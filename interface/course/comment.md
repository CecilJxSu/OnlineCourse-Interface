# /course/{courseId}/comments
课程的评论相关接口

## GET
获取该课程下的评论

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
    
    comments: Comment[] - [{
        id: number - 1;
        date: Date - new Date();
        
        author: User - {
            id: number - 123;
            name: string - "苏金兴";
            iconUrl: string - "http://url.com";
        }; 
        
        content: string - "Hello";
        
        pictureUrls: string[] - ["http://url.com/image"];
        
        likeCount: number - 10;
        replyCount: number - 10;
        
        replies: Reply[] - [{
            id: number - 1;
            date: Date - new Date();
            
            toUser: User - {
                id: number - 123;
                name: string - "苏金兴";
                iconUrl: string - "http://url.com";
            };
            author: User - {
                id: number - 123;
                name: string - "苏金兴";
                iconUrl: string - "http://url.com";
            };
            
            content: string - "Hello";
        }];
        
        isLike: boolean - false;
    }];
}
```

#### 补充说明
1. 可以不用登录
2. 检查是否点赞过
3. 评论回复 / 2，（回复时，每次+2）

#### 错误处理
* 400：参数错误
* 404：课程的评论列表为空


# /course/{courseId}/comment
## POST
评论课程
### 参数说明
无
#### 上传数据
```
{
    content: string - "Hello";
    pictureUrls?: string[] - ["http://url.com/image"];
}
```

#### 返回数据
```
{
    commentId: number - 12;   
}
```

#### 补充说明
1. 需要登录
2. 课程增加评论数 + 3

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：课程不存在


# /course/{courseId}/comment/{commentId}
回复评论
## POST
回复评论
### 参数说明
无
#### 上传数据
```
{
    content: string - "Hello";
    toUserId?: number - 12;
}
```

#### 返回数据
```
{
    replyId: number - 13;
}
```

#### 补充说明
1. 需要登录
2. 评论回复 + 2

#### 错误处理
* 400：上传数据有问题；
* 401：用户未登录；
* 404：课程或评论或toUser用户不存在。