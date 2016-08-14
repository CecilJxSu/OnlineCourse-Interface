# git操作手册

## 从远程主机克隆一个版本库
```github
git clone git@120.76.136.83:onlinecourse.git

```

## 查看分支
1. 查看远程分支

```github
cd onlinecourse
git branch -r

```

2. 查看本地分支

```github
git branch

```

## 从远端下载新的分支到本地分支(-b 创建)

1. git checkout -b 本地 远端

```github
git checkout -b feature-8.7-Preview origin/feature-8.7-Preview

```

2. 创建自己的分支(在此分支进行每天的开发)

```github
git checkout -b feature-8.7-Preview

```

3. 分支命名的规则

* feature-日期-特性(首字母大写，用And连接特性)
* feature-8.7-Feature1AndFeature2AndFeature


## 修改分支名称
* git branch -m 久分支名 新分支名


## 删除分支 ：
* git branch -d 分支名
* git branch -D （强制删除）


## 提交新修改的东西：
1. git add 新增加的文件
2. git add ./* 也是可以的
3. git commit -am "说明文字,简短一点，可能字数有限"