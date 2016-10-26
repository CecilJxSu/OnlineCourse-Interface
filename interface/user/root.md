# /user
## POST
注册用户

### 参数说明
无

#### 上传数据
```
{
    username: string - "cecil";
    password: string - "12345dff";
    email: string - "123456@qq.com";
}
```

#### 返回数据
```
{
    userID: number - 1;
}
```

#### 补充说明
1. 前端做加密，发送到服务器
2. userID是该用户创建后，返回的用户ID；
3. 上传用户名和密码

#### 错误处理
400：参数或上传数据有问题


## PUT
修改密码

### 参数说明
无

#### 上传数据
```
{
    old: string - "123";
    new: string - "321";
}
```

#### 返回数据
```
{}
```

#### 补充说明
1. old是旧密码；
2. new是新密码；
3. 需要用户登录。

#### 错误处理
* 400：参数或上传数据有问题；
* 401：用户未登录；
* 403：旧密码错误。


# /user/{userId}
## DELETE
封号以及永久封号
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
{
    infinity: boolean - true;
    lockEndDate?: number - 14700012323; //毫秒数
}
```

#### 补充说明
1. 需要管理员账号登录；
2. uid是被封的账号；
3. 如果infinity=true，则不用上传lockEndDate，永久封号；如果infinity=false，则lockEndDate=解封的时刻

#### 错误处理
* 400：参数有问题；
* 401：用户未登录;
* 403：权限不足；
* 404：用户不存在；
* 500：服务器错误，删除失败。