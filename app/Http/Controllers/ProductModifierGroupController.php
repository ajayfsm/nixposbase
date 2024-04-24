<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\ProductModifierGroup;
use App\ProductModifier;
use App\Http\Requests\StoreProductGroupModifierRequest;
use App\Http\Requests\UpdateProductGroupModifierRequest;
use App\Product;
use App\ProductModifierGroupMap;

class ProductModifierGroupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	$modifiers = ProductModifierGroup::all()->toArray();
	return view('productmodifiergroup.index',['modifiers' => $modifiers]);        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
	// Get the session stored modifier, if this is form validation error return then
	// it will help in repopulating with the old values, if it is first time it will
	// return null
	
	$modifiers = old('modifier');
	$productmodifiergroupmaps = old('map');
	
	

	//Remove blank entries from the productmodifiersgrouparray
	if(isset($productmodifiergroupmaps)){
	
	$resetarr = [];

	for($i=0;$i<count($productmodifiergroupmaps);$i++){
	   $map = $productmodifiergroupmaps[$i];

	   
	   if(trim($map['product_category']) == "" || trim($map['products']) == ""){
	   	unset($productmodifiergroupmaps[$i]);
	   }
	   else
	   {
		array_push($resetarr,$map);
	   }
	 }

	 //Now make resetarr into productmodifiergroupmaps
	 $productmodifiergroupmaps = $resetarr;
	 $resetarr = [];
	 }


	//Create an input arr to send all the data required for the View
	$inputarr = [];
	$inputarr['modifiers'] = $modifiers;

	//Get the session stored map
	$inputarr['productmodifiergroupmaps'] = $productmodifiergroupmaps;

	//Return the View
	return view('productmodifiergroup.create',$inputarr);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProductGroupModifierRequest $request)
    {
       //Get the ProductModifierGroup Details
      
      $newgroupdetails = $request->except(['modifier','num_modifiers','_token','map','productmodifiergroupmaps']);

      //Get a new ProductModifierGroup object and save it
      $newgroup = new ProductModifierGroup;
      $createdgroup = $newgroup->create($newgroupdetails);

      //Retrieve the saved ProductModifierGroup instance as savedgroup
      $savedgroup = ProductModifierGroup::find($createdgroup->id);

      
      //Get the modifiers array
      $newmodifiers = $request->only('modifier');

      //The above statement gets an array, which contains another array of modifiers with key modifier
      $newmodifiers = $newmodifiers['modifier'];


      if(count($newmodifiers)>0){
      //For each modifier in the array, save the modifier and associate with saved ProductModifierGroup
      foreach($newmodifiers as $key=>$modifier){
      	  
      	  $newmodifier = new ProductModifier;
	  $savedmodifier = $newmodifier->create($modifier);
          $savedgroup->ProductModifier()->save($savedmodifier);
      }
      }

      
      //Store the ProductModifierGroupMap
      $newmap = $request->only('map');
      $newmap = $newmap['map'];

      //For each of the entry, store it with the PMG group name
      for($i=0;$i<count($newmap);$i++){
	  $value = $newmap[$i];
          $map = new ProductModifierGroupMap;
	  $map->product_modifier_group_id = $createdgroup->id;
	  $map->product_category = $value['product_category'];
	  $map->products = $value['products'];
	  $map->save();
      }
      

      //Once done return to Create Page with Success Message
      return redirect(route('productmodifiergroup.show',$savedgroup->id))->with('message','Group Created Successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       
	//Get Group Modifier Data along with Modifier data in array[product_modifier]
	$groupmodifier = ProductModifierGroup::find($id);
	$productmodifiergroupmaps = $groupmodifier->ProductModifierGroupMap()->get()->toArray();
	
	$oldformdata = $groupmodifier->toArray();

	$modifiers=$groupmodifier->ProductModifier()->orderBy('SortOrder')->get()->toArray();
	

	$inputarray =[];
	$inputarray['id'] = $id;
	$inputarray['modifiers']=$modifiers;
	$inputarray['oldformdata'] = $oldformdata;
	$inputarray['productmodifiergroupmaps'] = $productmodifiergroupmaps;

	//dd($oldformdata);
	return view('productmodifiergroup.show',$inputarray);
 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
	$id = $id;

	//Get Form Submission fields in case there is an validation error
	$modifiers = old('modifier');
	$productmodifiergroupmaps = old('map');
	
	//Get Group Modifier Data along with Modifier data in array[product_modifier]
	$groupmodifier = ProductModifierGroup::find($id);
	
	$oldformdata = $groupmodifier->toArray();
	
		
	if($modifiers===null){
	 $modifiers=$groupmodifier->ProductModifier()->orderBy('SortOrder')->get()->toArray();
	}

	if($productmodifiergroupmaps===null){
	  $productmodifiergroupmaps = $groupmodifier->ProductModifierGroupMap()->get()->toArray();
	}

	//Remove blank entries from the productmodifiersgrouparray
	if(isset($productmodifiergroupmaps)){
	$resetarr = [];
	
	 for($i=0;$i<count($productmodifiergroupmaps);$i++){
	   $map = $productmodifiergroupmaps[$i];

	   if(trim($map['product_category']) == "" || trim($map['products']) == ""){
	   	unset($productmodifiergroupmaps[$i]);
	   }
	   else
	   {
		array_push($resetarr,$map);
	   }
	 }

	 //Now make resetarr into productmodifiergroupmaps
	 $productmodifiergroupmaps = $resetarr;
	 $resetarr = [];
	 }

	

	$inputarray =[];
	$inputarray['modifiers']=$modifiers;
	$inputarray['id'] = $id;
	$inputarray['oldformdata'] = $oldformdata;
	$inputarray['productmodifiergroupmaps'] = $productmodifiergroupmaps;
	
	
	return view('productmodifiergroup.edit',$inputarray);

	
	 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProductGroupModifierRequest $request, $id){
        $toBeUpdatedGroup = ProductModifierGroup::find($id);

	$toBeUpdatedGroup->update($request->except(['modifier','num_modifiers','_token','map','productmodifiergroupmaps']));

	$modifiers = $request->only('modifier')['modifier'];

	//Get all the Product Modifiers for a Given Group
	$allmodifiers = $toBeUpdatedGroup->ProductModifier()->get()->toArray();

	//Get all the ids in the group
	$allmodifiersID = array_pluck($allmodifiers,'id');

	
	//Store all the modifier IDs which are present in this request
	//The modifier IDs present in the GroupModifier and not in this request are to be deleted
	$request_ID = [];

	if(count($modifiers)>0){
	//Iterate through all modifiers
	foreach($modifiers as $modifier){
	    //If the modifier has an ID, then update the record with the new details
	    //Since ID can be spoofed, we first check if the modifier ID exists in the Group
	    //Then update it, if not leave it, as it identifies mischief by the user

	    if(array_has($modifier,'id'))
	     {
	      $modifiedModifier = $toBeUpdatedGroup->ProductModifier()->where('id',$modifier['id'])->first();
	      
	      if($modifiedModifier!=null){
		array_push($request_ID,$modifier['id']);
		$modifiedModifier->update(array_except($modifier,'id'));
	      }
	      
	     }
	     //Else it means it is a new addition
	     else{
		$newmodifier = new ProductModifier;
	  	$savedmodifier = $newmodifier->create($modifier);
          	$toBeUpdatedGroup->ProductModifier()->save($savedmodifier);
	     }
	  }
	  }

	//Now get the ID which are present in the original ModifierGroup but not in the Request
	$deletedID = array_diff($allmodifiersID,$request_ID);

	foreach($deletedID as $key=>$deleteid){
	   ProductModifier::find($deleteid)->delete();
	}



	//Update the ProductModifierGroupMap
	ProductModifierGroupMap::where('product_modifier_group_id',$id)->delete();

	//Store the ProductModifierGroupMap
      	$newmap = $request->only('map');
      	$newmap = $newmap['map'];

      	//For each of the entry, store it with the PMG group name
	for($i=0;$i<count($newmap);$i++){
	  $value = $newmap[$i];
	  $map = new ProductModifierGroupMap;
	  $map->product_modifier_group_id = $id;
	  $map->product_category = $value['product_category'];
	  $map->products = $value['products'];
	  $map->save();
      }
      
	 return redirect(route('productmodifiergroup.show',$id))->with('message',"Group Updated Successful");
    }


    /**
     * Display Page for Destroy
     */

     public function delete($id){
       //Get Group Modifier Data along with Modifier data in array[product_modifier]
	$groupmodifier = ProductModifierGroup::find($id);
	$productmodifiergroupmaps = $groupmodifier->ProductModifierGroupMap()->get()->toArray();
	
	$oldformdata = $groupmodifier->toArray();

	$modifiers=$groupmodifier->ProductModifier()->orderBy('SortOrder')->get()->toArray();
	

	$inputarray =[];
	$inputarray['id'] = $id;
	$inputarray['modifiers']=$modifiers;
	$inputarray['oldformdata'] = $oldformdata;
	$inputarray['productmodifiergroupmaps'] = $productmodifiergroupmaps;		
	return view('productmodifiergroup.delete',$inputarray);
      }




    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
	//Get Group Object
	$groupmodifier = ProductModifierGroup::find($id);

	//Delete all modifiers associated with the Group
	$groupmodifier->ProductModifier()->delete();

	$groupmodifier->ProductModifierGroupMap()->delete();
	//Delete the group
	$groupmodifier->delete();
	
	return redirect(route('productmodifiergroup.index'))->with('message','Group Deleted Successfully');
	}
}
