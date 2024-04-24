{{-- resources/views/index/index.blade.php --}}
@extends('common.app')

@section('title','- Index page')

@section('content')
<div class="container">
  <div class = "row"> 

  <div class="col-lg-2" id="button-area">
    Buttons
   </div>

   <div class="col-lg-6" id="bill-area" style="height:625px"> 
   	Bill Body
   </div>

   <div class="col-lg-4" id="menuitem-area">
   MenuItems
   <div class="form-inline">
   <input class="form-control" type="text" id="menuitem-selector" name="menuitem-selector"></input> 
   <button class="btn btn-primary form-control"> + </button>
   </div>
   </div>

   </div>

   
   <footer class="footer pull-right">
    (c) PirateFish Restaurants Private Limited, 2016
   </footer>

</div>
@endsection

@push('scripts-footer')
<script src="{{asset('/scripts/menudata.js')}}"></script>
<script>
$(function(){

console.log(data);
for(obj in data){
 console.log(data[obj].price);
}



});
</script>
@endpush


