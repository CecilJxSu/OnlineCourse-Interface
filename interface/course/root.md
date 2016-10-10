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
    
    isLike: boolean - false;
    isFavorite: boolean - true;
}
```

#### 补充说明
1. 需要登录
2. 检查是否点赞过和收藏过
3. 检查是否浏览过，如果没有浏览过，添加watchCount + 1
4. 如果存在url，则duration和previewImage也存在
5. likeCount/2，commentCount/3，favoriteCount/4

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：课程为空


## PUT
修改课程
### 参数说明
无
#### 上传数据
```
{
    status?: string - "public";
    name?: string - "Java 教程";
    introduction?: string - "课程简介";
    department?: string - "计算机系";
}
```

#### 返回数据
```
{}
```

#### 补充说明
1. 老师修改自己的课程，或者管理员
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
需要管理员账号登录；或者作者登录

#### 错误处理
* 401：未登录;
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
    name: string - "Java 教程";
    introduction: string - "课程简介";
    department: string - "计算机系";
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
2. 创建的课程是草稿draft，未正式发布

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
* [ sort = date | rank ]
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
* 400：参数错误
* 404：课程不存在