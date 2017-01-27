---
title: Git简易教程
date: 2016-07-31 13:41:40
tags:
categories: Git

---

commit 一定要准确表达你的文件修改!!!!!

http://blog.csdn.net/zxwd2015/article/details/51454668
http://www.bootcss.com/p/git-guide/
http://www.yiibai.com/git/home.html


#　Git工作流程

## 从服务器上克隆完整的Git仓库（包括代码和版本信息）到单机上。

```
创建一个本地仓库的克隆版本：
git clone /path/to/repository
如果是远端服务器上的仓库：
git clone username@host:/path/to/repository
```

## 在自己的机器上根据不同的开发目的，创建分支，修改代码,开始工作。

```
创建一个叫做“feature_x”的分支，并切换过去：
git checkout -b feature_x
或者
git branch new_branch (默认从当前分支的head创建分支,你也可以指定)
git checkout new_branch

-------------------------
列出分支:
git branch
git branch -a  包括远程分支
重命名分支:
git branch -m new old_branch_name  new_branch_new
删除分支:
git branch -D branch_name

```

## 在单机上提交分支到库

```
git add <feature_filename>
git add *      提交到暂存区
git commit -m "代码提交信息"
提交完了，向看下提交记录
git log

-----------
假如你做错事（自然，这是不可能的），你可以使用如下命令替换掉本地改动：
git checkout -- <filename>
------------
```

## 在单机上合并分支。

```
在你的分支已经被提交到单机的库内后

-------------
合并:
如果要将开发中的分支（develop），合并到稳定分支（master），
首先切换的master分支：git checkout master。
然后执行合并操作：git merge develop。

http://www.yiibai.com/git/git_managing_branches.html
------------------
```

## 把服务器上最新版的代码fetch下来，然后跟自己的主分支合并。

```
fetch你的本地仓库至最新改动，执行：
git pull
如果要将开发中的分支（develop），合并到稳定分支（master），
首先切换的master分支：git checkout master。
然后执行合并操作：git merge develop。
如果有冲突，会提示你，调用git status，git diff查看冲突文件。
解决冲突，然后调用git add或git rm将解决后的文件暂存。
所有冲突解决后，git commit 提交更改。
http://www.yiibai.com/git/git_handling_conflicts.html
```


## 推送的远程库

```

先连接远程库(就是一开始git clone 来的地方)
git remote add origin gituser@git.server.com:project.git (先要ssh验证)
再提交
git push origin master

另一方面:

你的远程库拥有者,可以通过git log origin/branch_name    来看你增加了什么新功能,然后 git merge origin/branch_name

```


## 生成补丁（patch），把补丁发送给主开发者。

```
http://www.yiibai.com/git/git_patch_operation.html

看主开发者的反馈，如果主开发者发现两个一般开发者之间有冲突（他们之间可以合作解决的冲突），就会要求他们先解决冲突，然后再由其中一个人提交。如果主开发者可以自己解决，或者没有冲突，就通过。


如
Tom 好奇Jerry 在做什么在他的私人分支，这就是为什么他检查日志从wchar_support 分支。

[tom@CentOS src]$ pwd
/home/tom/top_repo/project/src

[tom@CentOS src]$ git log origin/wchar_support -2
上面的命令会产生以下结果。

commit 64192f91d7cc2bcdf3bf946dd33ece63b74184a3
Author: Jerry Mouse <jerry@yiibai.com>
Date: Wed Sep 11 16:10:06 2013 +0530

Added w_strlen function to return string lenght of wchar_t string


commit 577647211ed44fe2ae479427a0668a4f12ed71a1
Author: Tom Cat <tom@yiibai.com>
Date: Wed Sep 11 10:21:20 2013 +0530

Removed executable binary
通过查看提交的信息，Tom 意识到Jerry 实现宽字符strlen 函数，他希望同样的功能集成到主分支。而不是重新实现他的分支合并到主分支，他决定采用杰里的代码。

[tom@CentOS project]$ git branch
* master

[tom@CentOS project]$ pwd
/home/tom/top_repo/project

[tom@CentOS project]$ git merge origin/wchar_support
Updating 5776472..64192f9
Fast-forward
src/string_operations.c | 10 ++++++++++
1 files changed, 10 insertions(+), 0 deletions(-)
```

就这样，代码任务被一层层的分配，然后一层层的合并推送，最后推送到主代码库，发布。

## 其他

可以通过git log 查看id，对库内的每一次提交打标签git tag
http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001376951758572072ce1dc172b4178b910d31bc7521ee4000

--------------------------------------------------------------
当我们需要删除暂存区或分支上的文件, 同时工作区也不需要这个文件了, 可以使用

git rm file_path
当我们需要删除暂存区或分支上的文件, 但本地又需要使用, 只是不希望这个文件被版本控制, 可以使用

git rm --cached file_path
file_path 为文件路径



# 其他使用总结


##　关于提交日志:

简短的格式:
git log --oneline

完整模式
git log --prett=fuller

如何不仅想显示commit记录和hash,还是想看文件的修改记录:
git log -p <filename>

本地的分支已经提交A-> B-> C-> D和合并分支已提交A-> B-> X> Y，则Git合并将当前转换像这样的本地分行A-> B-> C-> D-> X-> Y
这个时候你只想看A-B-C-D
git log --no-merges master

## 修改你的提交


git commit --amend

这个指令顾名思义。

假设提交之后，你意识到自己犯了一个拼写错误。你可以重新提交一次，并附上描述你的错误的提交信息。但是，还有一个更好的方法：

如果提交尚未推送到远程分支，那么按照下面步骤简单操作一下就可以了：

修复你的拼写错误
将修正过的文件暂存，通过git add some-fixed-file.js
运行 git commit –amend 命令，将会把最近一次的变更追加到你最新的提交。同时也会给你一个编辑提交信息的机会。

准备好之后，将干净的分支推送到远程分支。


## 重置文件

在git中，有3种类型的重置。重置是让文件回到git历史中的一个特定版本。

git reset –hard {{some-commit-hash}} —— 回退到一个特定的历史版本。丢弃这次提交之后的所有变更。


git reset {{some-commit-hash}}—— 回滚到一个特定的历史版本。将这个版本之后的所有变更移动到“未暂存”的阶段。这也就意味着你需要运行 git add . 和 git commit 才能把这些变更提交到仓库.


git reset –soft {{some-commit-hash}} ——回滚到一个特定的历史版本。将这次提交之后所有的变更移动到暂存并准备提交阶段。意味着你只需要运行 git commit 就可以把这些变更提交到仓库。

这些命令似乎并没有什么用处，但当你尝试着将文件在不同版本间移动时，使用它们会非常方便。

我平时使用重置的一些用例如下：

如果想清除变更记录，可以使用清理命令——git reset –hard HEAD （最常用）
如果想编辑，以不同的顺序，重新暂存，重新提交文件—— git reset {{some-start-point-hash}}
git reset –soft {{some-start-point-hash}}如果想把之前3次的提交，作为一次提交 git reset –soft {{some-start-point-hash}}

##　二分法定位错误提交

git bisect

# 进阶

http://blog.jobbole.com/96088/


