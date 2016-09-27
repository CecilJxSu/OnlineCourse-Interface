# /course/{courseId}
指定课程接口
## GET
根据课程ID，获取课程详情
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
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
    
    documents: Document[] - [{
        id: number - 1;
        date: Date - new Date();
        url: string - "http://url.com";
        type: string - "pdf" | "doc" | "ppt" | "xls" | "mp4";
        size: number - 13456;
    }];
    
    catalogs: Catalog[] - [{
        id: number - 1;
        date: Date - new Date();
        index: number - 1;
        name: string - "第一个小程序：Hello World";
        introduction: string - "本章节主要介绍Java的语法";
        url： string - "http://url.com/video";
        duration: number - 342424;
        previewImage: string - "http://url.com/image";
        
        documents: Document[] - [{
            id: number - 1;
            date: Date - new Date();
            url: string - "http://url.com";
            type: string - "pdf" | "doc" | "ppt" | "xls" | "mp4";
            size: number - 13456;
        }];
    }];
    
    isLike: boolean - false;
    isFavorite: boolean - true;
}
```

#### 补充说明
1. 需要登录
2. 检查是否点赞过和收藏过
3. 检查是否浏览过，如果没有浏览过，添加watchCount + 1

#### 错误处理
* 401：未登录
* 404：课程列表为空


## PUT
修改课程
### 参数说明
无
#### 上传数据
```
{
    status: string - "public" | "draft";
    name: string - "Java 教程";
    introduction: string - "课程简介";
    department: string - "计算机系";
    
    documents: Document[] - [{
        id: number - 1;
        url: string - "http://url.com";
        type: string - "pdf" | "doc" | "ppt" | "xls" | "mp4";
        size: number - 13456;
    }];
    
    catalogs: Catalog[] - [{
        id: number - 1;
        index: number - 1;
        name: string - "第一个小程序：Hello World";
        introduction: string - "本章节主要介绍Java的语法";
        url： string - "http://url.com/video";
        duration: number - 342424;
        previewImage: string - "http://url.com/image";
        
        documents: Document[] - [{
            id: number - 1;
            url: string - "http://url.com";
            type: string - "pdf" | "doc" | "ppt" | "xls" | "mp4";
            size: number - 13456;
        }];
    }];
}
```

#### 返回数据
```
{}
```

#### 补充说明
1. 老师修改自己的课程
2. 前端先获取该课程，然后判断status是否是发布的。
    如果已经发布了，则不显示“发布”按钮。

#### 错误处理
* 400：上传数据有问题；
* 401：用户未登录；
* 403：权限不足；
* 404：课程不存在。


## DELETE
删除课程
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{}
```

#### 补充说明
需要管理员账号登录；

#### 错误处理
* 401：管理员未登录;
* 403：权限不足；
* 404：课程不存在；
* 500：服务器错误，删除失败。


# /course
单个课程接口
## POST
创建课程
### 参数说明
无

#### 上传数据
```
{
    status: string - "public" | "draft";
    name: string - "Java 教程";
    introduction: string - "课程简介";
    department: string - "计算机系";
    
    documents: Document[] - [{
        url: string - "http://url.com";
        type: string - "pdf" | "doc" | "ppt" | "xls" | "mp4";
        size: number - 13456;
    }];
    
    catalogs: Catalog[] - [{
        index: number - 1;
        name: string - "第一个小程序：Hello World";
        introduction: string - "本章节主要介绍Java的语法";
        url： string - "http://url.com/video";
        duration: number - 342424;
        previewImage: string - "http://url.com/image";
        
        documents: Document[] - [{
            url: string - "http://url.com";
            type: string - "pdf" | "doc" | "ppt" | "xls" | "mp4";
            size: number - 13456;
        }];
    }];
}
```

#### 返回数据
```
{
    courseId: number - 12;   
}
```

#### 补充说明
1. 老师登录权限
2. status分别为发布，保存。点击保存，则是创建草稿，并未发布到前端

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：权限不足


# /courses
课程列表接口
## GET
模糊查询，获取列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]
* [ sort = date | hot ]
* [ department = 计算机系 ]

#### 上传数据
无
#### 返回数据
```
{
    total: number - 12;
    courses: Course[];
}
```
```
Course: {
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
}
```

#### 补充说明
1. 可以不用登录
2. 检查是否点赞过和收藏过

#### 错误处理
404：课程不存在