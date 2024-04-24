
var schemaBuilder = lf.schema.create('menu',1);

schemaBuilder.createTable('menuItem').
    addColumn('id',lf.Type.INTEGER).
    addColumn('code',lf.Type.STRING).
    addColumn('price',lf.Type.NUMBER).
    addColumn('modifier',lf.Type.OBJECT).
    addColumn('datetime',lf.Type.DATE_TIME).
    addColumn('active',lf.Type.BOOLEAN).
    addPrimaryKey(['id']).
    addNullable(['modifier']);

var db = schemaBuilder.connect();
var menuitem = db.getSchema().table('menuItem');

/*
schemaBuilder.connect().then(function(db){
    var menuitem = db.getSchema().table('menuItem');
    var data = 	{
	"id": 1,
	"code":"A1",
	"name":"test object",
	"price":150,
	"datetime": new Date(),
	"active":false
    };
    var row = menuitem.createRow(data);
    db.insertOrReplace().into(menuitem).values([row]).exec();

    db.select().from(menuitem).exec().then(function(values){
	values.forEach(function(row){
	    console.log(row);
	});
    });
});
*/



