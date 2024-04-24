<div class="row">
 <div class="col-md-6">
  <div class="panel panel-default">

   <div class="panel-heading">
     Add Products
     
    </div>

    <div class="panel-body">
    <!-- Product Category and Product Dropdowns here -->
    <div class="form-group form-inline">
    @inject('product','App\Product')
    {{Form::select("selectProductCategory",$product->getProductCategories(true),null,['class'=>'form-control','id'=>'selectProductCategory'])}}

    <select id="selectProduct" class="form-control">
    </select>

    <p class="pull-right clearfix">
      <a role="button" id="addProduct" class="btn btn-primary btn-md">Add</a>
      <a role="button" id="deleteProduct" class="btn btn-primary btn-md">Delete</a>
    </p>
    


    </div>
     


    <!-- Include product details here -->
    <table class="table table-bordered">
    <thead>
     <th width="75%"> Product Name </th>
     <th width="25%" style="text-align:center;"> Price </th>
    </thead>
    <tbody id="productContainer">

    <!-- Start Product List -->
    @if(isset($products))
    @each('menu.productlist',$products,'product')
    @endif
    <!-- End Product list -->
    </tbody>
    </table>    
    </div>

   </div>
  </div>

  <div class="col-md-6">
   <div class="panel panel-default">

     <div class="panel-heading">
      Product Modifiers Details
     </div>

     <div class="panel-body">
     <!-- Include Product Modifiers Here -->
     @if(isset($modifiers))
     <table class="table table-condensed">
     <thead>
     <th width="75%">Modifier Name</th>
     <th width="25%">Price</th>
     </thead>
     <tbody>
     @foreach($modifiers as $key=>$modifier)
     <tr><td><span class="label label-success">{{$modifier['ModifierGroupName']}}</span>
     {{Form::hidden('modifier['.$key.'][ModifierGroupName]',$modifier['ModifierGroupName'])}}
     </td>
     <td></td>
     </tr>
     @foreach($modifier['product_modifier'] as $index=>$mod)
     <tr>
     <td>
     {{Form::label($mod['product_modifier_name'])}}
     {{Form::hidden('modifier['.$key.'][product_modifier]['.$index.'][product_modifier_name]',$mod['product_modifier_name'])}}
     </td>
     <td>
     {{Form::number('modifier['.$key.'][product_modifier]['.$index.'][product_modifier_price]',
     isset($mod['product_modifier_price'])?$mod['product_modifier_price']:0,
     ['class' => 'form-control'])}}
     </td>
     </tr>
     @endforeach
     @endforeach
     </tbody>
     </table>
     @endif
     </div>
   </div>
  </div>


</div>
  