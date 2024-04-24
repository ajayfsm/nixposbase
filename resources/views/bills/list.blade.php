@extends('common.app')
@section('title','View Bills')
@section('content')
<div class="container">
<!-- Start all content here -->
 <div class="panel panel-primary">
  <div class="panel-heading"> List of Bills </div>

  <div class="panel-body"> <!-- Panel body start -->
   @include('bills.table',$bills)
  </div> <!-- Panel body end -->

</div><!-- End of Panel -->
 
<!-- End all content here -->
</div>
@endsection
