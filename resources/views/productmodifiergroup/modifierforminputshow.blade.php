<div class="panel panel-default">
      <div class="panel-heading">
      Product Modifiers
      </div>

      
      
      <div class="panel-body">
      <!-- Modifier Action Buttons Start -->
      <!-- @include('productmodifiergroup.modifierbuttons') -->
      <!-- Modifier Action Buttons End -->
      <!-- <pre>{{print_r($modifiers)}}</pre> -->      

      <table class="table table-condensed table-bordered sortable">
       	 <thead>
	 <th>#</th>
	 <th>Tag</th>
	 <th>Max Quantity</th>
	 </thead>
	 @each('productmodifiergroup.modifierinputshow',$modifiers,'modifier')
	</table>
      <div>
      
 </div>
