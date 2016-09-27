# /catalog/{catalogId}/questions
课程章节下的题目

## GET
获取该章节下的小测

### 参数说明
无

#### 上传数据
无

#### 返回数据
```
Question：[]
```
```
Question: {
    id: number - 1;
    date: Date - new Date();
    catalogId: number - 1;
    index: number - 1;
    type: number - 1 | 2 | 3;
    question: string - "1 + 1 = ?";
    
    answer?: string[] - ["A"];
    
    item: any - { A: "2", B: "3", C: "5", D: "6" };
    explains: string - "1 + 1 = 2";
    url?: string - "http://url.com";
    score: number - 2;
}
```

#### 补充说明
1. 需要登录
3. type: 试题类型；判断题：1；单选：2；多选：3

#### 错误处理
* 401：未登录
* 404：试题为空

# /catalog/{catalogId}/question/{questionId}
课程章节下的题目

## GET
获取该章节下的小测

### 参数说明
无

#### 上传数据
无

#### 返回数据
```
Question：[]
```
```
Question: {
    id: number - 1;
    date: Date - new Date();
    catalogId: number - 1;
    index: number - 1;
    type: number - 1 | 2 | 3;
    question: string - "1 + 1 = ?";
    
    answer?: string[] - ["A"];
    
    item: any - { A: "2", B: "3", C: "5", D: "6" };
    explains: string - "1 + 1 = 2";
    url?: string - "http://url.com";
    score: number - 2;
}
```

#### 补充说明
1. 需要登录
3. type: 试题类型；判断题：1；单选：2；多选：3

#### 错误处理
* 401：未登录
* 404：试题为空