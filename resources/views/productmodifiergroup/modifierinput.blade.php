
@if(isset($modifier))

<tr class="draggable">
 <td class="handle">
  <div>{{$modifier['SortOrder']}}</div>
  <input type="hidden" id="modifier[{{ $modifier['SortOrder'] }}][SortOrder]" name="modifier[{{$modifier['SortOrder']}}][SortOrder]" value="{{$modifier['SortOrder']}}" />
  </td>

  <td>
  <div contenteditable="true">{{$modifier['product_modifier_name']}}</div>
  <input type="hidden" id="modifier[{{$modifier['SortOrder']}}][product_modifier_name]" name="modifier[{{$modifier['SortOrder']}}][product_modifier_name]" value="{{$modifier['product_modifier_name']}}" />
 </td>

 <td>
 <div contenteditable="true">{{$modifier['MaxQuantity']}}</div>
 <input type="hidden" id="modifier[{{$modifier['SortOrder']}}][MaxQuantity]" name="modifier[{{$modifier['SortOrder']}}][MaxQuantity]" value="{{$modifier['MaxQuantity']}}" />
 </td>
</tr>

@endif