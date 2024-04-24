/**
 * Class Settlement
 * Settlement handles the payment methods for a bill
 * 
 * /---Available Methods---/
 *
 * /--Available Properties-/
 * 
 *
 */

function SettlementException(message){
    this.message = message;
    this.name = "SettlementException";
}


function Settlement(billamount){

    //Constructor
    
    //Properties
    this.settledAmount = Number(0);
    this.billAmount = Number(billamount);
    this.paymentDetails = [];
    this.toBeSettledAmount = Number(0);
    this.status = false;
    this.numberPayment = 0;
    this.discount = 0;
    //this.canDiscount = true;
    
    //Constants
    this.PAYMENT_TYPES = ['cash','credit'];

    //Invoking methods
    this.calcAmount();
}

//Generate Random Unique ID
/*
 * generateUUID
 * Generate a 5 character alphanumeric unique ID
 */
Settlement.prototype.genID = function (){
    return (0|Math.random()*6.04e7).toString(36);
}


/** 
 * Add Payment
 * addPayment(Number amount,String type(defined in PAYMENT_TYPES),Object payopts)
 */

Settlement.prototype.addPayment=function(amount,type,payopts=null){
    var newpayment = {};
    var newamount = Number(amount);
    var newtype = type.toLowerCase();
    var payid = this.paymentDetails.length;
    
    
    
    if(newamount <= 0 || typeof amount !== "number"){
	throw new SettlementException("Invalid Amount");
    }

    if(this.PAYMENT_TYPES.indexOf(type)==-1 || typeof type !== "string"){
	throw new SettlementException("Invalid Payment Type");
    }

    if(payopts !== null && typeof payopts !== "object"){
	throw new SettlementException("Invalid type - Payment Options - Needs to be type Object");

    }
    

    //Create a new numeric instance
    newpayment['payid'] = this.genID();
    newpayment['amount'] = newamount;
    newpayment['type'] = newtype;
    newpayment['opts'] = payopts;
    
    this.paymentDetails.push(newpayment);
    this.calcAmount();
    //console.log(this.paymentDetails);
}


/**
 * Remove Payment
 * removePayment(String payid)
 */
Settlement.prototype.removePayment = function(payid){

    if(typeof payid !== "string"){
	throw new SettlementException("Invalid type - payid");
    }



    //Iterate through all the payment Details
    for(var num in this.paymentDetails){
	var payment = this.paymentDetails[num];
	if(payment.payid == payid){
	    this.paymentDetails.splice(num,1);
	    this.calcAmount();
	    return true;
	}
    }
    console.log("Invalid Payment ID");
    return false;
}

/** 
 * calcAmount
 * Calculated the settledAmount and toBeSettledAmount properties
 */

Settlement.prototype.calcAmount = function(){
    var calcAmount = 0;

    for(var num in this.paymentDetails){
	var payment = this.paymentDetails[num];
	if(payment.hasOwnProperty("amount")){
	    calcAmount = calcAmount+payment['amount'];
	}
    }
    this.settledAmount = calcAmount;
    this.toBeSettledAmount = this.billAmount-this.discount-this.settledAmount;

    if(this.settledAmount >= (this.billAmount - this.discount) && this.billAmount > 0){
	this.status = true;
    }
    else
	this.status = false;

}


/**
 * Set Discount
 * setDiscount(String discount)
 * if discount contains a string or a number
 * if it a number it is considered to be the amount to be discounted
 * if it is a string, it looks for '%' and discounts the appropriate %
 */

Settlement.prototype.setDiscount = function(discount){
    //Check is discount is a number or string throw exception is it is neither    
    if(typeof discount !== "number" && typeof discount !=="string")
	throw new SettlementException("Invalid type discount- must be a string or number")

        
    //If it is a number
    if(typeof discount == "number"){
	var discountamount = Number(discount);
	console.log(discountamount);
	if(discountamount <= this.billAmount){
	    this.discount = discountamount;
	    return true;
	}
	else{
	    return false;
	}
    }
    else if(typeof discount == "string"){
	if(discount.search("%")!==-1){
	    var discountamount = (Number(discount.substr(0,discount.search("%")))/100)*this.billAmount;
	    if(typeof discountamount == "number" && discountamount <= this.billAmount){
		this.discount = Math.round(discountamount);
		this.calcAmount();
		return true;
	    }
	    else
	    {
		return false;
	    }
	}
	else if(Number(discount)>0 && Number(discount)<this.billAmount){
	    this.discount = Number(discount);
	    this.calcAmount();
	    return true;
	}
	else{
	    return false;
	}
	
    }
    
    return false;
}




