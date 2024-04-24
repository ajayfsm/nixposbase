$(function(){

     //Create a new bill
   var t = new Bill();

    //Add location
    t.location = $('#location').val();


    //Hide the settle page
    $('#settle-page').hide();

    //Focus on the CodeInput field
    $('#search_input').focus();

    //Reset Option Modifiers;
    resetOptionsModifiers()

    //Set Table Number
    $('#billtablenumberholder').on('click',function(){
	var tablenum = prompt("Enter the table Number");
	t.table = tablenum;
	$('#billtablenumber').html(t.table);
    });

    //Initiate Table Number
    $('#billtablenumber').html(t.table);

    
    //On clicking the settle button
    $('#settle').on("click settleactivate",function(event,saveFlag=false){
	$('#item_bar').html($("#settle-page").html());

	if(!saveFlag)
	    $(this).toggleClass("settleSelected");
	
	if($(this).hasClass("settleSelected")){
	    //Disable MenuItem selects
	    $( ".selectable" ).selectable({
		disabled: true
	    });
	    
	    
	    //Hide ItemOptions and MenuCategory
	    $('#option_bar').hide();
	    $('#menu_bar').hide();
	    
	    //Dialog Disable
	    //$('#billnumberinput').dialog("destroy");
	    //$('#billdateinput').dialog("destroy");
	}
	else{
	    $( ".selectable" ).selectable({
		disabled: false
	    });
	    
	    $('#option_bar').show();
	    $('#menu_bar').show();
	    
	    //Remove references to Settle
	    $('#item_bar').html('');
	    removeAllSelection();
	}
	
	
	//On clicking the Payment Type buttons
	$(".payment_buttons").on("click",function(){
	    
	    var type = $(this).attr("paytype");
	    var amount = Number($('#payment_charged').val());
	    
	    if(type =="cash"){
		if(amount>0 && amount <= t.settle.toBeSettledAmount){
		    t.settle.addPayment(amount,type);
		}
	    }
	    else if(type == "credit" && amount > 0 && amount <= t.settle.toBeSettledAmount){
		var cardnum = prompt("Enter last 4 digits of the Credit/Debit card");
		if(cardnum.toString().length == 4){
		    t.settle.addPayment(amount,type,{"CC Number":cardnum});		    
		} 
	    }
	    else if(type == "discount" && t.settle.toBeSettledAmount > 0){
		var discount = prompt("enter Discount % or discount Amount");
		t.settle.setDiscount(discount);
	    }
	    else if(type == "All" && t.settle.toBeSettledAmount > 0){
		//console.log(t.settle.toBeSettledAmount);
		$('#payment_charged').val(t.settle.toBeSettledAmount.toFixed(2));
		return false;
	    }
	    
	    //console.log(t.settle.paymentDetails);
	    populateSettlePage();
	});


	
	
	populateSettlePage();
	
    });
    
    

    
    //Init the bill with a new number
    $.ajaxSetup({
	    headers: {
		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	    },
	contentType: 'application/json; charset=utf-8',
	context: this,
	beforeSend: function(){
	    $('#spinner').show();
	},
	complete: function(){
	    $('#spinner').hide();
	}
	


    });

    var payload = {};
    payload['location'] = t.location;
    $.post($("#getNextBillIdUrl").val(),JSON.stringify(payload))
	.then(function(data){
	
	var ret = JSON.parse(data);
	t.billnum = Number(ret['bill_number'])+1;
	
	updateBillNumberandDate();
    });
	
    
    
  


    



    //Inititate the Change Bill Number and Change Bill Date Dialogs
    

    var billnumdialog = $('#billnumberinput').dialog({
	autoOpen: false,
	modal: true,
	buttons :[
	    { "text" : "Save",
	      "click" : function(){
		  t.setBillNumber($('#billnumber').val());
		  updateBillNumberandDate();
		  $(this).dialog("close");
	      }
	    },
	    {
		"text" : "Cancel",
		"click" : function(){
		    $(this).dialog("close");
		}
	    }
	]
    })

    
    $('#billdateinput').dialog({
	autoOpen:false,
	modal:true,
	buttons :[
	    { "text" : "Save",
	      "click" : function(){
		  t.setDate($('#billdatepick').val());
		  updateBillNumberandDate();
		  $(this).dialog("close");
	      }
	    },
	    {
		"text" : "Cancel",
		"click" : function(){
		    $(this).dialog("close");
		}
	    }
	],
	open: function(){
	    $('#billdatepick').datepicker({
		dateFormat : "d MM yy",
		constrainInput: true,
		gotoCurrent: true,
	    }).blur();
	},

	close:function(){
	    $('#billdatepick').datepicker('destroy');
	}
    });

    
    //Run Update the BillNumber & Date function
    //updateBillNumberandDate()
      
    function updateBillNumberandDate(){
	
	
	// For Number
	//Update the bill
	$('#billnum').html(t.billnum);

	//Update the input
	$('#billnumberinput').val(t.billnum);

	//For Date
	//Update the bill
	$('#billdate').html(t.billdate);
	
	//Update the input
	$('#billdatepick').val(t.billdate);
    }

    //$('#billdate').datepicker();
    
    refreshBillArea();
    updateBillAmount();

    $('#billing_bar').on("click","#billnumholder",function(){
	billnumdialog.dialog("open");
    })

    $('#billing_bar').on("click","#billdateholder",function(){
	$('#billdateinput').dialog("open");
    })

    

//On clicking any Modifier in the bill area
$('#item_bar').on('click','.modifier_buttons',function(){
    
    //console.log("modifier clicked");
    var modifierdiv = $(this).children("div:first");
    
    var parentid = modifierdiv.attr('parent');

    var insertObj = {};
    insertObj['name'] = modifierdiv.attr('value');
    insertObj['price'] = modifierdiv.attr('price');
    insertObj['maxselect'] = modifierdiv.attr('maxselect');
    insertObj['group'] = modifierdiv.attr('group');
    
    t.getItemById(parentid).addModifier(insertObj);
    refreshBillArea();
    updateBillAmount();
    
 //Refresh menu items buttons area
    var itemobj = t.getItemById(parentid);
    $('#item_bar').html(displayModifiersByName(itemobj.description,data,itemobj));
    $(".modifier_buttons").fitText(0.7);
});

 
//On clicking any button in the option_bar area
$('#option_bar').on('click','.button',function(){
	var method = $(this).attr('method');
	var parent = $(this).attr('parent');

    if(method == 'delete'){
	t.removeItem(parent);
	resetOptionsModifiers();
	refreshBillArea();
	updateBillAmount();
    }
    
    if(method == 'increaseQty'){
	var item = t.getItemById(parent);
	//console.log(item);
	item.addQuantity();
	refreshBillArea();
	updateBillAmount();
	}

	if(method == 'decreaseQty'){
	    var item = t.getItemById(parent);
	    //console.log(item);
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


    // On clicking any menu_bar  button, which is the Product Group
    $("#menu_bar").on("click",".child",function(e){
	removeAllSelection();
	

	//Get the choice clicked on in the menu bar
	var choice = $(this).html();
	var menuitemobj = getMenuItemsFromGroupName(choice,data);

	//Get the html from makeMenuItems function and remove the wrapping div by
	//Converting the returned object to a Jquery Object and calling HTML on it
	//Assigned returned html to div.item_bar inner html
	
	$('div.item_bar').html($(makeMenuItems(menuitemobj)).html());
	
	
	
    });


    //On inputting in the search_input box
    $('#search_input').on("keyup",function(event,ui){
	//On pressing enter Key
	if(event.keyCode == 13){
	    //Get the code in the input
	    var itemcode = $(this).val();

	    if(itemcode.length<1)
		return false;
	    
	    //Find the object with a given code
	    var itemobj = findItemByCode(itemcode,data);

	    //If code exists add and then set the input value to blank
	    if(itemobj){
		t.addItem(new Item(itemobj.code,itemobj.name,itemobj.price));
		$(this).val('');
		refreshBillArea();
		updateBillAmount();
	    }
	    
	}

    })

    //On Clicking the X button on Search Input
    $("#input_bar").on("click","button",function(){
	$(this).parent().children("input:first").val('');
    })

    
    //Get Menu Items from Group Name
    function getMenuItemsFromGroupName(groupname,data){
	if(data.hasOwnProperty(groupname)){
	    return data[groupname]
	}
	else{
	    return false;
	}
    }

    //Make MenuItems from MenuItems Object
    function makeMenuItems(menuitemobj){
	//Initialize a variable i to keep track of item_row
	var i = 0;

	//Wrapping Div
	var wrappingdiv = new DomElem("div");
	
	//Check if the variable passed is an object
	if(typeof menuitemobj === "object"){
	    for(menuitem in menuitemobj){
		menuitem = menuitemobj[menuitem];
		var code= menuitem['code'];
		var price = menuitem['price'];
		var name = menuitem['name'];
		
		
		var itemmenu = new DomElem("div",name,{"price":price,"id":code}).get();
		var itembutton = new DomElem("div",false,
					     {"class":"item_button",
					      "style":"font-size: 13.4857px;"
					     },itemmenu);
						
		if(i%5==0){
		    
		    var itemrow = new DomElem("div",false,{"class":"item_row","id":i});
		    wrappingdiv.addNode(itemrow.get());
		    itemrow.addNode(itembutton.get());
		    
		}
		else{
		    itemrow.addNode(itembutton.get());
		}

		i++;
		
		
	    }
	    
	}

	//If no elements in menuitemobj a blank div is returnedx
	return wrappingdiv.get();
    }
    

    // On clicking the MenuItems buttons in itembar
    $("#item_bar").on("click"," div.item_button",function(e){
	var clickedbutton = $(this);
	var clickedchoice = $(this).children("div");
	var choosencode = clickedchoice.attr('id');
	var choosenprice = clickedchoice.attr('price');
	var choosenitem = clickedchoice.html();
	//console.log(choosencode);
	//console.log(choosenprice);
	//console.log(choosenitem);

	var itemObj = findItemByName(choosenitem,data);

	if(itemObj){
	    t.addItem(new Item(itemObj.code,itemObj.name,itemObj.price));
	}

	
	refreshBillArea();
	updateBillAmount();
	
	
    });





    
    function refreshBillArea(){
	console.log(t);

	//Display the bill from the object 
	$('#bill_area').html(t.displayBill());

	//If there is a selectedid, set ui-selected class to it
	var selectedid = $('#selecteditem').val();
	//console.log('selectedid'+selectedid);
	
	if(selectedid!='' && !$('#'+selectedid).hasClass('ui-selected')){
	    $('#'+selectedid).addClass('ui-selected');
	}
	
	$('.selectable').selectable({
		filter: $('.selectable').children('div'),
		selected : function(event,ui){
		    var selectedid = ui.selected.id;

		    //Check to see if the selectedID already has been selected
		    //See if the selecteditem input field has the same value
		    var storedvalue = $('#selecteditem').val();
		    if(storedvalue==selectedid){
			$('#'+selectedid).removeClass('ui-selected');
			resetOptionsModifiers();
		    }
		    else
		    {
			// Set the selecteditem value to the selected element ID
			$('#selecteditem').val(selectedid);
			
			var itemobj = t.getItemById(selectedid);
			
			//Display the modifiers
			$('#item_bar').html(displayModifiersByName(itemobj.description,data,itemobj));
			$(".modifier_buttons").fitText(0.7);
			
			//Display the options
			$('#option_bar').html(refreshItemOptions(itemobj.__id));
			updateBillAmount();
		    }
		    
		},
	  });
    }

    // Function resetOptionsModifiers
    // Removes options from Options Bar
    // Removes items from Items bar
    // removes any Selected item IDs from selecteditem input element
    // Use for deleting, deselecting
    
    function resetOptionsModifiers(){
	$('#selecteditem').val('');
	$('#item_bar').html('');
	$('#option_bar').html(defaultOptionBarOptions());

	//Click Functions for Default Options
	$('#print_bill').on("click",function(){
	    t.printBill();
	});
	
    }



    //Function Default OptionBar menu
    function defaultOptionBarOptions(){
	var option = "";
	option+= "<div class='button parent'><div id='print_bill' class='child'>Print Bill</div></div>";
	return option;


	


    }


    // Function removeAllSelection
    // Removes all the ui-selected from all selectable objects
    // Used when clicking on ProductGroup
    function removeAllSelection(){
	//console.log('Removing all selected items');
	$('#bill_area .ui-selected').removeClass('ui-selected');
	$('#selecteditem').val('');
	resetOptionsModifiers();
    }

    

    // To return options when an Item is selected in the bill
    // shows the options on the left hand side bar
    // need the UUID(itemCode) of the line item
    // @param : UUID of the item in bill
    // @returns : HTML 
    function refreshItemOptions(itemCode){
	
	 if(itemCode===undefined){
		return '';
	 }
	 
	var alldiv = document.createElement('div');
	var alldiv = new DomElem("div");
	
	var deleteBtn = new DomElem("div",false,
				    {'id':'delete-button',
				     'parent':itemCode,
				     'method':'delete',
				     'class' :'button parent'},
				    new DomElem("div","Cancel Item",{'class':'child'}).get());
		 
	alldiv.addNode(deleteBtn.get());

	var increaseQty = new DomElem("div",false,
				    {'id':'increase-qty',
				     'parent':itemCode,
				     'method':'increaseQty',
				     'class' :'button parent'},
				    new DomElem("div","Quantity +",{'class':'child'}).get());


	alldiv.addNode(increaseQty.get());

	var decreaseQty = new DomElem("div",false,
				    {'id':'decrease-qty',
				     'parent':itemCode,
				     'method':'decreaseQty',
				     'class' :'button parent'},
				    new DomElem("div","Quantity -",{'class':'child'}).get());

	alldiv.addNode(decreaseQty.get());
	//console.log(alldiv.get());
	return alldiv.get();
    }


function updateBillAmount(){
	 $('#bill_amount').html(t.getBillAmount());
}

    //Save functionality
    $('#save').on("click",function(){
	$('.ui-error').each(function(index){
	    $(this).removeClass('.ui-error');
	});
	removeAllSelection();
	t.save();
    });


    function populateSettlePage(){
	
	t.settle.calcAmount();
	//console.log(tObj.settle);

	//Populate the Total Amount

	//Populate the discount
	$('#payment_discount').val(Number(t.settle.discount).toFixed(2));
	
	//Populate total
	$('#payment_total').val(Number(t.settle.toBeSettledAmount).toFixed(2));

	//Populate charged as 0.00
	$('#payment_charged').val(Number(0).toFixed(2));
	//Populate the Payment Table

	//Reset the table first
	$("#payment_table table").html('');

	//Create Table Headings
	$("#payment_table table").append("<th>#</th>"+
					 "<th>Payment Type</th>"+
					 "<th>Amount</th>"+
					 "<th>Details</th>"+
					 "<th>&nbsp</th>");

	//Iterate through payment details and create rows in table
	for(var num in t.settle.paymentDetails){
	    var paydetail = t.settle.paymentDetails[num];
	    var numtd = "<td>"+(Number(num)+1)+"</td>";
	    var paytype = "<td>"+paydetail.type+"</td>";
	    var amount = "<td>"+Number(paydetail.amount).toFixed(2)+"</td>";
	    
	    if(paydetail.hasOwnProperty("opts") && paydetail.opts !== null){
		var optstr = "<td>";
		var keys = Object.keys(paydetail.opts);
		//console.log(keys);
		//console.log(typeof keys);
		//console.log(optstr);
		for(key in keys){
		    //console.log(keys[key]+":"+paydetail.opts[keys[key]]);
		    optstr = optstr+""+keys[key]+": "+paydetail.opts[keys[key]];
		    //console.log(optstr);
		}
		
		optstr = optstr+"</td>";
	    }
	    else{
		var optstr = "<td></td>";
	    }

	    var removebtn = "<td>"+
		"<span style='cursor:pointer' class='payment_remove' parent ='"+paydetail.payid+"'>"+
		"X</span></td>";
	    $("#payment_table table").append("<tr>"+numtd+paytype+amount+optstr+removebtn+"</tr>");
	}
	
        //On clicking the payment remove button
	$('.payment_remove').on("click",function(e){
	    var parentId = $(this).attr("parent");
	    t.settle.removePayment(parentId);
	    populateSettlePage();
	})
    }
    
});
