/**
   Function to get the details of the item when clicked
   The function takes in the clicked object and retrieves
   The item code, name and price
   It returns an JSON object for inserting into database

  @params
  # obj - item click object

  @return
  # JSON object

**/
function getMenuInfo(obj){
    
    // Setting all the attributes to null
    var price = null;
    var id = null;
    var name = null;
    var ts = new Date();

    //Getting the attributes from returned click object
    price = obj.children("div:first").attr('price');
    id = obj.children("div:first").attr('id');
    name = obj.children("div:first").html();

    //Creating the return object
    JSONret = {};

    
    //Assigning values to the return object
    JSONret.price =  parseFloat(price);
    JSONret.code = id.toString();
    JSONret.name = name.toString();
    JSONret.timestamp = ts;
    JSONret.active = true;
    JSONret.orderId = window.ActiveOrder;
    //Returning the JSON object
    return JSONret;
}
