<!-- ProductModifierGroupInputField Start -->
<div class="row">
 <div class="col-md-4">

 <div class="form-group">
 {{Form::label('ModifierGroupName','Name') }}
 {{Form::text('ModifierGroupName',null,['class' => 'form-control','disabled'])}}
 </div>
 
 <div class="form-group">
  {{Form::label('MinSelectedItems','Min. Selected Items:') }}
  {{Form::number('MinSelectedItems',null,['class' => 'form-control'])}}
 </div>
 
 <div class="form-group">
  {{Form::label('MaxSelectedItems','Max. Selected Items:') }}
  {{Form::number('MaxSelectedItems',null,['class' => 'form-control'])}}
 </div>

 <div class="checkbox">
  <label>
   {{Form::checkbox('AddTagPriceToOrderPrice','1')}}
   Add Tag Price to Order Price
   </label> 
 </div>

 <div class="checkbox">
  <label>
   {{Form::checkbox('TaxFree','1')}}
   Tax Free
  </label>
 </div>

 <div class="checkbox">
  <label>
   {{Form::checkbox('FreeTagging','1')}}
   Free Tagging
  </label>
 </div>

 <div class="checkbox">
  <label>
   {{Form::checkbox('SaveFreeTags','1')}}
   Save Free Tags
  </label>
 </div>

 <div class="panel panel-default"> <!-- Panel Display Setting Start -->
      <div class="panel-heading">
        Display Settings
      </div>

      <div class="panel-body"><!-- Panel Body Start -->

       <div class="row">
       	    <div class="col-sm-6">
	    {{Form::label('GroupTag','Group Tag')}}
	    </div>

	    <div class="col-sm-6">
	    {{Form::text('GroupTag',null,['class' => 'form-control'])}}
	    </div>
       </div>	

       <div class="row">
       	    <div class="col-sm-6">
	    {{Form::label('ColumnCount','Column Count')}}
	    </div>

	    <div class="col-sm-6">
	    {{Form::text('ColumnCount',null,['class' => 'form-control'])}}
	    </div>
       </div>

       <div class="row">
       	    <div class="col-sm-6">
	    {{Form::label('ButtonHeight','Button Height')}}
	    </div>

	    <div class="col-sm-6">
	    {{Form::text('ButtonHeight',null,['class' => 'form-control'])}}
	    </div>
       </div>

       <div class="checkbox">
       <label>
       {{Form::checkbox('Hidden','1')}}
       Hidden
       </label>
       </div>

      </div><!-- Panel Body End -->
 </div> <!-- Panel Display Setting End -->

 
 
 
 </div> <!-- End Product Modifier Group Details -->

<!-- Start the ProductModifiers Panel -->
 <div class="col-md-4">
 
 @include('productmodifiergroup.modifierforminputshow')

 </div>
<!-- End the ProductModifiers Panel -->


</div> <!-- Div main Row End -->
