
<!-- resources/views/product/edit.blade.php -->
@extends('common.app')

@section('title','-Delete Product')

@section('content')
<div class="container">

<!-- Errors -->
@include('common.errors')

<!--Messages -->
@include('common.messages')


<!-- Start all content code here -->

<div class="panel panel-primary"><!--Primary Panel Start -->
 <div class="panel-heading"> Delete Product </div>

 <div class="panel-body"><!-- Panel Body Start -->
 {{Form::model($deleteproduct,array('url' => route('product.destroy',$id),'method'=>'post')) }}

 {{Form::hidden('id',$id)}}
 
 @include('product.forminput',['button_name' => 'Delete Product'])

{{Form::close()}}

 </div> <!-- Panel Body End -->
</div> <!-- Primary Panel End -->


<!-- List Panel Start -->
@include('product.list',$products)
<!-- List Panel End -->



<!-- End all content code here -->
</div>
@endsection

