/**
* ListItem class definition
* %%%%%%% Properties %%%%%%%
* code  : Item code
* name  : Item description
* price : price of the item
* addl  : Object containing additional specifications
* quantity : quantity of the item ordered
* 
* %%%%%%% Methods %%%%%%%%
* addAddl - add additional items to the menuItem
* deleteAddl - deletes an additional item based on the id 
* updatePrice - computes the total price - base price* quantity + price of additionals
* updateQuantity - updated the quantity of the menuItem 
**/

function menuItem(code,name,price,quantity){
    this.code = code;
    this.name = name;
    this.price = price;
    this.addl = [];
    this.modifier = [];
    this.quantity = quantity;
    this.id = new Date().getTime();
    this.addlCount = 0;
    this.totalPrice = this.price*this.quantity;
    
}

menuItem.prototype.addAddl = function(item,price){
    var newAddl = {};
    newAddl['item'] = item;
    newAddl['price'] = price;
    this.addlCount = this.addlCount+1;
    newAddl['id'] = this.addlCount;
    this.addl.push(newAddl);
    this.updatePrice();
}

menuItem.prototype.deleteAddl = function(id){
    for(i=0;i<this.addl.length;i++){
	var record = this.addl[i];
	if(record.id == id){
	    this.addl.splice(i,1);
	}
    }
    this.updatePrice();
}

menuItem.prototype.updatePrice = function(){
    var mainprice =  this.price*this.quantity;
    var addlprice = 0;
    var modprice = 0;
    for(i=0;i<this.addl.length;i++){
	var record = this.addl[i];
	addlprice = addlprice+record['price'];
    }

    for(j=0;j<this.modifier.length;j++){
	var mod = this.modifier[j];
	if(mod.hasOwnProperty('price') && mod['price']){
	    modprice = modprice+mod['price'];
	}
    }
    this.totalPrice = mainprice+modprice+addlprice;
}

menuItem.prototype.updateQuantity = function(newQuantity){
    if(newQuantity > 0)
	this.quantity = newQuantity;
    this.updatePrice();
}


/** 
* Method to add a modifier 
* addModifier(category,description,price)
* for a modifier in which any property is missing, use false
**/

menuItem.prototype.addModifier = function(cat,desc,price){
    var newMod = {};
    this.addlCount = this.addlCount+1;
    newMod['id']=this.addlCount;
    newMod['category']=cat;
    newMod['description']=desc;
    newMod['price']=price;
    this.modifier.push(newMod);
    this.updatePrice();
}

/**
* Method to delete a modifier
* deleteModifier(id)
**/

menuItem.prototype.deleteModifier = function(id){
    for(j=0;j<this.modifier.length;j++){
	var mod = this.modifier[j];
	if(mod['id']==id)
	    this.modifier.splice(j,1);
    }
    this.updatePrice();

}

/** 
* Method to print the menuItem
* print()
**/

menuItem.prototype.printItem = function(){
    var retString = "";
    // Print the Quantity Item Price

    
    retString = retString+"<div class='order_lineitem' id='"+this.id+"'>";
    retString = retString+"<span class='col_qty'>"+this.quantity+"</span>";
    retString = retString+"<span class='col_name'>"+this.name+"</span>";
    retString = retString+"<span class='col_price'>"+this.totalPrice+"</span>";
    retString = retString+"<div class='order_linemods'>";
    // Adding Modifiers
    for(j=0;j<this.modifier.length;j++){
	retString = retString+"<div class='order_linemods'>";
	if(this.modifier[j]['description'])
	    retString = retString+"<span class='mod_name'>"+this.modifier[j]['description']+"</span>";
	if(this.modifier[j]['price'])
	    retString = retString+"<span class='mod_price'>"+this.modifier[j]['price']+"</span>";
	retString = retString+"</div>";//Order Line Mod close
    }
    retString = retString+"</div>";//Line Item Close

    return retString;
}
