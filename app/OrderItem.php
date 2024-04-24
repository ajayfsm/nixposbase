<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderItem extends Model
{
    //Using SoftDeletes Traits
    use SoftDeletes;

    // Guarded parameter to Blacklist the fields not fillable
    protected $guarded = ['id'];

    //Guarding dates
    protected $dates = ['deleted_at'];




    /* Relationships */
    public function bill(){
       return $this->belongsTo('App\Bill');
    }         


}