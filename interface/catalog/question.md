# /catalog/{catalogId}/question
课程章节下的题目


## POST
创建该章节下的小测
### 参数说明
无
#### 上传数据
```
{
    total: number - 100;
    questions: Question[];
}
```
[参考Question设计] (https://github.com/CecilJxSu/OnlineCourse-Interface/blob/master/models/question%E8%AE%BE%E8%AE%A1.md)

#### 返回数据
```
{
    questionId: number - 1;
}
```
#### 补充说明
1. 需要登录，课程所有者才能创建
2. question会以JSON.stringify的方式储存
3. 可以根据不同的type来设计不同的题型结构
4. total总分

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是课程所有者
* 404：章节不存在
* 409：已经存在该课程


## PUT
更新该章节下的小测
### 参数说明
无
#### 上传数据
```
{
    total: number - 100;
    questions: Question[];
}
```
[参考Question设计] (https://github.com/CecilJxSu/OnlineCourse-Interface/blob/master/models/question%E8%AE%BE%E8%AE%A1.md)

#### 返回数据
```
{}
```
#### 补充说明
1. 需要登录，课程所有者才能更新
2. question会以JSON.stringify的方式储存
3. 可以根据不同的type来设计不同的题型结构
4. total总分

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是课程所有者
* 404：章节不存在或小测不存在


## DELETE
删除该章节下的小测
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{}
```
#### 补充说明
需要登录，课程所有者才能删除

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是课程所有者
* 404：试题不存在/章节不存在


## GET
获取该章节下的小测
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    id: number - 1;
    date: Date - new Date();
    catalogId: number - 1;
    questions: Question[];
    total: number - 100;
}
```
[参考Question设计] (https://github.com/CecilJxSu/OnlineCourse-Interface/blob/master/models/question%E8%AE%BE%E8%AE%A1.md)

#### 补充说明
1. 需要登录
2. question会以JSON.stringify的方式储存
3. 可以根据不同的type来设计不同的题型结构
4. total总分

#### 错误处理
* 401：未登录
* 404：试题不存在
