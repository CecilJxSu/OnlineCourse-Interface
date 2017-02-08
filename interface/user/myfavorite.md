# /user/favorites
我的收藏列表接口
## GET
获取我的收藏列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]
* [ type = course | type ]

#### 上传数据
无
#### 返回数据
```
{
    total: number - 10;
    
    favorites: Favorite[] - [{
        type: "course" | "type" - "course";
        date: Date - new Date();
        
        id: number - 1;
        name: string - "标题";
        content: string - "内容";
    }];
}
```
 
#### 补充说明
需要登录
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：我的收藏为空