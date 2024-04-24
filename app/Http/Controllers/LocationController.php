<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Location;
use Auth;
use App\Http\Requests\StoreLocationRequest;

class LocationController extends Controller
{
    public function create(){
    	$locations = new Location;
	$data['loclist'] = $locations->active(true)->get()->all();
    	return view('location.create',$data);
    }


    public function store(StoreLocationRequest $request){
    	$newloc = new Location;
	$newrecord = $request->only(['location_slug','location_area','location_city']);
	$newloc->create($newrecord);
	return redirect()->route('location.create')->with('message',"Location Added Successfull");
    }

    public function change(Request $request,$location){
    	   $getlocation = Location::where(['location_slug' => $location])->active(true)->firstOrFail();
	   $location_id = $getlocation->id;
	   

	   if($request->user()->canAccessLocation($location_id)){
		$locationobj = ['location_id' => $getlocation->id,
			        'location_area' => $getlocation->location_area,
				'location_city' => $getlocation->location_city,
				'location_slug' => $getlocation->location_slug,
				];
		$request->session()->put($locationobj);
	   }

	   //dd($request->session()->all());
	   return back();
    }
}

