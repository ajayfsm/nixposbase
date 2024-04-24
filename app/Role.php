<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    /**
     * The attributes that are mass assignable
     *
     * @var array
     */

     protected $fillable = ['role_slug','role_human','active','role_description'];

     /**
      * A Role belongs to many Users
      */
      public function user(){
      	 return $this->belongsToMany('App\User')->withTimestamps();
      }

      /**
       * A Role belongs to many permissions
       */

       public function permission(){
       	  return $this->belongsToMany('App\Permission')->withTimestamps();
       }

       /**
	* Mutator for role_slug variable.
	* Always store in lower case
	*/

	public function setRoleSlugAttribute($value){
	   $this->attributes['role_slug'] = strtolower($value);
	}

       
}
