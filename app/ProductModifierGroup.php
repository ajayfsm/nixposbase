<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class ProductModifierGroup extends Model
{
    
    //Using SoftDeletes Traits
    use SoftDeletes;

    // Guarded parameter to Blacklist the fields not fillable
    protected $guarded = [];

    //Guarding dates
    protected $dates = ['deleted_at'];

    //Casting the values
    protected $cast = [
    'ModifierGroupName' => 'string',
    'SortOrder' => 'integer',
    'ColumnCount' => 'integer',
    'ButtonHeight' => 'integer',
    'MaxSelectedItems' => 'integer',
    'MinSelectedItems' => 'integer',
    'AddTagPriceToOrderPrice' => 'boolean',
    'FreeTagging' => 'boolean',
    'SaveFreeTags' => 'boolean',
    'GroupTag' => 'string',
    'TaxFree' => 'boolean',
    'Hidden' => 'boolean'
    ];

    //Relationships
    public function ProductModifier(){
    	return $this->hasMany('App\ProductModifier','ProductModifierGroupId');
    }

    public function ProductModifierGroupMap(){
       return $this->hasMany('App\ProductModifierGroupMap','product_modifier_group_id');
    }    

    

    
}
