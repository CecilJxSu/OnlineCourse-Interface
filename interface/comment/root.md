# /comment/{commentId}
评论相关接口

## GET
获取指定评论

### 参数说明
commentId = 1

#### 上传数据
无

#### 返回数据
```
Comment: {
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
}
```

#### 补充说明
1. 可以不用登录
2. 检查是否点赞过
3. 评论回复 / 2，（回复时，每次+2）

#### 错误处理
* 400：参数错误
* 404：评论不存在
