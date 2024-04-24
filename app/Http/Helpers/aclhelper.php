<?php

/**
 * Function to create a route link if user has permission
 */

 function aclUrl($displayname,$routename,$params){
 //Check if the user is logged in
 if(Auth::check()){
	$user = Auth::user();
	$route_name = implode("-",array_reverse(explode(".",$routename)));
	//dd($user->hasPermission($route_name));
	if($user->hasPermission($route_name)){
		
		return "<li><a href=\"".url(route($routename,$params))."\">".$displayname."</a></li>";
	}
	else
		return false;
 }
}


 function canAccessAtleast($permissions){
  if(Auth::check()){
   $user = Auth::user();
    $permissions = (array) $permissions;
     foreach($permissions as $permission){
      if($user->hasPermission($permission)){
       return true;
      }
     }
    }
    return false;
    }
  
