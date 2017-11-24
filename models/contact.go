package models

import (
	"github.com/astaxie/beego/orm"
)

type Contact struct {
	Id       int    `json:"id"`
	Name     string `json:"name"`
	Phone    string `json:"phone"`
	Email    string `json:"email"`
	Message  string `json:"message"`
	Created  string
	Status  int
}

func (this *Contact) TableName() string {
	return "contact"
}

func init() {
	orm.RegisterModel(new(Contact))
}

//添加联系信息
func AddContact(addCom Contact) (int64, error) {
	o := orm.NewOrm()
	o.Using("default")
	cot := new(Contact)
	cot.Name = addCom.Name
	cot.Phone = addCom.Phone
	cot.Email = addCom.Email
	cot.Message = addCom.Message
	cot.Created = addCom.Created
	cot.Status = addCom.Status
	id, err := o.Insert(cot)
	return id, err
}