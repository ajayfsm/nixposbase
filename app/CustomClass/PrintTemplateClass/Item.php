<?php
namespace App\CustomClass\PrintTemplateClass;

class Item{

 private $qty;
 private $name;
 private $price;
 private $paper_width;

 public function __construct($qty=0,$name='',$price=0.00,$print_width=0){

       	$this->qty = (int) $qty;
	$this->name = (string) $name;
	$this->price = (float) $price;
	$this->paper_width = (int) $print_width;
	
 }


 public function __toString(){
 	   $qty = $this->qty;
	   $name = $this->name;
	   $price = $this->price;

	   //Start the left part of the bill
	   $left = "";
	   $left .= "- ";
	   $left .= $qty;
	   $left .= " ";
	   $left .= $name;


	   //Start right side of the bill
	   $right = "";
	   $right .= "x";
	   $right .= number_format($price,2);
	   $right .= "=";
	   $right .= number_format((float) ($price*$qty),0);
	   
	   //Space for the left
	   //PAPER_WIDTH is 48
	   $spaceleft = $this->paper_width - strlen($right);

	   if(strlen($left) > $spaceleft){
	      $left = substr($left,0,$spaceleft-2);
	   }else{
	      $left = str_pad($left,$spaceleft-2," ",STR_PAD_RIGHT);
	   }

	   return $left." ".$right."\n";

 }
 
}