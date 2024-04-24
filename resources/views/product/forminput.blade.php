
<!-- resources/views/product/forminput.blade.php -->
<div class="row"> <!-- Names Row Start -->

 <div class="col-sm-3">
  {{Form::label('product_category','Product Category')}}
 </div>
     
 <div class="col-sm-2">
  {{Form::label('product_code','Product Code')}}
 </div>
 
 <div class="col-sm-4">
  {{Form::label('product_name','Product Description')}}
 </div>

 <div class="col-sm-2">
 </div>

 </div><!-- Names Row End -->

 <div class="row"> <!-- Field Row Start -->

 <div class="col-sm-3">
  {{Form::text('product_category',null,['class' => 'form-control']) }}
 </div>

 <div class="col-sm-2">
  {{Form::text('product_code',null,['class' => 'form-control']) }}
 </div>

 <div class="col-sm-4">
 {{Form::text('product_name',null,['class' => 'form-control']) }}
 </div>

 <div class="col-sm-2">
 {{Form::submit($button_name,['class' => 'btn btn-primary form-control'],'submit-product') }}
 </div>
 </div><!-- Field Row End -->