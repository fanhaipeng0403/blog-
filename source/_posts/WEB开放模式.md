---
title: WEB设计模式
date: 2016-08-03 22:24:59
tags:
categories: Others

---

# 前言

在想弄懂这些名词的过程中，看了很多文章，觉得在将MVC时，应该先注意到：

```
今天无数经过演绎的MVC实现（如backbone）和科普文，要么是原本作者概念已经很混乱，掺杂私货，要么为了适配现代的标记语言和控件模式，自己修改了经典MVC中的一些概念和耦合关系。实际上今天MVC已经没法作为一种交流的标准词汇了。`
```

```
MVC在bs架构和cs架构上差别很大，即使同是bs，因为使用的技术的差别，业务的差别，架构的差别，MVC的通信方式也会和原来你书本上看到的不一样。就像backbonejs和angularjs的出现，是发明还是延伸，还是糟蹋？每天和它一起工作的人才知道。
所有的设计应该以贴近自然或接近自然规律为目标。再通俗的讲，用的舒服就是自然。好的东西绝对不需要强记一堆原理来理解的。
```

个人觉得，MVC是更多的是在一种思想上去理解。而不是一种标准。


##  MVC和MVVC图解
![](https://camo.githubusercontent.com/2a09625439c430f360a770c80702f8df2c996156/687474703a2f2f7777332e73696e61696d672e636e2f6d773639302f34373465626633357477316476716e77786338746b6a2e6a7067?_=4285171)

##  REST精要

REST

a，出身：由Roy Thomas Fielding博士于2000年提出

b，全称：Representational state Transfer,称为表象化状态转变，或者表述性状态转移

c，REST是Web服务的一种架构风格

d，使用HTTP、URI等广泛流行的标准和协议

e，轻量级、跨平台、跨语言的架构设计

那么，从上面5点总结来看，REST到底是个什么鬼呢？好了，下面要注意了，重点来了：**REST是一种设计风格，它既不是一种标准，也不是一种软件，而是一种思想。它通常使用HTTP、URI和XML、json以及HTML这些现有的流行的协议和标准**

## REST架构的主要原则

a，网络上的所有资源都可以被抽象为资源（Resource）

b，每个资源都有一个唯一的资源标识符（Resource identifier）

c，同一资源具有多种表现形式，例如xml，json

d，对资源的各种操作不会改变资源的标识符

e，所有的操作都是无状态的（stateless）[无状态：HTTP是无状态协议。无状态是指协议对于事务处理没有记忆能力，如果后续需要前面的信息，则它必须重传，这样可能导致每次连接传送的数据量增大]

f，符合REST原则的架构方式均可被称为RESTful

## REST对资源的操作


-GET：表示获取一个资源

-POST：表示创建一个新的资源

-PUT：表示修改一个资源的状态

-DELETE：表示删除一个资源

资源展现：-XML    -JSON

## RESTful

a，RESTful对应中文是REST式的

b，RESTful WebService 是一种常见的REST的应用，是遵守REST风格以及Web风格的Web服务

c，REST式的Web服务是一种ROA（(Resource-Oriented Architecture，面向资源架构）


```
虽然REST开发方式很好，但直到现在为止，MVC(Model-View-Controller) 模式依然是Web开发最普遍的模式，绝大多数的公司和开发人员都采取此种架构来开发Web应用，并且其思维方式也停留于此。MVC模式由数据，视图和控制 器构成，通过事件(Event)触发Controller来改变Model和View。加上Webwork,Struts等开源框架的加入，MVC开发模 式已经相当成熟，其思想根本就是基于Action来驱动。从开发人员角度上来说，贸然接受一个新的架构会带来风险，其中的不确定因素太多。并且REST新 的思维方式是把所有用户需求抽象为资源，这在实际开发中是比较难做到的，因为并不是所有的用户需求都能被抽象为资源，这样也就是说不是整个系统的结构都能 通过REST的来表现。所以在开发中，我们需要根据以上2点来在REST和MVC中做出选择。我们认为比较好的办法是混用REST和MVC，因为这适合绝 大多数的Web应用开发，开发人员只需要对比较容易能够抽象为资源的用户需求采取REST的开发模式，而对其它需求采取MVC开发即可。这里需要提到的就 是ROR(Ruby on Rails)框架，这是一个基于Ruby语言的越来越流行的Web开发框架，它极大的提高了Web开发的速度。更为重要的是，ROR(从1.2版本起)框 架是第一个引入REST做为核心思想的Web开发框架，它提供了对REST最好的支持，也是当今最成功的应用REST的Web开发框架。实际上，ROR的 REST实现就是REST和MVC混用，开发人员采用ROR框架，可以更快更好的构建Web应用。
```

个人理解，MCV是从过程解决问题的一种思维，RESRFUL是一种从资源对象方面解决的问题的思维

个人理解，MCV是从过程解决问题的一种思维，RESRFUL是一种从资源对象方面解决的问题的思维。

# Webhook

        webhook（也被称为网络回调或HTTP推送API）被视为一个应用为其他应用提供实时信息的一种方法。当webhook被触发后，它将传送数据到其他应用程序中去，这就意味着你会立即获取到数据。
        webhook通过一台服务器的工作，在有事发生时，发送到特定的URL数据，到另一台服务器。
        就像一个钩子一样连接着其他程序。

        ![](https://segmentfault.com/img/remote/1460000006971575?w=550&h=400)

## webhooks模式的主要优点

        无需周期性地调用APIs。相反，当一些有趣的事情发生之后，APIs将通过特定端点通知的方式来访问你的应用。现在缺少的是一种以编程方式告诉APIs你所感兴趣的接收呼叫和注册端点。

        这里有一个常见的例子：你到github上。有一个用于他们代码POST请求webhook的文本框。你输入一个URL。现在当你上传你的代码到github上时，github将会通过HTTP POST的方法请求你所选择的包含详细信息的URL。没有更简单的方法以便与任意Web服务进行开放式集成


        http://jnn.iteye.com/blog/83095
http://www.cnblogs.com/hoojo/p/longPolling_comet_jquery_iframe_ajax.html
http://stackoverflow.com/questions/23172760/differences-between-webhook-and-websocket



目前要实现消息实时推送，有两种方法，一种是ajax轮询，由客户端不停地请求服务器端，查询有没有新消息，然后再由服务器返回结果；另外一种就是long poll,通过一次请求，询问服务器有没有新消息更新，如果没有新消息时，会保持长连接，就一直不返回Response给客户端。直到有消息才返回，返回完之后，客户端再次建立连接，周而复始。这两种都是单向链接，需要被动的请求服务器，而不是由服务器自动发给客户端。

从上面可以看出其实这两种方式，都是在不断地建立HTTP连接，然后等待服务端处理，可以体现HTTP协议的另外一个特点，被动性。
何为被动性呢，其实就是，服务端不能主动联系客户端，只能有客户端发起。
简单地说就是，服务器是一个很懒的冰箱（这是个梗）（不会、不能主动发起连接），但是上司有命令，如果有客户来，不管多么累都要好好接待。

你想去ATM机取钱，但是银行卡没钱了，你找你老爹求救，你把老爹说马上打给你

# Ajax轮询


办法：因为你着急用啊，去ATM插卡，输入密码，看你的卡有没有钱，觉得你老爹的钱该到了，你又插卡输入密码，看有没有钱。


ATM机相当于Nginx，处理你的请求
你老爹相当于handler
插卡，输入密码，每次都要重新验证，可以看成HTTP，而且是无记忆性的。


缺点: 你要反复的插卡，需要很高的处理速度，才能不耽误你花钱


# long poll

办法：你的卡插着ATM机器，一直保持等着钱来

采用阻塞模型，HTTP不断

缺点: 营业厅ATM就那几台，不占这位置，浪费资源

# webhook



C/S=Client/Server
B/S=Browser/Server
一个基于客户端/服务器，一个基于浏览器/服务器

# 开发模式非常好的文章

http://blog.csdn.net/shaobingj126/article/details/49420145
http://www.ruanyifeng.com/blog/2015/02/mvcmvp_mvvm.html
http://www.cnblogs.com/winter-cn/p/4285171.html


