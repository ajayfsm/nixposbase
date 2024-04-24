/** 
 * Scripts for menu/create page
 */

//On document ready
$(function(){

    //On clicking addProduct
    $("#addProduct").on("click",function(event){
	//console.log("Add Product");
	
	//Get the productCategory and products name
	var prod_cat = $('#selectProductCategory option:selected').val();
	var prod = $('#selectProduct option:selected').attr('value');
	
	
	//Check to see if the product is already added
	//Add the product to the productContainer and reIndex
	if(!isProductAdded(prod) && isProductValid(prod)){
	    $('#productContainer').append(createProductHolder(null,prod));
	    reIndexProducts();
	    removeExistingProducts();
	}
	
	
    });
    
    //On clicking deleteProduct
    $("#deleteProduct").on("click",function(event){
	//Remove all the elements which have been selected
	$(".ui-selected").each(function(){
	    $(this).remove();
	});

	//Reindex the products
	reIndexProducts();

	//Trigger Refresh event on the Product Category to repopulate Product dropdowns
	$("#selectProductCategory").trigger("refresh");
    });
    
    //On change of selectProductCategory or triggering refresh event
    $('#selectProductCategory').on('select2:select refresh',function(e){
	
	//If the refresh trigger is executed, there is no event thus selected
	//value will be used as parameter for ajax request
	if(e.data == undefined)
	    var selected = $(this).val();
	else
	    var selected = e.params.data.id;
	
	if(trim(selected)==="" || typeof trim(selected) !=="string" || trim(selected).length < 1)
	    return false;
	
	var retpost = postAjax('/share/product'+'/'+selected);
	retpost.then(function(data){
	    //Parse the data from String to Javascript array
	    var data = JSON.parse(data);
	    
	    //Update the options in data
	    updateSelectProductOptions(data);
	});
	
    })
    
    
    //Initializing start here
    console.log("menu create ready")

    //Initialize select2 on selectProductCategory & selectProduct
    initializeSelect2();
    
    //reIndexProducts on startup
    reIndexProducts();

    //Initalizing selectable on all tr under productContainer
    $("#productContainer").selectable();
    
    //Set the default value of selectProductCategory to *
    //Trigger refresh to populate the selectProduct with values related to * category
    $("#selectProductCategory").val("*").trigger("change");
    $("#selectProductCategory").trigger("refresh");

})//End of onDocumentReady


function postAjax(url,options=null){
    $.ajaxSetup({
	headers: {
	'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	},
	contentType: 'application/json; charset=utf-8',
	context: this,
	});
    return $.post(url,options)
}

function initializeSelect2(){
    $('#selectProductCategory,#selectProduct').select2();
}

//Update the selectProduct element with options
function updateSelectProductOptions(data){
    //console.log(data);
    //Initialize options(master list of options) to blank
    $options = "";

    //Get all the product_names already added and remove them
    
    
    
    //Iterate through the data and create option with the product name in data
    for(i=0;i<data.length;i++){
	$option = "<option value='"+data[i]['product_name']+"'>"+data[i]['product_name']+"</option>";

	//Add option to options
	$options = $options+$option;
    }

    //console.log($options);
    //update the select element with the master options
    $('#selectProduct').html($options);

    //Reinit the select2 plugin for selectfield resize
    initializeSelect2();

    //Remove any options for which the products have already been added
    removeExistingProducts();
}


//createProductHolders
//name is product[0],product[1] etc
//Product name is "Crostini Melanzana" etc.

function createProductHolder(name,productname,productid){
    
    //Create a holding div, useful for innerHTML later
    var outershell = new DomElem("div");

    var prodHolder = new DomElem("tr",null,{'class':'productHolder'});

    var prodname = new DomElem("td",productname,{'class':'productname','style':'vertical-align:middle;'});

    var prodnameinput = new DomElem("input",
				    null,
				    {'name':name+"[product_name]",'id':name+"[product_name]",'type':'hidden','value':productname});

    /*
    var prodidinput = new DomElem("input",
				    null,
				    {'name':name+"[product_id]",'id':name+"[product_id]",'type':'hidden','value':productid});
    */

    prodname.addNode(prodnameinput.get());
    //prodname.addNode(prodidinput.get());
    
    var prodprice = new DomElem("td",null,{'class':'productprice'});
    var prodpriceinput = new DomElem("input",null,
				     {'name':name+"[product_price]",'id':name+"[product_price]",'type':'text',
				      'class':'form-control','style':'height:100%;'

				     });
    prodprice.addNode(prodpriceinput.get());

    prodHolder.addNode(prodname.get());
    prodHolder.addNode(prodprice.get());
    

    outershell.addNode(prodHolder.get());
    return $(outershell.get()).html();
}


/**
  reIndexProducts
  function which iterated through all the product holders and sets the right id and names
  based on the index
*/

function reIndexProducts(){
    var products = $('#productContainer .productHolder');

    var index = 0;
    $(products).each(function(){
	var name = 'product['+index+']';
	var self = this;

	//Get the td with class productname
	var nameTd = $(self).children("td.productname:first");
	var nameInput = $(nameTd).children("input:first");
	$(nameInput).attr('name',name+"[product_name]").attr('id',name+"[product_name]");

	//var idInput = $(nameTd).children("input:last");
	//$(idInput).attr('name',name+"[product_id]").attr('id',name+"[product_id]");

	//Get the td with class productprice
	var priceTd = $(self).children("td.productprice:first");
	var priceInput = $(priceTd).children("input:first");
	$(priceInput).attr('name',name+"[product_price]").attr('id',name+"[product_price]");

	index++;	
    });
}

/**
 * getProductsAdded()
 *return a list of all products already added to the productContainer
 */

function getProductsAdded(){
    var retarray = [];
    $('#productContainer .productHolder').each(function(){
	var product = $(this).children("td.productname").children("input:first").attr('value');
	retarray.push(product);
    });
    
    return retarray;
    
}

function isProductValid(product){
    if(typeof product != "string" || product === "" || product === null){
	return false;

    }
    return true;

}



function isProductAdded(product){
    var productsadded = getProductsAdded();
    for(var num in productsadded){
	if(productsadded[num] === product){
	    return true;
	}
    }
    return false;
}


/**
 * removeExistingProducts()
 * This function checks the products which have been added and removes those from the 
 * selectProduct dropdown
 */

function removeExistingProducts(){
    var prodadd = getProductsAdded();

    $('#selectProduct option').each(function(){
	//For each option in selectProduct, check to see if it exists in productsAdded
	if(prodadd.indexOf($(this).attr("value"))!== -1){
	    $(this).remove();
	}
    });
    $('#selectProduct').trigger("change");

}



/** 
 * Function Trim
 * to remove whitespaces from ends
 */
function trim(x) {
    return x.replace(/^\s+|\s+$/gm,'');
}




