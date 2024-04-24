/**
   ############################################################################
   File         : lf-service.js 
   Author       : Sandeep Mallareddy
   Date Created : 16th May, 2016
   Description  : LoveFieldService class for CRUD with the IndexedDB database
   Dependencies : lovefield-
   ###########################################################################

   Lovefield is an in-browser javascript based relational DB. NixPos uses this local db as a temporaty store for objects until they are resolved by the central database.

**/


/**
   #####################################
   Initiating the class LoveFieldService
   #####################################

   (#) Define table variables
   (#) Initiate Database connection

**/

var LoveFieldService = function(){

    /*
    
      (#)Testing variable - to quickly debug;default off
      (#) Use debugModeStart method to start
      (#) Use debugModeStop method to stop
    
    */
    this.testing = false;
    

    /* Initiating the db connection object to null, the object will be assigned during getConnection method */
    this.db_ = null;

    /* Initating the newmenu table object to null, the object will be assigned during onConnected method */
    this.nm_ = null;

    

};


/**
   #################
   DebugMode Methods
   #################

   (#) Debug mode can be initialised using the debugModeStart and debugModeStop Methods
   (#) The purpose of these methods is to enable error and other information logging during development and disabling it during production
   (#) Use this.testing property before debug statements to fully utilise these functions
   (#) Eg. if(this.testing){Log something}
   (#) LoveFieldService.debugModeStart() - Start Debug in console
   (#) LoveFieldService.debugModeStop()  - Stop Debug

**/

LoveFieldService.prototype.debugModeStart = function(){
    this.testing = true;
    console.log("Debug Mode Started");
}

LoveFieldService.prototype.debugModeStop = function(){
    this.testing = false;
    console.log("Debug Mode Stopped");
}




/**
 ###################
 Creating the schema 
 ####################
 
 (#) Define all schema definitions here, and include the table definitions(this.nm_(for newmenu)) in the constructor and the onConnected function

**/

LoveFieldService.prototype.buildSchema_ = function(){

    /* Initiate a SchemaBuilder with the name of the database and version */
    var schemaBuilder = lf.schema.create('nixpos', 1);

    /* Create menuItem table */
    schemaBuilder.createTable('menuItem').
	addColumn('id',lf.Type.INTEGER).
	addColumn('code',lf.Type.STRING).
	addColumn('name',lf.Type.STRING).
	addColumn('price',lf.Type.NUMBER).
	addColumn('active',lf.Type.BOOLEAN).
	addPrimaryKey(['id']);

    /* Return the object for database connection */
    return schemaBuilder;

};


/**
 ############################################
 Initiating the table variables
 ############################################

 (#) Assign table objects to variables, but don't forget to declare them in constructor

**/

LoveFieldService.prototype.onConnected_ = function(){
    /* Get menuItem table object */
    this.nm_ = this.db_.getSchema().table('menuItem');

    //Testing-Debug
    if(this.testing){
	console.log("On connected Method");
	console.log(this);
    }
}


/** 
    ################################
    Establishing database connection
    ###############################

    (#) Established a connection to the database
    (#) Assigns database connection object to this._db
    (#) Runs onConnected_ method, to assign table variables
    (#) Returns this.db_ object and Promise
    (#) Use this getConnection().then(function(){}) to run any other method


**/
LoveFieldService.prototype.getConnection = function(){

    /* If connection already exists, return it. You can only initiate connection with db one time */
    if(this.db_ !== null){
	//Testing debug
	if(this.testing){
	    console.log("Connection already exists, returning existing object");
	}

	return this.db_;
    }

    
    /* Defining connection options, use IndexedDB as the Storage */
    var connectOptions = {storeType: lf.schema.DataStoreType.INDEXED_DB};

    /* Return the database object and initiate table variables */
    return this.buildSchema_().connect(connectOptions).then(
	function(db) {
	    this.db_ = db;
	    this.onConnected_();
	    return db;
	}.bind(this));
 
};


/* Testing the db connection */
LoveFieldService.prototype.test = function(){
    console.log("test start");
    console.log(this);
    console.log("test end");
    /*
    var data = {'id':1,'code':'A3','price':150.10,'name':'testobject2','active':true};
    var row = this.nm_.createRow(data);
    return this.db_.insertOrReplace().into(this.nm_).values([row]).exec(); 
    */
}

LoveFieldService.prototype.testinsert = function(){
    
    return this.getConnection().then(function(){
	var data = {'id':2,'code':'A3','price':150.10,'name':'testobject2','active':true};
	var row = this.nm_.createRow(data);
	return this.db_.insertOrReplace().into(this.nm_).values([row]).exec();
    }.bind(this));
}
