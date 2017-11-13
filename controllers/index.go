package controllers

import (

)
//后台主页
type AdminIndexController struct {
	BaseController
}

func (this *AdminIndexController) Get(){
	userLogin := this.GetSession("userLogin")
	if userLogin == nil {
		this.TplName ="login.tpl"
		return
	}
	this.Data["userProfile"] = this.GetSession("userProfile")
	this.Data["slider"]="index"
	this.TplName="index.html"
}