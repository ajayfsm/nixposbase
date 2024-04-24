/*
 * unique
 * returns only an unique elements of an array
 */
function unique(arr){
    var ret = [];
    for(var i in arr){
	elem = arr[i];
	if(ret.indexOf(elem) === -1){
	    ret.push(elem)
	}
    }
    return ret;
}




/*
 * generateUUID
 * Generate a 5 character alphanumeric unique ID
 */
function generateUUID(){
    return (0|Math.random()*6.04e7).toString(36);
}

/*
 * findItemByCode(code,data)
 * Find an Item based on the Code
 */

function findItemByCode(code,data){

    for(groups in data){
	group = data[groups];
	
	for(items in group){
	    var item = group[items];
	    if(item['code'].toUpperCase() == code.toUpperCase()){
		return item;
	    }
	    

	}
    }
	
    return false;

}


/*
 * getModifiersByCode(code,data)
 * Get all the Modifiers of an Object based on Code
 */
function getModifiersByCode(code,data){
    var getObj = findItemByCode(code,data);

    
    if(getObj){
	console.log(getObj.modifiers);
	return getObj.modifiers;
    }
    else
	return {};
}


function displayModifiersByCode(code,data,itemobj){
    var getModifiers = getModifiersByCode(code,data);

    var alldiv = document.createElement("div");
   
    for(group in getModifiers){
	var groupdiv = document.createElement("div");
	groupdiv.appendChild(document.createTextNode(group));

	var modifiers = getModifiers[group];

	for(modifier in modifiers){
	    //Get each of the modifier
	    var eachmod = modifiers[modifier];

	    //Get the modifier attributes from the item object
	    var itemattributes = itemobj.getModifierAttributes(eachmod.name);

	    //Number
	    var number = itemattributes?eachmod.name+"("+itemattributes['qty']+"X)":eachmod.name;
	    
	    
	    
	    var modbutton = document.createElement('button');
	    modbutton.setAttribute('class','btn btn-success');
	    modbutton.setAttribute('value',eachmod.name);
	    modbutton.setAttribute('price',eachmod.price);
	    modbutton.setAttribute('parent',itemobj.__id);
	    modbutton.setAttribute('maxselect',eachmod.maxselect);
	    modbutton.appendChild(document.createTextNode(number));
	    groupdiv.appendChild(modbutton);
	}

	alldiv.appendChild(groupdiv)
    }

    return alldiv;
}

/** 
 * Find Item by Name
 * @param : name of the product, dataobject containing the product data
 * @return: Product Object
*/
function findItemByName(name,data){
   
    for(groups in data){
	//console.log("findItemByName",name)
	group = data[groups];
	//console.log(group);
	//console.log("hasProp "+group.hasOwnProperty(name));
	if(group.hasOwnProperty(name)){
	    return group[name];
	    
	}
    }

    return false;
}

/*
 * getModifiersByName(name,data)
 * Get all the Modifiers of an Object based on Name of the Product
 */
function getModifiersByName(name,data){
    var getProduct = findItemByName(name,data);
    //console.log('getModifiersByName -getProduct '+JSON.stringify(getProduct));
    var productmodifiers = {};

    for(num in getProduct.modifiers){
	modifiername = getProduct.modifiers[num];
	if(modifiers.hasOwnProperty(modifiername)){
	    productmodifiers[modifiername] = modifiers[modifiername];
	}
    }
    
    
    
    if(getProduct){
	return productmodifiers;
	//return (object) getProduct.modifiers;
    }
    else
	return {};
}

/*
 * displayModifiersByName()
 */
function displayModifiersByName(name,data,itemobj){
    var getModifiers = getModifiersByName(name,data);

    //console.log(getModifiers);

    var alldiv = new DomElem("div");
   
    for(group in getModifiers){
	var groupdiv = new DomElem("div")
	
	var modifiers = getModifiers[group].modifiers;

	//Add variable to track item rowe
	var itemrow = 0;

	groupdiv.addNode(new DomElem("div",group,{'class':'item_row'}).get());
	for(modifier in modifiers){
	    
	    //Get each of the modifier
	    var eachmod = modifiers[modifier];
 
	    //Get the modifier attributes from the item object
	    var itemattributes = itemobj.getModifierAttributes(eachmod.name);

	    //Number
	    var number = itemattributes?"("+itemattributes['qty']+"x)":"";

	    var modbutton = new DomElem("div",eachmod.name,
					{'class':'item_button modifier_buttons'},
				        new DomElem("div",false,
						    {"value":eachmod.name,
						     "price":eachmod.price,
						     "parent":itemobj.__id,
						     "maxselect":eachmod.maxselect,
						     "group":group
						    }
						   ).get()
				       );
	    modbutton.addNode(new DomElem("div",number).get());
	    
	    
	    
	    if(itemrow % 5 == 0){
		var itemgroup = new DomElem("div",false,{'class':'item_row modifier_parent'});
		groupdiv.addNode(itemgroup.get());
		itemgroup.addNode(modbutton.get());
				
	    }
	    else {
		itemgroup.addNode(modbutton.get());
	    }

	    itemrow++;
	}
	
	
	alldiv.addNode(groupdiv.get())
    }

    return alldiv.get();
}



/*
 * Bill Class
 * 
 */
function Bill(date){

    
    //Constructors
    
    this.billdate = date === undefined?new Date().toLocaleDateString("en-GB",{year: 'numeric', month: 'long', day: 'numeric'}):new Date(Date.parse(date)).toLocaleDateString("en-GB",{year: 'numeric', month: 'long', day: 'numeric'});
    this.billtime =   new Date().toString();
    this.__id       = generateUUID();
    this.items      = [];
    this.table      = "";
    this.billamount = new Number(0);
    this.billnum = ""; //String variable to hold the bill number
    this.location = "";
    this.settle = new Settlement(this.billamount);
}

/*
 * Bill Methods
 *
 * setDate(Date)
 * <Sets the Bill Date>
 */
Bill.prototype.setDate = function(newdate){
    this.billdate = new Date(Date.parse(newdate)).toLocaleDateString("en-GB",{year: 'numeric', month: 'long', day: 'numeric'});
}


/*
 * Bill Methods
 *
 * setTable(tablenumber)
 * <Sets the Table number for the table>
 */
Bill.prototype.setTable = function(tablenumber){
    this.table = tablenumber;
}

/*
 * Bill Methods
 *
 * addItem(object Item)
 * < Adds the Item to a Bill >
 */

Bill.prototype.addItem = function(newitem){
    this.items.push(newitem);

    // Calculate Total Bill Amount
    this.getBillAmount();
}

/*
 * Bill Methods
 *
 * removeItem(array ItemId)
 * < Removes the Item from a Bill >
 */

Bill.prototype.removeItem = function(itemID){
    for(i=0;i<this.items.length;i++){
	var items = this.items[i];

	if(itemID.indexOf(items.__id)!==-1){
	    this.items.splice(i,1);
	}

    }

}

/*
 * Display Bill
 * Return all the HTML elements required for the bill Area
 */
Bill.prototype.displayBill = function(){
    
    // Create a returning div to contain all the bill items
    // Append the class selectable to the div

    var alldivs = document.createElement("div");
    alldivs.setAttribute('class','selectable');
    
    for(num in this.items){

	var item= this.items[num];
	
	
	var itemdiv = document.createElement("div");
	itemdiv.setAttribute('id',item.__id);
	itemdiv.setAttribute('class',"order_lineitem");
	
	
	var qtyspan = document.createElement("span");
	qtyspan.setAttribute('class','col_qty');
	qtyspan.appendChild(document.createTextNode(item.qty));

	var namespan = document.createElement("span");
	namespan.setAttribute('class','col_name');
	namespan.appendChild(document.createTextNode(item.description));

	var pricespan = document.createElement("span");
	pricespan.setAttribute('class','col_price');
	pricespan.appendChild(document.createTextNode(item.totalPrice*item.qty));

	itemdiv.appendChild(qtyspan);
	itemdiv.appendChild(namespan);
	itemdiv.appendChild(pricespan);

	
	for(num in item.modifiers){

	    var linemoddiv = document.createElement("div");
	    linemoddiv.setAttribute('class','order_linemods');
	
	    var modifier = item.modifiers[num];

	    	    
	    var modnamespan = document.createElement("span");
	    modnamespan.setAttribute('class','mod_name');
	    modnamespan.appendChild(document.createTextNode(modifier.name+"("+modifier.qty+")"));

	    var modpricespan = document.createElement("span");
	    modpricespan.setAttribute('class','mod_price');

	    //console.log(modifier.price);
	    var displayprice = modifier.price==='null'||modifier.price===null?'':modifier.qty*modifier.price;
	    //console.log(displayprice);
	    modpricespan.appendChild(document.createTextNode(displayprice));

	    linemoddiv.appendChild(modnamespan)
	    linemoddiv.appendChild(modpricespan);
	    itemdiv.appendChild(linemoddiv);
	}

	//Appending the error
	for(var error in item.errors){
	    var linemoddiv = document.createElement("div");
	    linemoddiv.setAttribute('class','order_linemods');
	
	    var errormess = item.errors[error];
	    //console.log(errormess);
	    	    
	    var modnamespan = document.createElement("span");
	    modnamespan.setAttribute('class','mod_name');
	    modnamespan.appendChild(document.createTextNode(errormess));
	    
	    linemoddiv.appendChild(modnamespan)
	    itemdiv.appendChild(linemoddiv);
	}

	    <!-- Item Div Created -->
	    alldivs.appendChild(itemdiv);
    }
    
    return alldivs;
}


/*
 * Bill Methods
 *
 * getItemById(ItemId)
 * < Gets the Item Object present in a Bill >
 */

Bill.prototype.getItemById = function(itemid){
    for(num in this.items){

	var item = this.items[num];

	if(item.__id === itemid){
	    return item;
	}
    }
}


/*
 * Bill Methods
 *
 * getBillAmount
 * < Gets the total bill amount >
 */

Bill.prototype.getBillAmount = function(){
    var billamount = 0;
    for(num in this.items){
	var item = this.items[num];

	billamount = billamount+(item.totalPrice*item.qty);
	
    }

    this.billamount = billamount;
    this.settle.billAmount = this.billamount;
    return billamount;
}


/**
 * Bill Methods 
 * setBillNumber(text)
 * Sets the bill number to reflect the text provided
 * @param: text(string)
 * @return: void
 */

Bill.prototype.setBillNumber = function(text){
    this.billnum = text;
}


/**
 * Bill Methods 
 * getNextBillId()
 * Gets the next bill number in order
 * @param: text(string)
 * @return: void
 */

Bill.prototype.getNextBillId = function(){
    

    $.ajaxSetup({
	    headers: {
		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	    },
	contentType: 'application/json; charset=utf-8',
	context: this
	});
	
	$.post("bill/getNextBillId",function(data){
	    
	    var ret = JSON.parse(data);
	    this.billnum = Number(ret['bill_number'])+1;
	    
	    
	});
    
    
}



/**
 * Bill Methods
 * save()
 * Saves the bill by sending an AJAX request
 */

Bill.prototype.save = function(){

    if(!this.validate()){
	return false;
    }

    if(!this.settleValidate()){
	return false;
    }


    var payload = {};
    payload['bill_number'] = this.billnum;
    payload['bill_date'] = this.billdate;
    payload['bill_start_time'] = this.billtime;
    payload['bill_end_time'] = new Date().toString();
    payload['bill_amount'] = this.billamount;
    payload['bill_itemorders'] = this.items;
    payload['bill_location']=this.location;
    payload['bill_states'] = JSON.stringify({'table':this.table});
    payload['payment_details'] = JSON.stringify(this.settle);
    
    $.ajaxSetup({
	headers: {
	    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	},
	contentType: 'application/json; charset=utf-8',
	beforeSend: function(){
	    $('#spinner').show();
	},
	complete: function(){
	    $('#spinner').hide();
	}
    });
    
    $.post($('#billcreate').val(),JSON.stringify(payload),function( data ) {
	$('#dummy_form').submit();
	console.log(data);
	alert("saved successfully");
    }).fail(function(data){
	alert("something went wrong");
	console.log(data);
    });
}






/**
 * Bill Methods
 * Validate()
 * Validates the bill elements to ensure all the 
 * Properties are valid before saving
 */

Bill.prototype.validate = function(){
    
    if(this.billnum === '' || typeof Number(this.billnum) == 0){
	alert("Bill Number needs to be a number");
	return false;
    }
    
    if(this.billamount == 0 || typeof this.billamount == 'object' || typeof this.billamount === "undefined"){
	alert("Improper Bill Amount please check");
	return false;
    }
    
    
    if(this.location === '' || typeof this.location !== "string"){
	alert("Location not valid");
	return false;
    }
    
    
    
    for(var items in this.items){
	var item = this.items[items];
	
	if(item.errors.length !== 0){
	    $('#'+item.__id).addClass("ui-error ui-selected");
	    alert("Order item is incomplete");
	    return false;
	}
    }
    
    return true;
}


Bill.prototype.settleValidate = function(){
    
    if(this.settle.status === false){
	//$('#settle').trigger("settleactivate",[true]);
	alert("Bill Not Settled");
	$('#settle').trigger("settleactivate");
	return false;
    }

    return true;
}



/** 
 * Function to print the bill 
 */
Bill.prototype.printBill = function(){
    console.log("printBill");

    if(!this.validate()){
	return false;
    }

    var payload = {};
    payload['bill_number'] = this.billnum;
    payload['bill_date'] = this.billdate;
    payload['bill_start_time'] = this.billtime;
    payload['bill_end_time'] = new Date();
    payload['bill_amount'] = this.billamount;
    payload['bill_itemorders'] = this.items;
    payload['bill_location']=this.location;
    payload['bill_states'] = JSON.stringify({'table':this.table});
    
    //payload['payment_details'] = JSON.stringify(this.settle);
    
    $.ajaxSetup({
	headers: {
	    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	},
	contentType: 'application/json; charset=utf-8',
	beforeSend: function(){
	    $('#spinner').show();
	},
	complete: function(){
	    $('#spinner').hide();
	}
    });
    
    $.post($('#billprint').val(),JSON.stringify(payload),function( data ) {
	//$('#dummy_form').submit();
	//console.log(data);
	alert(data);
	//alert("print successfully");
    }).fail(function(data){
	alert(data);
	//console.log(data);
    });


}


/** END OF BILL CLASS **/


/*
 * Item Class
 *
 */
function Item(code,description,price){

    //Constructor
    this.code = code;
    this.description =  description;
    this.price =  Number(price);
    this.modifiers = [];
    this.__id = generateUUID();
    this.totalPrice = Number(price);
    this.setPrice = null;
    this.qty = 1;
    this.errors = [];
    this.checkMinModifiers();

    //Original Price
    this.origPrice = Number(price);
}

/*
 * Item Methods
 *
 * addModifier(Object modifier)
 * Adds modifiers Object to the Item
 */
Item.prototype.addModifier= function(newmodifier){
    //newmodifier has the following attributes
    //{"name","price","maxselect","group"}

    var modname = newmodifier['name'];
    var group = newmodifier['group'];
    //newmodifier['price'] = new Number(newmodifier['price']).toFixed(2);

    //console.log("Add Modifier="+newmodifier);
    
    if(!this.checkModBelongsToGroup(modname,group,data,modifiers)){
	return false;
    }

    //Check to see if the Max Modifier criteria for the group is met

    //Get the attributes of the modifierGroup for the given item from Data
    var modgroupattrib = this.getModifierGroupAttributes(group,data,modifiers);
    //console.log("modgroupattrib - "+JSON.stringify(modgroupattrib));
        
    //Get the modifier names present in the Group for this item
    var modsnamesingroup = this.getModifiersNamesInGroup(group);

    //console.log(modsnamesingroup);
    
    //Get modfier group names
    var modGroupNames = this.getModifierGroupNames();
    
    //If maxselected attribute is defined for the group and is not zero
    
    if(modgroupattrib.maxselecteditems > 0){
	
	//If the maxselecteditems and the number of modifiers present in item for the group are equal
	if(modgroupattrib.maxselecteditems == modsnamesingroup.length){

	    //If the modfier being added is not already present;meaning new modifier in a group
	    if(modsnamesingroup.indexOf(modname)==-1){
		//This is not allowed
		alert(" cannot add more than "+modgroupattrib.maxselecteditems+" "+group);
		return false;
	    }
	}
    }
    
    
    

    
    //Iterate through all modifiers
    for(num in this.modifiers){
	
	//Get each of the modifier
	var modifier = this.modifiers[num];
	
	//console.log(modifier);
	
	    //If the modifier exists
	if(newmodifier.name == modifier.name)
	{
	    
	    //If the modifier quanity is less than max permissible quantity then increase
	    if(modifier.qty < modifier.maxselect){
		this.modifiers[num].qty++

		//console.log("Checking modgroupattrib "+modgroupattrib);
		//If the ModifierGroup has the addTagPriceToOrderPrice
		if(modgroupattrib.addtagpricetoorderprice !== 0){

		    this.modifiers[num].addTagPriceToOrderPrice = true;

		    //Add the Modifier price to Item Price
		    //this.price = new Number(this.price) +  new Number(this.modifiers[num].price);
		    
		}


		this.calcPrice();
		this.checkMinModifiers();
		return true;
	    }
	    //else delete the modifier
	    else
	    {
		//If the ModifierGroup has the addTagPriceToOrderPrice
		if(modgroupattrib.addtagpricetoorderprice !== 0){
		    
		    //Remove all the added Modifier Price from the item Price
		    //this.price = this.price - newmodifier.price*this.modifiers[num].qty;
		}
		
		this.modifiers.splice(num,1);
		this.checkMinModifiers();
		
		this.calcPrice();
		return false;
	    }
	}
    }
	    
    
    //If it doesn't exist, create a new one
    //Add qty property 
    newmodifier['qty'] = 1;

    //If the ModifierGroup has the addTagPriceToOrderPrice
    if(modgroupattrib.addtagpricetoorderprice !== 0){

	newmodifier.addTagPriceToOrderPrice = true;
	
	//Add the Modifier price to Item Price
	//this.price = new Number(this.price) + new Number(newmodifier.price);
		
    }
    

    
    //Push it into the modifier
    this.modifiers.push(newmodifier);

    this.calcPrice();
    this.checkMinModifiers();

	

}


/*
 * Item Methods
 *
 * removeModifier(Array modifiernames)
 * Removes modifiers from an Item
 */

Item.prototype.removeModifier = function(modifiernames){
    for(var i=0;i<this.modifiers.length;i++){

	//Get each of the modifier
	var obj = this.modifiers[i];

	//Get the modifier name
	var objname = Object.keys(obj)[0];

	//If the modifier name is present in the modifier array list, splice it
	if(modifiernames.indexOf(objname)!== -1){
	    this.modifiers.splice(i,1);
	    this.calcPrice();
	}
    }
}

/*
 * Item Methods
 * getModifierGroupAttributes(modifiergroupname,data)
 * takes in the itemname, modifiergroupname and the menu data and return the following attributes
 * minselecteditems
 * maxselecteditems
 * @param : itemname, modifiergroupname , data
 * @return : {minselecteditems: x, maxselecteditems: y}
 */

Item.prototype.getModifierGroupAttributes = function (modgroupname,data,modifiers){
    var allmods = getModifiersByName(this.description,data);
    
    //console.log(this.description);
    //console.log(data);

    //console.log("item.getModifierGroupAttributes"+JSON.stringify(allmods));
    for(mods in allmods){
	console.log("mods -",mods);
	//console.log("allmods[mods] - ",allmods[mods]);
	if(mods == modgroupname){
	    var mod = allmods[mods];
	    var retobj = {};
	    retobj['minselecteditems'] = mod['minselecteditems'];
	    retobj['maxselecteditems'] = mod['maxselecteditems'];
	    retobj['addtagpricetoorderprice'] = mod['addtagpricetoorderprice'];
	    return retobj;
	}
    }

    return false;
}

/*
 * Item Methods
 * getModifierGroupNames()
 * return an unique array containing all modifier group names
 */

Item.prototype.getModifierGroupNames = function(){
    //initialise ret array
    var ret_array = [];
    
    for(num in this.modifiers){
	var mod = this.modifiers[num];
	ret_array.push(mod['group']);
    }

    //console.log(ret_array);
    return unique(ret_array);
}


/**
 * Item Methods
 * 
 * getModifierAttributes
 * Get the attributes of a modifier for an item
 */
Item.prototype.getModifierAttributes = function(modifiername){
    //console.log(this.modifiers);
    
    for(num in this.modifiers){

	//Get each of the modifier
	var obj = this.modifiers[num];

	//If the modifier name is the same, return the object
	if(obj.name === modifiername)
		return obj;
	
    }

    return false;
}

/*
 * Item Methods
 * checkModBelongsToGroup(mod,group,data)
 * Checks to see if for a given item the modifier and group is valid
 
 * Algo
 * Get the product description
 * findItemByName from "data" array
 * (1) See if for the product the given modifiergroup exists
 * Get ProductModifier data from "modifiers"
 * (2) see if the modifier exists in the ProductModifier data
 * return true if both (1) and (2) are true, else return false 
*/

Item.prototype.checkModBelongsToGroup = function(mod,group,data,modifiers){

    var modexists = false;
    var groupexists = false;
    
    /*
    console.log("CheckModBelongsToGroup");
    console.log("Inputs");
    console.log("mod =",mod);
    console.log("group =",group);
    console.log("data =",data);
    */

    /* Get item details from "data" object */
    var itemdetails = findItemByName(this.description,data);
    //console.log("Product Details",itemdetails);

    /* Check if the group(ModifierGroup) exists for the product */
    groupexists = itemdetails.modifiers.indexOf(group)==-1?false:true;//.indexOf(group)==-1?false:true;
    //console.log(groupexists);

    
    
    /* Check if the modifier data has the group and the group exists for the product(1) */
    if(modifiers.hasOwnProperty(group) && groupexists){

	/* Get GroupModifier data from "modifiers" */ 
	/* Get all the Modifiers which Belong to the GroupModifier */
	var groupmodifier = modifiers[group].modifiers;

	/* (2) see if the modifier exists in the ProductModifier data */
	if(groupmodifier.hasOwnProperty(mod)){
	    modexists = true;
	}
	
	
    }

    /*return true if both (1) and (2) are true, else return false */
    return modexists && groupexists;
}

/*
 * Item Methods
 * getModifiersInGroup(groupname)
 * return an array of all the modifiers which belong to a particular group in an Item
 * @param : modifier group name
 * @return: Array(Modifier Objects)
 */

Item.prototype.getModifiersInGroup = function(groupname){
    var ret_array = [];
    for(num in this.modifiers){
	var mod = this.modifiers[num];
	if(mod['group'] === groupname){
	    ret_array.push(mod);
	}

    }
    //If ret_array is empty, no Modifier in group so return false
    return ret_array;
}

/*
 * Item Methods
 * getModifiersNamesInGroup(groupname)
 * return an unique array of all the modifier names which belong to a particular group in an Item
 * @param : modifier group name
 * @return: Array(Modifier Objects)
 */
Item.prototype.getModifiersNamesInGroup = function(groupname){
    var allmods = this.getModifiersInGroup(groupname);

    var retarray = [];

    for(mod in allmods){
	var modifier = allmods[mod];
	retarray.push(modifier.name);
    }

    return retarray;
}







/*
 * Item Methods
 * checkMinModifiers()
 * checks all the modifiers and ensures validations for min selections are met
 *
 */

Item.prototype.checkMinModifiers = function(flag=false,group=false){

    var errorbag = [];
    
    //Get all modifiers for a given Item by Name from the data array
    var allmods = getModifiersByName(this.description,data);

    //Iterate through all modifiers
    for(var modname in allmods){
	
	//Get the Modifier Group object
	var mod = allmods[modname];

	//Get min and maxselecteditems from the Mod Group
	var minselect = mod.minselecteditems;
	var maxselect = mod.maxselecteditems;

	var nummodifiers = this.getModifiersInGroup(modname);

	//if minselect is > 0, then that modifier must be present in the modifiers
	if(minselect!==0 && minselect !== undefined){
	    if(nummodifiers.length < minselect){
		    errorbag.push(" add atleast "+minselect+" "+modname);
	    }
	    
	}

	/*
	//if maxselect is > 0, then that modifier cannot have more that specified modifiers
	if(maxselect!==0 && maxselect !== undefined){
	    if(nummodifiers.length  > maxselect){
		errorbag.push(modname+" can have only "+maxselect+" modifiers");
	    }
	}*/
	
	
	
    }
    
        
    // If errors present then it returns the errors as an array of messages
    // else returns false
    //return errorbag.length > 0? errorbag:false;
    this.errors = errorbag;
    
}






/** 
 * Item Methods
 *
 * itemPrice()
 * the total price of an item
 */

Item.prototype.calcPrice = function(){
    var modifierPrice = Number(0.00);
    for(num in this.modifiers){

	//console.log("calcPrice - "+JSON.stringify(this.modifiers[num]));
	//console.log(this.modifiers[num].price);

	//Group name is
	var modgroupname = this.modifiers[num].group;

	//Get Group Attributes
	

	//console.log(this.modifiers[num]);
	
	//console.log("calcPrice - modgroupattribs -"+JSON.stringify(modgroupattrib));
	
	var onemodifier = this.modifiers[num].price === "null" || this.modifiers[num].price === null?0:
	    this.modifiers[num].price*this.modifiers[num].qty;

	
	    modifierPrice = modifierPrice+onemodifier;
	


    }

    
    this.totalPrice = this.price + modifierPrice;
    
}

/**
 * Item methods
 * addQuantity()
 * Increases the quantity of the item
 */

Item.prototype.addQuantity= function(){
    this.qty = this.qty+1;
    this.calcPrice();
}


/**
 * Item Methods
 *
 * removeQuanity()
 * Decreases the quantity of the item
 */

Item.prototype.removeQuantity=function(){
    if(this.qty > 1){
	this.qty = this.qty - 1;
        this.calcPrice();
    }
}


