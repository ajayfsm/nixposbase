
@if(isset($modifier))

<tr>
 <td>
  <div>{{$modifier['SortOrder']}}</div>
 </td>

  <td>
  <div>{{$modifier['product_modifier_name']}}</div>
  </td>

 <td>
 <div>{{$modifier['MaxQuantity']}}</div>
 </td>
</tr>

@endif