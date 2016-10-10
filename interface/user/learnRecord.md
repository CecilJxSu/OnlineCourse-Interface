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
    learnRecords: LearnRecords[] - [{
        id: number - 1;
        date: Date - new Date();
        catalog: Catalog - {
            id: number - 1;
            name: "Java教程";
        };
        user: User - {
            id: number - 1;
            name: string - "cecil";
            iconUrl: string - "http://url.com";
        };
        progress: number - 10.9;
        lastDate: Date - new Date();
        lastPosition: number - 1;
    }];
}
```
#### 补充说明
1. 需要登录
2. 获取别人的学习记录，需要老师登录，而且获取的，是自己的课程下的观看记录

#### 错误处理
* 400：参数错误
* 401：未登录
* 403：不能获取别人的学习记录，只有老师才可以
* 404：没有学习记录