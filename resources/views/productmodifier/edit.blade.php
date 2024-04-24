
<!-- resources/views/productmodifier/edit.blade.php -->
@extends('common.app')

@section('title','-Edit Product Modifier')

@section('content')
<div class="container">

<!-- Errors -->
@include('common.errors')


<!--Messages -->
@include('common.messages')


<!-- Start all content code here -->

<div class="panel panel-primary"><!--Primary Panel Start -->
 <div class="panel-heading"> Update Product Modifier </div>

 <div class="panel-body"><!-- Panel Body Start -->
 {{Form::model($editmodifier,array('url' => route('productmodifier.update',$id),'method'=>'post')) }}
 
 <div class="row"> <!-- Names Row Start -->
 <div class="col-sm-4">
  {{Form::label('product_modifier_name','Product Modifier Description')}}
 </div>
 
 <div class="col-sm-2">
 {{Form::hidden('id',$id)}}
 </div>
 <div class="col-sm-6">
 <!-- Empty -->
 </div>

 </div><!-- Names Row End -->

 <div class="row"> <!-- Field Row Start -->
 <div class="col-sm-4">
 
 {{Form::text('product_modifier_name',null,['class' => 'form-control']) }}
 </div>
 
 <div class="col-sm-2">
 {{Form::submit('Update Modifier',['class' => 'btn btn-primary form-control'],'submit-product') }}
 </div>

 <div class="col-sm-6">
 </div>
 </div><!-- Field Row End -->

 {{Form::close()}}

 </div> <!-- Panel Body End -->
</div> <!-- Primary Panel End -->


<!-- List Panel Start -->
@include('productmodifier.list',$modifiers)
<!-- List Panel End -->



<!-- End all content code here -->
</div>
@endsection

