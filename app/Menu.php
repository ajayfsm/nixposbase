<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\MenuProduct;
use App\MenuProductModifier;

class Menu extends Model
{
    protected $fillable = ['menu_name','active','location_id'];

    //Relationships
    public function menuproduct(){
    	   return $this->hasMany('App\MenuProduct','menu_id');
    }


    public function menuproductmodifier(){
    	   return $this->hasMany('App\MenuProductModifier','menu_id');
    }
    


}



