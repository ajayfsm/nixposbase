{{-- resources/views/index/index.blade.php --}}
@extends('common.app')

@section('title','- Index page')

@section('content')
<div class="container">
  <div class = "row"> 

  <div class="col-lg-2" id="button-area">
    
    
   </div>

   <div class="col-lg-6" id="bill-area" style="height:625px"> 
   	<div id="billing_bar" style="font-size:14px;">

	<div id="billing_area" style="height:595px;border:1px solid #dfdfdf;">
	<div style="width:100%;background-color:brown;"> Table no T1 </div>
	<div style="width:100%;background-color:teal;" id="newOrder"> New Order</div>
	<div style="width:100%;background-color:violet;">pax : 20 | waiting :20mins</div>
	
	

	<div>
	  <div class="col_qty col-xs-2"><p class="text-left">QTY</p></div>
	  <div class="col_name col-xs-7">ITEM</div>
	  <div class="col_price col-xs-3">PRICE</div>
	</div>
	<div style="clear:both;"></div>

	<div id="bill_area" style="height:500px;font-size:14px;overflow-y:scroll;">
	
	</div>
	
	<div id="bill_balance_area" class="pull-right" style="padding:10px">
	<span>Balance:<span>
	<span id="bill_amount"></span>
	</div>
      	

	</div> <!-- Billing area end -->
	</div> <!-- billing bar end -->
    </div> <!-- bill-area end -->

   <div class="col-lg-4" id="menuitem-area">
   MenuItems
   <div class="form-inline">
   <input class="form-control" type="text" id="menuitem-selector" name="menuitem-selector"></input> 
   <button id="add-item" class="btn btn-primary form-control"> + </button>
   </div>

   <div id="menu-item-buttons"></div>
   
   </div>

   
   </div>

   
   <footer class="footer pull-right">
    (c) PirateFish Restaurants Private Limited, 2016
   </footer>

</div>
@endsection

@push('scripts-footer')
<script src="{{asset('/jqueryui/jquery-ui.js')}}"></script>
<script src="{{asset('/scripts/menudata.js')}}"></script>
<script src="{{asset('/scripts/core.js')}}"></script>



<script>
$(function(){



var t = new Bill();

var i = new Item('A1','crostini melanzana',180);
i.addModifier({"name":"chicken","price":100,"maxselect":3});

i.addModifier({"name":"fusili","price":"null","maxselect":1});

i.addModifier({"name":"chicken","price":100,"maxselect":3});
i.addModifier({"name":"chicken","price":100,"maxselect":3});

i.addModifier({"name":"chicken","price":100,"maxselect":3});




console.log(i);








t.addItem(i);

console.log(t);


refreshBillArea();
updateBillAmount();


//On clicking any menu item in the bill area
$('#menu-item-buttons').on('click','div>div>button',function(){
 var parentid = $(this).attr('parent');

 var insertObj = {};
 insertObj['name'] = $(this).attr('value');
 insertObj['price'] = $(this).attr('price');
 insertObj['maxselect'] = $(this).attr('maxselect');

 t.getItemById(parentid).addModifier(insertObj);
 refreshBillArea();
 updateBillAmount();

 //Refresh menu items buttons area
 var itemobj = t.getItemById(parentid);
 $('#menu-item-buttons').html(displayModifiersByCode(itemobj.code,data,itemobj))
 
});


//On clicking any button in the button area
$('#button-area').on('click','button',function(){
	var method = $(this).attr('method');
	var parent = $(this).attr('parent');

	if(method == 'delete'){
		  t.removeItem(parent);
		  $('#button-area').html(refreshItemOptions());
		  $('#menu-item-buttons').html('');
		  refreshBillArea();
		  updateBillAmount();
	}

	if(method == 'increaseQty'){
		  var item = t.getItemById(parent);
		  console.log(item);
		  item.addQuantity();
		  refreshBillArea();
		  updateBillAmount();
	}

	if(method == 'decreaseQty'){
		  var item = t.getItemById(parent);
		  console.log(item);
		  item.removeQuantity();
		  refreshBillArea();
		  updateBillAmount();
	}
	
	
		  
});


//On clicking the (+) button next to add item 
$('#add-item').click(function(){

	var itemCode = $('#menuitem-selector').val().toUpperCase();
		
	var itemObj = findItemByCode(itemCode,data);

	if(itemObj){
	    t.addItem(new Item(itemCode,itemObj.name,itemObj.price));
	    $('#menuitem-selector').val('');    
	}

	
	refreshBillArea();
	updateBillAmount();
	

	
});

function refreshBillArea(){
	 $('#bill_area').html(t.displayBill());
	 $('.selectable').selectable({
		filter: $('.selectable').children('div'),
		selected : function(event,ui){
			 var selectedid = ui.selected.id;
			 var itemobj = t.getItemById(selectedid);
			 //console.log(itemobj);
			 $('#menu-item-buttons').html(displayModifiersByCode(itemobj.code,data,itemobj));
			 $('#button-area').html(refreshItemOptions(itemobj.__id));
			 updateBillAmount();

		},
	  });
}


function refreshItemOptions(itemCode){

	 if(itemCode===undefined){
		return '';
	 }
	 
	 var alldiv = document.createElement('div');
	 

	 var deleteBtn = document.createElement("button");
	 deleteBtn.setAttribute('class','btn btn-primary');
	 deleteBtn.setAttribute('id','delete-button');
	 deleteBtn.setAttribute('parent',itemCode);
	 deleteBtn.setAttribute('method','delete');
	 deleteBtn.appendChild(document.createTextNode('Delete Item'));
	 
	 alldiv.appendChild(deleteBtn);


	 var increaseQty = document.createElement("button");
	 increaseQty.setAttribute('class','btn btn-primary form-control');
	 increaseQty.setAttribute('id','increase-qty');
	 increaseQty.setAttribute('parent',itemCode);
	 increaseQty.setAttribute('method','increaseQty');
	 increaseQty.appendChild(document.createTextNode('Quantity +'));
	 alldiv.appendChild(increaseQty);


	 var decreaseQty = document.createElement("button");
	 decreaseQty.setAttribute('class','btn btn-primary form-control');
	 decreaseQty.setAttribute('id','decrease-qty');
	 decreaseQty.setAttribute('parent',itemCode);
	 decreaseQty.setAttribute('method','decreaseQty');
	 decreaseQty.appendChild(document.createTextNode('Quantity -'));
	 alldiv.appendChild(decreaseQty);
	 


	 return alldiv;	 
}


function updateBillAmount(){
	 $('#bill_amount').html(t.getBillAmount());
}




});
</script>
@endpush

@push('stylesheets')
<link rel="stylesheet" href="{{asset('/jqueryui/jquery-ui.css')}}"></link>

<style>
.order_lineitem{
color:#7d0705;
}

.order_linemods{
    font-size: 10px;
}


.selectable .ui-selecting { color: red; }
.selectable .ui-selected { color : green;  }

</style>
@endpush

