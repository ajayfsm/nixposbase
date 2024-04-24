<?php
namespace App\CustomClass\PrintTemplateClass;


class Modifier{

 private $qty;
 private $name;
 private $price;
 private $paper_width;
 private $addTagPriceToOrderPrice;

 public function __construct($qty=0,$name='',$price=0.00,$print_width=0,$addTagPrice=false){

       	$this->qty = (int) $qty;
	$this->name = (string) $name;
	$this->price = (float) $price;
	$this->paper_width = (int) $print_width;
	$this->addTagPriceToOrderPrice = $addTagPrice;
	
 }


 public function __toString(){
           $qty = $this->qty;
	   $name = $this->name;
	   $price = $this->price;
 	   $returnstring = "";	   
 	   for($i=1;$i<=$qty;$i++){
	      $returnstring .= $this->printOneModifier($name,$price);
	   }

	   return $returnstring;	 
   }



	   //To Print One Modifier - Take in name and price
	  public function printOneModifier($name,$price){
	     //Only if price is greater than 0; print the modifier
	   if($price > 0){

	   //Start the left part of the bill
	   $left = "";
	   $left .= " * ";
	   //$left .= $qty;
	   //$left .= " ";
	   $left .= strtoupper($name);


	   //Start right side of the bill
	   $right = "";
	   //If the modifier doesnot have AddTagPriceToOrderPrice then print the price
	   if(!$this->addTagPriceToOrderPrice){
	   $right .= "x";
	   $right .= number_format($price,2);
	   //$right .= " = ";
	   //$right .= number_format((float) $price*$qty,0);
	   }
	   //Space for the left
	   //PAPER_WIDTH is 48
	   $spaceleft = $this->paper_width - strlen($right." ".$left);

	   if($spaceleft < 0){
	      $right = substr(0,strlen($right)+$spaceleft-1);
	   }

	     return $left." ".$right."\n";
	   }
	     return "";
	 }





}//End of Class