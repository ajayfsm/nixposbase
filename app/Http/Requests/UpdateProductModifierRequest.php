<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class UpdateProductModifierRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
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
            'product_modifier_name' => 'required|string|unique:product_modifiers,product_modifier_name,'.$this->request->all()['id'] 
        ];
    }


    public function messages(){
    return[
    	   'product_modifier_name.required' => 'Product Modifier Description is required',
	   'product_modifier_name.string' => 'Product Modifier Description needs to be a string',
	   'product_modifier_name.unique' => 'Product Modifier already exists'
	   ];
	   }
}
