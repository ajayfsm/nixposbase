/**
   (@) ticket.js
   (@) Function calls to handle lf transactions with 'ticket' table
**/

/* Create a new ticket */

function insertTicket(data){
    var tic_table = db.getSchema().table('ticket');
    var row = tic_table.createRow(data);
    return db.insert().into(tic_table).values([row]).exec();
}
