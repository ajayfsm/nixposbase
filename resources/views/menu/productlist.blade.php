<tr class="productHolder">

      <td class="productname" style="vertical-align:middle">
      {{$product['product_name']}}
      {{Form::hidden('product_name',$product['product_name'])}}
      </td>

      <td class="productprice" >
      {{Form::text('product_price',isset($product['product_price'])?$product['product_price']:"",['class' => 'form-control','style'=>'height:100%;'])}}
      </td>
      
</tr>