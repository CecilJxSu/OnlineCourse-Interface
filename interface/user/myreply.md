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
    
    replies: Reply[] - [{
        id: number - 1;
        date: Date - new Date();
        
        commentId: number - 1;
        toUserId: number - 1;
        userId: number - 1;
        
        content: string - "Hello";
    }];
}
```
 
#### 补充说明
需要登录
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：我的回复为空