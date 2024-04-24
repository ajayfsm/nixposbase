<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    /**
    * A location has many users
    */

    public function user(){
    	   return $this->belongsToMany('App\User')->withPivot('home')->withTimestamps();
    }


    
    // Fields which are mass assignable
    protected $fillable = ['location_slug','location_area','location_city','active'];

    // Mutator to store the location_slug as lowercase slug always
    public function setLocationSlugAttribute($value){
    	   $this->attributes['location_slug']=str_slug(trim($value),"-");
    }

    //Scope for getting active records - active(true/false)
    public function scopeActive($query,$flag){
       	   return $query->where('active',$flag);
    }

    //Scope for storing all area names in lower case
    public function setLocationAreaAttribute($value){
    	   $this->attributes['location_area'] = strtolower(trim($value));
    }

    //Scope for storing all city names in lower case
    public function setLocationCityAttribute($value){
    	   $this->attributes['location_city'] = strtolower(trim($value));
    }

    //Getting all Area names in UCwords
    public function getLocationAreaAttribute($value){
    	   return ucwords($value);
    }

    //Getting all City names in UCwords
    public function getLocationCityAttribute($value){
    	   return ucwords($value);
    }

    
    
    
}
