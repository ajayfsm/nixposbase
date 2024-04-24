<!-- productmodifiergroup/create.blade.php -->

@extends('common.app')

@section('title')
- Product Modifier Group
@endsection



@section('content')
<div class="container">

@include('common.errors')

@include('common.messages')

<!-- Content code Start -->

<div class="panel panel-primary">
 <div class="panel-heading">
  New Product Group Modifier
 </div>

 <div class="panel-body">
  {{Form::model($oldformdata,array('route' => array('productmodifiergroup.update',$id),'method'=>'PUT'))}}

  <!-- Form Body ProductModifierGroup -->
  @include('productmodifiergroup.groupforminputedit')
  <!-- End Form Body ProductModifierGroup -->
  </div>

  <!-- Order Mapping -->
   </div>

   @include('productmodifiergroupmap.edit')
   
  {{Form::close()}}
 </div>
 <!-- Content code End -->

</div>
@endsection

@push('scripts-header')

<script src="{{asset('jqueryui/jquery-ui.js')}}"></script>
<script src="{{asset('scripts/DOMcreate.js')}}"></script>

@endpush

@push('scripts-footer')

<script>

/**
 * Resort Sortable List
 * Re-sorts the elements in the sortable list and assigns the right key numbers to the first DIV
 */

function sortableResortList(){
	 var sortablelistelem = $('table.sortable tr.draggable');

	 //Set the number of modifiers in the list to num_modifiers
	 $('#num_modifiers').val(sortablelistelem.length);
	 
	 
	 $.each(sortablelistelem,function(key,element){
		$(element).children("td:first").children("div").html(Number(key)+1);

		//If the tr contains an ID div, update the SortOrder on the ID too
		if($(element).children("input[type='hidden']").length){
		   $(element).children("input[type='hidden']")
		   .attr('name','modifier['+(Number(key)+1)+'][id]')
		   .attr('id','modifier['+(Number(key)+1)+'][id]');
		 }
		
		
		//Also assign the input(sortOrder) for the element
		$(element).children("td:first").children("input[type='hidden']")
		.val(Number(key)+1)
		.attr('name','modifier['+(Number(key)+1)+'][SortOrder]')
		.attr('id','modifier['+(Number(key)+1)+'][SortOrder]');

		
		//Also assign the inputID (Tag) for the element
		$(element).children("td:eq(1)").children("input[type='hidden']").attr('name',
		'modifier['+(Number(key)+1)+'][product_modifier_name]').attr('id','modifier['+(Number(key)+1)+'][product_modifier_name]');

		//Also assign the inputID(maxQuantity) for the element
		$(element).children("td:last").children("input[type='hidden']").attr('name',
		'modifier['+(Number(key)+1)+'][MaxQuantity]').attr('id','modifier['+(Number(key)+1)+'][MaxQuantity]');
				
	 });
}





</script>



<script>
$(document).ready(function(){
	console.log('Ready');

	
	
	$('.sortable').sortable({
	  items: "> tbody > tr.draggable",

	  handle: ".handle",
	  
	  stop: function(event,ui){
	  	 sortableResortList();
                }
	});

	//On selecting a item
	$('.sortable').on('click',"tbody tr td.handle",function(e){
	    //Remove all the classes from all tr
	    removeSelections();

	    //Add class selected
	    $(this).parent().addClass('ui-selected');
	    

	});

	//On clicking the Add Product Modifier Button
	$('#addProductModifier').click(function(){

	// DomElem = new DomElem(type of elem,body of elem,attributes,nodes);
	
	   var emptytr = new DomElem("tr",'',{'class':'draggable'});

	   var emptytd = new DomElem("td",'',{'class':'handle'},new DomElem('div','').get());

	   emptytd.addNode(
	    new DomElem('input','',{'type':'hidden','name':'modifier[][SortOrder]','id':'modifier[][SortOrder]','value':''}).get()
	   );
	   
	   emptytr.addNode(emptytd.get());
	   

	   var emptytd = new DomElem("td",'',false,
	    new DomElem('div','',{'contentEditable':'true','style':'min-height:20px;'}).get()
	   );
	   
	   emptytd.addNode(
	    new DomElem('input','',{'type':'hidden','name':'modifier[][product_modifier_name]','id':'modifier[][product_modifier_name]','value':''}).get()
	   );
	   emptytr.addNode(emptytd.get());


	   var emptytd = new DomElem("td",'',false,	   
	   new DomElem('div','',{'contentEditable':'true','style':'min-height:20px;'}).get());

	   emptytd.addNode(
	    new DomElem('input','',{'type':'hidden','name':'modifier[][MaxQuantity]','id':'modifier[][MaxQuantity]','value':''}).get()
	   );
	   emptytr.addNode(emptytd.get());

	   
	   $('table.sortable').append(emptytr.get());	   
	   sortableResortList();
	   
	});

	//Remove the selected item
	$('#removeProductModifier').click(function(){
	  $("table.sortable tbody tr.ui-selected").remove();
	  sortableResortList();
	});

	
	//To remove ui-selected class from all the objects
	function removeSelections(){
		   $('table.sortable tbody tr').removeClass('ui-selected');	
	};


	//on Blur-removal of focus from any editable div in the sortable list
	$("table.sortable").on("blur","div[contenteditable='true']",
	function(event){
		$(this).parent().children("input").attr('value',$(this).html());
		console.log($(this).parent().children("input").val());

	});


	

	
});
</script>
@endpush

@push('stylesheets')
<style>
.ui-selected { background-color: #f2f2f2; }
</style>
@endpush


