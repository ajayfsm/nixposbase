<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\ProductModifier;
use App\Http\Requests\StoreProductModifierRequest;
use App\Http\Requests\UpdateProductModifierRequest;

class ProductModifierController extends Controller
{
    //Create Method
    public function index(){
    	   $modifiers = ProductModifier::all()->toArray();
	   $inputarray['modifiers'] = $modifiers;
	   return view('productmodifier.index',$inputarray);
    }


    //Store Method
    public function store(StoreProductModifierRequest $request){
    	   $newmodifier = new ProductModifier;
	   $newmodifier->product_modifier_name = trim($request->input('product_modifier_name'));
	   $newmodifier->save();
	   return redirect(route('productmodifier.index'))->with('message','Product Modifier created successfully');
    }


    //Edit Method
    public function edit($id){
    	   $oldmodifier = ProductModifier::find($id);
	   $modifiers = ProductModifier::all()->toArray();
	   $inputarray['modifiers'] = $modifiers;
	   $inputarray['editmodifier'] = $oldmodifier;
	   $inputarray['id'] = $id;
	   return view('productmodifier.edit',$inputarray);

    }


    //Update Method
    public function update(UpdateProductModifierRequest $request,$id){
    	 $oldproduct = ProductModifier::find($id);

	 if($id == $request->input('id') && $oldproduct->product_modifier_name != trim($request->input('product_modifier_name'))){
	 $oldproduct->product_modifier_name = trim($request->input('product_modifier_name'));
	 $oldproduct->save();
	 return redirect(route('productmodifier.index'))->with('message','Product Modifier Updated Successfully');	 }

	 return redirect(route('productmodifier.index'))->with('message','Something terrible happened');

    }


    //Delete Method
    public function delete($id){
    	   $oldmodifier = ProductModifier::find($id);
	   $modifiers = ProductModifier::all()->toArray();
	   $inputarray['modifiers'] = $modifiers;
	   $inputarray['deletemodifier'] = $oldmodifier;
	   $inputarray['id'] = $id;
	   return view('productmodifier.delete',$inputarray);
    }

    //Destroy Method
    public function destroy(Request $request,$id){
    	   $deletemodifier = ProductModifier::where([
	   'id' => $id,
	   'product_modifier_name' => $request->input('product_modifier_name')
	   ]);

	   $deletemodifier->delete();
	   return redirect(route('productmodifier.index'))->with('message','Product Modifier deleted');
    }

    
}
