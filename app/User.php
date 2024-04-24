<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    /**
     * RELATIONSHIPS
     **/

    /**
     * A User has many roles
     */

     public function role(){
      return $this->belongsToMany('App\Role')->withTimestamps();
     }
     

     /**
      * A User belongs to many Locations
      *
      **/
      
     public function location(){
     	    return $this->belongsToMany('App\Location')->withPivot('home')->withTimestamps();
     }


     /**
      * A user can create many Bills
      */

      public function bill(){
      	     return $this->hasMany('App\Bill');
      }






     /**
      * ACL Methods
      */

      protected $whitelist = ['change-location'];



     /**
     * Function to get the array of all permissions for a user
     */
     public function getAllPermissions(){
        //Get all roles
	$roles = $this->role;

	//permission array
	$perm_array = [];
	
	//Iterate through all roles and get the permissions
	foreach($roles as $role){
           foreach($role->permission as $permission){
	       array_push($perm_array,$permission->toArray()['permission_slug']);
	   }
	}

	return array_sort(array_unique($perm_array),function($value){return $value;});

     }


     public function getAllRoles(){
     //Get all roles
     $roles = $this->role;

     //Return roles array
     $role_array = [];

     foreach($roles as $role){
     	array_push($role_array,$role->toArray()['role_slug']);
	}

     return array_unique($role_array);

     }

     /**
      * Function to check if the given user is an Admin
      */
     public function isAdmin(){
       return in_array('admin',$this->getAllRoles());
     }


     /**
     * hasPermission($permissions)
     * @var array
     * @return boolean(true/false)
     * Checks to see if the user has all the given permissions and returns
     */

     public function hasPermission($permissions){

     if($this->isAdmin()){
	return true;     
     }

     //Cast Permissions into an array
     $permissions = (array) $permissions;

      //set the default return as false
      $defaultret = false;

      //get all permissions for the user
      $allpermissions = $this->getAllPermissions();

      
      foreach($permissions as $permission)
      {
            
       if(!in_array($permission,$allpermissions) && !in_array($permission,$this->whitelist)){
	  return false;
	  }
	
      }

      //Successfully has all the permissions required
      return true;

     }




     /**
      * Location Methods
      */

      /**
       * Fetch the home Location ID for a given user
       * @return (int)LocationID
       */
       
      public function getHomeLocation(){
      //If user is an ADMIN, return the first active location as Home
      if($this->isAdmin())
	{
	  $homeloc_collect = Location::active(true)->first();
	}
	else{      
      	     $homeloc_collect =  $this->belongsToMany('App\Location')
	     		      	 ->withPivot('home')
				 ->wherePivot('home',1)->first();
	     }
	 return $homeloc_collect->toArray();
      }


      /**
       * Get the Location Ids for a given user
       * @params $expand[default=false]; if true return the slug and city and area details too
       * @return (array)
       */
       public function getLocationIds($expand=false){
       	      //Get the locations for a particular user which are active
	      /**
		* Response looks like
	       	* array: [ 0 => array["id" => 1,
		         "pivot" => array[]
			   ],
			     1 => array
			         "id" => 2
				     "pivot" => array:5 
				       ]
		          ]
	       
	       **/

	       //If user is an Admin, send all active locations
	       if($this->isAdmin())
	       {
	         $locations = Location::active(true)->get()->toArray();
	       }
	       else
	       {
		$locations = $this->location()->active(true)->get()->toArray();
	       }

	      // Create an empty array
	      $locations_array = [];

	      //Iterate through all locations and insert location ids into array
	      foreach($locations as $location){

	      //If expand flag is false			 
	       if(!$expand){
	      	   array_push($locations_array,$location['id']);
		 }
	       else
	       {
	          $locationrecord = array(
		  'id' => $location['id'],
		  'area' => $location['location_area'],
		  'city' => $location['location_city'],
		  'slug' => $location['location_slug']
		  );
		  array_push($locations_array,$locationrecord);
	       }
	      }

	      return $locations_array;
       }

       /**
        * Check if the user has access to a particular location
	*/

	public function canAccessLocation($locationid){
	       //Check if the user is Admin, then return true
	       if($this->isAdmin()){
		return true;
	       }

	       //If user is not Admin, check if locationid is in the array
	       return in_array($locationid,$this->getLocationIds());
	       
	}
      

}
