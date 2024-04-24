<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class ProductModifier extends Model
{
    //Using SoftDeleted Trait
    use SoftDeletes;

    // Guarded Parameter to Blacklist the fields not fillable
    protected $guarded = ['id'];

    //Guarded dates
    protected $dates = ['deleted_at'];

    //Casting the values
    protected $cast = [
      'product_modifier_name' => 'string',
      'SortOrder' => 'integer',
      'ProductModifierGroupId' => 'integer',
      'MaxQuantity' => 'integer'
    ];

    //Relationships
    public function ProductModifierGroup(){
    	   return $this->belongsTo('App\ProductModifierGroup','ProductModifierGroupId');
    }
}
