@if(isset($bills) && count($bills) > 0)

   <table class="table">
   <thead>
   <th> Bill Number </th>
   <th> Date </th>
   <th> Location </th>
   <th> Bill Amount </th>
   <th> Actions </th>
   </thead>
   <tbody>
   @foreach($bills as $index=>$bill)
   <tr>
     <td>{{$bill['bill_number']}}</td>
     <td>{{$bill['bill_date']}}</td>
     <td>{{$bill['bill_location']}}</td>
     <td>{{$bill['bill_amount']}}</td>
     <td> <a href="{{route('bill.print',$bill['id'])}}" class="btn btn-default">Print</a> </td>
   </tr>
   @endforeach
   </tbody>
    </table>
 
@endif