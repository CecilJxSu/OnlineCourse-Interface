# /user/{userId}/profile
获取用户的资料
## GET
获取用户的资料
### 参数说明
无
#### 上传数据
无

#### 返回数据
```
{
    nickname: string - "cecil";
    gender: string - "male";
    userStatus: string - "student" | "teacher" | "admin**";
    iconUrl: string - "http://url.com";
    universityId: string - "1340706111";
    realname: string - "苏金兴";
    phone: string - "18819437953";
    email: string - "123456@qq.com";
    department: string - "计算机系";
    major: string - "web应用软件开发";
    dormitoryAddress: string - "M2409";
    
    isFollowing?: boolean - true;
}
```

#### 补充说明
1. 需要登录
2. 如果登录用户ID等于userId，就是获取自己的
3. isFollowing，是否关注别人

#### 错误处理
* 401：未登录
* 404：用户不存在


# /user/profile
个人资料
## PUT
用户修改资料

### 参数说明
无

#### 上传数据
```
{
    universityId?: string - "1340706111";
    nickname?: string - "cecil";
    realname?: string - "苏金兴";
    gender?: string - "male";
    iconUrl?: string - "http://url.com";
    phone?: string - "18819437953";
    email?: string - "123456@qq.com";
    department?: string - "计算机系";
    major?: string - "web应用软件开发";
    dormitoryAddress?: string - "M2409";
}
```

#### 返回数据
```
{}
```

#### 补充说明
需要登录，修改自己的资料

#### 错误处理
* 400：参数或上传数据有问题
* 401：未登录