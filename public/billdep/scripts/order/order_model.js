/**
   (@) order_model.js
   (@) Function calls to handle lf transactions with 'order' table
**/

/* Insert a new order */

function insertOrder(data){
    var ord_table = db.getSchema().table('order');
    var row = ord_table.createRow(data);
    return db.insert().into(ord_table).values([row]).exec();
}
