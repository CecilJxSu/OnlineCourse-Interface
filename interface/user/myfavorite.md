# /user/favorites
我的收藏列表接口
## GET
获取我的收藏列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]
* [ type = course | chat ]

#### 上传数据
无
#### 返回数据
```
//type = course
{
    total: number - 10;
    courses: Course[{
        id: number - 1;
        date: Date - new Date();
        name: string - "Java 教程";
        introduction: string - "课程简介";
        
        author: User - {
            id: number - 123;
            name: string - "苏金兴";
            iconUrl: string - "http://url.com";
        };
        
        department: string - "计算机系";
        watchCount: number - 10;
        likeCount: number - 10;
        commentCount: number - 10;
        favoriteCount: number - 10;
        
        isLike: boolean - false;
        isFavorite: boolean - true;
    }];
}

//type = chat
{
    total: number - 10;
    chats: Chat[{
        id: number - 1;
        date: Date - new Date();
        title: string - "话题标题";
        content: string - "话题内容";
        html: string - "<p>话题内容</p>";
        
        author: User - {
            id: number - 123;
            name: string - "苏金兴";
            iconUrl: string - "http://url.com";
        };
        
        pictureUrls: string[] - ["http://url.com"];
        
        watchCount: number - 10;
        likeCount: number - 10;
        commentCount: number - 10;
        favoriteCount: number - 10;
        
        isLike: boolean - false;
        isFavorite: boolean - true;
    }];
}
```
 
#### 补充说明
需要登录
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：我的收藏为空