<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    /**
    * The attributes that are mass assignable
    *
    *@var array
    */

    protected $fillable = ['permission_slug','permission_human','permission_description','active'];

    /**
     * A permission belongs to many Roles
     */

     public function role(){
     	    return $this->belongsToMany('App\Role')->withTimestamps();
     }


     /**
     * Mutator for permission_slug variable
     * Always store in lower case
     */

     public function setPermissionSlugAttribute($value){
     	 $this->attributes['permission_slug'] = strtolower($value);

     }
}
