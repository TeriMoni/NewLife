package controllers

import (
	"fmt"
	. "NewLife/models"
	. "NewLife/utils"
	"time"
)

type ContactController struct {
	BaseController
}

func (this *ContactController) Get(){
	this.TplName="contact.tpl"
}

func (this *ContactController) Post(){

	contact := Contact{}
	if err:=this.ParseForm(&contact);err !=nil{
		fmt.Printf("表单数据提交错误")
	}
	contact.Status = 0 ;
	contact.Created = GetDate(time.Now().Unix())
	id,err := AddContact(contact)
	if err == nil{
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "添加message成功","id":id}
	}else{
		this.Data["json"] = map[string]interface{}{"code": 0, "message": "添加message失败"}
	}

	this.ServeJSON()
}