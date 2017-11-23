package utils

import (
	"time"
	"github.com/astaxie/beego/cache"
	"github.com/astaxie/beego"
)

type MyCache struct {
	cache.Cache
}

var (
	bc cache.Cache
)

func init(){
	bc,_= cache.NewCache("file", `{"CachePath":"./cache","FileSuffix":".cache","DirectoryLevel":2,"EmbedExpiry":20}`)
}

//通过key获取缓存
func Get(key string) interface{}{
	return bc.Get(key)
}

//设置缓存
func Put(key string, val interface{}, timeout time.Duration) {
	error := bc.Put(key,val,timeout)
	if error == nil{
		beego.Info("设置缓存成功,超时时间:",timeout)
	}else{
		beego.Error("设置缓存失败")
	}

}
//删除缓存
func Delete(key string){
	error := bc.Delete(key)
	if error == nil{
		beego.Info("删除缓存成功")
	}else{
		beego.Error("删除缓存失败")
	}
}

//判断缓存是否存在
func IsExist(key string) bool{
	return bc.IsExist(key)
}