<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class StoreProductGroupModifierRequest extends Request
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
            'ModifierGroupName' => 'required|string|unique:product_modifier_groups,ModifierGroupName',
	    'MinSelectedItems' => 'required|numeric',
	    'MaxSelectedItems' => 'required|numeric',
	    'AddTagPriceToOrderPrice' => 'sometimes|boolean',
	    'TaxFree' => 'sometimes|boolean',
	    'FreeTagging' => 'sometimes|boolean',
	    'SaveFreeTags' => 'sometimes|boolean',
	    'GroupTag' => 'sometimes|string',
	    'ColumnCount' => 'sometimes|numeric|min:1',
	    'ButtonHeight' => 'sometimes|numeric|min:1',
	    'Hidden' => 'sometimes|boolean',

	    'modifier.*.product_modifier_name' => 'required|string|distinct',
	    'modifier.*.MaxQuantity' => 'required|numeric|min:0',
	    'modifier.*.SortOrder' => 'required|numeric|min:1',
	    'num_modifiers' => 'required|numeric|min:0',

	    'map.*.product_category' => 'required|string',
	    'map.*.products' => 'required|string'
	    ];
    }
}
