
<!-- resources/views/productmodifiergroup/index.blade.php -->
@extends('common.app')

@section('title','-Product Modifier Group')

@section('content')
<div class="container">

<!-- Errors -->
@include('common.errors')


<!--Messages -->
@include('common.messages')


<!-- Start all content code here -->

<div class="panel panel-primary"><!--Primary Panel Start -->
 <div class="panel-heading"> Create New Product Modifier Group</div>

 <div class="panel-body"><!-- Panel Body Start -->
 
 
 <div class="row"> <!-- Names Row Start -->
 <div class="col-sm-4">
 Click here to create a new Product Modifier Group
 <a href="{{route('productmodifiergroup.create')}}" role="button" class ='btn btn-primary'
 id='create-product-modifier-group' name='create-product-modifier-group'>
 Create Modifier Group
 </a>
 </div>
 
 <div class="col-sm-2">
 <!-- Empty --> 
 </div>
 <div class="col-sm-6">
 <!-- Empty -->
 </div>

 </div><!-- Names Row End -->

  </div> <!-- Panel Body End -->
</div> <!-- Primary Panel End -->


<!-- List Panel Start -->
@include('productmodifiergroup.list',$modifiers)
<!-- List Panel End -->



<!-- End all content code here -->
</div>
@endsection

