# /course/{id}/like
课程的点赞接口

## POST
点赞课程

### 参数说明
无

#### 上传数据
无

#### 返回数据
```
{}
```

#### 补充说明
需要登录

#### 错误处理
* 401：未登录
* 404：课程不存在

## DELETE
取消点赞

### 参数说明
无

#### 上传数据
无

#### 返回数据
```
{}
```

#### 补充说明
需要登录

#### 错误处理
* 401：未登录
* 404：课程不存在