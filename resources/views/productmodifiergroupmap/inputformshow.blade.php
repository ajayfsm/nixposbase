@if(isset($productmodifiergroupmaps))

	@inject('product','App\Product')
	@foreach($productmodifiergroupmaps as $key=>$map)
	<tr class="mapSelectable">
	<td>{{$map['product_category']}}</td>
	<td>{{$map['products']}}</td>
	</tr>
	@endforeach
@endif
