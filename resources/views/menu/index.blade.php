@extends('common.app')

@section('title')
Menu
@endsection

@section('content')
<!-- Container start -->
<div class="container">

@include('common.errors')
@include('common.messages')
<!-- Start Content -->
<div class="row"> <!-- Start of Row -->
 <div class="panel panel-primary"><!-- Start of panel -->
 <div class="panel-heading">
 <a href="{{route('menu.create')}}" role="button" class="btn btn-default btn-sm">Create a new Menu</a> 
 </div>

 <div class="panel-body">
 @if(isset($menu) && count($menu) >0)
 <table class="table table-condensed">
 <thead>
 <th>#</th>
 <th>Menu Name</th>
 <th>Status</th>
 <th>Actions</th>
 </thead>


 <tbody>
 
 @foreach($menu as $index=>$entry)
 <tr>
  <td>{{$index+1}}</td>
  <td>{{$entry['menu_name']}}</td>
  <td>
  <span class="label @if($entry['active'])label-success"@else label-default" @endif>
  @if($entry['active']) Active @else Inactive @endif
  </td>
  <td>
  @if(!$entry['active'])
  <a href="{{route('menu.activate',$entry['id'])}}" role="button" class="btn btn-success btn-xs">Activate</a>
  @else
  <a href="{{route('menu.activate',$entry['id'])}}" role="button" class="btn btn-default btn-xs">Deactivate</a>
  @endif
  <a href="{{route('menu.edit',$entry['id'])}}" role="button" class="btn btn-warning btn-xs">Edit</a>
  <a href="{{route('menu.delete',$entry['id'])}}" role="button" class="btn btn-danger btn-xs">Delete</a>
  </td>
 </tr>
 @endforeach
 </tbody>
 </table>
 @endif
 </div>

 </div><!-- End of Panel -->
</div><!-- End of Row -->
<!-- End Content -->
</div>
<!-- End of Container -->


@endsection