---
title: requirements.txt文件
tags: Python

---

Python项目中必须包含一个 requirements.txt 文件，用于记录所有依赖包及其精确的版本号。以便新环境部署。

在虚拟环境中使用pip生成：

```
(venv) $ pip freeze >requirements.txt
```
安装或升级包后，最好更新这个文件。


当需要创建这个虚拟环境的完全副本，可以创建一个新的虚拟环境，并在其上运行以下命令：

```
(venv) $ pip install -r requirements.txt
```


其他工具可以尝试pigar,pipreqs
