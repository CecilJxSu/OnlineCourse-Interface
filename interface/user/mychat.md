# /user/chats
我的话题列表接口
## GET
获取我的话题列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]

#### 上传数据
无
#### 返回数据
```
{
    total: number - 10;
    
    chats: Chat[] - [{
        id: number - 1;
        date: Date - new Date();
        title: string - "话题标题";
        content: string - "话题内容";
        html: string - "<p>话题内容</p>";
        
        userId: number - 1;
        
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
* 404：我的话题为空