<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;
use Auth;
class StoreLocationRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check();
    }

    /**
     * Add the Location Slug attribute to the request object
     */

     public function __construct(\Illuminate\Http\Request $request)
     {

	
	//Some sanitizing of inputs
	 $request->replace(['location_city' => trim($request->location_city),'location_area' => trim($request->location_area)]);
	 
	

	 // Creating the location slug as a concatenate of city and area with only "-"
	 $prelocation_slug = implode("-",$request->only('location_city','location_area'));
	 $location_slug = str_slug($prelocation_slug,"-");

	 //Adding location_slug ATTRIBUTE to the REQUEST array
	 $request->merge(['location_slug' => $location_slug]);
	 
     }





    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

	//Create a Location Slug and insert it into the Input
	/*
	 * Addl Comment: This need to be done in the request parameter added to the construct
	 */
	//$this->createLocationSlug();
	
	
	/**
	 * Validation rules
	 * location_slug is required(if present), unique in the locations table
	 * location_area is required, unique for the a given location_city, contains only alphanumeric and space
	 * location_city is required, and contains only alphanumeric and space
	 */
        return [
	  'location_slug' => 'sometimes|unique:locations,location_slug|regex:/^[a-z\d\-]+$/i',
	  'location_area' => 'required|regex:/^[a-z\d\s]+$/i|unique:locations,location_area,NULL,id,location_city,'.$this->input('location_city'),
	  'location_city' => 'required|regex:/^[a-z\d\s]+$/i',
	  ];
    }


    /**
     * Set the messages to the error message
     */
     public function messages()
     {
	return [
	 'location_slug.unique'   => 'City and Locality must be unique',
	 'location_area.regex'    => 'Can contain only numbers, alphabets and spaces',
	 'location_city.regex'    => 'Can contain only numbers, alphabets and spaces',
	 'location_area.required' => 'Please enter the Locality',
	 'location_city.required' => 'Please enter the city',
	 'location_area.unique'   => 'Locality must be unique in a given city',
	 ];
     
     }

          
     
}