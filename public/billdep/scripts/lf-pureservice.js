
/**
   Lovefield Service Script
   Defines the functions necessary to create and transact with Lovefield
   
   |=============================================|
   + Author : Sandeep Mallareddy                 +
   | Date   : 17-06-2016                         |
   + Dependencies                                +
   |        - lovefield-2.13                     |
   +                                             +
   |=============================================|        

   Schema Definitions are at schema.js



/**
  On loading the entire script, self run this function
  Treat this self function as the constructor
  **/
$(function(){
    //On loading, run main function
    main().then(function(){

	//Indicate that the Database is setup and ready to run
	console.log("Database Initialized");
	//
	console.log(db);
    });

});



/**
   Function to initiate the connection to Lovefield database and return database object to @var(db)
**/

function main(){
    //if there is not database connection
    if(db == null){
	//Get the schemabuilder instance and connect to it
	return nixpos.db.getSchemaBuilder().connect({
	    storeType: lf.schema.DataStoreType.INDEXED_DB
	}).then(function(database) {

	    //assign the database connection object to @var(db)
	    db = database;
	    return db;
	});
	
    }
}


/** 
    Function to Delete the database.
    Since Lovefield doesn't provide the functions to do this, we will use IndexedDB API to perform
**/

function deleteDb(){

    return new Promise(function(resolve,reject){
	
	//Close the DB connection
	db.close();
	db = null;

	//Delete the DB
	var DBDeleteRequest = window.indexedDB.deleteDatabase("nixposdb");

	DBDeleteRequest.onerror = function(event) {
	console.log("Error deleting database.");
	reject();
	};
	
	DBDeleteRequest.onsuccess = function(event) {
	console.log("Database deleted successfully");
	resolve();	
	};
    });

}

/**
   Function to reset the database connection
   Delete the database and recreate the connection
**/
function resetDb(){
    //Delete the Database
    return deleteDb().then(function(){
	console.log(db);
	main().then(function(){
	    console.log("Database connection successful");
	});
    });
}








/**
   Test Functions
   - Testing functions for debug- start here
**/

/* Function to test the insertorReplace into the connection */
function testinsert(){
    var data = {'code':'A3','price':150.10,'name':'testobject2','active':true,'temp':new Date().toString()};
    var row = db.getSchema().table('menuItem').createRow(data);
    console.log("Inserted test object successfully");
    return db.insert().into(db.getSchema().table('menuItem')).values([row]).exec();
    
}
