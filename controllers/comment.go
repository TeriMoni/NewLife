package controllers

import (
	"time"

	. "NewLife/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/utils/pagination"
	"strconv"
	"fmt"
)

//添加评论
type AddCommentController struct {
	BaseController
}

func (this *AddCommentController) Post() {
	/*if !this.isLogin {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "请先登录"}
		this.ServeJSON()
		return
	}*/
	nickname := this.GetString("nickname")
	article_id, _ := this.GetInt("article_id")
	content := this.GetString("content")
	uri := this.GetString("uri")

	if "" == nickname {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "请填写昵称"}
		this.ServeJSON()
		return
	}

	if "" == content {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "请填写内容"}
		this.ServeJSON()
		return
	}

	var com Comment
	com.Nickname = nickname
	com.ArticleId = article_id
	com.Uri = uri
	com.Content = content
	com.Status = 1
	com.Created = time.Now().Unix()

	id, err := AddComment(com)
	if err == nil {
		this.Data["json"] = map[string]interface{}{"code": 1, "message": "评论添加成功", "id": id}
	} else {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "评论添加出错"}
	}
	this.ServeJSON()
}

//修改
type EditCommentController struct {
	BaseController
}

func (this *EditCommentController) Post() {

	if !this.isLogin {
		this.Redirect("/login", 302)
		return
	}
	comment := Comment{}
	if err:=this.ParseForm(&comment);err !=nil{
		fmt.Printf("表单数据提交错误")
	}
	err := UpdateComment(comment)

	if err == nil {
		this.Data["json"] = map[string]interface{}{"code": 1, "message": "评论修改成功", "id": comment.Id}
	} else {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "评论修改失败"}
	}
	this.ServeJSON()
}

func (this *EditCommentController) Get() {

	if !this.isLogin {
		this.Redirect("/login", 302)
		return
	}
	idstr := this.Ctx.Input.Param(":id")
	id, err := strconv.Atoi(idstr)
	if err != nil {
		this.Redirect("/404.html", 302)
	}
	com,err2 := GetComment(id)

	if err2 != nil {
		this.Redirect("/404.html", 302)
	}

	this.Data["com"]=com
	this.Data["slider"] = "comment"
	this.TplName="update-comment.html"
}

type ListCommentController struct {
	BaseController
}
//获取评论列表
func (this *ListCommentController) Get() {

	if !this.isLogin {
		this.Redirect("/login", 302)
		return
	}
	//评论分页
	page, err1 := this.GetInt("p")
	if err1 != nil {
		page = 1
	}
	offset, err2 := beego.AppConfig.Int("pageoffset")
	if err2 != nil {
		offset = 9
	}
	condCom := make(map[string]string)
	condCom["article_id"] = ""
	if !this.isLogin {
		condCom["status"] = "1"
	}
	countComment := CountComment(condCom)
	paginator := pagination.SetPaginator(this.Ctx, offset, countComment)
	_, _, coms := ListComment(condCom, page, offset)
	this.Data["paginator"] = paginator
	this.Data["coms"] = coms
	this.Data["slider"] = "comment"
	this.TplName="comment.html"
}

type DeleteCommentController struct {
	BaseController
}

//删除评论
func (this *DeleteCommentController) Get(){
	if !this.isLogin {
		this.Redirect("/login", 302)
		return
	}
	idstr := this.Ctx.Input.Param(":id")
	id, err := strconv.Atoi(idstr)
	if err != nil {
		this.Redirect("/404.html", 302)
	}
	err2 := DeleteComment(id)
	if err2 == nil{
		this.Data["json"] = map[string]interface{}{"code": 1, "message": "删除评论成功"}
	}else{
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "删除评论失败"}
	}
	this.ServeJSON()
}
