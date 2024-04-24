
<!-- resources/views/productmodifier/list.blade.php -->

@if(isset($modifiers) && count($modifiers) > 0)
<div class="panel panel-primary"> <!-- List Panel Start -->
<table class="table">
@foreach($modifiers as $key=>$modifier)
<tr>
<td>{{++$key}}</td>
<td>{{$modifier['product_modifier_name']}}</td>
<td>
<a class="btn btn-warning btn-sm" href="{{route('productmodifier.edit',$modifier['id'])}}" role="button">
Edit
</a>
<a class="btn btn-danger btn-sm" href="{{route('productmodifier.delete',$modifier['id'])}}" role="button">
Delete
</a>



</td>
</tr>
@endforeach
</table>
</div><!-- List Panel End -->
@endif
