
<!-- resources/views/product/edit.blade.php -->
@extends('common.app')

@section('title','-Edit Product')

@section('content')
<div class="container">

<!-- Errors -->
@include('common.errors')

<!--Messages -->
@include('common.messages')


<!-- Start all content code here -->

<div class="panel panel-primary"><!--Primary Panel Start -->
 <div class="panel-heading"> Update Product Details </div>

 <div class="panel-body"><!-- Panel Body Start -->
 {{Form::model($editproduct,array('url' => route('product.update',$id),'method'=>'post')) }}

 {{Form::hidden('id',$id)}}
 
 @include('product.forminput',['button_name' => 'Update Product'])

 {{Form::close()}}

 </div> <!-- Panel Body End -->
</div> <!-- Primary Panel End -->


<!-- List Panel Start -->
@include('product.list',$products)
<!-- List Panel End -->



<!-- End all content code here -->
</div>
@endsection

