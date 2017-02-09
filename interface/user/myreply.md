# /user/replies
我的回复列表接口
## GET
获取我的回复列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]

#### 上传数据
无
#### 返回数据
```
{
    total: number - 10;
    
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
        isReply: boolean - true;
    }];
}
```
 
#### 补充说明
1. 需要登录
2. replies 只有一条

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：我的回复为空