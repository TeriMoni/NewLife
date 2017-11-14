<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">H5 Blog</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="/article">Soulmate Blog</a> </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="/article">首页</a></li>
		<li><a href="/album">相册</a></li>
        <li><a href="/about">关于</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
		{{if $.isLogin}}
        <li><a href="/logout">登出</a></li>
		{{else}}
		<li><a href="/login">登录</a></li>
		{{end}}
      </ul>
    </div>
    <!--/.nav-collapse -->
  </div>
</nav>
