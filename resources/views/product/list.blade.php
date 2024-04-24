
<!-- resources/views/product/list.blade.php -->

@if(isset($products) && count($products) > 0)
<div class="panel panel-primary"> <!-- List Panel Start -->
<table class="table">
<!-- Table Header -->

<thead>
<th>#</th>
<th>Category</th>
<th>Code</th>
<th>Description</th>
<th>Actions</th>
</thead>

@foreach($products as $key=>$product)
<tr>
<td>{{++$key}}</td>
<td>{{$product['product_category']}}</td>
<td>{{$product['product_code']}}</td>
<td>{{$product['product_name']}}</td>
<td>
<a class="btn btn-warning btn-sm" href="{{route('product.edit',$product['id'])}}" role="button">
Edit
</a>
<a class="btn btn-danger btn-sm" href="{{route('product.delete',$product['id'])}}" role="button">
Delete
</a>



</td>
</tr>
@endforeach
</table>
</div><!-- List Panel End -->
@endif
