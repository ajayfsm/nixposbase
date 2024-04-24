/**
 * DOMcreate.js
 * To Create DOM elements quickly
 * Date: 26 July 2016
 */

function DomElem(name,body=false,attributes=false,appendNodes=false){
    this.elem = document.createElement(name);
    if(body){
	this.addBody(body);
    }
    
    if(attributes)
	this.addAttr(attributes);

    if(appendNodes)
	this.addNode(appendNodes);
    
}

DomElem.prototype.addAttr = function(attribarr,replaceflag=false){
    for(var attribute in attribarr){

	if(attribute !== 'class'){
	    this.elem.setAttribute(attribute,attribarr[attribute]);
	}
	else{
	    var currentattrib = this.elem.getAttribute(attribute);
	    if(currentattrib !== null)
		var newattrib = currentattrib + ' ' + attribarr[attribute];
	    else
		var newattrib = attribarr[attribute]
	    
	    this.elem.setAttribute(attribute,newattrib);
	}	    
    }
}

DomElem.prototype.addNode= function(nodes){
	this.elem.appendChild(nodes);
}

DomElem.prototype.addBody = function(text){
    this.elem.appendChild(document.createTextNode(text));

}

DomElem.prototype.addRawBody = function(text){
    this.elem.appendChild(text);
}


DomElem.prototype.get = function(){
    return this.elem;
}

