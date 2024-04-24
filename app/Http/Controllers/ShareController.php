<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;


use App\Product;
use App\ProductModifier;
use App\ProductModifierGroup;
use App\ProductModifierGroupMaps;

use App\Menu;
use App\MenuProduct;
use App\MenuProductModifier;

//Facades
use Response;
use DB;
use Session;


class ShareController extends Controller
{
    //Controller to expose all AJAX request for the app


    /**
     * getProductCategories
     * /share/productcategory
     * Returns the list of all product categories as JSON
     */
     
    public function getProductCategories(Request $request){
    	if($request->ajax()){
		$products = Product::all(['product_category'])->toArray();
		
		$prod_cat_arr = [];
		foreach($products as $key=>$value){
		  array_push($prod_cat_arr,$value['product_category']);
		}
		print json_encode(array_unique($prod_cat_arr));
	}
		
    }

    /**
     * getProductCategories
     * /share/product
     * Returns the list of all product categories as JSON
     */

    public function getProduct(Request $request,$productcategory){
    	   if($request->ajax()){
	      $products = new Product;
	      if($productcategory !== "*" && $productcategory !=="uncategorized")
	      	$getproducts = $products->where('product_category',$productcategory)->get(['product_name'])->toArray();
	      else if($productcategory == "*")
	        $getproducts = $products->all(['product_name'])->toArray();
	      else
	        $getproducts = $products->where('product_category',null)->get(['product_name'])->toArray();
	      print json_encode($getproducts);
    	   }
    }
    

    /**
     * createMenuData
     * /share/menudata
     * Return a JSON object containing menu items
     * Needs an active menu set else returns no menu set
     */
     public function createMenuData(){
     
     $retarray = [];
     $status = 200;
     $testarray = [];

     $menu = Menu::where(['location_id'=>Session::get('location_id'),'active'=>1])->with('menuproduct.product')->firstOrFail();

     if(isset($menu)){
	$menuproducts = $menu->menuproduct;
	$menumodifiers = $menu->menuproductmodifier;

	foreach($menuproducts as $menuproduct){
	    //$menuproduct = $menuproducts[22];
	   
	   //Get the Product details
	   
	   //Get the category/Label stored in the menu_products table
	   $label = $menuproduct->product_category;

	   //If Label/Category doesn't exist,put it in Uncategorized
	   if(trim($label)==""){
		$label="Uncategorized";
	   }

	   //Create new Label/Category if not present
	   if(!array_key_exists($label,$retarray)){
		$retarray[$label] = [];	
	   }


	   $productarray = [];
	   $product = $menuproduct->product;
	   $productname = $product->product_name;

	   $productarray = [];

	   //Set Price
	   $productprice = $menuproduct->product_price;
	   if($productprice == 0){
	      $productprice = null;
	   }
	   $productarray["price"]=$productprice;	   

	   //Set Name
	   $productarray["name"]=$productname;
	   
	   
	   //Set Code
	   $productarray["code"]=$product->product_code;

	   //Get All ModifierGroups for a given product
	   //Get all the ModifierGroup IDs for a given product by looking at GroupMaps
	   $allmodgroups = $product->getModifierGroups();
	   

	   //Get the list of all the GroupModifiers and the associated Modifiers by their Sortorder
	   $productModifierGroups = ProductModifierGroup::whereIn('id',$allmodgroups)
	   ->with(['ProductModifier' => function($query){
	     $query->orderBy('SortOrder','asc');
	   }])
	   ->orderBy('SortOrder','asc')->get();


	   $groupmodifier = [];
	   
	   foreach($productModifierGroups as $modgroup){
	   	//dd($modgroup);
	   	array_push($groupmodifier,$modgroup->ModifierGroupName);
	   }

	   //Assign all the group modifier to Product["modifiers"]
	    $productarray["modifiers"] = $groupmodifier;

	    	   
	   $retarray[$label][$productname]=$productarray;

	 } //End of foreach product in menu
	 

	 $menuGroupIds = $menumodifiers->map(function($item){
		return $item->ProductModifierGroupId;

	 })->flatten()->toArray();
	 

	 $uniqGroupIds = array_unique(array_values($menuGroupIds));

	 $productModifierGroups = ProductModifierGroup::whereIn('id',$uniqGroupIds)
	   ->with(['ProductModifier' => function($query){
	     $query->orderBy('SortOrder','asc');
	   }])
	   ->orderBy('SortOrder','asc')->get();
	 
	 $groupmodifier = [];
	 
	   //Iterate through each modifier group
	   foreach($productModifierGroups as $modgroup){

	   	$modgroupname = $modgroup->ModifierGroupName;

		//print($modgroupname);
		
		//If a modifier group doesn' exist create it in the modifiers array
	     	if(!array_key_exists($modgroupname,$groupmodifier)){
	 	   $groupmodifier[$modgroupname] = [];
	   	}

		//Set Min and Max SelectedItems
		$groupmodifier[$modgroupname]["minselecteditems"] = $modgroup->MinSelectedItems;
		$groupmodifier[$modgroupname]["maxselecteditems"] = $modgroup->MaxSelectedItems;


		//Set AddPriceToOrderTag
		$groupmodifier[$modgroupname]["addtagpricetoorderprice"] = $modgroup-> AddTagPriceToOrderPrice;

		//Get the modifiers associated with the ModifierGroup
		$allmodifiers = $modgroup->ProductModifier;
		
		$groupmodifier[$modgroupname]["modifiers"]=[];
		
		
		
		//Iterate through all the Modifiers
		foreach($allmodifiers as $eachmodifier){

				
	 	    	
		    $modifier = [];
		    $modifier["name"] = $eachmodifier->product_modifier_name;
		    $modifier["maxselect"] = $eachmodifier->MaxQuantity;
		    

		   //dd($menumodifiers->where('product_modifier_id',73));
		   //Get the modifier price from the menumodifiers collection by using eachmodifier id
		   $menumodrecord = $menumodifiers->where('product_modifier_id',$eachmodifier->id);
		   $modprice =	$menumodrecord->first()->product_modifier_price;
	           
	           if($modprice == 0){
		      $modprice = null;
		   }

		   $modifier["price"] = $modprice;

		   $groupmodifier[$modgroupname]["modifiers"][$modifier["name"]]=$modifier;
		}//End of foreach(modifiers)
		
	     }//End of foreach(modifiergroups)
	     
	     
	    
	}//End of Ifelse menu exists
	else
	{
	   $retarray["error"] = "No Menu Found";
	   $status = 203;
	 }



	 
	 //print_r($retarray);
	 //print "var data=".str_replace(array('[',']'),'',json_encode($retarray));
	 print "var data=".json_encode($retarray);
	 print "\n";
	 print "var modifiers=".json_encode($groupmodifier);
	 
     }


}//Share Class end