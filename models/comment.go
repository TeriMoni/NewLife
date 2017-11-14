package models

import (
	//"strconv"
	"time"

	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type Comment struct {
	Id        int
	ArticleId int
	Nickname  string
	Uri       string
	Content   string
	Created   int64
	Status    int
}

func (this *Comment) TableName() string {
	return "comment"
}

func init() {
	orm.RegisterModel(new(Comment))
}

func UpdateComment(updCom Comment) error {
	o := orm.NewOrm()
	o.Using("default")

	com := Comment{Id: updCom.Id}
	com.Created = updCom.Created
	com.ArticleId = updCom.ArticleId
	com.Nickname = updCom.Nickname
	com.Content = updCom.Content
	com.Status = updCom.Status
	_, err := o.Update(&com)
	return err
}

func AddComment(updCom Comment) (int64, error) {
	o := orm.NewOrm()
	o.Using("default")
	com := new(Comment)

	com.ArticleId = updCom.ArticleId
	com.Nickname = updCom.Nickname
	com.Uri = updCom.Uri
	com.Content = updCom.Content
	com.Created = time.Now().Unix()
	com.Status = updCom.Status

	id, err := o.Insert(com)
	return id, err
}

func ListComment(condArr map[string]string, page int, offset int) (num int64, err error, com []Comment) {
	o := orm.NewOrm()
	qs := o.QueryTable("comment")
	cond := orm.NewCondition()
	if condArr["article_id"] != "" {
		cond = cond.And("article_id", condArr["article_id"])
	}
	if condArr["status"] != "" {
		cond = cond.And("status", condArr["status"])
	}
	qs = qs.SetCond(cond)
	if page < 1 {
		page = 1
	}
	if offset < 1 {
		offset = 9
	}
	start := (page - 1) * offset
	var comments []Comment
	num, err1 := qs.Limit(offset, start).All(&comments)
	return num, err1, comments
}

func CountComment(condArr map[string]string) int64 {
	o := orm.NewOrm()
	qs := o.QueryTable("comment")
	cond := orm.NewCondition()
	if condArr["article_id"] != "" {
		cond = cond.And("article_id", condArr["article_id"])
	}
	if condArr["status"] != "" {
		cond = cond.And("status", condArr["status"])
	}
	num, _ := qs.SetCond(cond).Count()
	return num
}
func DeleteComment(id int) error  {
	o := orm.NewOrm()
	_, err := o.Delete(&Comment{Id: id})
	return err
}

func GetComment(id int) (Comment,error){
	o := orm.NewOrm()
	qs := o.QueryTable("comment")
	var com Comment
	err := qs.Filter("Id",id).One(&com)
	return com, err
}