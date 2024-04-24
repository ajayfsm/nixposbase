<!-- resources/views/common/app.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    <!-- Title for the page, section(title) to insert -->
    <title>FSM @yield('title')</title>
    <!-- End of Title -->

    <!-- Fonts -->
    @include('common.fonts')
    @stack('fonts')

    <!-- Stylesheets -->
    @include('common.stylesheets')
    @stack('stylesheets')

    <!-- Scripts (a) Header -->
    @include('common.scripts')
    @stack('scripts-header')
    
</head>

<!-- Beginning of Body -->
<body id="app-layout">

@section('navbar')
<!-- Nav Bar Begin-->
@include('common.navbar')
<!-- Nav Bar End -->
@show

<!-- Include all content here -->
@yield('content')
<!-- End of content           -->

<!-- Start Footer -->

<!-- Push all footer scripts here -->
<!-- Scripts (a) Footer -->
@stack('scripts-footer')

<!-- End  Footer -->

</body>
<!-- End of Body -->
</html>
