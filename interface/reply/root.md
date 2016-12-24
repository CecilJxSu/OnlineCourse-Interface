# /reply/{replyId}
回复相关接口

## GET
获取指定回复
### 参数说明
replyId = 1
#### 上传数据
无
#### 返回数据
```
Reply: {
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
}
```

#### 补充说明
可以不用登录

#### 错误处理
* 400：参数错误
* 404：回复不存在
