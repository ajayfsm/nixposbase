/**
   (@) item_model.js
   (@) Contains all the function calls for transactions with LF database

**/

/**
    Function to insert a row into menuItem table
@input
#data  - JSON click object

@output
#Promise and object containing inserted object
**/

function insertItem(data){
    //Get table schema
    var mi_table = db.getSchema().table('menuItem');
    var row = mi_table.createRow(data);
    return db.insert().into(mi_table).values([row]).exec();
}

