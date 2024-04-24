@extends('common.app')



@section('title','Create Menu')

@section('content')
@include('common.errors')
@include('common.messages')


<!-- start content -->
<!-- start container -->
<div class="container">

{{Form::open(array('url'=>route('menu.store'),'method'=>'put'))}}
<!-- Start container row -->
<div class="row"

<!-- Start Main Panel -->
<div class="panel panel-primary">

  <!-- Start Main Panel Heading -->
  <div class="panel-heading">
   Create Menu
   
  </div>
  <!-- End Main Panel Heading -->
  
  <!-- Start Main Panel Body -->
  <div class="panel-body">
   <div class="form-group">
   {{Form::label('menu_name',"Name of the menu")}}
   {{Form::text('menu_name',isset($menuname)?$menuname:null,['class'=>'form-control'])}}
   
   </div>
   @include('menu.product')   
  
  </div>
  <!-- End Main Panel Body -->

  <div class="panel-footer">
  <!-- Start Save Button Holder -->
    @include('menu.savebutton',['buttontext'=>'Save'])
   <!-- End Save Button Holder -->
  </div>



</div>
<!-- End Main Panel -->


</div>
<!-- End container row -->

{{Form::close()}}

</div>
<!-- end container -->
<!-- end content -->
@endsection

@push('scripts-header')
<script src="{{asset('jqueryui/jquery-ui.js')}}"></script>
<script src="{{asset('select/dist/js/select2.min.js')}}" type="text/javascript"></script>
<script src="{{asset('scripts/DOMcreate.js')}}"></script>
@endpush

@push('stylesheets')
<link href="{{asset('select/dist/css/select2.css')}}" rel="stylesheet"></link>

<style>
.ui-selected { background-color: #f2f2f2; }
</style>

@endpush


@push('scripts-footer')
<script src="{{asset('scripts/menu/create.js')}}" type="text/javascript"></script>
@endpush