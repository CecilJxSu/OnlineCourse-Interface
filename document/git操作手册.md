从远程主机克隆一个版本库
git clone git@120.76.136.83:onlinecourse.git


查看分支：
cd onlinecourse
git branch -r
查看本地分支：
git branch


从远端下载新的分支(-b 创建)：
git checkout -b 本地 远端
git checkout -b feature-8.7-Preview origin/feature-8.7-Preview


创建自己的分支(在此分支进行每天的开发)：
git checkout -b feature-8.7-Preview

分支命名的规则：
feature-日期-特性(首字母大写，用And连接特性)
feature-8.7-Feature1AndFeature2AndFeature

修改分支名称：
git branch -m 久分支名 新分支名

删除分支 ：
git branch -d 分支名
git branch -D （强制删除）


提交新修改的东西：
git add 新增加的文件
git add ./* 也是可以的
git commit -am "说明文字,简短一点，可能字数有限"
