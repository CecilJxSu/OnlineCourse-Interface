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
    catalogId: number - 2;
    userId: number - 1;
    answer: { [index:number]: string[]; } - { 1: ["A"], 2: ["B"], 3: ["A","B"] };
    total: number - 98.5;
}
```

#### 补充说明
1. 需要登录
2. total: 总分

#### 错误处理
* 401：未登录
* 404：答题为空/章节不存在