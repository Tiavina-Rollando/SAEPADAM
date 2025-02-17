<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ env('APP_NAME') }}</title>
    <link rel="stylesheet" href="{{ asset('asset/css/swagger-ui.css') }}">
    <link rel="stylesheet" href="{{ asset('asset/css/index.css') }}">
</head>
<body>
    <div id="swagger-ui"></div>
    <script src="{{ asset('asset/js/swagger-ui-bundle.js') }}"></script>
    <script src="{{ asset('asset/js/swagger-ui-standalone-preset.js') }}"></script>
    <script src="{{ asset('asset/js/swagger-initializer.js') }}"></script>
</body>
</html>