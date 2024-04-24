@extends('common.app')

@section('title','Delete Menu')

@section('content')
@include('common.messages')
<!-- start content -->
<!-- start container -->
<div class="container">

{{Form::open(array('url'=>route('menu.destroy',$menuid),'method'=>'post'))}}

<!-- Start container row -->
<div class="row"

<!-- Start Main Panel -->
<div class="panel panel-primary">

  <!-- Start Main Panel Heading -->
  <div class="panel-heading">
   Delete Menu
   <p class="pull-right clearfix">
   <button type="submit" class="btn btn-xs btn-danger">Confirm Delete</button>
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
