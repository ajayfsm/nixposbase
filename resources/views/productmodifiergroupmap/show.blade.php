<div class="col-md-4">
<!-- Start map panel -->
<div class="panel panel-default">

  <!-- start map panel heading -->
  <div class="panel-heading">
   Product Modifier Group Map
  </div>
  <!-- end map panel heading -->

  <!-- start map panel body -->
  <div class="panel-body">

   
    <table class="table table-bordered">
   <input type="hidden" name="productmodifiergroupmaps" id="productmodifiergroupmaps" value=0></input>
   <thead>
   <th width="50%">Product Category</th>
   <th width="50%">Product</th>
   </thead>

   <tbody id="mapTableBody">
   <!-- Include the map form elements -->
   @include('productmodifiergroupmap.inputformshow')
   </tbody>
   
   </table>
   
   
 </div>
  <!-- end map panel body -->
  

 </div>
<!-- End map panel -->


<!-- End of col-md div -->
</div>

@push('scripts-footer')
<script>

function initSelect2(){
	 $('.mapProductCategory,.mapProduct').each(function(){
	 	 $(this).select2();
	 });

	 
	 $('#mapTableBody').selectable({
	 'filter':'tr',
	  });

	  $('.mapProductCategory').on("select2:select",function(e){
		var querystr = e.params.data.id;
		var self = this;
		$.ajaxSetup({
	   	 headers: {
		 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	    	 },
		 contentType: 'application/json; charset=utf-8',
		 context: this,
		 });

		$.post('/share/product/'+querystr).then(function(data){
		var prodata = JSON.parse(data);
		var parent = $(self).parent().parent();
		var productsel = parent.children("td:nth-child(2)").children("select");
		productsel.html("<option value='*'>*</option>");
		for(var num in prodata){
		   var oneprod = prodata[num];
		   productsel.append("<option value='"+oneprod['product_name']+"'>"+oneprod['product_name']+"</option>");
		}
		
		  
		  
		});
	  });
	 
}


initSelect2();

$("#addMapItems").on("click",function(){

	//Find number of mapSelectables are in the table
	var nummapsel = $('.mapSelectable').length;

	//Create a new TR in the table
	var tr1 = new DomElem("tr",null,{'class':'mapSelectable'});

	//Containing a TD with a Select Element, containing one Blank Option
	var td1 = new DomElem("td");

	$.ajaxSetup({
	    headers: {
		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	    },
	contentType: 'application/json; charset=utf-8',
	context: this,
	});

	//Get Product Categories
	$.post('/share/productcategory').then(function(data){
	var catdata = JSON.parse(data);

	var sel1 = new DomElem("select",
	    	   null,
		   {'class':'form-control mapProductCategory',
		   'id':"map["+nummapsel+"][product_category]",
		   'name':"map["+nummapsel+"][product_category]"		   
		   },
		   new DomElem("option","").get());
	sel1.addNode(new DomElem("option","*",{'value':'*'}).get());	   
        	   
	for(var product in catdata){
		var cat = catdata[product];
		sel1.addNode(new DomElem("option",cat,{'value':cat}).get());
	}	   

	td1.addNode(sel1.get());

	//Also create another TD containing a select element with one Blank Option
	var td2 = new DomElem("td");
	var sel2 = new DomElem("select",
		   null,
		   {'class':'form-control mapProduct',
		   'id':"map["+nummapsel+"][products]",
		   'name':"map["+nummapsel+"][products]",
		   
		   },
		   new DomElem("option","").get());
        
        td2.addNode(sel2.get());
	
	//Add both TD to TR
	tr1.addNode(td1.get());
	tr1.addNode(td2.get());

	//Append this TR to the mapTableBody
	$("#mapTableBody").append(tr1.get());


	//Update number of element in productmodifiergroupmaps variable
	$('#productmodifiergroupmaps').val($('.mapSelectable').length);
	
	//Initalize the Select2 binding on these newly created select boxes
	initSelect2();


	
	
	});
	
	
});

$("#removeMapItems").on("click",function(){
	$('#mapTableBody .ui-selected').each(function(){
	  $(this).remove();
	  $('#productmodifiergroupmaps').val($('.mapSelectable').length);

	  var numelem = 0;
	  
	  //Renumber the ids and names to reflect no missing numbers
	  $('.mapSelectable').each(function(){

	  var numselect = 0;
	  
	  //Get the child td 
	  $(this).children("td").each(function(){

		if(numselect == 0){
		  //Get the select['product_category'] 
		  var select = $(this).children("select");
		  select.attr('id',"map["+numelem+"][product_category]");
		  select.attr('name',"map["+numelem+"][product_category]");
		  numselect++;
		}
		else{
		  //Get the select['product']
		  var select = $(this).children("select");
		  select.attr('id',"map["+numelem+"][products]");
		  select.attr('name',"map["+numelem+"][products]");
		  numselect = 0;
		}

	  });
	  numelem++;

	  });
	  
	});
});


//On selecting the ProductCategory
$('.mapProductCategory').on("select2:select",function(e){console.log(this)});

//




</script>
@endpush

@push('scripts-header')
<link href="{{asset('/select2/dist/css/select2.min.css')}}" rel="stylesheet" />
<script src="{{asset('/select2/dist/js/select2.min.js')}}"></script>
@endpush