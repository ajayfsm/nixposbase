// Variable to hold all the db schemabuilder instances
var nixpos = { db:{} };

//Initiate building schema definitions
nixpos.db.getSchemaBuilder = function(){

    //Create nixposdb database
    var ds = lf.schema.create('nixposdb', 1);

    //Create tables for nixposdb

    //menuItem Table Schema
    ds.createTable('menuItem').
	addColumn('id',lf.Type.INTEGER).
	addColumn('orderId',lf.Type.INTEGER).
	addColumn('code',lf.Type.STRING).
	addColumn('name',lf.Type.STRING).
	addColumn('price',lf.Type.NUMBER).
	addColumn('active',lf.Type.BOOLEAN).
	addColumn('timestamp',lf.Type.DATE_TIME).
	addPrimaryKey(['id'],true).
	addForeignKey('fk_OrderId',{local:'orderId',ref:'order.id',action: lf.ConstraintAction.CASCADE});

    //Ticket table schema
    ds.createTable('ticket').
	addColumn('id',lf.Type.INTEGER).
	addColumn('tickettype',lf.Type.INTEGER).
	addColumn('tableId',lf.Type.INTEGER).
	addColumn('ticketActive',lf.Type.BOOLEAN).
	addColumn('ticketStartTime',lf.Type.DATE_TIME).
	addColumn('ticketCloseTime',lf.Type.DATE_TIME).
	addPrimaryKey(['id'],true).
	addNullable(['tickettype','tableId','ticketCloseTime']);


    //Order table schema
    ds.createTable('order').
	addColumn('id',lf.Type.INTEGER).
	addColumn('orderStartTime',lf.Type.DATE_TIME).
	addColumn('orderEndTime',lf.Type.DATE_TIME).
	addColumn('ticketId',lf.Type.INTEGER).
	addColumn('custManagerId',lf.Type.INTEGER).
	addColumn('orderClosed',lf.Type.BOOLEAN).
	addPrimaryKey(['id'],true).
	addNullable(['orderEndTime','custManagerId']).
	addForeignKey('fk_TicketId',{local:'ticketId',ref:'ticket.id',action: lf.ConstraintAction.CASCADE});
        
    //Add other table schemas here
    
    //return the table objects
    return ds;
}
