<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;

class Bill extends Model
{
    //Using SoftDeletes Traits
    use SoftDeletes;

    // Guarded parameter to Blacklist the fields not fillable
    protected $guarded = ['id'];

    //Guarding dates
    protected $dates = ['deleted_at'];

    /* Relationships */
    public function orderitem(){
    	   return $this->hasMany('App\OrderItem');    
    }



    public function user(){
    	   return $this->belongsTo('App\User');

    }

    /* Mutators */
    public function setBillDateAttribute($value){
    	   $this->attributes['bill_date'] = Carbon::createFromFormat('d F Y',trim($value));
    }


    /* Accessors */
    public function getBillDateAttribute($value){
    	   return Carbon::createFromFormat('Y-m-d',$value)->format('d F Y');
    }

    /* Mutators */
    public function setBillStartTimeAttribute($value){
    	   $this->attributes['bill_start_time'] = Carbon::parse(trim($value));
    }

    /* Mutators */
    public function setBillEndTimeAttribute($value){
    	   $this->attributes['bill_end_time'] = Carbon::parse(trim($value));
    }

    


}
