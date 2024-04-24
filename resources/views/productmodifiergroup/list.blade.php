
<!-- resources/views/productmodifiergroup/list.blade.php -->

@if(isset($modifiers) && count($modifiers) > 0)
<div class="panel panel-primary"> <!-- List Panel Start -->
<table class="table">
<thead>
<th>#</th>
<th> Product Modifier Group </th>
<th> Actions </th>
</thead>


@foreach($modifiers as $key=>$modifier)
<tr>

<td>{{++$key}}</td>

<td><a href="{{route('productmodifiergroup.show',$modifier['id'])}}">
{{$modifier['ModifierGroupName']}}
</a>
</td>

<td>
<a class="btn btn-warning btn-sm" href="{{route('productmodifiergroup.edit',$modifier['id'])}}" role="button">
Edit
</a>
<a class="btn btn-danger btn-sm" href="{{route('productmodifiergroup.delete',$modifier['id'])}}" role="button">
Delete
</a>

</td>
</tr>
@endforeach
</table>
</div><!-- List Panel End -->
@endif
