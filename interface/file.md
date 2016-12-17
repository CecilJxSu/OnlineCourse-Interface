# /file
文件相关
## POST
创建文件
### 参数说明
无
#### 上传数据
```
文件
```
#### 返回数据
```
{
    url: string - "http://host[:port]/file/96C7D24A6E62517DC8C9FD8C36A46A98";
    fileType: string - "jpg" | "docx" | "mp4";
    fileSize: float - 4976.5;
}
```
```java
String uuid = UUID.randomUUID().toString();
MessageDigest messageDigest = MessageDigest.getInstance("MD5");
messageDigest.update(uuid.getBytes());
uuid = String.format("%032X", new BigInteger(1, messageDigest.digest()));
```
#### 说明
1. 文件名以uuid加密后为命名方式，先生成uuid，然后加密成md5；
2. 返回的url，port默认80，则省略；file后面是文件名
3. 文件大小，单位: B

#### 错误处理
401：未登录

# /file/{name}
## GET
获取文件
### 参数说明
无
#### 上传数据
无
#### 返回数据
```
文件
```
#### 说明
name 是文件名，比如 /file/96C7D24A6E62517DC8C9FD8C36A46A98
#### 错误处理
* 400：参数错误
* 401：未登录
* 404：没有该文件 
