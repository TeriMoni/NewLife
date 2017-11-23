<head>
    {{template "inc/meta.tpl" .}}
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>简单生活</title>

    <!-- Bootstrap Core CSS -->
   <link href="/static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="/static/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="/static/css/clean-blog.css" rel="stylesheet">

    <!-- Temporary navbar container fix until Bootstrap 4 is patched -->
    <style>
        .navbar-toggler {
            z-index: 1;
        }

        @media (max-width: 576px) {
            nav > .container {
                width: 100%;
            }
        }
    </style>

</head>

<body>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-toggleable-md navbar-light" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            菜单 <i class="fa fa-bars"></i>
        </button>
        <a class="navbar-brand page-scroll" href="/">进击的菜鸟</a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="/">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="/about">关于</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="/">相册</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="/contact">联系</a>
                </li>
            </ul>
        </div>
    </div>
</nav>