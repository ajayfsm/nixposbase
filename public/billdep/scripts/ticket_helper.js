/***
   ticket_helper.js
   (@) Contains functions to help with ticket management
**/

/** 
 * Function to create a New Ticket 
 * creates a new Ticket and sets the active Ticket to the newly created TicketID
 **/

function createNewTicket(){
    console.log("Creating new Ticket");

    // Get the time of starting the ticket
    var startTime = new Date();

    // Set the status of the Ticket to Active
    var Active = true;

    //Create the data object for inserting
    var ticketObj = {};
    ticketObj.ticketActive = Active;
    ticketObj.ticketStartTime = startTime;

    //Run query yo insert the ticket
    var query = insertTicket(ticketObj);
    //console.log(query);

    //The query return a promise and an object with the inserted object details, get the row id
    //and assign it to ActiveTicket(@global)

    //Return the promise so the on click handler can continue to perform other tasks once this call is successful
    return query.then(function(row){
	window.ActiveTicket = row[0].id;
    });
}
