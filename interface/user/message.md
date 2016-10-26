# /user/messages
用户的消息列表接口
## GET
获取用户的消息

### 参数说明
* [ start = 0 ]
* [ count = 10 ]
* [ isRead = Y | N ]

#### 上传数据
无
 
#### 返回数据
```
{
    total: number - 10;
    
    messages: Message[] - [{
        id: number - 1;
        date: Date - new Date();
        type: string - "course" | "chat" | "comment" | "system" | "user";
        
        toUser: User - {
            id: number - 123;
            name: string - "cecil";
            iconUrl: string - "http://url.com/image";
        };
        fromUser?: User - {
            id: number - 123;
            name: string - "cecil";
            iconUrl: string - "http://url.com/image";
        };
        
        actionType?: string - "like" | "favorite" | "following" | "reply" | "comment";
        position?: Course | Chat | Comment - {
            id: number - 10;
            name: string - "Java 课程";   //Course的name，Chat的title，comment的content
        };
        
        content?: string - "收藏课程";
    }];
}
```
 
#### 补充说明
需要登录
 
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：消息为空


# /user/message/{id}
指定消息接口
## GET
获取指定消息
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    id: number - 1;
    date: Date - new Date();
    type: string - "course" | "chat" | "comment" | "system" | "user";
    
    toUser: User - {
        id: number - 123;
        name: string - "cecil";
        iconUrl: string - "http://url.com/image";
    };
    fromUser?: User - {
        id: number - 123;
        name: string - "cecil";
        iconUrl: string - "http://url.com/image";
    };
    
    actionType?: string - "like" | "favorite" | "following" | "reply" | "comment";
    position?: Course | Chat | Comment - {
        id: number - 10;
        name: string - "Java 课程";   //Course的name，Chat的title，comment的content
    };
    
    content?: string - "收藏课程";
}
```
 
#### 补充说明
1. 需要登录
2. 设置消息为已读

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：没有该消息


# DELETE
删除自己的通知

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
* 400：参数错误
* 401：未登录
* 404：没有该消息