# /chat/{chatId}/favorite
话题的收藏接口

## POST
收藏话题

### 参数说明
无

#### 上传数据
无

#### 返回数据
```
{}
```

#### 补充说明
1. 需要登录
2. 话题收藏数 + 4

#### 错误处理
* 304：已经收藏
* 400：参数错误
* 401：未登录
* 404：话题不存在

## DELETE
取消收藏

### 参数说明
无

#### 上传数据
无

#### 返回数据
```
{}
```

#### 补充说明
1. 需要登录
2. 话题收藏数 - 4

#### 错误处理
* 400：参数错误
* 401：未登录
* 404：未收藏