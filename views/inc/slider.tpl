<aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
    <ul class="nav nav-sidebar">
        <li {{if eq .slider "index"}} class="active"{{end}}><a href="/index">报告</a></li>
    </ul>
    <ul class="nav nav-sidebar">
        <li {{if eq .slider "article"}} class="active"{{end}}><a href="/article/list">文章</a></li>
        <li><a href="notice.html">公告</a></li>
        <li {{if eq .slider "comment"}} class="active"{{end}}><a href="/comment/list">评论</a></li>
        <li><a data-toggle="tooltip" data-placement="bottom" title="网站暂无留言功能">留言</a></li>
    </ul>
    <ul class="nav nav-sidebar">
        <li {{if eq .slider "category"}} class="active"{{end}}><a href="/category/list">分类</a></li>
        <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
            <ul class="dropdown-menu" aria-labelledby="otherMenu">
                <li><a href="flink.html">友情链接</a></li>
                <li><a data-toggle="modal" data-target="#areDeveloping">访问记录</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
            <ul class="dropdown-menu" aria-labelledby="userMenu">
                <li><a data-toggle="modal" data-target="#areDeveloping">管理用户组</a></li>
                <li><a href="manage-user.html">管理用户</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="loginlog.html">管理登录日志</a></li>
            </ul>
        </li>
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
            <ul class="dropdown-menu" aria-labelledby="settingMenu">
                <li><a href="setting.html">基本设置</a></li>
                <li><a href="readset.html">阅读设置</a></li>
                <li role="separator" class="divider"></li>
                <li><a data-toggle="modal" data-target="#areDeveloping">安全配置</a></li>
                <li role="separator" class="divider"></li>
                <li class="disabled"><a>扩展菜单</a></li>
            </ul>
        </li>
    </ul>
</aside>