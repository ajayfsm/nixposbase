/** 
 * Order Helper Library
 * Functions to help with the order details
 * An order is an collection of menuItems
 **/

/**
 * createNewOrder
 * Function to create a new order if one doesn't exist
 **/

function createNewOrder(){
    console.log("Creating new Order");

    //Get the start time of the order
    var startTime = new Date();

    //Create the object for inserting
    var orderObj = {};
    orderObj.orderStartTime = startTime;
    orderObj.ticketId = window.ActiveTicket;
    orderObj.orderClosed = false;

    //Run the query
    var query = insertOrder(orderObj);

    //The query will return a promise and an object containing the inserted object details, get the row id and assign it t ActiveOrder(@global)

    //Return the promise so the onClick handler can continue to perform other tasks once this call is successful
    return query.then(function(row){
	window.ActiveOrder = row[0].id;
    });

}
