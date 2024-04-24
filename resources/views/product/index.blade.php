<!-- resources/views/product/index.blade.php -->
@extends('common.app')

@section('title','-Product')

@section('content')
<div class="container">

<!-- Errors -->
@include('common.errors')


<!--Messages -->
@include('common.messages')


<!-- Start all content code here -->

<div class="panel panel-primary"><!--Primary Panel Start -->
 <div class="panel-heading"> Create New Product </div>

 <div class="panel-body"><!-- Panel Body Start -->
 {{Form::open(array('url' => route('product.store'),'method'=>'put')) }}
 
 <!-- Form contents begin -->
 @include('product.forminput',['button_name' => 'Create Product'])

 {{Form::close()}}

 </div> <!-- Panel Body End -->
</div> <!-- Primary Panel End -->


<!-- List Panel Start -->
@include('product.list',$products)
<!-- List Panel End -->



<!-- End all content code here -->
</div>
@endsection

