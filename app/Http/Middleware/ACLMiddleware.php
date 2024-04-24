<?php

namespace App\Http\Middleware;

use Closure;
use Route;


/**
 * ACL  Middleware
 * alias acl
 * accepts @permissions Array, containing list of permissions required ['edit-bill','index-bill' etc.]
 */ 

class ACLMiddleware{     
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $permissions=null)
    {
	if($permissions === NULL || $permissions == NULL){
	//Get the currently requested route
	$route = Route::current();

	//Get Route name -> generally it is <controller>.<method> format
	$routename = $route->getName();

	//Change it to <method>-<controller>
	$permissions = implode("-",array_reverse(explode(".",$routename)));
	}

	if($request->user()->isAdmin()){
	  return $next($request);
	}
	
	if(! $request->user()->hasPermission($permissions))
	{
	  abort(403,"No Permission");;
	}

	return $next($request);
    }
}

