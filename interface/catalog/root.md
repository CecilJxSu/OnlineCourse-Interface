# /catalog/{catalogId}
课程章节

## GET
获取指定章节
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    id: number - 12;
    date: Date - new Date();
    courseId: number - 1;
    index: number - 1;
    parent_id: number - 0;
    name: string - "Java 入门";
    introduction: string - "Java 入门";
    url?: string - "http://url.com/video";
    duration?: number - 12321;
    previewImage?: string - "htp:/url.com/image";
}
```

#### 补充说明
1. 需要登录
2. 如果有url，则duration和previewImage也会存在
3. parent_id大于零，为节；如果不大于零，为章

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：没有该章节

## PUT
修改章节
### 参数说明
无
#### 上传数据
```
{
    parent_id?: number - 0;
    index?: number - 1;
    name?: string - "Java 入门";
    introduction?: string - "Java 入门";
    url?: string - "http://url.com/video";
    duration?: number - 12321;
    previewImage?: string - "htp:/url.com/image";
}
```
#### 返回数据
```
{}
```

#### 补充说明
需要登录，当前老师的权限
#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是自己的课程
* 404：没有该章节
* 409：index和parent_id已经存在（修改index时，index重复）

## DELETE
删除章节
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{}
```

#### 补充说明
需要登录，当前老师的权限

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不是自己的课程
* 404：没有该章节
