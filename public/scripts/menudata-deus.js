var data = {
    "Antipasti":{
	"crostini melanzana":
	{"price":"180",
	 "name":"crostini melanzana",
	 "code":"A1",
	 "modifiers":["extras","pasta"]
	},
      
	"crostini al forno":{"price":190,"name":"crostini al forno","code":"A2"},
	"crostini assortiti":{"price":210,"name":"crostini assortiti","code":"A3"},
	"bruschetta pomodoro":{"price":140,"name":"bruschetta pomodoro","code":"A4"},
	"pane aglio":{"price":70,"name":"pane aglio","code":"A5"},
	"pane aglio e formaggio":{"price":90,"name":"pane aglio e formaggio","code":"A6"},
	"pane aglio e verdure":{"price":120,"name":"pane aglio e verdure","code":"A7"},
	"insalata caprese":{"price":220,"name":"insalata caprese","code":"A8"},
	"peperoni arrosto":{"price":220,"name":"peperoni arrosto","code":"A9"},
	"funghi trifolati":{"price":300,"name":"funghi trifolati","code":"A10"},
	
	"crostini con pollo e formaggio":{"price":300,"name":"crostini con pollo e formaggio","code":"A11"},
	
	"carpaccio di salmone":{"price":300,"name":"carpaccio di salmone","code":"A14"},
	"antipasto del maiale":{"price":300,"name":"antipasto del maiale","code":"A15"},
	"pollo e limone":{"price":300,"name":"pollo e limone","code":"A16"},
	
	"crostini con tonno":{"price":300,"name":"crostini con tonno","code":"A18"},
	
	"crostini con uova":{"price":300,"name":"crostini con uova","code":"A20"},
	"salsa spinaci":{"price":300,"name":"salsa spinaci","code":"A21"},
	"salsa jalapeno":{"price":300,"name":"salsa jalapeno","code":"A22"},
	
	"funghi ripieni di verdure":{"price":300,"name":"funghi ripieni di verdure","code":"A23"},
	"funghi ripieni di pollo":{"price":300,"name":"funghi ripieni di pollo","code":"A24"}
    }
}
    
    

var modifiers = {
    "extras":{
	"minselecteditems":0,
	"maxselecteditems":2,
	"modifiers":
	{
	    "chicken":{"name":"chicken","price":100,"maxselect":3},
	    "lamb":{"name":"lamb","price":150,"maxselect":3},
	    "fish":{"name":"fish","price":200,"maxselect":3},
	    "veg":{"name":"veg" ,"price":-75,"maxselect":3}
	}
    },
    
    "pasta":{
	"minselecteditems":1,
	"maxselecteditems":0,
	
	"modifiers":
	{
	    "spaghetti":{"name":"spaghetti","price":null,"maxselect":1},
	    "fusili":{"name":"fusili","price":null,"maxselect":1},
	    "tagatelle":{"name":"tagatelle","price":null,"maxselect":1}
	}
    }
}


