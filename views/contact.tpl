<!DOCTYPE html>
<html lang="en">
{{template "inc/frontHead.tpl" .}}
    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('/static/img/contact-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="page-heading">
                        <h1>联系我</h1>
                        <hr class="small">
                        <span class="subheading">如果有什么问题要我和交流的，请联系我</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <p>如果有什么问题，请联系我，我会尽量在24小时给你答复，欢迎大家一起交流</p>
                <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
                <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
                <!-- NOTE: To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
                <form name="sentMessage" id="contactForm" novalidate>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                            <label>名字</label>
                            <input type="text" class="form-control" placeholder="名字" id="name" required data-validation-required-message="请输入名字.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                            <label>邮件</label>
                            <input type="email" class="form-control" placeholder="邮件" id="email" required data-validation-required-message="请输入邮箱.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                            <label>电话</label>
                            <input type="tel" class="form-control" placeholder="电话" id="phone" required data-validation-required-message="请输入电话号码.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                            <label>建议</label>
                            <textarea rows="5" class="form-control" placeholder="建议" id="message" required data-validation-required-message="请输入建议信息."></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <br>
                    <div id="success"></div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-secondary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <hr>

    <!--&lt;!&ndash; Footer &ndash;&gt;
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
                    <p class="copyright text-muted">Copyright &copy; Your Website 2017</p>
                </div>
            </div>
        </div>
    </footer>-->
    <!-- Contact Form JavaScript -->
    <script src="/static/js/jqBootstrapValidation.js"></script>
    <script src="/static/js/contact_me.js"></script>
    {{template "inc/common.tpl" .}}

</body>

</html>
