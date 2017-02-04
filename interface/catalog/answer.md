# /catalog/{catalogId}/answer
课程章节下的回答

## GET
获取自己在该章节下的回答
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    id: number - 1;
    date: Date - new Date();
    questionId: number - 1;
    user: User - {
        id: number - 1;
        name: string - "cecil";
        iconUrl: string - "http://url.com";
    };
    answer: Answer[];
    total: number - 98.5;
}
```
[参考Answer设计] (https://github.com/CecilJxSu/OnlineCourse-Interface/blob/master/models/answer%E8%AE%BE%E8%AE%A1.md)

#### 补充说明
1. 需要登录
2. total: 总分

#### 错误处理
* 401：未登录
* 404：答题为空


## POST
创建用户的回答
### 参数说明
无
#### 上传数据
```
{
    questionId: number - 1;
    answer: Answer[];
    total: number - 98.5;
}
```
[参考Answer设计] (https://github.com/CecilJxSu/OnlineCourse-Interface/blob/master/models/answer%E8%AE%BE%E8%AE%A1.md)

#### 返回数据
```
{ answerId: number - 1 }
```
#### 补充说明
1. 需要登录
2. total: 总分
3. 不能重复回答

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：章节不存在或小测不存在
* 409：已经回答
