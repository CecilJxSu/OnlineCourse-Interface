# /document/{documentId}
指定文档
## GET
获取文档
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    id: number - 1;
    date: Date - new Date();
    targetType: string - "course" | "catalog";
    targetId: number - 12;
    url: string - "http://url.com";
    type： string - "pdf";
    size: number - 123241;
    name: string - "Java实训教程";
}
```

#### 补充说明
需要登录
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：没有该文档

## DELETE
删除文档
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{}
```
#### 补充说明
需要登录，当前所有者的才能删除
#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是自己的
* 404：没有该文档