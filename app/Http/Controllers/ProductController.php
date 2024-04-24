<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Product;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;


class ProductController extends Controller
{

    /**
     * Function index
     * Method for the index of Product controller
     *
     * @param void
     * @return View
     */
    public function index(){
    	   $products = Product::orderBy('product_category','ASC')->orderByRaw("lpad(product_code, 5, 0) asc")->get()->toArray();
	   $inputarray = ['products' => $products];
	   return view('product.index',$inputarray);
    }


    /**
     * Function store
     * Method for storing a product
     *
     * @param void
     * @return View
     */
    public function store(StoreProductRequest $request){
    $newproduct = new Product;
    $newproduct->product_name = trim($request->product_name);
    if($request->has('product_code')){
	$newproduct->product_code = trim($request->product_code);
    }

    if($request->has('product_category')){
	$newproduct->product_category = trim($request->input('product_category'));
    }
    
    $newproduct->save();
    return redirect(route('product.index'))->with('message','New Product Created Successfully');
	       

    }

    /**
     * Function Edit
     * Method for editing a product
     * @param productid
     * @return View
     */
     public function edit($id){
     	
     	$product = Product::find($id);
	$newarray['id'] = $id;
	$newarray['editproduct'] = $product;
	$newarray['products'] = Product::orderBy('product_category','ASC')->orderByRaw("lpad(product_code, 5, 0) asc")->get()->toArray(); 
	return view('product.edit',$newarray);
     }


     /**
     * Function Update
     * Method for updating a product
     * @param UpdateProductRequest
     * @return View
     */
     public function update(UpdateProductRequest $request,$id){
     	  //Get the ID from the list
     	  $id = $request->id;

	  //Get the product with a given ID
	  $updatedproduct = Product::find($id);

	  //IfUpdatedFlag
	  $ifUpdated = false;
		
	  //update the product category if there is a difference
	  if($updatedproduct->product_category !== trim($request->product_category)){
	  	$updatedproduct->product_category = trim($request->product_category);

		//Set updatedFlag to true;
		$ifUpdated = true;
	  }
	  
	  //Update the product name if there is a difference
	  if($updatedproduct->product_name !== trim($request->product_name)){
	   $updatedproduct->product_name = trim($request->product_name);

	   //Set updatedFlag to true;
	   $ifUpdated = true;
	  }

	  //If an update happens: either description or category changed
	  if($ifUpdated){
		$updatedproduct->save();
	  }
	  return redirect(route('product.index'))->with('message','Product Successfully Updated');

     }

     


     /**
      * Function delete
      * Method for deleting a product
      * @param (product)id
      * @return View
      */

      public function delete($id){
      	//Get Product based on ID
      	$product = Product::find($id);

	//Send ID
	$newarray['id'] = $id;

	//Send retrieved product
	$newarray['deleteproduct'] = $product;

	//Get all the products for the list
	$newarray['products'] = Product::orderBy('product_category','ASC')->orderByRaw("lpad(product_code, 5, 0) asc")->get()->toArray();

	//Return View
	return view('product.delete',$newarray);
      	     



      }


      public function destroy(Request $request,$id){

      	     
      	     $product = Product::where([
	     'id'=>$id,
	     'product_name'=>$request->product_name,
	     'product_code'=>$request->product_code,
	     'product_category' => $request->product_category
	     ]);

	     if($product->delete()){      	     
      	     return redirect(route('product.index'))->with('message','Product Deleted');
	     }
	     else{
	     return redirect(route('product.index'))->with('message','Product Not Deleted');
	     }
      }

}
