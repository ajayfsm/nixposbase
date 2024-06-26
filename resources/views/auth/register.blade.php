@extends('common.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}">

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}">

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

			<div class="form-group{{ $errors->has('home_location') ? ' has-error' : '' }}">
                            <label for="home_location" class="col-md-4 control-label">Home Location</label>

                            <div class="col-md-6">
			    @inject('locations','App\Location')
			    <select id="home_location" class="form-control" name="home_location">
			    <option></option>
			    @foreach($locations->all()->toArray() as $location)
			    <option value="{{$location['location_slug']}}"
			    @if($location['location_slug'] == old('home_location'))
			    selected
			    @endif
			    >
			    {{$location['location_area'].",".$location['location_city']}}
			    </option>
			    @endforeach
				</select>
                                @if ($errors->has('home_location'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('home_location') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
			
			<div class="form-group{{ $errors->has('user_role') ? ' has-error' : '' }}">
                            <label for="home_location" class="col-md-4 control-label">Role</label>

                            <div class="col-md-6">
			    @inject('roles','App\Role')
			    <select id="user_role" class="form-control" name="user_role">
			    <option></option>
			    @foreach($roles->all()->toArray() as $role)
			    @if($role['role_slug']!='admin')
			    <option value="{{$role['role_slug']}}"
			    @if($role['role_slug'] == old('user_role'))
			    selected
			    @endif>
			    
			    {{$role['role_human']}}
			    </option>
			    @endif
			    @endforeach
				</select>
                                @if ($errors->has('user_role'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('user_role') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password">

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation">

                                @if ($errors->has('password_confirmation'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-btn fa-user"></i> Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




@endsection
