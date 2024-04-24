<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class UpdateMenuRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
	//dd($this->request->all());
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
	    //'menu_name' => 'required|unique:menus,menu_name',
            'product.*.product_name' => 'required|string|exists:products,product_name',
	    'product.*.price' => 'sometimes|numeric',
	    'modifier.*.ModifierGroupName' => 'required|string|exists:product_modifier_groups,ModifierGroupName',
	    'modifier.*.product_modifier.*.product_modifier_name' => 'required|string|exists:product_modifiers,product_modifier_name',
	    'modifier.*.product_modifier.*.product_modifier_price' => 'sometimes|numeric'
        ];
    }


}
