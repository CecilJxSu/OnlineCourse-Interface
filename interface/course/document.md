# /course/{courseId}/document
指定课程下的文档
## POST
创建文档
### 参数说明
无
#### 上传数据
```
{
    url: string - "http://url.com";
    type: string - "pdf";
    size: number - 12342;
    name: string - "Java 实训教程.pdf";
}
```
#### 返回数据
```
{
    documentId: number - 12;
}
```
#### 补充说明
登录，课程所有者
#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是当前作者的
* 404：没有该课程


# /course/{courseId}/documents
课程下的文档列表
## GET
获取文档列表
### 参数说明
* [ start = 0 ]
* [ count = 10 ]
* [ sort = date | name | size ]

#### 上传数据
无
#### 返回数据
```
{
    total: number - 10;
    documents: Document[] - [{
        id: number - 1;
        date: Date - new Date();
        targetType: string - "course";
        targetId: number - 12;
        url: string - "http://url.com";
        type： string - "pdf";
        size: number - 123241;
        name: string - "Java实训教程";
    }];
}
```
#### 补充说明
登录
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：没有文档