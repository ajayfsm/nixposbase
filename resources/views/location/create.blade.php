<!-- resources/views/location/index.blade.php -->
@extends('common.app')

@section('title','Location')

@section('content')
<div class="container">

<!-- Errors -->
@include('common.errors')


<!--Messages -->
@include('common.messages')


<!-- Start all content code here -->

<div class="panel panel-primary"><!--Primary Panel Start -->
 <div class="panel-heading"> Create New Location </div>

 <div class="panel-body"><!-- Panel Body Start -->
 {{Form::open(array('url' => route('location.store'),'method'=>'put')) }}
 
 <!-- Form contents begin -->
 @include('location.forminput',['button_name' => 'Create Location'])

 {{Form::close()}}

 </div> <!-- Panel Body End -->
</div> <!-- Primary Panel End -->


<!-- List Panel Start -->
@include('location.list',$loclist)
<!-- List Panel End -->



<!-- End all content code here -->
</div>
@endsection
