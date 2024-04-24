{{-- Stored in resources/views/location/list.blade.php --}}

@if(isset($loclist) && count($loclist)>0)
<table class="table">
<tr>
<th> City     </th>
<th> Locality </th>
<th> Actions </th>
</tr>

@foreach($loclist as $key=>$value)
<tr>
<td> {{$value['location_city']}} </td>
<td> {{$value['location_area']}} </td>
<td> Edit/Delete </td>
</tr>
@endforeach

</table>
@else
<p> Sorry! There are no records </p>
@endif
