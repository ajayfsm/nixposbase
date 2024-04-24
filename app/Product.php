<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{

     protected $guarded = ['id'];

     
    //Mutators

    /**
     * ProductCode Mutator
     * To always store the product code in uppercase
     *
     */
     public function setProductCodeAttribute($value){
     	    $this->attributes['product_code'] = strtoupper(trim($value));
     }

     /**
     * ProductCode Accessor
     * To retrieve the product code in uppercase
     *
     */
     public function getProductCodeAttribute($value){
     	    return strtoupper(trim($value));

     }


     /**
      * getAllProductCategories
      * TO get an array of all product categories
      */

      public static function getProductCategories($addstarflag=true){
      	     
      	     $products = static::all(['product_category'])->toArray();

	     $prod_cat_arr = [];
		foreach($products as $key=>$value){
		 array_push($prod_cat_arr,$value['product_category']);
	     }

	     if($addstarflag){
		array_push($prod_cat_arr,"*");
	     }


	     $uniq_prod_cat_arr = array_unique($prod_cat_arr);

	     $fin_prod_cat_arr = [];
	     foreach($uniq_prod_cat_arr as $key=>$oneprod){
	     	$fin_prod_cat_arr[$oneprod] = $oneprod;
	     }

	    

	     return $fin_prod_cat_arr;

      }

      /**
      * getProduct
      * To get an array of all product based on category
      */

      public static function getProduct($category){
      if(trim($category)!==""){ 
      if($category!=="*"){
	  $products = static::where('product_category',$category)->get()->toArray(); 
	  }
	  else{
	  $products = static::all()->toArray();
	  }

	  $ret_array = [];
	  $ret_array['*'] = "*";
	  foreach($products as $key=>$value){
	  	$ret_array[$value['product_name']]=$value['product_name'];
		
	  }

	  return $ret_array;
      }

	  return [];
      }



      /**
       * Get Modifiers
       * Searches the ProductModifierGroupMaps and returns all the ModifierGroups it is associated with
       */
       public function getModifierGroups(){
       	      $getmodifiers = ProductModifierGroupMap::where('products',$this->product_name)
	      ->orWhere(['product_category'=>$this->product_category,'products' => '*'])
	      ->orWhere(['product_category'=>'*','products' => '*'])
	      //->toSql();
	      //dd($getmodifiers);

	      ->get(['product_modifier_group_id'])->toArray();

	      //Create a array holder
	      $getmodid = [];

	      //Iterate and get all the ID values as a flattened array
	      foreach($getmodifiers as $onemod){
	   	array_push($getmodid,$onemod["product_modifier_group_id"]);
	       }
	       
	       //Get only the unique values
	       $getmodid = array_values(array_unique($getmodid));

	      return $getmodid;
	      
       }

}



    

