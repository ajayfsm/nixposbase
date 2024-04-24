<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//Requests
use App\Http\Requests;
use App\Http\Requests\StoreMenuRequest;
use App\Http\Requests\UpdateMenuRequest;

//Models
use App\ProductModifier;
use App\ProductModifierGroup;
use App\Product;
use App\Menu;
use App\MenuProduct;
use App\MenuProductModifier;



//Facades
use DB;
use Session;

class MenuController extends Controller
{
   /**
    * Index Method
    */
    public function index(){
       $menu = Menu::where('location_id',Session::get('location_id'))->get()->toArray();
       return view('menu.index',['menu'=>$menu]);
    }
	

    
    public function create(){
    	$modifiers = old('modifiers');
	$products  = old('product');
	
	if(!isset($modifiers)){
	  $modifiers = ProductModifierGroup::with('ProductModifier')->get()->toArray();
	}

	if(!isset($products)){
         $products = Product::all()->toArray();	
	}

	$inputarr = [];
	$inputarr['products'] = $products;
	$inputarr['modifiers'] = $modifiers;

	
    	return view('menu.create',$inputarr);
    }

    public function store(StoreMenuRequest $request){
    	   
	   
    	   //First start a transaction
	   DB::transaction(function() use ($request){
		$newmenu = new Menu;
		$newmenu->menu_name = $request->input('menu_name');
		$newmenu->location_id = Session::get('location_id');
		$newmenu->save();
		
		//Get the product name and price from the Form Submission
		$products = $request->only('product')['product'];
		
		foreach($products as $key=>$oneproduct){
	          //Get ID and Category of the Product by name
		  $otherproddetails = Product::where('product_name',$oneproduct['product_name'])->first(['id AS product_id','product_category'])->toArray();

		  //Merge the name, price with id and category
		$oneprod = array_merge($otherproddetails,$oneproduct);

		//Save the record	         
		$newmenu->menuproduct()->create($oneprod);
		}


		//Get Modifiers
		$modifiergroup = $request->only('modifier')['modifier'];

		//Get Each Modifier Group
		foreach($modifiergroup as $index=>$onemodifiergroup){

		$productmodifiergroupdetails = ProductModifierGroup::
		where('ModifierGroupName',$onemodifiergroup['ModifierGroupName'])->first();

		//Get Modifiers for each Group
		 foreach($onemodifiergroup['product_modifier'] as $modifier){

		 //Get modifier details(id, ProductModifierGroupId)
		   $moddetails = ProductModifier::
		   where(['product_modifier_name'=>$modifier['product_modifier_name'],
		     'ProductModifierGroupId'=>$productmodifiergroupdetails->id])
		   ->first(['id AS product_modifier_id','ProductModifierGroupId'])->toArray();

		   //Combine the modifier details with price and name
	     $combinedMod = array_merge($modifier,$moddetails);
	           //Add modifierGroupName to the combined array
	     $combinedMod['ModifierGroupName'] = $onemodifiergroup['ModifierGroupName'];
		   //Save the record
             $newmenu->menuproductmodifier()->create($combinedMod);
		 }
		}
		
	   });

	   //If transaction is successfull,return to create page and display success message
	   return redirect(url(route('menu.index')))->with('message','Menu Successfully Created');

    }

    /**
     * Show method
     */
     
     public function show($menuid){
     	$menu = Menu::where(['id'=>$menuid,'location_id'=>Session::get('location_id')])->first()->toArray();
	
	$menuname = $menu['menu_name'];
	
        $products = MenuProduct::where('menu_id',$menuid)->get()->toArray();
	$modifiers = MenuProductModifier::where('menu_id',$menuid)->get()->toArray();
	  
	$retarr = [];

	$modifiergroups = [];
	 
	foreach($modifiers as $modifier){
	    array_push($modifiergroups,$modifier['ModifierGroupName']);
	}

	$modifiergroups = array_values(array_unique($modifiergroups));

	foreach($modifiergroups as $key=>$modgroup){
	   $retarray[$key]['ModifierGroupName'] = $modgroup;
	   $retarray[$key]['product_modifier'] = [];
	 }

	foreach($modifiers as $modifier){
	   foreach($retarray as $key=>$eachgroup){
	        if($modifier['ModifierGroupName'] == $eachgroup['ModifierGroupName']){
		  array_push($retarray[$key]['product_modifier'],['product_modifier_name'=>$modifier['product_modifier_name'],'product_modifier_price'=>$modifier['product_modifier_price']]);
		}
	   }
	 }

	 
	 $modifiers = $retarray;
	 $retarray = [];
	 
	

	$inputarr = [];
	$inputarr['products'] = $products;
	$inputarr['modifiers'] = $modifiers;
	$inputarr['menuname'] = $menuname;
	$inputarr['menuid'] = $menuid;
    	return view('menu.show',$inputarr);
     }





    /**
     * Edit Method
     */
     public function edit($menuid){
        $modifiers = old('modifiers');
	$products  = old('product');
	 
	$menu = Menu::where(['id'=>$menuid,'location_id'=>Session::get('location_id')])->first()->toArray();
	
	

	$menuname = $menu['menu_name'];
	
	if(!isset($modifiers)){
	  $modifiers = MenuProductModifier::where('menu_id',$menuid)->get()->toArray();
	  
	  }

	if(!isset($products)){
         $products = MenuProduct::where('menu_id',$menuid)->get();

	  //Special case
	 //In case the product names changes after save we need to bring in the updated names from
	 //Product table
	 // Get the new product names or details and update menu_product details
	   foreach($products as $product){
	      $existproduct = Product::find($product->product_id);
	      $product->product_name = $existproduct->product_name;
	      $product->product_category = $existproduct->product_category;
	      $product->save();
	   }

	   //Refetch the menu_product details;
	   $products = MenuProduct::where('menu_id',$menuid)->get()->toArray();
	   
	 $retarr = [];

	 $modifiergroups = [];
	 
	 foreach($modifiers as $modifier){
	    array_push($modifiergroups,$modifier['ModifierGroupName']);
	 }

	 $modifiergroups = array_values(array_unique($modifiergroups));
	 
	 
	 foreach($modifiergroups as $key=>$modgroup){
	   $retarray[$key]['ModifierGroupName'] = $modgroup;
	   $retarray[$key]['product_modifier'] = [];
	 }

	 //dd($retarray);
	 
	 foreach($modifiers as $modifier){
	   foreach($retarray as $key=>$eachgroup){
	        if($modifier['ModifierGroupName'] == $eachgroup['ModifierGroupName']){
		  array_push($retarray[$key]['product_modifier'],['product_modifier_name'=>$modifier['product_modifier_name'],'product_modifier_price'=>$modifier['product_modifier_price']]);
		}
	   }
	 }


	 //Check to see if any more modifiers were added to ProductModifierGroups
	 $prod_mod = ProductModifierGroup::with('ProductModifier')->get()->toArray();

	 //dd($prod_mod);
	 //Check to see if the modgroup exists in retarray
	 foreach($prod_mod as $modgroup){

	 //If a ModifierGroupName exists in the original List but not in MenuList then add it
	 if(!in_array($modgroup['ModifierGroupName'],$modifiergroups)){

	 /* This means all the ProductModifiers for this group can be added with Price 0*/
	 $product_modifiers = [];

	 //For each of the product_modifier in the Modifiergroup Name
	 foreach($modgroup['product_modifier'] as $productmodifier){
	 	array_push($product_modifiers,
			   ['product_modifier_name' => $productmodifier['product_modifier_name'],
			    'product_modifier_price' => 0.00]);
	 }
		

	 array_push($retarray,
		['ModifierGroupName'=>$modgroup['ModifierGroupName'],'product_modifier' => $product_modifiers]);

	
	}//End of if ModifierGroup Doesn't exist
	else //Modifier Group Exists;then check productModifiers of each group
	{
            //Get the ModifierGroup and all productModifiers from existing list
	    foreach($retarray as $key=>$retmodgroup){
	        if($retmodgroup['ModifierGroupName'] == $modgroup['ModifierGroupName']){

		//Now iterate through each of the $modgroup productmodifiers and see if it exists
	    	//in listmodgroup;else insert it with zero; check by IDs in case the name changes;
	    	//Use this to sync the modgroup and listmodgroup

		foreach($modgroup['product_modifier'] as $origmodifiers){
                 $present_flag = 0;
	         foreach($retmodgroup['product_modifier'] as $listmodifiers){
		  if($listmodifiers['product_modifier_name'] == $origmodifiers['product_modifier_name'])
		  {
		    $present_flag = 1;
		    break;
		  }
		}//Foreachloop-listmodifier

		if($present_flag == 0){
		   array_push($retarray[$key]['product_modifier'],[
		   'product_modifier_name' =>  $origmodifiers['product_modifier_name'],
		   'product_modifier_price' => 0.00]
		   );
		}

		}//Foreachloop-origmodifier
	}
       }
      }//End of if ModifierGroup doesn' exist

      }

	
	 $modifiers = $retarray;
	 $retarray = [];
	 
	}

	$inputarr = [];
	$inputarr['products'] = $products;
	$inputarr['modifiers'] = $modifiers;
	$inputarr['menuname'] = $menuname;
	$inputarr['menuid'] = $menuid;
    	return view('menu.edit',$inputarr);
    }


     /**
      *  Update Method
      */
      public function update(UpdateMenuRequest $request,$menuid){
      	      //First start a transaction
	   DB::transaction(function() use ($request,$menuid){

	   $newmenu = Menu::where(['id'=>$menuid,'location_id'=>Session::get('location_id')])
	   	      ->first();	   
	   //$newmenu = Menu::find($menuid);

		//Delete all the old Products
		$newmenu->menuproduct()->delete();
		

		//Get the product name and price from the Form Submission
		$products = $request->only('product')['product'];

		foreach($products as $key=>$oneproduct){
	          //Get ID and Category of the Product by name
		  $otherproddetails = Product::where('product_name',$oneproduct['product_name'])->first(['id AS product_id','product_category'])->toArray();

		  //Merge the name, price with id and category
		$oneprod = array_merge($otherproddetails,$oneproduct);

		//Save the record	         
		$newmenu->menuproduct()->create($oneprod);
		}


		//Delete all the old Modifiers
		$newmenu->menuproductmodifier()->delete();

		//Get Modifiers
		$modifiergroup = $request->only('modifier')['modifier'];

		//Get Each Modifier Group
		foreach($modifiergroup as $index=>$onemodifiergroup){

		$productmodifiergroupdetails = ProductModifierGroup::
		where('ModifierGroupName',$onemodifiergroup['ModifierGroupName'])->first();


		//Get Modifiers for each Group
		 foreach($onemodifiergroup['product_modifier'] as $modifier){

		 //Get modifier details(id, ProductModifierGroupId)
		   $moddetails = ProductModifier::
		   where(['product_modifier_name'=>$modifier['product_modifier_name'],
		          'ProductModifierGroupId'=>$productmodifiergroupdetails->id])
		   ->first(['id AS product_modifier_id','ProductModifierGroupId'])->toArray();

		   //Combine the modifier details with price and name
	     $combinedMod = array_merge($modifier,$moddetails);
	           //Add modifierGroupName to the combined array
	     $combinedMod['ModifierGroupName'] = $onemodifiergroup['ModifierGroupName'];
		   //Save the record
             $newmenu->menuproductmodifier()->create($combinedMod);
		 }
		}
		
	   });

	   //If transaction is successfull,return to create page and display success message
	   return redirect()->route('menu.show',[$menuid])->with('message','Menu Successfully Updated');
      	     



      }
      
      public function delete($menuid){
      	$menu = Menu::where(['id'=>$menuid,'location_id'=>Session::get('location_id')])->first()->toArray();
	$menuname = $menu['menu_name'];
	
        $products = MenuProduct::where('menu_id',$menuid)->get()->toArray();
	$modifiers = MenuProductModifier::where('menu_id',$menuid)->get()->toArray();
	  
	$retarr = [];

	$modifiergroups = [];
	 
	foreach($modifiers as $modifier){
	    array_push($modifiergroups,$modifier['ModifierGroupName']);
	}

	$modifiergroups = array_values(array_unique($modifiergroups));

	foreach($modifiergroups as $key=>$modgroup){
	   $retarray[$key]['ModifierGroupName'] = $modgroup;
	   $retarray[$key]['product_modifier'] = [];
	 }

	foreach($modifiers as $modifier){
	   foreach($retarray as $key=>$eachgroup){
	        if($modifier['ModifierGroupName'] == $eachgroup['ModifierGroupName']){
		  array_push($retarray[$key]['product_modifier'],['product_modifier_name'=>$modifier['product_modifier_name'],'product_modifier_price'=>$modifier['product_modifier_price']]);
		}
	   }
	 }
	 
	 $modifiers = $retarray;
	 $retarray = [];
	 
	

	$inputarr = [];
	$inputarr['products'] = $products;
	$inputarr['modifiers'] = $modifiers;
	$inputarr['menuname'] = $menuname;
	$inputarr['menuid'] = $menuid;
    	return view('menu.delete',$inputarr);

      }


      public function destroy($menuid){
          DB::transaction(function() use($menuid){
	    $menu = Menu::where(['id'=>$menuid,'location_id'=>Session::get('location_id')])->first();
	    $menu->menuproduct()->delete();
	    $menu->menuproductmodifier()->delete();
	    $menu->delete();
	  });

	  return redirect(route('menu.index'))->with('message','Successfully deleted');
      }

      public function activate($menuid){

      	  DB::transaction(function() use($menuid){
      	  //Get all menus
      	  $menus = Menu::where('location_id',Session::get('location_id'))->get();
	  
	  //Iterate through all menus and set all as inactive
	  foreach($menus as $menu){
	  $eachid = $menu->id;
	  $isactive = $menu->active;

	  if($eachid == $menuid){
	       if($isactive !=1){
		   $menu->active = 1;
		}
		else
		   $menu->active= 0;		
	    }
	    else
		$menu->active = 0;
	    $menu->save();
	  }
      	  
      });

      return redirect(route('menu.index'));
      }
}


