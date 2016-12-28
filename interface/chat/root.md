# /chat/{chatId}
指定话题接口
## GET
根据话题ID，获取话题详情
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
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
}
```

#### 补充说明
1. 可以不用登录
2. 检查是否点赞过和收藏过
3. 检查是否浏览过，如果没有浏览过，添加watchCount + 1
4. likeCount/2，commentCount/3，favoriteCount/4

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：话题为空


## DELETE
删除话题
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{}
```

#### 补充说明
需要登录

#### 错误处理
* 401：未登录；
* 403：权限不足，只能删除自己的话题；
* 404：话题不存在；
* 500：服务器错误，删除失败。


# /chat
单个话题接口
## POST
创建话题
### 参数说明
无
#### 上传数据
```
{
    title: string - "话题标题";
    content: string - "话题内容";
    html: string - "<p>话题内容</p>";
    pictureUrls?: string[] - ["http://url.com/image"];
}
```

#### 返回数据
```
{
    chatId: number - 12;   
}
```

#### 补充说明
1. 需要登录
2. 图片可能需要处理多一份缩略图

#### 错误处理
* 400：参数错误
* 401：未登录
* 500：创建失败


# /chats
话题列表接口
## GET
模糊查询，获取列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]
* [ sort = date | rank ]

#### 上传数据
无
#### 返回数据
```
{
    total: number - 12;
    chats: Chat[];
}
```
```
Chat: {
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
}
```

#### 补充说明
1. 可以不用登录
2. 检查是否点赞过和收藏过
3. 返回的图片，可以是缩略图

#### 错误处理
* 400：参数错误
* 404：话题列表为空