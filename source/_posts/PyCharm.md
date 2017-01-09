---
title: PyCharm
date: 2017-01-08 20:48:01
tags:
categories: others

---


#  配置
http://www.jb51.net/softjc/127770.html

# 插件

ideavim

# 主题路径

先用locate或者find  find /home × | grep ×

/home/fanhaipeng/.PyCharm2016.3/config/settingsRepository/repository/colors


# 运行
改为F10

# 打开目录

alt 1, 然后ctrl o 新建文件

# 打开审查代码

alt 7

# 控制台

alt 4

# 待做

alt 6

# 使用心得
JetBrains家的IDE很多技巧是通用的，说一些自己日常用得多但不一定仅限于PyCharm的技巧：

`ctrl+alt+L`，格式化代码，曾经用Eclipse的时候，格式化代码一定要先选中某个区域的代码块再进行格式化，用了JetBrains的IDE之后就习惯性地格式化一下，还必须手贱多格式化几次才舒服，不过有后遗症，以后到各种编辑框中总喜欢`ctrl+alt+L`几下才舒服

`alt+enter`万能键，不同场景有不同的表现方式，在还没import(install)模块名上使用会import(install)相对应的模块，在方法名上使用补注释，在测试中使用帮你补充断言代码……不管出错了不知道怎么办，知道怎么办想这么办时都按下这个快捷键，有惊喜

`ctrl+space` 万能提示键，PyCharm的会根据上下文提供补全。不仅是代码提示，`ctrl+f`搜索的时候，不知道该键入啥时就按下，经常给人惊喜。在windows下由于输入法无法使用这个快捷键，`ctrl+alt+s`打开设置键入 keymap，在Keymap中搜索basic可以找到并修改它

`ctrl+shift+f10`运行当前文件，十分智能，如果是测试代码，则以测试模式run，并列出测试通过情况

`ctrl+w`扩展选取和`ctrl+shift+w`缩减选区，根据当前层级一层一层向上伸展选中区域，例如value ->key:value -> dict -> ... ，每按一次就扩展一级，`ctrl+shift+w`用来取消上一次的扩展选取操作，注意后遗症，大部分软件中的`ctrl+w`是关闭！是`ctrl+shift+箭头`而不是`ctrl+w`

`ctrl+alt+shift+T`重构选区，可以将选区抽取成变量，方法等。不同的重构方式有不同的快捷键，比如将a.b.c中的a.b抽取出来，选中a.b，键入`ctrl+alt+v`可见效果

`ctrl+q`查注释

`ctrl+shift+i`没注释时查源码

`ctrl+p`调用方法时查看参数，在括号内按下，就知道当前位置该给啥参数，不过由于是Python，这里使用`ctrl+space`也可以达到很好的效果

`shift+enter`另起一行，光标在行内任意位置都能另起一行，且不破坏当行结构

`ctrl+alt+enter`向上另起一行

`ctrl+shift+数字键`与`ctrl+数字键`书签功能

`ctrl+shift+a`搜索IDE功能，比如想看看这个文件的历史，就键入history 可以找到 Local history

变量或表达式的最后键入`.(点)`，出现提示后，看最下面的部分有各种代码模板，例如现有变量a，在下一行键入 a.(点)print 然后键入`tab`，Python2会变成`print a`，Python3会变成`print(a)`，还有if,else等各种常用的代码模板

双击`shift`搜索一切，不管是IDE功能、文件、方法、变量……都能搜索

各个窗口下，无论是Project,Setting,Debugger...都可以直接键入想要搜索的内容，它会帮你高亮，键入`↑`或`↓`可切换匹配到的目标

整合的REPL，由于JetBrains的加成可以实现很多与编辑器内相同的效果

整合了Git，通过插件可以支持 Git flow，十分优秀的代码对比，merge时解决冲突很有帮助

Local history，文件夹，每个文件都有记录历史版本

整合了source code pro字体+Darcula Theme(暗色主题) ，眼不疼了

Tip of the day，总会给人带来一些有用的小功能 ，别嫌烦就给关了啊，写代码累了，Help > Tip of the day点开看看

固态硬盘，配合JetBrains碉堡的索引，虽然没什么关系


#l
