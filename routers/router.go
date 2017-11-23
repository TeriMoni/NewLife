package routers

import (
	"NewLife/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.ListArticleController{},"get:Index")
	beego.Router("/404.html", &controllers.BaseController{}, "*:Go404")

	beego.Router("/article", &controllers.ListArticleController{})
	beego.Router("/article/:id", &controllers.ShowArticleController{})

	beego.Router("/login", &controllers.LoginUserController{})
	beego.Router("/logout", &controllers.LogoutUserController{})

	beego.Router("/article/add", &controllers.AddArticleController{})
	beego.Router("/article/edit/:id", &controllers.EditArticleController{})
	beego.Router("/article/delete/:id", &controllers.DeleteArticleController{})
	beego.Router("/article/list", &controllers.ListArticleController{})


	beego.Router("/comment/add", &controllers.AddCommentController{})
	beego.Router("/comment/list", &controllers.ListCommentController{})
	beego.Router("/comment/edit/:id", &controllers.EditCommentController{})
	beego.Router("/comment/delete/:id", &controllers.DeleteCommentController{})
	beego.Router("/comment/more/:p", &controllers.MoreCommentController{})

	beego.Router("/album", &controllers.ListAlbumController{})
	beego.Router("/album/upload", &controllers.UploadAlbumController{})
	beego.Router("/album/edit", &controllers.EditAlbumController{})

	beego.Router("/about", &controllers.AboutUserController{})

	beego.Router("/uploadmulti", &controllers.UploadMultiController{})
	beego.Router("/upload", &controllers.UploadController{})

	beego.Router("/index", &controllers.AdminIndexController{})

	beego.Router("/contact",&controllers.ContactController{},"get:Get;post:Post")

	//使用restful 自定义路由规则
	beego.Router("/category/list",&controllers.CategoryController{},"*:ListCategory")
	beego.Router("/category/add",&controllers.CategoryController{},"post:AddCategory")
	beego.Router("/category/update/:id",&controllers.CategoryController{},"get:Get;post:UpdateCategory")
	beego.Router("/category/delete/:id",&controllers.CategoryController{},"get:DeleteCategory")

	//beego.Router("/article/ajax/add", &controllers.AddArticleController{}, "*:AddPost")
	//beego.Router("/article/add", &controllers.AddArticleController{}, "*:Add")
}
