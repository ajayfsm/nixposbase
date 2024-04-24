@extends('common.app')



@section('title','Show Menu')

@section('content')
@include('common.messages')
<!-- start content -->
<!-- start container -->
<div class="container">

{{Form::open()}}

<!-- Start container row -->
<div class="row"

<!-- Start Main Panel -->
<div class="panel panel-primary">

  <!-- Start Main Panel Heading -->
  <div class="panel-heading">
   Show Menu
   <p class="clearfix pull-right">
   <a href="{{route('menu.edit',$menuid)}}" role="button" class="btn btn-warning btn-xs">Edit</a>
   <a href="{{route('menu.delete',$menuid)}}" role="button" class="btn btn-danger btn-xs">Delete</a>
   </p>
  </div>
  <!-- End Main Panel Heading -->
  <fieldset disabled="disabled">  
  <!-- Start Main Panel Body -->
  <div class="panel-body">
   <div class="form-group">
   {{Form::label('menu_name',"Name of the menu")}}
   {{Form::text('menu_name',isset($menuname)?$menuname:null,['class'=>'form-control','disabled'=>'disabled'])}}
   </div>
   @include('menu.product')   
  
  </div>
  <!-- End Main Panel Body -->

</div>
<!-- End Main Panel -->

</div>
<!-- End container row -->
</fieldset>
{{Form::close()}}

</div>
<!-- end container -->
<!-- end content -->
@endsection
