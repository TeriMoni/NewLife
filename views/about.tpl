<!DOCTYPE html>
<html lang="en">
  {{template "inc/frontHead.tpl" .}}
<!-- Page Header -->
<header class="intro-header" style="background-image: url('/static/img/about-bg.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
        <div class="page-heading">
          <h1>关于我</h1>
          <span class="subheading">个人介绍</span>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- Main Content -->
<div class="container">
  <div class="row">
    <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
    {{str2html .pro.Intro}}
    </div>
  </div>
</div>

<hr>

<!-- Footer -->
<!--<footer>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
        <ul class="list-inline text-center">
          <li class="list-inline-item">
            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
            </a>
          </li>
          <li class="list-inline-item">
            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
            </a>
          </li>
          <li class="list-inline-item">
            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>-->
</footer>

{{template "inc/common.tpl" .}}

</body>

</html>
