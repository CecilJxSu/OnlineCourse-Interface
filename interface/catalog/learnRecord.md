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
    lastPosition: number - 1123;
}
```
#### 补充说明
1. 需要登录
2. lastPosition最后观看位置

#### 错误处理
* 401：未登录
* 404：章节不存在


## POST
创建学习记录
### 参数说明
无
#### 上传数据
```
{
    progress: number - 10.9;
    lastPosition: number - 1123;
}
```
#### 返回数据
```
{ learnRecordID: number - 1; }
```
#### 补充说明
1. 需要登录
2. lastPosition最后观看位置

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：章节不存在
* 409：已经存在


## PUT
更新学习记录
### 参数说明
无
#### 上传数据
```
{
    progress: number - 10.9;
    lastPosition: number - 1123;
}
```
#### 返回数据
```
{}
```
#### 补充说明
1. 需要登录
2. lastPosition最后观看位置

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：学习记录不存在