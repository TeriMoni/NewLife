<!DOCTYPE html>
<html lang="en">
{{template "inc/frontHead.tpl" .}}

    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('/static/img/home-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="site-heading">
                        <!--<h1>简约生活</h1>-->
                        <span class="subheading">一个菜鸟码农的成长之路</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                {{range $k,$v := .art}}
                <div class="post-preview">
                    <a href="/article/{{$v.Id}}">
                        <h2 class="post-title">
                            {{$v.Title}}
                        </h2>
                        <h3 class="post-subtitle">
                            {{$v.Summary}}
                        </h3>
                    </a>
                    <p class="post-meta"><span class="glyphicon glyphicon-tags">&nbsp;{{$v.Category.Name}}</span>&nbsp;&nbsp;<span class="glyphicon glyphicon-calendar">&nbsp;{{$v.Created}}</span></p>
                </div>
                <hr>
                {{else}}
                <div class="post-preview">暂无数据</div>
                {{end}}
                <!-- Pager -->
                    <footer class="message_footer" style="text-align:right;text-align: right">
                        {{if .paginator.HasPages}}
                        <ul class="pagination pagination">
                            {{if .paginator.HasPrev}}
                            <li><a href="{{.paginator.PageLinkFirst}}">首页</a></li>
                            <li><a href="{{.paginator.PageLinkPrev}}">&laquo;</a></li>
                            {{else}}
                            <li class="disabled"><a>首页</a></li>
                            <li class="disabled"><a>&laquo;</a></li>
                            {{end}}
                            {{range $index, $page := .paginator.Pages}} <li{{if $.paginator.IsActive .}} class="active"{{end}}> <a href="{{$.paginator.PageLink $page}}">{{$page}}</a>
                            </li>
                            {{end}}
                            {{if .paginator.HasNext}}
                            <li><a href="{{.paginator.PageLinkNext}}">&raquo;</a></li>
                            <li><a href="{{.paginator.PageLinkLast}}">尾页</a></li>
                            {{else}}
                            <li class="disabled"><a>&raquo;</a></li>
                            <li class="disabled"><a>尾页</a></li>
                            {{end}}
                        </ul>
                        {{end}}
                    </footer>
            </div>
        </div>
    </div>

    <hr>
    <!-- Footer -->
    <footer>
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
        </div>
    </footer>
    {{template "inc/common.tpl" .}}
</body>

</html>
