<!doctype html>
<html lang="en" dir="ltr">
<head>
    @include('partials.head')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!--     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400;500;600;700&display=swap">
 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous" defer></script>
</head>
<body>
    <div class="page">
        <div class="page-main">
            @include('partials.header')
            <div class="my-3 my-md-5">
                <div class="container">
                    @yield('content')
                </div>
            </div>
        </div>
        @include('partials.footer')
    </div>
    @include('partials.scripts')
    @yield('scripts')
</body>
</html>

