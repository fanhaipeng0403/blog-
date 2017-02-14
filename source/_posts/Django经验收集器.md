---
title: Django经验收集器_Pycharm
date: 2016-07-29 22:01:27
tags: Django

----
Django中文文档
http://python.usyiyi.cn/django_182/topics/auth/default.html

----
Django项目目录设计

http://www.loonapp.com/blog/11/
http://python.jobbole.com/81229/
https://github.com/pydanny/cookiecutter-django
http://www.cnblogs.com/276815076/p/5772475.html

----
app设计

每个app都是一个功能性模块
一个app有一个model.py文件, 一个model.py有一系列class ,每个class对应一个表

注意在设计app的model的时候,防止模块循环引用的发生

每个app有个migration子目录,同时项目数据库中名为django_migration的表,记录每个表的生产记录


每个app文件下有个apps.py文件,可以配置apps.py 的别名之类的

```
from django.apps import AppConfig

class OrganizationConfig(AppConfig):
    name = 'organization'
    verbose_name = u"课程机构"

同时也配置对应的__init__.py文件
default_app_config = "organization.apps.OrganizationConfig"
```

---

第三方插件查询

https://djangopackages.org/
https://github.com/rosarior/awesome-django
http://www.tuicool.com/articles/Iviayi
https://pypi.python.org/pypi?%3Aaction=search&term=django&submit=search

----
实时webscoket
http://www.tuicool.com/articles/JBZnYjB
ajax
http://www.ziqiangxuetang.com/django/django-ajax.html
第三方modefiled
https://django-model-utils.readthedocs.io/en/latest/fields.html#statusfield

----
manage.py 命令

[auth]
    changepassword
    createsuperuser

[captcha]
    captcha_clean

[django]
    compilemessages
    createcachetable
    dbshell
    ------
    diffsettings
    ------
    dumpdata
    flush
    inspectdb
    loaddata
    makemessages
    ------
   sendtestemail
    ------
    shell
    ------
    check
    makemigrations
    migrate
    showmigrations
    sqlflush
    sqlmigrate
    sqlsequencereset
    squashmigrations
    -------
    startapp
    startproject
    --------
    test
    testserver

[sessions]
    clearsessions

[staticfiles]
    collectstatic
    findstatic
    runserver

-------

Setting 设置

sys.path.extend([os.path.join(BASE_DIR, 'apps'), os.path.join(BASE_DIR, 'extra_apps')])

LANGUAGE_CODE = 'zh-hans'

USE_TZ = False
TIME_ZONE = 'Asia/Shanghai'

AUTH_USER_MODEL = "userprofile.UserProfile"
AUTHENTICATION_BACKENDS = ("userprofile.views.CustomBackend",)

STATICFILES_DIRS = (os.path.join(BASE_DIR, "static"),)
STATIC_URL = '/static/'

-------
后台
预使用admin管理,要在app里对应的admin.py文件中注册

例如注册Userprofile
```
from .models import UserProfile

class UserProfileAdmin(admin.ModelAdmin):
     pass

admin.site.register(UserProfile, UserProfileAdmin)
```

admin自动注册了一个叫--组--的表,对应于数据库里的auth_group

http://www.ziqiangxuetang.com/django/django-admin.html

--------
model的meta
class Meta 详解
http://www.ttwshell.com/article/Django-Model-Class-Meta.html

-------
视图

只是静态文件,不用处理后台逻辑,数据,可以直接用通用视图,如下

from django.views.generic import TemplateView
url(r'^$', TemplateView.as_view(template_name="index.html"), name="index"),

---------


```
<form action="/login/"  method="post">
First name:<br>
<input type="text" name="别名" value="Mickey">
<input type="submit" value="Submit">
</form>
```

url(r'^login/$', LoginView.as_view(), name="别名"),

post是一个字典,post.name=Mickey

html: {%url '别名' %}


-------

Form的action的值就是 urls.py文件中,form的view对应的url
action="/form" ,其中'go_form'是url中name的值

建议action的值灵活使用为
action="{% url 'go_form'%}" ,其中'go_form'是url中name的值

------
model的增删改查
http://coding.imooc.com/lesson/78.html#mid=1985

------

静态文件寻找路径出错:

Error fetching command 'collectstatic': You're using the staticfiles app without having set the STATIC_ROOT setting to a filesystem path. Command 'collectstatic' skipped

解决:
PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))
STATIC_ROOT = os.path.join(PROJECT_DIR, 'static')

https://docs.djangoproject.com/en/dev/ref/settings/#std:setting-STATIC_ROOT

-----
安装mysql-python时寻找mysql_config文件出错

解决:
sudo apt-get install libmysqld-dev
原来使用apt-get安装的MySQL是没有mysql_config这个文件的,不然安装pip install mysql-python会报错

-----

Ctrl alt + R 等效于 Python manage.py然后可以在shell里输入参数

startapp app_name : 创建应用

makemigrations: 基于当前的model创建新的迁移策略文件
(你的mmodel会被扫描, 然后与之前的版本作比较, 在app的migrations目录下生成本次迁移文件,注意migration是基于App的, 因此, 我们可以针对某些app不启用migration功能)

migrate: 用于执行迁移动作
(然后在就会根据你setting里的设置在数据库生产相应的数据表,有一部分django自带的功能需要的数据表)

sqlmigrate: 显示迁移的SQL语句

-------

使用Vcs
Vcs->Import into Version Control->Creative Git Repository
Alt + 9 使用
在.gitignore添加想不被控制的文件,如果不想被控制的不幸已经被提交 ,git rm --cached 

----
路径问题

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

__file__是setting.py

os.path.abspath(__file__):
/home/fanhaipeng/PycharmProjects/mook/mook/settings.py

os.path.dirname(os.path.abspath(__file__)):
/home/fanhaipeng/PycharmProjects/mook/mook

os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
/home/fanhaipeng/PycharmProjects/mook()

此时 BASE_DIR=/home/fanhaipeng/PycharmProjects/mook

-----
models类型

models->fields

__all__ = [str(x) for x in (
    'AutoField', 'BLANK_CHOICE_DASH', 'BigIntegerField', 'BinaryField',
    'BooleanField', 'CharField', 'CommaSeparatedIntegerField', 'DateField',
    'DateTimeField', 'DecimalField', 'DurationField', 'EmailField', 'Empty',
    'Field', 'FieldDoesNotExist', 'FilePathField', 'FloatField',
    'GenericIPAddressField', 'IPAddressField', 'IntegerField', 'NOT_PROVIDED',
    'NullBooleanField', 'PositiveIntegerField', 'PositiveSmallIntegerField',
    'SlugField', 'SmallIntegerField', 'TextField', 'TimeField', 'URLField',
    'UUIDField',
)]


CharFie(max_length=20,null=True,blank=True,default='')字段可以为空,默认值为''

object_id=models.CharField(max_length=50,primary_key=True,verbose_name=u'主键')不指定也会自动生成


model层元信息
    class Meta:
        verbose_name = u"用户留言信息"      #别名
        db_table = "user_message"           # 表名
        ordering="-oject_id"                #排序
        verbose_name_plural=verbose_name    #别名复数

-----

python中 from . import ×××的那个点是表示当前包吗？
在看requests源码时看到api模块第一句是from . import sessions，是不是导入当前包的模块？不懂什么意思，没百度到。新手，请大神们指教，谢谢


我的理解是 from . import XXX默认的就是在当前程序所在文件夹里__init__.py程序中导入XXX，如果当前程序所在文件夹里没有__init__.py文件的话，就不能这样写，而应该写成from .A import XXX，A是指当前文件夹下你想导入的函数(或者其他的)的python程序名，如果你想导入的函数不在当前文件夹，那么就有可能用到 from .. import XXX(即上一个文件夹中的__init__.py)，或者from ..A import XXX(即上一个文件夹中的文件A)

http://blog.csdn.net/u010278162/article/details/52043308

------

当运行Python manage runserver 时,如果出现no module xxx 时,考虑是否是搜索路径问题,可添加环境路径sys.path
同时在pycharm里可以直接设置所在文件夹为source root

------
当修改处于git管理的下的文件,点击代码页面左侧蓝色线条,可以实时比较文件代码和head指针对应的库的代码区别

-----

setting-editor-smartkey 可以设置surround with 自动在单词两侧输入引号等

---

