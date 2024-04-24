<?php

namespace App;

use App\Product;

use Illuminate\Database\Eloquent\Model;

class MenuProduct extends Model
{
    protected $guarded = ['id'];


    //Relationship
    public function product(){
    	   return $this->hasOne('App\Product','id','product_id');
    }
}
