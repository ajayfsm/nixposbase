<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
use Session;

/**
 * This Middleware set the location of the user to home location
 */
 
class LocationPermissionMiddleware
{
    /**
     * Ensures the location of the user is set and validated.
     * @alias location.permit
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
       //Check if the user is authenticated
       if(Auth::check())
       {
	 //Get the user
	 $user = Auth::user();
	 
	 //See if location is set, else set it to home <--> Removed since Session:flush not working
	 if(!$request->session()->has('location_id')){

	 //Get the home location array
	    $homelocation = $user->getHomeLocation();

	 //Set the location_id/area/city/slug in session
            $request->session()->put(['location_id' => $homelocation['id'],'location_area' => $homelocation['location_area'],'location_city' => $homelocation['location_city'],'location_slug' => $homelocation['location_slug']]);
	    
	 }

       }
     
        return $next($request);
    }
}
