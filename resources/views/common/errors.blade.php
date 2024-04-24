<!-- common/errors -->

@if(count($errors->all())>0)
<div class="alert alert-dismissable alert-danger">
<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>


<ul>
@foreach($errors->all() as $error)
 <li>{{$error}}</li>
@endforeach
</ul>
</div>

@endif