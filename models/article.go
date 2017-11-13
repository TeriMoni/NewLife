package models

import (

	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"fmt"
)

type Article struct {
	Id       int
	Title    string
	Uri      string
	Keywords string
	Summary  string
	Content  string
	Category *Category `json:"category" orm:"rel(fk)"`
	Author   string
	Created  string
	Viewnum  int
	Status   int
	Tag string
	Visibility int
	Titlepic string
}

type Category struct {
	Id       int
	Name    string
	Alias    string
	Keywords    string
	Description    string
	Author    string
	Status   int
	Articles []*Article `orm:"reverse(many)"`
}

func (this *Article) TableName() string {
	return "article"
}


func init() {
	//orm.RegisterDriver("mysql", orm.DRMySQL)
	//orm.RegisterDataBase("default", "mysql", "root:@/blog?charset=utf8", 30)
	orm.RegisterModel(new(Article),new(Category))
	//orm.RunSyncdb("default", false, true)
}

func GetArticle(id int) (Article, error) {
	o := orm.NewOrm()
	qs := o.QueryTable("article").OrderBy("-created")
	var art Article
	err := qs.Filter("Id",id).RelatedSel().One(&art)

	//if err == orm.ErrNoRows {
	//return art, nil
	//}
	return art, err
}

func UpdateArticle(id int, updArt Article) error {
	o := orm.NewOrm()
	o.Using("default")
	art := Article{Id: id}

	art.Title = updArt.Title
	art.Keywords = updArt.Keywords
	art.Summary = updArt.Summary
	art.Content = updArt.Content
	art.Author = updArt.Author
	art.Status = updArt.Status
	art.Tag = updArt.Tag
	art.Visibility = updArt.Visibility
	art.Titlepic = updArt.Titlepic
	art.Category = updArt.Category
	art.Created = updArt.Created
	_, err := o.Update(&art)
	return err
}

func AddArticle(updArt Article) (int64, error) {
	o := orm.NewOrm()
	o.Using("default")
	art := new(Article)

	art.Title = updArt.Title
	art.Uri = updArt.Uri
	art.Keywords = updArt.Keywords
	art.Summary = updArt.Summary
	art.Content = updArt.Content
	art.Author = updArt.Author
	art.Created = updArt.Created
	art.Viewnum = 1
	art.Status = updArt.Status
	art.Tag = updArt.Tag
	art.Visibility = updArt.Visibility
	art.Titlepic = updArt.Titlepic
	art.Category = updArt.Category
	id, err := o.Insert(art)
	return id, err
}

func ListArticle(condArr map[string]string, page int, offset int) (num int64, err error, art []Article) {
	o := orm.NewOrm()
	qs := o.QueryTable("article").OrderBy("-created")
	cond := orm.NewCondition()
	if condArr["title"] != "" {
		cond = cond.And("title__icontains", condArr["title"])
	}
	if condArr["keywords"] != "" {
		cond = cond.Or("keywords__icontains", condArr["keywords"])
	}
	if condArr["status"] != "" {
		//status, _ := strconv.Atoi(condArr["status"])
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
	var articles []Article
	num, err1 := qs.Limit(offset, start).RelatedSel().All(&articles)
	return num, err1, articles
}

func CountArticle(condArr map[string]string) int64 {
	o := orm.NewOrm()
	qs := o.QueryTable("article")
	cond := orm.NewCondition()
	if condArr["title"] != "" {
		cond = cond.And("title__icontains", condArr["title"])
	}
	if condArr["keywords"] != "" {
		cond = cond.Or("keywords__icontains", condArr["keywords"])
	}
	if condArr["status"] != "" {
		cond = cond.And("status", condArr["status"])
	}
	num, _ := qs.SetCond(cond).Count()
	return num
}

func GetAllCategory()(category []*Category){
	o := orm.NewOrm()
	var categorys []*Category
	qs := o.QueryTable("category")
	num,err := qs.RelatedSel().All(&categorys)
	//关联查询出相应分类下的所有文章信息
	for _, v :=range categorys {
		_, err = orm.NewOrm().LoadRelated(v, "Articles")
	}
	fmt.Printf("Returned Rows Num: %s, %s", num, err)
	return categorys
}

//通过分类id获取分类信息
func GetCategory(id int) (Category, error){
	o := orm.NewOrm()
	qs := o.QueryTable("category")
	var cat Category
	err := qs.Filter("Id",id).One(&cat)
	return cat, err
}


//删除文章
func DeleteArticle(id int) error  {
	o := orm.NewOrm()
	_, err := o.Delete(&Article{Id: id})
	return err
}
//添加栏目
func AddCategory(addCat Category)(int64 ,error){
	o := orm.NewOrm()
	o.Using("default")
	category := new(Category)
	category.Alias = addCat.Alias
	category.Author = addCat.Author
	category.Name = addCat.Name
	category.Description = addCat.Description
	category.Keywords = addCat.Keywords
	id,err:=o.Insert(category)
	return id,err
}

//更新栏目
func UpdateCategory(updCat Category) error{
	o := orm.NewOrm()
	o.Using("default")
	cat := Category{Id: updCat.Id}
	cat.Keywords = updCat.Keywords
	cat.Name = updCat.Name
	cat.Description = updCat.Description
	cat.Alias = updCat.Alias
	cat.Author = updCat.Author
	_, err := o.Update(&cat)
	return err
}

func DeleteCategory(id int) error{
	o := orm.NewOrm()
	_, err := o.Delete(&Category{Id: id})
	return err
}

