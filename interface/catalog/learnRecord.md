# /catalog/{catalogId}/learnRecord
课程章节下的学习记录


## GET
获取自己的学习记录
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    id: number - 10;
    date: Date - new Date();
    catalogId: number - 10;
    user: User - {
        id: number - 1;
        name: string - "cecil";
        iconUrl: string - "http://url.com";
    };
    progress: number - 9.8;
    lastDate: Date - new Date();
    lastPosition: number - 1;
}
```
#### 补充说明
需要登录
#### 错误处理
* 401：未登录
* 404：章节不存在


## PUT
更新学习记录
### 参数说明
无
#### 上传数据
```
{
    progress: number - 10.9;
    lastPosition: number - 1;
}
```
#### 返回数据
```
{}
```
#### 补充说明
* 需要登录
* lastPosition是章节的index

#### 错误处理
* 401：未登录
* 404：章节不存在