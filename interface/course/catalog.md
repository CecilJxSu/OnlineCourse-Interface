# /course/{courseId}/catalog
课程下的章节
## POST
创建章节
### 参数说明
无
#### 上传数据
```
{
    index: number - 1;
    name: string - "第一个小程序：Hello World";
    introduction: string - "本章节主要介绍Java的语法";
    url?： string - "http://url.com/video";
    duration?: number - 342424;
    previewImage?: string - "http://url.com/image";
}
```
#### 返回数据
```
{
    catalogId: number - 1;
}
```
#### 补充说明
1. 老师登录
2. 如果上传url，则duration和previewImage也要上传

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是当前课程作者登录
* 404：课程不存在
* 409：index存在，不能重复


# /course/{courseId}/catalogs
课程下的章节
## GET
获取课程下的章节列表
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
Catalog[] - [{
    id: number - 1;
    date: Date - new Date();
    courseId: number - 1
    index: number - 1;
    name: string - "第一个小程序：Hello World";
    introduction: string - "本章节主要介绍Java的语法";
    url?： string - "http://url.com/video";
    duration?: number - 342424;
    previewImage?: string - "http://url.com/image";
}];
```
#### 补充说明
1. 需要登录
2. 如果存在url，则duration和previewImage也存在

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：章节不存在