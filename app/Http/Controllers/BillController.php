<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Http\Requests;
use App\Bill;
use App\OrderItem;
use Carbon\Carbon;
use App\Menu;
use App\MenuProduct;



use DB;
use Storage;
use Response;
use Session;
use Auth;
use \Exception as Exception;

use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;

//Classes for Printing Item and Modifier Formats
use App\CustomClass\PrintTemplateClass\Item;
use App\CustomClass\PrintTemplateClass\Modifier;


class BillController extends Controller
{
    
    public function index(){
     //print("Welcome to Bill Index");
     return view('bills.index');
    }

	
    //Displays the interface to create a bill
    public function create(){
    	   $location = Session::get('location_slug');
	   //dd($location);

	   if($location!==null)
		return view('bills.create',['location'=>$location]);
	   else
	        return false;
    }

    //Method to store a Bill and OrderItems
    public function store(Request $request){
    	   
    	   if($request->ajax() && Auth::check()){
	   
	   //Validation
	   	   
	   $this->validate($request,[
			'bill_number' => 'required|numeric',
			'bill_location' => 'required|string|exists:locations,location_slug',
			'bill_date' => 'date_format:d F Y',
			'bill_start_time' => 'date',
			'bill_end_time' => 'date',
			'bill_amount' => 'numeric|min:1',
			'bill_itemorders.*.description' => 'exists:products,product_name',
			'bill_itemorders.*.code' => 'exists:products,product_code',
			'bill_itemorders.*.modifiers.*.group' => 'exists:product_modifier_groups,ModifierGroupName',
			
			
		]);
		
	  
		//All validation pass
		//Create a new bill
		$newbill = new Bill;

		
		DB::beginTransaction();
		//Check to see if the billnumber exists

		//OrderByRaw since the number is stored as String
		$billrecord = Bill::where('bill_location',$request->location)
		->orderByRaw('bill_number*1 desc')
		->sharedLock()
		->first(['bill_number']);

		
		if($billrecord!=null){
			$billrecord = $billrecord->toArray();
			$billnum = (int) $billrecord['bill_number']+1;
		}
		else{
		$billnum = 1;
		}

		if($request->bill_number < $billnum){
			$newrequest = $request->all();
			$newrequest['bill_number']=(String) $billnum;
			$request->replace($newrequest);
		}
		
		//Setting the UserID from User sending the bill
		$temprequest = $request->all();
		$temprequest['user_id'] = Auth::user()->id;
				
		$request->replace($temprequest);

		
		//Save Bill data
		$savedbill = $newbill->create($request->except('bill_itemorders'));
		
		DB::commit();
		
		//Get all Orderitems
		$allorderitems = $request->only('bill_itemorders');

		$allorderitems = $allorderitems['bill_itemorders'];

		foreach($allorderitems as $index=>$orderitem){

		   		   
		   $savearray = [];
		   $savearray['product_name'] = $orderitem['description'];
		   $savearray['product_code'] = isset($orderitem['code'])?$orderitem['code']:null;
		   $savearray['order_item_quantity'] = isset($orderitem['qty'])?$orderitem['qty']:null;
		   
		   //Set item price rather than totalPrice
		   $savearray['order_item_price'] = isset($orderitem['setPrice'])?$orderitem['setPrice']:$orderitem['price'];
		   $savearray['order_item_totalPrice'] = isset($orderitem['totalPrice'])?$orderitem['totalPrice']:0;

		   $savearray['order_item_price_change'] = isset($orderitem['setPrice'])?1:0;
		   $savearray['order_item_modifiers'] = json_encode($orderitem['modifiers']);

		   //Later implementations
		   $savearray['order_item_price_change_note'] = '';

		   //Save the OrderItem
		   $savedbill->orderitem()->create($savearray);

		   }
		}//If request is AJAX end
    }
    



    /**
     * getNextBillId()
     * @params: none
     * @return: (integer) billnumber
     * Return the next bill number in series
     */

     public function getNextBillId(Request $request){
     
     //If the request is an AJAX request
       if($request->ajax()){
	  $location = $request->location;
	  
	  
	 //Get the billnumber which is the last for a given location 
         $billnum = Bill::where('bill_location',$location)->orderByRaw('bill_number*1 desc')->first(['bill_number']);
	 if($billnum!==null){
		$billnum = $billnum->toArray();
		print(json_encode($billnum));
	 }
	 else
	    print("{\"bill_number\":0}");

        }
     }

     
     /**
      * List Bills
      * Method to view all the bills
      */
      public function listBill(){
      $location = Session::get('location_slug');
      	     if($location !== null){
	         $allbills = Bill::where('bill_location',$location)->get()->toArray();
	      }
	      else
	        return abort('404');
      	return view('bills.list',['bills' => $allbills]);
      }


      /**
       * Print Bill Template
       * @param : $printbill and $map object(mapping database field names to JSON fieldnames)
       */ 
       
       public function printBillTemplateDefault($printbill,$mapping=false){

       try {
    	$connector = new NetworkPrintConnector("192.168.0.199", 9100);
       }
	catch(Exception $e){
	try{
	    $connector = new FilePrintConnector("/dev/usb/lp1");
	}
	catch(Exception $e){
	    return "Couldnot Find Printers";
	}    
	};
	   
	


	//try{
	
	//Activate the printer
	$printer = new Printer($connector);
	     
   	/* PRINTER PAPER WIDTH in characters*/
   	      	 define('PAPER_WIDTH',48);

    	/* COMPANY_NAME */
    	      	  define('COMPANY_NAME','FLYING SPAGHETTI MONSTER');

    //Set Mappping
    $mappings = ['price' => 'order_item_price',
		 'qty' => 'order_item_quantity',
		 'description' => 'product_name',
		 'bill_itemorders' => 'orderitem',
		 'modifiers' => 'order_item_modifiers',
		 'totalPrice' => 'order_item_totalPrice'
		 ];
	
    //Start Printing
    $printer->initialize();

    //Set the company name to big and of FONT_B type
    $printer -> selectPrintMode(Printer::MODE_FONT_A|Printer::MODE_DOUBLE_WIDTH|Printer::MODE_DOUBLE_HEIGHT);
    $printer -> setJustification(Printer::JUSTIFY_CENTER);
    $printer -> text(COMPANY_NAME."\n");
    
    
    //Set to print mode default
    $printer -> selectPrintMode(Printer::MODE_FONT_B|Printer::MODE_DOUBLE_HEIGHT);
    
    
    //Print Location
    $location = strtoupper($printbill['bill_location']);
    $printer -> text($location."\n");
    
    $printer -> selectPrintMode();
    $printer -> feed();
    
    //Print date
    $date = Carbon::createFromFormat('d F Y',$printbill['bill_date'])->format('d/m/Y');
    $printer -> setJustification(Printer::JUSTIFY_LEFT);
    $printer-> text("Date: ".$date."\n");

    //Print start time
    //return $printbill['bill_start_time'];
    
     $bill_time = Carbon::parse($printbill['bill_start_time'])->format('g:i a');
    

    $printer -> setJustification(Printer::JUSTIFY_LEFT);
    $printer-> text("Time: ".$bill_time."\n");
    
    //Print Table
    $billstates = $printbill['bill_states']!=NULL?json_decode($printbill['bill_states'],true):[];
    $table = array_key_exists('table',$billstates)?$billstates['table']:'';	
    $printer-> text("Table: ".$table."\n");

    //Print Ticket number which is Bill Number
    $printer -> text("Ticket number:".$printbill['bill_number']."\n");

    //Print Line
    $printer -> text(str_repeat("-",PAPER_WIDTH)."\n");

    //Get Items and Modifiers
    $orderitems = !array_key_exists('bill_itemorders',$printbill)?
    $printbill[$mappings['bill_itemorders']]:$printbill['bill_itemorders'];

    if(count($orderitems)>0){
    /* Print the items and Modifiers */
       foreach($orderitems as $index=>$item){

       //Since Direct Bill Print and Bill Print From DB has some mismatches with ColumnNames
       //Implement a Mapping
       
       
       $item_quantity = !array_key_exists('qty',$item)?$item[$mappings['qty']]:$item['qty'];
       $item_description = !array_key_exists('description',$item)?$item[$mappings['description']]:$item['description'];
       $item_price = !array_key_exists('totalPrice',$item)?$item[$mappings['totalPrice']]:$item['totalPrice'];


       


       $printer->text(new Item((int) $item_quantity,
	 				  (string) $item_description,
					  (float) $item_price,
					  PAPER_WIDTH));

	$modifiers = !array_key_exists('modifiers',$item)?
		      json_decode($item[$mappings['modifiers']],true):$item['modifiers'];

        if(count($modifiers)>0){
		foreach($modifiers as $modifier){
		
		//return array_key_exists('addTagPriceToItemPrice',$modifier);
		$printer->text(new Modifier((int) $modifier['qty'],
					     (string) $modifier['name'],
					     (float) $modifier['price'],
					     PAPER_WIDTH,array_key_exists('addTagPriceToOrderPrice',$modifier)));
					     
		}
	}

       }
    }
     /* End of Items and modifiers */


    //Print the double lines after the items
    $printer -> text(str_repeat("=",PAPER_WIDTH)."\n");

    
    $printer->selectPrintMode(Printer::MODE_DOUBLE_HEIGHT);
    $printer->setJustification(Printer::JUSTIFY_LEFT);
    $padding = PAPER_WIDTH/2;
    $printer->text(str_pad("Total:",$padding," ",STR_PAD_RIGHT));

    $totalamount = number_format((float) $printbill['bill_amount'],2);

    $printer->text(str_pad($totalamount,$padding," ",STR_PAD_LEFT)."\n");
    $printer->setJustification(Printer::JUSTIFY_LEFT);
    $printer->text("Tip:"."\n");
    
    //Print the double lines after the total
    $printer->selectPrintMode();
    $printer -> text(str_repeat("=",PAPER_WIDTH)."\n");

    //Print the grand total
    $printer->selectPrintMode(Printer::MODE_DOUBLE_HEIGHT);
    $printer->setJustification(Printer::JUSTIFY_LEFT);
    $printer->text("Total:"."\n");

    //Print the double lines after the grand total
    $printer->selectPrintMode();
    $printer -> text(str_repeat("=",PAPER_WIDTH)."\n");

    //Print the message
    $printer->setJustification(Printer::JUSTIFY_CENTER);
    $message = "WE DON'T ADD SERVICE CHARGES FROM OUR END \n the tip amount is purely your choice :)";
    $printer -> text($message."\n");

    //Print the double lines after the message
    $printer->setJustification(Printer::JUSTIFY_LEFT);
    $printer->selectPrintMode();
    $printer -> text(str_repeat("=",PAPER_WIDTH)."\n");

    //Print Thank You
    $printer->setJustification(Printer::JUSTIFY_CENTER);
    $printer -> selectPrintMode(Printer::MODE_FONT_B|Printer::MODE_DOUBLE_WIDTH|Printer::MODE_DOUBLE_HEIGHT);
    $printer -> text('THANK YOU'."\n");

    //Print the double lines after the Thank you
    $printer -> selectPrintMode();
    $printer -> text(str_repeat("=",PAPER_WIDTH)."\n");

    //Print the footer message
    $printer -> text("For your convenience find Tip Calculator Below"."\n");

    //Tip Calculator Table
    $tips = array(5,10,15,20);
    $tipamounts = [];

    $columnspace = (int) (PAPER_WIDTH-4)/count($tips);

    $tipdisplay = "Tip%";
    $tipamountdisplay = "Rs.";

    foreach($tips as $tip){
      $tipamounts[$tip] = ((int) $tip/100)*((float) $printbill['bill_amount']);
      $tipdisplay .= str_pad($tip."%",$columnspace," ",STR_PAD_BOTH);
      $tipamountdisplay .= str_pad((ceil($tipamounts[$tip]/5)*5),$columnspace," ",STR_PAD_BOTH);
    }
     
    //$printer->text(implode("-",$tipamounts)."\n");
    $printer->text($tipdisplay."\n");
    $printer->text($tipamountdisplay."\n");
    $printer -> cut();
    
   /*
    
    }    
    catch(Exception $e)
    {  
      return $e->getMessage();			
    }
    finally
    {				
      $printer->close();
      return "Print Successful";
    }

 */
    
}


    public function printBillNow(Request $request){
        if($request->ajax() && Auth::check()){
	   
	   //Validation
	   	   
       $this->validate($request,[
	'bill_number' => 'required|numeric',
	'bill_location' => 'required|string|exists:locations,location_slug',
	'bill_date' => 'date_format:d F Y',
	'bill_start_time' => 'date',
	'bill_end_time' => 'date',
	'bill_amount' => 'numeric|min:1',
	'bill_itemorders.*.description' => 'exists:products,product_name',
	'bill_itemorders.*.code' => 'exists:products,product_code',
	'bill_itemorders.*.modifiers.*.group' => 'exists:product_modifier_groups,ModifierGroupName',
	]);

    	//Set PrintBill containing the incoming request
	$printbill = $request->all();
	$this->printBillTemplateDefault($printbill);
     }
   }


     public function printBill($billid){
     	$printbill = Bill::where('id',$billid)->with('orderitem')->first()->toArray();
	try{
	$this->printBillTemplateDefault($printbill);
    	}
	catch(Exception $e){
	 return back()->with('message',$e->getMessage());
	}finally{
	 return back()->with('message','Print Successfull');
	}
     }

	/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */ 


	public function billMigrate(){
    	    $allbills = Bill::where('id','>',1)->with('orderitem')->get()->toArray();
	    $retarray = [];
	    foreach($allbills as $bill){
	      $order_items = $bill['orderitem'];
	      
	      foreach($order_items as $orderItem){
	      
	          //Get the Order Item Price and Check it against the DB value
		  $itemname = $orderItem['product_name'];

		  //Get the active menu from the location_id
		  $menu = Menu::where(['active'=>1,'location_id' => Session::get('location_id')])->first();
		  //Product Price
		  $origItem = MenuProduct::where(['menu_id'=> $menu->id,'product_name'=>$itemname])->first()->toArray();

		  //dd($origItem);

		  //Get the Order Item Object to Modify it
		    $modOrderItem = OrderItem::find($orderItem['id']);

		    $testarray = [];
		    
		 //Check if the Price is the same
		 if($orderItem['order_item_price']!=$origItem['product_price']){  
                    
		    //Set the OrderItem price to Orig Price
		    $testarray['order_item_price'] = ['old_price' => $modOrderItem->order_item_price,
		                                      'new_price'  => $origItem['product_price']];
						      
		    $modOrderItem -> order_item_price = $origItem['product_price'];
		}

		
		    
		    		    
		    $modifiers = json_decode($orderItem['order_item_modifiers'],true);

		    //Calculate the totalPrice
		    $totalPrice = $origItem['product_price'];
		    
		    foreach($modifiers as $modifier){

		    if(!array_key_exists('addTagPriceToOrderPrice',$modifier)){
		      $totalPrice += $modifier['qty']*((float) $modifier['price']);
		     }
		    }
		    
		    
		    if($orderItem['order_item_totalPrice']!= $totalPrice){
		       $testarray['order_item_totalPrice'] =
		    				['old_price' => $modOrderItem->order_item_totalPrice,
		                                 'new_price'  => $totalPrice];

	               $modOrderItem -> order_item_totalPrice = $totalPrice;
		    		     			     
		    }
		    
		    $modOrderItem->save();
		    
		    $retarray[$orderItem['id']]=$testarray;   				      
		 }
	    	 
		  
  	       }
	        dd($retarray);     
	    }
	    
	  
 	  
	 	 










      /**
       * Print Bills
       * Method to display the print bill
       */
       public function xprintBill($billid){

              /*
       	      try{
       	      $connector = new NetworkPrintConnector("192.168.0.199", 9100);
	      $printer = new Printer($connector);
	      }catch(Exception $e){
	       abort(403,"Printer not set");
	      };

	      */
	      
       	      $printbill = Bill::where('id',$billid)->with('orderitem')->first()->toArray();
	      	      
	      // 40 characters
	      $string = "";
	      //Print the company name
	      $companyname = "FLYING SPAGHETTI MONSTER";
	      $string .= str_repeat(" ",20-(strlen($companyname)/2)).$companyname;
	      
	      //print the bill_location
	      $billloc  = strtoupper($printbill['bill_location']);
	      $string .= "\n".str_repeat(" ",20-(strlen($billloc)/2)).$billloc;


	      //Get BillStates
	      $bill_states = $printbill['bill_states'];

	      
	      //$string .= "\n\t\t**********";
	      $string .= "\n".str_repeat("*",40);
	      $string .= "\nBILL # ".$printbill['bill_number'];
	      $string .= str_repeat(" ",(40-7-5-8-strlen((string) $printbill['bill_number'])));
	      $string .= "DATE ".Carbon::createFromFormat('d F Y',$printbill['bill_date'])->format('d/m/y');
	      $string .= "\n".str_repeat("*",40);
	      $string .= "\n";
	      $string .= "QTY".str_repeat(" ",5)."ITEMS".str_repeat(" ",17)."AMOUNT";


	      foreach($printbill['orderitem'] as $index=>$item){
	      		$qty = (int) $item['order_item_quantity'];
			
			$itemname = $item['product_name'];
	      		$amount = $item['order_item_price'];

			//Get a new line
			$string .= "\n";

			
			//Print the Quantity
			//Needs to be centered, so length of the quantity, 3-(length of qty)
			$qty = strlen((string) $qty)==1?" ".$qty." ":strlen((string)$qty)==2?" "+$qty:$qty;
			
			//Truncate at 25 characters
			$itemname = strlen($itemname)>25?substr($itemname,0,24):$itemname;
			$space_item_amount = 32-strlen($itemname)-strlen((string) $amount);

			//Amount
			//$amount = sprintf("%4.2f",$amount);

			$string.=$qty.str_repeat(" ",5).$itemname.str_repeat(" ",$space_item_amount).$amount;
		}

		$string .= "\n";
		$string .= "\n";
		$string .= str_repeat("*",40);
		$string .="\n";
		$string .= str_repeat(" ",27)."TOTAL ";
		$string .= str_repeat(" ", 7-strlen((string) $printbill['bill_amount'])).$printbill['bill_amount'];
		$string .= "\n\n";
		$string .= str_repeat(" ",9).str_repeat("*",5)."ARRIVEDERCI".str_repeat("*",5).str_repeat(" ",9);
		$string .="\n";

		/*
		try {
	          $printer -> text($string);
		  //$printer -> qrCode("1234567890",Printer::QR_ECLEVEL_L,10);
		  $printer -> cut();
	      } finally {
		  $printer -> close();
	       }
		*/

		//Name of the file
	      	$filename = $printbill['bill_location']."_BillNumber_".$printbill['bill_number'].".txt";

	      	//Headers for the text file
	      	
		$headers = array(
	            'Content-Type' => 'plain/txt',
		    'Content-Disposition' => sprintf('attachment; filename="%s"', $filename),
		    'Content-Length' => sizeof($string),
	      	    );

		
	      	//Download the file
	      	return Response::make($string, 200, $headers);
		//return redirect();	      
       }


       /** printBillNow
        *  Method to print bill from AJAX call
	*/
	public function xprintBillNow(Request $request){
	if($request->ajax() && Auth::check()){
	   
	   //Validation
	   	   
	   $this->validate($request,[
			'bill_number' => 'required|numeric',
			'bill_location' => 'required|string|exists:locations,location_slug',
			'bill_date' => 'date_format:d F Y',
			'bill_start_time' => 'date',
			'bill_end_time' => 'date',
			'bill_amount' => 'numeric|min:1',
			'bill_itemorders.*.description' => 'exists:products,product_name',
			'bill_itemorders.*.code' => 'exists:products,product_code',
			'bill_itemorders.*.modifiers.*.group' => 'exists:product_modifier_groups,ModifierGroupName',
			
			
		]);

		//return $request->all();
		$printbill = $request->all();

		//return $printbill['bill_itemorders'];

		//All validation pass
		// 40 characters
	      $string = "";
	      //Print the company name
	      $companyname = "FLYING SPAGHETTI MONSTER";
	      $string .= str_repeat(" ",20-(strlen($companyname)/2)).$companyname;
	      
	      //print the bill_location
	      $billloc  = strtoupper($printbill['bill_location']);
	      $string .= "\n".str_repeat(" ",20-(strlen($billloc)/2)).$billloc;

	      
	      //$string .= "\n\t\t**********";
	      $string .= "\n".str_repeat("*",40);
	      $string .= "\nBILL # ".$printbill['bill_number'];
	      $string .= str_repeat(" ",(40-7-5-8-strlen((string) $printbill['bill_number'])));
	      $string .= "DATE ".Carbon::createFromFormat('d F Y',$printbill['bill_date'])->format('d/m/y');
	      $string .= "\n".str_repeat("*",40);
	      $string .= "\n";
	      $string .= "QTY".str_repeat(" ",5)."ITEMS".str_repeat(" ",19)."AMOUNT";


	      foreach($printbill['bill_itemorders'] as $index=>$item){
	      		$qty = (int) $item['qty'];
			
			$itemname = $item['description'];
	      		$amount = $item['price'];

			//Get a new line
			$string .= "\n";

			
			//Print the Quantity
			//Needs to be centered, so length of the quantity, 3-(length of qty)
			$qty = strlen((string) $qty)==1?" ".$qty." ":strlen((string)$qty)==2?" "+$qty:$qty;
			
			//Truncate at 25 characters
			$itemname = strlen($itemname)>25?substr($itemname,0,24):$itemname;
			$space_item_amount = 32-strlen($itemname)-strlen((string) $amount);

			//Amount
			//$amount = sprintf("%.2f",$amount);

			$string.=$qty.str_repeat(" ",5).$itemname.str_repeat(" ",$space_item_amount).$amount;


			//Printing the modifiers
			$modifiers = $item['modifiers'];

			//Iterate through modifiers
			foreach($modifiers as $modifier){
			   if($modifier['price'] > 0){
			   
			   $modifiername = strlen($modifier['name'])>25?substr($modifier['name'],0,24):$modifier['name'];
			   $modifiername = $modifiername."(".$modifier['qty'].") - ".$modifier['price'];
			   //$modifierpricespace = 32-strlen($modifiername)-strlen((string) $modifier['price']);
			   //$string.="\n".str_repeat(" ",8).$modifiername.str_repeat(" ",$modifierpricespace).$modifier['price'];
			   $string.="\n".str_repeat(" ",8).$modifiername;
			   }
			}
		}

		$string .= "\n";
		$string .= "\n";
		$string .= str_repeat("*",40);
		$string .="\n";
		$string .= str_repeat(" ",27)."TOTAL ";
		$string .= str_repeat(" ", 7-strlen((string) $printbill['bill_amount'])).$printbill['bill_amount'];
		$string .= "\n\n";
		$string .= str_repeat(" ",9).str_repeat("*",5)."ARRIVEDERCI".str_repeat("*",5).str_repeat(" ",9);
		$string .="\n";

				
		try {
		  //$connector = new NetworkPrintConnector("192.168.0.199", 9100);
		  $connector = new FilePrintConnector("/dev/usb/lp1");
	        }catch(Exception $e){
	          return $e->getMessage();
		}

		try{
		$printer = new Printer($connector);			  
	        $printer -> text($string);
		//$printer -> qrCode("1234567890",Printer::QR_ECLEVEL_L,10);
		$printer -> cut();
		$printSuccess = true;  
	        }catch(Exception $e){
		  return $e->getMessage();		
		}finally {
		  $printer -> close();
		  return "Print Successful";
	       }
		
	}
    }	


    

}