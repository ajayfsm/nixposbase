<!-- resources/views/location/forminput.blade.php -->
<div class="row"> <!-- Names Row Start -->

 <div class="col-sm-3">
  {{Form::label('location_city','City')}}
 </div>
     
 <div class="col-sm-2">
  {{Form::label('location_area','Locality')}}
 </div>
 
 <div class="col-sm-2">
  
 </div>

 <div class="col-sm-4">
 </div>

 </div><!-- Names Row End -->

 <div class="row"> <!-- Field Row Start -->

 <div class="col-sm-3">
  {{Form::text('location_city',null,['class' => 'form-control']) }}
 </div>

 <div class="col-sm-2">
  {{Form::text('location_area',null,['class' => 'form-control']) }}
 </div>

 <div class="col-sm-2">
 {{Form::submit($button_name,['class' => 'btn btn-primary form-control'],'submit-product') }}
 
 </div>

 <div class="col-sm-4">
 
 </div>
 </div><!-- Field Row End -->