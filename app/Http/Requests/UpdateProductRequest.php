<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class UpdateProductRequest extends Request
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
            'product_code' => 'sometimes|alpha_num|unique:products,product_code,'.$this->request->all()['id'],
	    'product_name' => 'required|string|unique:products,product_name,'.$this->request->all()['id']
        ];
    }


    public function messages(){
    	   return [
	   
	   'product_code.alphanumeric' => 'Product code can contain only alphabets and numbers',
	   'product_code.unique' => 'Product Code already exists',
	   'product_name.required' => 'Product Description is required',
	   'product_name.unique' => 'Product Description already exists'
	   ];

    }
}
