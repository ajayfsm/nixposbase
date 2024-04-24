
<nav class="navbar navbar-default">
<div class="container">
<div class="navbar-header"> 
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
<span class="sr-only">Toggle Navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>

<a class="navbar-brand" href="{{ url('/') }}"> *nixPOS </a>
</div>

<div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                  <li><a href="{{ url('/') }}">Home</a></li>
		  <!--
	  <li><a href="{{ url(route('product.index')) }}">Product</a></li>
	  <li><a href="{{ url(route('productmodifier.index'))}}">Product Modifier</a></li>
	  <li><a href="{{ url(route('productmodifiergroup.index'))}}">Product Modifier Group</a></li>
	  <li><a href="{{ url(route('menu.index'))}}">Menu</a></li>
	  	  -->
		  {!! aclUrl('Product','product.index',"") !!}
		  {!! aclUrl('Product Modifier','productmodifier.index',"") !!}
		  {!! aclUrl('Product Modifier Group','productmodifiergroup.index',"") !!}
		  {!! aclUrl('Menu','menu.index',"") !!}
		  
		  
		  

		  @if(canAccessAtleast(['create-bill','list-bill'])) 
		  <li class="dropdown">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
		  aria-haspopup="true" aria-expanded="false"> Bill <span class="caret"></span></a>
		   <ul class="dropdown-menu">
		   {!! aclUrl('Create Bill','bill.create',"") !!}
		   {!! aclUrl('View Bill','bill.list',"") !!}

		   <!--
		   <li>
		   <a href="{{ url(route('bill.create'))}}">Create Bill </a>
		   </li>
		   <li>
		   <a href="{{ url(route('bill.list'))}}">View Bills</a>
		   </li>
		   -->
		   </ul>
		   
		  </li>
		  @endif
		  </ul>
		  <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        <li><a href="{{ url('/login') }}">Login</a></li>
                        <li><a href="{{ url('/register') }}">Register</a></li>
                    @else
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                            </ul>
                        </li>
                    @endif
                </ul>


		@if(Session::get('location_area')!==null)
		<!-- Navbar Right - Location -->
		<ul class="nav navbar-nav navbar-right">
		  <!-- Authentication -->
		  @if(Auth::check())
		  <li class="dropdown">
		    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		      {{ Session::get('location_area').','.Session::get('location_city') }}
		      <span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu" role="menu">
                                
		    @foreach(Auth::user()->getLocationIds(true) as $location)
		    <li>
		      <a href="{{ url('/location/change',$location['slug']) }}">
			<i class="fa fa-location-arrow" aria-hidden="true"></i>
			{{ $location['area'].','.$location['city'] }}
		      </a>
		    </li>
                    @endforeach
		    </ul>
		  </li>
		  @endif
		  <!-- Authentication ends -->

		</ul>
		<!-- End Location Navbar -->
		@endif

</div>

</div>
</nav>