@if(isset($productmodifiergroupmaps))

	@inject('product','App\Product')
	
	@foreach($productmodifiergroupmaps as $key=>$map)
	
	<tr class="mapSelectable">
	<td>{{
	Form::select('map['.$key.'][product_category]',
	$product::getProductCategories(),
	null,
	['class'=>'form-control mapProductCategory']
	)}}</td>
	<td>{{
	Form::select('map['.$key.'][products]',
	$product::getProduct($map['product_category']),
	null,
	['class'=>'form-control mapProduct']
	)}}</td>
	</tr>
	@endforeach
@endif
