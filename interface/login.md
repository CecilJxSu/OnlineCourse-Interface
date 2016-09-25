# /login
用户登录

## POST
用户登录

### 参数说明
无

#### 上传数据
```
{
    username: string - "cecil";
    password: string - "12345dff";
}
```

#### 返回数据
```
{
    id: number - 1;
    userStatus: string - student | teacher | admin;
    nickname: string - "cecil";
    gender: string - male | female;
    iconUrl: string - "http://url.com";
}
```

#### 补充说明
返回成功后，设置头部 Authorization

#### 错误处理
400：参数错误；
403：密码错误。