<?php

namespace App;

use Illuminate\Database\Eloquent\Model;



class ProductModifierGroupMap extends Model
{
	//

	//Relationships
	public function ProductModifierGroup(){
	       return $this->belongsTo('App\ProductModifierGroup','product_modifier_group_id');
	}


	
}
