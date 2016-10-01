# /user/{userId}/learnRecord
用户的学习记录接口
## GET
获取学习记录
### 参数说明
* [ start = 0 ]
* [ count = 10 ]

#### 上传数据
无

#### 返回数据
```
{
    total: number - 10;
    users: User[] - [{
        id: number - 1;
        name: string - "cecil";
        iconUrl: string - "http://url.com";
    }];
}
```

#### 补充说明
需要登录

#### 错误处理
* 401：未登录
* 404：没有关注用户


# /user/follower
用户的粉丝

## GET
获取自己的粉丝

### 参数说明
* [ start = 0 ]
* [ count = 10 ]

#### 上传数据
无

#### 返回数据
```
{
    total: number - 10;
    users: User[] - [{
        id: number - 1;
        name: string - "cecil";
        iconUrl: string - "http://url.com";
    }];
}
```

#### 补充说明
需要登录

#### 错误处理
* 401：未登录
* 404：没有粉丝


# /user/{id}/following
用户关注接口

## POST
关注该用户

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
* 404：用户不存在

## DELETE
取消关注

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
* 404：用户不存在