package main

import (
	_ "NewLife/routers"

	"html/template"
	"net/http"

	_ "NewLife/initial"

	"github.com/astaxie/beego"
)

func main() {
	beego.ErrorHandler("404", page_not_found)
	beego.Run()
}

func page_not_found(rw http.ResponseWriter, r *http.Request) {
	t, _ := template.New("404.tpl").ParseFiles("views/404.tpl")

	data := make(map[string]interface{})
	data["content"] = "page not found"
	t.Execute(rw, data)
}