@extends('common.app')

@section('title',"Something went wrong")

@section('content')
<div class="container">
  <div class="row">
  <div class="content">
    <div class="title">
      You have upset the delicate balance.<br/>Go back and check everything once more
    </div>
  </div>
  </div>
</div>
@endsection

@push('stylesheets')

<style>
  #body {
  margin: 0;
  padding: 0;
  width: 100%;
  color: #B0BEC5;
  display: table;
  font-weight: 100;
  font-family: 'Lato';
  }
  
  .#container {
  text-align: center;
  display: table-cell;
  vertical-align: middle;
  }
  
  .content {
  text-align: center;
  display: inline-block;
  }

  .title {
  font-size: 72px;
  margin-bottom: 40px;
  color: #B0BEC5;
  display: table;
  font-weight: 100;
  font-family: 'Lato';
  }
</style>
@endpush

