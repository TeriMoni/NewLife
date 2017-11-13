package controllers

import (
	. "NewLife/models"

	"fmt"
	"strconv"
)
type CategoryController struct {
	BaseController
}
//分类栏目列表
func (this *CategoryController) ListCategory(){
	if !this.isLogin {
		this.Redirect("/login",302)
		return
	}
	categories := GetAllCategory()
	this.Data["slider"] = "category"
	this.Data["userProfile"] = this.GetSession("userProfile")
	this.Data["categories"] = categories
	this.TplName="category.html"
}

//添加分类
func (this *CategoryController) AddCategory(){
	if !this.isLogin {
		this.Redirect("/login",302)
		return
	}
	categories := Category{}
	if err:=this.ParseForm(&categories);err !=nil{
		fmt.Printf("表单数据提交错误")
	}
	categories.Author="admin"
	id,err := AddCategory(categories)
	if err == nil {
		this.Data["json"] = map[string]interface{}{"code": 1, "message": "添加分类成功", "id": id}
	} else {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "添加分类出错"}
	}
	this.ServeJSON()
}

//更新分类
func (this *CategoryController) UpdateCategory(){
	if !this.isLogin {
		this.Redirect("/login",302)
		return
	}
	category := Category{}
	if err:=this.ParseForm(&category);err !=nil{
		fmt.Printf("表单数据提交错误")
	}
	category.Author = "admin"
	err := UpdateCategory(category)
	if err == nil {
		this.Data["json"] = map[string]interface{}{"code": 1, "message": "更新分类成功", "id": category.Id}
	} else {
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "更新分类出错"}
	}
	this.ServeJSON()
}

func (this *CategoryController) Get(){
	if !this.isLogin {
		this.Redirect("/login",302)
		return
	}
	idstr := this.Ctx.Input.Param(":id")
	id, err := strconv.Atoi(idstr)
	category, err := GetCategory(id)
	if err != nil {
		this.Redirect("/404.html", 302)
	}
	this.Data["slider"] = "category"
	this.Data["userProfile"] = this.GetSession("userProfile")
	this.Data["category"] = category
	this.TplName="update-category.html"
}

//删除分类
func (this *CategoryController) DeleteCategory(){
	if !this.isLogin {
		this.Redirect("/login",302)
		return
	}
	idstr := this.Ctx.Input.Param(":id")
	id, err := strconv.Atoi(idstr)
	if err != nil {
		this.Redirect("/404.html", 302)
	}
	err2 := DeleteCategory(id)
	if err2 == nil{
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "删除成功"}
	}else{
		this.Data["json"] = map[string]interface{}{"code": 1, "message": "删除失败"}
	}
	this.ServeJSON()
}
