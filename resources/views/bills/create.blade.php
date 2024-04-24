<html>
<head>
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <!-- Dependencies and Libraries -->
   @include('bills.mainscripts')
  
  <!-- Other scripts -->
  @include('bills.otherscripts')

  <!-- Object scripts start from here -->
  <!-- include('bills.objectscripts') -->
  

  
  <!-- Stylesheets -->
  <link rel="stylesheet" type="text/css" href="{{asset('billdep/scripts/jqueryui/jquery-ui.theme.css')}}" media="screen" />
  <link rel="stylesheet" type="text/css" href="{{asset('billdep//scripts/jqueryui/jquery-ui.structure.css')}}" media="screen" />
  <link rel="stylesheet" type="text/css" href="{{asset('billdep/static/24_style.css')}}" media="screen" />

  <!-- Stylesheets from nixposbase.com/test -->
  <link rel="stylesheet" href="{{asset('/jqueryui/jquery-ui.css')}}"></link>

  <style>
    .order_lineitem{
    color:#7d0705;
    }

    .order_linemods{
    font-size: 10px;
    }

    <!-- Temp fix to get the background color of the div from being shown -->
    <!-- Made changes in 24_css -->
    .col_name {
    float:none;
    }
    
    //.selectable .ui-selecting { color: red; }
    .selectable .ui-selected{
    color : green;
    background-color:yellow;
    }

    
    .selectable .ui-error{color: red;}


    //Spinner
    .overlay-loader {
    display: block;
    margin: auto;
    width: 97px;
    height: 97px;
    position: relative;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    }

    .loader {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    width: 97px;
    height: 97px;
    animation-name: rotateAnim;
    -o-animation-name: rotateAnim;
    -ms-animation-name: rotateAnim;
    -webkit-animation-name: rotateAnim;
    -moz-animation-name: rotateAnim;
    animation-duration: 0.4s;
    -o-animation-duration: 0.4s;
    -ms-animation-duration: 0.4s;
    -webkit-animation-duration: 0.4s;
    -moz-animation-duration: 0.4s;
    animation-iteration-count: infinite;
    -o-animation-iteration-count: infinite;
    -ms-animation-iteration-count: infinite;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-iteration-count: infinite;
    animation-timing-function: linear;
    -o-animation-timing-function: linear;
    -ms-animation-timing-function: linear;
    -webkit-animation-timing-function: linear;
    -moz-animation-timing-function: linear;
    }
    .loader div {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    border: 1px solid rgb(0,0,0);
    position: absolute;
    top: 2px;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    }
    .loader div:nth-child(odd) {
    border-top: none;
    border-left: none;
    }
    .loader div:nth-child(even) {
    border-bottom: none;
    border-right: none;
    }
    .loader div:nth-child(2) {
    border-width: 2px;
    left: 0px;
    top: -4px;
    width: 12px;
    height: 12px;
    }
    .loader div:nth-child(3) {
    border-width: 2px;
    left: -1px;
    top: 3px;
    width: 18px;
    height: 18px;
    }
    .loader div:nth-child(4) {
    border-width: 3px;
    left: -1px;
    top: -4px;
    width: 23px;
    height: 23px;
    }
    .loader div:nth-child(5) {
    border-width: 3px;
    left: -1px;
    top: 4px;
    width: 31px;
    height: 31px;
    }
    .loader div:nth-child(6) {
    border-width: 4px;
    left: 0px;
    top: -4px;
    width: 39px;
    height: 39px;
    }
    .loader div:nth-child(7) {
    border-width: 4px;
    left: 0px;
    top: 6px;
    width: 49px;
    height: 49px;
    }


    @keyframes rotateAnim {
    from {
    transform: rotate(360deg);
    }
    to {
    transform: rotate(0deg);
    }
    }

    @-o-keyframes rotateAnim {
    from {
    -o-transform: rotate(360deg);
    }
    to {
    -o-transform: rotate(0deg);
    }
    }

    @-ms-keyframes rotateAnim {
    from {
    -ms-transform: rotate(360deg);
    }
    to {
    -ms-transform: rotate(0deg);
    }
    }

    @-webkit-keyframes rotateAnim {
    from {
    -webkit-transform: rotate(360deg);
    }
    to {
    -webkit-transform: rotate(0deg);
    }
    }

    @-moz-keyframes rotateAnim {
    from {
    -moz-transform: rotate(360deg);
    }
    to {
    -moz-transform: rotate(0deg);
    }
    }

   .settleSelected {
    color: green;
    }



  </style>
  <!-- End of stylesheets from nixposbase.com/test -->

  
  



</head>
  
  <body class="disable-selection">
    <form id="dummy_form" method="GET" action="{{route('bill.create')}}">
    </form>

  <div class="header"><div style="padding-top:1px;padding-bottom:3px;padding-left:5px;font-size:1.2em;font-weight:bold;color:white;"><img src="{{asset('billdep/images/141.png')}}" height=25 width=25 /> nixPOS version 0.99</div></div>
  <div id="content">
    <!-- store selected Item value -->
    <input type="hidden" id="selecteditem" value=""></input>
    <!-- End -->

    <!-- Store location -->
    <input type="hidden" id="location" value="{{$location}}"></input>
    <!--End-->

    <input type="hidden" id="getNextBillIdUrl" value="{{route('bill.getnextbillid')}}"/>
    <input type="hidden" id="billcreate" value="{{route('bill.store')}}"/>
    <input type="hidden" id="billprint" value="{{route('bill.printNow')}}"/>
    
    <div id="option_bar">
      <!--<div class="button parent"><div class="child">Change Table</div></div>
      <div class="button parent"><div class="child">Select Customer</div></div>
      <div class="button parent"><div class="child">Ticket Note</div></div>
      <div class="button parent"><div class="child">Print Bill</div></div>
      <div class="button parent"><div class="child">Change Table</div></div>
      <div class="button parent"><div class="child" id="addTicket">Add Ticket</div></div>
      <div class="button parent"><div class="child" id="addOrder">Add Order</div></div>
      <div class="button parent"><div class="child" id="resetDb">Reset database</div></div>
     -->
    </div>

    <div id="billing_bar" style="font-size:14px;">
      <div style="width:470px;height:595px;border:1px solid #dfdfdf;">
	<div style="width:100%;background-color:violet" id="billnumholder">
	  Bill no:
	  <span id="billnum"></span>
	</div>
	<div style="width:100%;background-color:teal;" id="billdateholder">
	  Date:
	  <span id="billdate">23-02-2016</span>
	</div>

	<div style="width:100%;background-color:violet;">Location:{{$location}}</div>

	<div style="width:100%;background-color:yellow;" id="billtablenumberholder">
	  Table:
	  <span id="billtablenumber"></span>
	</div>



	
	<div style="font-size:14px;">
	  <div class="col_qty" style="width:10%;float:left;">QTY</div>
	  <div class="col_name" style="width:75%;float:left;">ITEM</div>
	  <div class="col_price" style="width:15%;float:left;">PRICE</div>
	</div>

	<div style="clear:both;"></div>

	<div id="bill_area" style="height:500px;font-size:14px;overflow-y:scroll;">
	  <span class="col_qty"></span>
	  <span class="col_name">'Loading...Please Wait'</span>
	  <span class="col_price"></span>
	</div>

      </div>

      <div id="bill_info" style="height:39px;margin:3px;">
	<div style="">Balance:
	  <div id="bill_amount" style="float:right;"></div>
	</div>
      </div>

      <div class="big_buttons">
	<div class="button parent" style="float:left;">
	  <div id="settle" class="child">Settle</div>
	</div>
	<div class="button parent" style="float:left;margin-left:6px;">
	  <div id="save" class="child">Save</div>
	</div>
      </div>
    </div>

    <div class="menu_bar" id="menu_bar">
      <div class="button parent"><div class="child">Antipasti</div> </div>
      <div class="button parent"><div class="child">Salads</div></div>
      <div class="button parent"><div class="child">Pizza</div></div>
      <div class="button parent"><div class="child">Fresh Pasta</div></div>
      <div class="button parent"><div class="child">Pasta</div></div>
      <div class="button parent"><div class="child">Risotto</div></div>
      <div class="button parent"><div class="child">Pizza</div></div>
      <div class="button parent"><div class="child">Secondi</div></div>
      <div class="button parent"><div class="child">Soup</div></div>      
      <div class="button parent"><div class="child">Mocktails</div></div>
      <div class="button parent"><div class="child">Drinks</div></div>
      <div class="button parent"><div class="child">Specials</div></div>
      <div class="button parent"><div class="child">Mexican</div></div>
      <div class="button parent"><div class="child">Desserts</div></div>
    </div>
    
    
    
    <div id="item_bar" class="item_bar">
      
      
      
    </div>
    


      <div id="input_bar" class="input_bar">
	<input id="search_input" type="text" size="25" />
	<button>X</button>
      </div>
      <div id="keyboard_bar" class="keyboard_bar">
	<button>1</button>
	<button>2</button>
	<button>3</button>
	<br>
	<button>4</button>
	<button>5</button>
	<button>6</button>
	<br>
	<button>7</button>
	<button>8</button>
	<button>9</button>
	<br/>
	<button>.</button>
	<button>0</button>
	<button>x</button>
      </div>
      
    
    
  

  <div class="footer">
    (c) PirateFish Restaurants Private Limited, 2016
  </div>

  <!-- Dialog widget to Change Bill Number -->
  
  <div id="billnumberinput" title="Change Bill Number">
    <label for="billnumber">Bill Number</label>
    <input type="text" id="billnumber"></input>
  </div>
  


  <!-- Dialog widget to Change Bill Number -->
  <div id="billdateinput" title="Change Bill Date">
    <label for="billdatepick">Bill Date</label>
    <input type="text" id="billdatepick" value=""></input>
  </div>


  <!-- Modal to block during Settle -->
  <div id="blockModal" class="modal">
  </div>



  <!-- End Modal-->

  <!-- Overlay loader for Spinner -->
  <div id="spinner" class="overlay-loader" style="display:none;">
    <div class="loader">
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div>
  

  <page id="settle-page">





    <div id="payment_container" style="float:left;font:family:Helvetica">

      <div id="payment_field"
	     style="display:block;float:left;
		    font-size:43px;color:rgb(169,169,169);
		    width:410px;">
	  Discount
	<input type="text" id="payment_discount" disabled
		 style="border:none;background:none;text-align:right;
			border-bottom:2px solid rgb(169,169,169);;
			width:200px;padding:0px;font-size:35px;float:right;"></input>
	</div>

      <div style="clear:left"></div>
      
      <div id="payment_field"
	     style="display:block;float:left;
		    font-size:43px;color:rgb(169,169,169);
		    width:410px;">
	  Total
	<input type="text" id="payment_total" disabled
		 style="border:none;background:none;text-align:right;
			border-bottom:2px solid rgb(169,169,169);;
			width:200px;padding:0px;font-size:35px;float:right;"></input>
	</div>

	  <div style="clear:left"></div>

	<div id="payment_field"
	     style="display:block;float:left;
		    font-size:43px;color:rgb(169,169,169);
		    width:410px;">
	  Charged  
	  <input type="text" id="payment_charged"
		 style="border:none;background:none;text-align:right;
			border-bottom:2px solid rgb(169,169,169);;
			width:200px;padding:0px;font-size:35px;float:right;"></input>
	</div>

	<div style="clear:left"></div>
	
	<div id="payment_table" style="margin-top:10px;display:block;width:100%">
	  <table border="0" style="width:100%;text-align:center;padding:2px">
	    
	  </table>
	</div>
	
	</div>

	<div id="payment_buttons" style="display:block;width:133px;float:right;">
	  <div style="display:block;border:1px solid #dfdfdf;height:45px;background:white">
	    <div class="payment_buttons child"
		 style="position:relative;text-align:center;"
		 paytype="cash" >
	      Cash
	    </div>
	  </div>
	  
	  
	  <div style="display:block;border:1px solid #dfdfdf;height:45px;background:white">
	    <div class="payment_buttons child"
		 style="position:relative;text-align:center;"
		 paytype="credit" >
	      Credit
	    </div>
	  </div>


	  <div style="display:block;border:1px solid #dfdfdf;height:45px;background:white">
	    <div class="payment_buttons child"
		 style="position:relative;text-align:center;"
		 paytype="discount" >
	      Discount
	    </div>
	  </div>

	  <div style="display:block;border:1px solid #dfdfdf;height:45px;background:white">
	    <div class="payment_buttons child"
		 style="position:relative;text-align:center;"
		 paytype="All" >
	      All amount
	    </div>
	  </div>

	  
	</div>
  </page>


  
  <!-- Footer Scripts -->
  <scriptdummy src="{{asset('/jqueryui/jquery-ui.js')}}"></script>
  <scriptdummy src="{{asset('/billdep/scripts/jquery.fittext.js')}}"></script>
  <scriptdummy src="{{asset('/scripts/menudata-deus.js')}}"</script>
  <script src="{{route('share.menudata')}}"></script>
  <scriptdummy src="http://backstage.fsm.in/json_write.php"></script>
  <script src="{{asset('/scripts/core-settle.js')}}"></script>
  <script src="{{asset('/scripts/core.js')}}"></script>
  <script src="{{asset('/scripts/DOMcreate.js')}}"></script>
  <!-- Footer scripts end -->

  <script type="text/javascript">
    jQuery(".item_button").fitText(0.9);
  </script>

  <!-- Scripts from nixposbase.com/test file -->
  <script src="{{asset('/scripts/posinteractivity.js')}}"></script>
  <scriptdummy src="{{asset('/scripts/settleinteractivity.js')}}"></script>
  <!-- end of script from nixposbase.com/text -->


  </body>
</html>
