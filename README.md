# 个人搭建的SSM技术学习博客
搭建SSM开始从0到分布式架构学习博客（计划中）
## 前言
使用Eclipse搭建的Maven项目，这是个没有复杂的业务流程，更不是XXXX系统，只有一些技术学习的分享的小东西。如果有BUG地方，那是你不会用(请给予指正)，并且多多包涵
。如果觉得写的好的地方就给个Star，写的不好的地方，也请多多包涵。
这个博客已经在两台服务器跑起来了，有兴趣的可以前往博客地址：[119.29.112.39](http://119.29.112.39)
## 项目介绍
基于Spring+SpringMVC+Mybatis+Shiro+Redis集群实现单点登录、单用户登录控制博客Demo
## 技术选型
|技术|名称|官网|
|:---|:---|:---|
|Spring Framework|容器|[http://projects.spring.io/spring-framework/](http://projects.spring.io/spring-framework/)|
|SpringMVC|MVC框架|[http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc)|
|Apache Shiro|安全框架|[http://shiro.apache.org/](http://shiro.apache.org/)|
|MyBatis|ORM框架|[http://www.mybatis.org/mybatis-3/zh/index.html](http://www.mybatis.org/mybatis-3/zh/index.html)|
|PageHelper|MyBatis物理分页插件|[http://git.oschina.net/free/Mybatis_PageHelper](http://git.oschina.net/free/Mybatis_PageHelper)|
|Druid|Alibaba数据库连接池|[http://git.oschina.net/free/Mybatis_PageHelper](http://git.oschina.net/free/Mybatis_PageHelper)|
|Redis|分布式缓存数据库|[https://redis.io/](https://redis.io/)|
|Maven|项目构建管理|[http://maven.apache.org/](http://maven.apache.org/)|
|Log4J|日志组件|[http://logging.apache.org/log4j/1.2/](http://logging.apache.org/log4j/1.2/)|
## 快照
![首页](https://github.com/Beloya/SSM/blob/master/%E9%A1%B9%E7%9B%AE/%E9%A6%96%E9%A1%B5.png)
![文章](https://github.com/Beloya/SSM/blob/master/%E9%A1%B9%E7%9B%AE/%E8%AF%A6%E6%83%85.png)
## 环境搭建
### 开发工具:
* MySql: 数据库
* Tomcat：开发服务器
* SVN|Git: 版本管理
* Nginx: 反向代理服务器
* Eclipse：开发IDE
### 开发环境：
* Jdk-1.8
* Mysql-5.6
* Redis-4
* Maven-3.2.2
* Tomcat 8
## 开发指南:
* 1、本机安装Jdk8、Mysql、Redis、Maven、Tomcat 8并启动相关服务.
* 2、克隆源代码到本地并打开，推荐使用Eclipse，本地编译并安装到本地maven仓库
* 3、导入项目目录下的SQL
## 编译流程
maven编译安装pom.xml文件即可
