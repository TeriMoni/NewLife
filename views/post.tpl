<!DOCTYPE html>
<html lang="en">
{{template "inc/frontHead.tpl" .}}
    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('/static/img/post-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="post-heading">
                        <h1>{{.art.Title}}</h1>
                        <h2 class="subheading">{{.art.Summary}}</h2>
                        <span class="meta">作者 <a href="#">{{.art.Author}}</a> {{.art.Created}}</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    {{str2html .art.Content}}
                </div>
            </div>
        </div>

        <!-- 评论栏目 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 ">

                        {{if .coms}}
                        <h3 class="alert-success padtb10">评论
                            <div class="pull-right"><a href="#comment">我要评论</a></div>
                        </h3>
                        <div class="more-comment">
                        {{range $k,$v := .coms}}
                        <div class="media">
                            <div class="media-left"> <a href="{{$v.Uri}}" title="{{$v.Nickname}}" target="_blank"> <img class="media-object" alt="{{$v.Nickname}}" style="width: 64px; height: 64px;" src="{{avatar}}" data-holder-rendered="true"> </a> </div>
                            <div class="media-body">
                                <h4 class="media-heading">{{$v.Nickname}} <span class="label label-info pull-right">（{{$v.Created}}）</span></h4>
                                <div> {{$v.Content}}
                                </div>
                            </div>
                        </div>
                        {{end}}
                        {{end}}
                         </div>
                        {{if .paginator.HasNext}}
                        <div class="media" style="margin-bottom: 10px" id="moreComment">
                            <a href="javascript:getMoreComment()" style="text-align: center;background-color: white;color: #666;background: #f5f5f5;font-size: 12px;margin: 15px auto 0;border: 1px solid #c4c4c4;width: 125px;
                                height: 30px;line-height: 30px;">查看更多评论</a>
                        </div>
                        {{end}}
                    <!--    {{if .paginator.HasPages}}
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
                        {{end}}-->
                        <h3 class="alert-success padtb10">我要评论<a name="comment"></a></h3>
                        <form method="post" id="comment-form">
                            <div class="form-group">
                                <label for="nickname">昵称</label>
                                <input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname" value="">
                            </div>
                            <div class="form-group">
                                <label for="content">内容</label>
                                <textarea class="form-control" id="content" name="content" placeholder="Content" style="height:120px;"></textarea>
                            </div>
                            <input type="hidden" name="article_id" value="{{.art.Id}}">
                            <input type="hidden" name="id" value="{{.com.Id}}">
                            <input type="hidden" value="2" id="page"/>
                            <button type="submit" class="btn btn-primary">提交评论</button>
                        </form>
                </div>
            </div>
        </div>
    </article>
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

<script>

    function getMoreComment() {
       var pageNext = $("#page").val();
       $.ajax({
           url:"/comment/more/"+pageNext,
           type:'GET',
           data:{"id":{{.art.Id}},"p":pageNext},
           dataType:'json',
           success:function(data) {
            var coms = data.coms;
            var images = data.images;
             var object= $("#media").last();
             var html = "";
             for(var i=0;i<coms.length;i++){
                  html += '<div class="media"><div class="media-left"> <a href='+coms[i].Uri+' title='+coms[i].Nickname+' target="_blank"> <img class="media-object" alt='+coms[i].Nickname+' style="width: 64px; height: 64px;" src='+images[i]+' data-holder-rendered="true"> </a> </div>\n' +
                    '<div class="media-body">\n'+
                    '<h4 class="media-heading"><span class="label label-info pull-right">（'+coms[i].Created+'）</span></h4>\n' +
                    '<div>'+coms[i].Content+'</div></div> </div>';
            }
            $("#page").val(parseInt(pageNext)+1)
            if(data.flag == 1){
                 var obj = $(".moreComment")
               $("#moreComment").hide();
            }
            $(".more-comment").append(html)
           }
       })
    }
</script>

</html>
