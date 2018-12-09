CREATE DATABASE  IF NOT EXISTS `myblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `myblog`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archiveflag`
--

DROP TABLE IF EXISTS `archiveflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `archiveflag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AID` int(11) NOT NULL COMMENT '文章ID',
  `FID` int(11) NOT NULL COMMENT '标签ID',
  `REVISION` int(11) DEFAULT NULL COMMENT '乐观锁',
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `CREATED_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATED_BY` int(11) DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=2340;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archiveflag`
--

LOCK TABLES `archiveflag` WRITE;
/*!40000 ALTER TABLE `archiveflag` DISABLE KEYS */;
INSERT INTO `archiveflag` VALUES (1,1,1,NULL,'Beloya','2018-07-07 01:51:54',NULL,NULL),(2,1,2,NULL,'Beloya','2018-07-07 01:51:54',NULL,NULL),(3,1,1,NULL,'Beloya','2018-07-07 07:29:29',NULL,NULL),(4,1,2,NULL,'Beloya','2018-07-07 07:29:29',NULL,NULL),(5,1,1,NULL,'Beloya','2018-07-07 07:32:20',NULL,NULL),(6,1,2,NULL,'Beloya','2018-07-07 07:32:20',NULL,NULL),(7,1,3,NULL,'Beloya','2018-07-07 07:32:20',NULL,NULL);
/*!40000 ALTER TABLE `archiveflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS `archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `archives` (
  `AID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键;自增',
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `Type` int(11) NOT NULL COMMENT '类型',
  `CREATED_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `CREATED_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `Status` int(11) NOT NULL COMMENT '状态;1审核||0正常||-1失效',
  `ReadCount` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `Flag` int(11) DEFAULT '0' COMMENT '标签;外键',
  `VID` int(11) NOT NULL COMMENT '可见性;外键',
  PRIMARY KEY (`AID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=32768;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
INSERT INTO `archives` VALUES (1,'搭建自己博客，采用SSM框架(一)配置文件篇','<p>一直想建一个属于自己的博客记录学习过程，但之前苦于学生党没钱买服务器<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/pcmoren_wu_org.png\" alt=\"[污]\"></p><p>由于博客还没建好，就只能在这记录下过程以及踩到的坑。</p><p>反正没人看</p><p><img src=\"https://diygod.me/images/havefun.jpg\" alt=\"\" layer-index=\"1\"></p><p>这次打算用Spring+SpringMvc+Mybaits+Redis+Shrio搭配来制作自己的博客</p><h3><u>首先是Maven的POM依赖包配置</u></h3><div><pre><code>&lt;project xmlns=\"http://maven.apache.org/POM/4.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\"&gt;<br>  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;<br>  &lt;groupId&gt;com.MyBlog1&lt;/groupId&gt;<br>  &lt;artifactId&gt;MyBlog1&lt;/artifactId&gt;<br>  &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;<br>  &lt;packaging&gt;war&lt;/packaging&gt;<br>  &lt;dependencies&gt;  <br>  &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-core&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-beans&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-context&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>     &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-context-support&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>			&lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>			&lt;artifactId&gt;spring-test&lt;/artifactId&gt;<br>			&lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>		&lt;/dependency&gt;<br>&lt;!-- 2.Spring dao依赖 --&gt;<br>&lt;!-- spring-jdbc包括了一些如jdbcTemplate的工具类 --&gt;<br>    &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-tx&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;!-- 3.Spring web依赖 --&gt;<br>    &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-web&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br><br>    &lt;!-- 4.Spring test依赖：方便做单元测试和集成测试 --&gt;<br> &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-expression&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>     &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-aop&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br>      &lt;dependency&gt;<br>        &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br>        &lt;artifactId&gt;spring-aspects&lt;/artifactId&gt;<br>        &lt;version&gt;5.0.0.RELEASE&lt;/version&gt;<br>    &lt;/dependency&gt;<br><br>    <br>    &lt;!-- Mybaits --&gt;<br>&lt;dependency&gt;<br>  &lt;groupId&gt;org.mybatis&lt;/groupId&gt;<br>  &lt;artifactId&gt;mybatis&lt;/artifactId&gt;<br>  &lt;version&gt;3.4.2&lt;/version&gt;<br>&lt;/dependency&gt;<br>    &lt;dependency&gt;<br>    &lt;groupId&gt;org.mybatis&lt;/groupId&gt;<br>    &lt;artifactId&gt;mybatis-spring&lt;/artifactId&gt;<br>    &lt;version&gt;1.3.2&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;!-- MyBaits分页插件 --&gt;<br>&lt;dependency&gt;<br>    &lt;groupId&gt;com.github.pagehelper&lt;/groupId&gt;<br>    &lt;artifactId&gt;pagehelper&lt;/artifactId&gt;<br>    &lt;version&gt;5.1.4&lt;/version&gt;<br>&lt;/dependency&gt;<br>  &lt;!-- MySQL --&gt;<br>	&lt;dependency&gt;<br>    &lt;groupId&gt;mysql&lt;/groupId&gt;<br>    &lt;artifactId&gt;mysql-connector-java&lt;/artifactId&gt;<br>    &lt;version&gt;8.0.11&lt;/version&gt;<br>&lt;/dependency&gt;<br>  &lt;!-- commons 连接池 --&gt;<br>	&lt;dependency&gt;<br>			&lt;groupId&gt;commons-dbcp&lt;/groupId&gt;<br>			&lt;artifactId&gt;commons-dbcp&lt;/artifactId&gt;<br>			&lt;version&gt;1.2.2&lt;/version&gt;<br>		&lt;/dependency&gt;		<br>			&lt;dependency&gt;<br>    &lt;groupId&gt;commons-pool&lt;/groupId&gt;<br>    &lt;artifactId&gt;commons-pool&lt;/artifactId&gt;<br>    &lt;version&gt;1.3&lt;/version&gt;<br>&lt;/dependency&gt;<br><br>&lt;!--urlrewritefilter --&gt;<br>&lt;dependency&gt;<br>    &lt;groupId&gt;org.tuckey&lt;/groupId&gt;<br>    &lt;artifactId&gt;urlrewritefilter&lt;/artifactId&gt;<br>    &lt;version&gt;4.0.4&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;!--junit单元测试 --&gt;<br>		&lt;dependency&gt;<br>			&lt;groupId&gt;junit&lt;/groupId&gt;<br>			&lt;artifactId&gt;junit&lt;/artifactId&gt;<br>			&lt;version&gt;4.11&lt;/version&gt;<br>			&lt;!-- 表示开发的时候引入，发布的时候不会加载此包 --&gt;<br>			&lt;scope&gt;test&lt;/scope&gt;<br>		&lt;/dependency&gt;<br>		&lt;!--junit单元测试 --&gt;<br>	<br><br><br>&lt;dependency&gt;<br>			&lt;groupId&gt;javax&lt;/groupId&gt;<br>			&lt;artifactId&gt;javaee-api&lt;/artifactId&gt;<br>			&lt;version&gt;7.0&lt;/version&gt;<br>		&lt;/dependency&gt;<br>	&lt;dependency&gt;<br>    &lt;groupId&gt;jstl&lt;/groupId&gt;<br>    &lt;artifactId&gt;jstl&lt;/artifactId&gt;<br>    &lt;version&gt;1.2&lt;/version&gt;<br>&lt;/dependency&gt;<br>		&lt;!-- 日志 --&gt;<br>		&lt;dependency&gt;<br>			&lt;groupId&gt;log4j&lt;/groupId&gt;<br>			&lt;artifactId&gt;log4j&lt;/artifactId&gt;<br>			&lt;version&gt;1.2.16&lt;/version&gt;<br>		&lt;/dependency&gt;<br>		&lt;dependency&gt;<br>    &lt;groupId&gt;org.slf4j&lt;/groupId&gt;<br>    &lt;artifactId&gt;slf4j-api&lt;/artifactId&gt;<br>    &lt;version&gt;1.8.0-beta2&lt;/version&gt;<br>&lt;/dependency&gt;<br><br>		&lt;dependency&gt;<br>			&lt;groupId&gt;commons-fileupload&lt;/groupId&gt;<br>			&lt;artifactId&gt;commons-fileupload&lt;/artifactId&gt;<br>			&lt;version&gt;1.3.1&lt;/version&gt;<br>		&lt;/dependency&gt;<br>		&lt;dependency&gt;<br>			&lt;groupId&gt;commons-io&lt;/groupId&gt;<br>			&lt;artifactId&gt;commons-io&lt;/artifactId&gt;<br>			&lt;version&gt;2.4&lt;/version&gt;<br>		&lt;/dependency&gt;<br>		&lt;dependency&gt; <br>			&lt;groupId&gt;commons-codec&lt;/groupId&gt;<br>			&lt;artifactId&gt;commons-codec&lt;/artifactId&gt;<br>			&lt;version&gt;1.9&lt;/version&gt;<br>		&lt;/dependency&gt;<br>		    &lt;dependency&gt;<br>		    &lt;!-- json --&gt;<br>    &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;<br>    &lt;artifactId&gt;jackson-core&lt;/artifactId&gt;<br>    &lt;version&gt;2.9.4&lt;/version&gt;<br>    &lt;/dependency&gt;<br>	 &lt;dependency&gt;<br>    &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;<br>    &lt;artifactId&gt;jackson-databind&lt;/artifactId&gt;<br>    &lt;version&gt;2.9.4&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>    &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;<br>    &lt;artifactId&gt;jackson-annotations&lt;/artifactId&gt;<br>    &lt;version&gt;2.9.4&lt;/version&gt;<br>    &lt;/dependency&gt;<br>    &lt;dependency&gt;<br>			&lt;groupId&gt;org.codehaus.jackson&lt;/groupId&gt;<br>			&lt;artifactId&gt;jackson-mapper-asl&lt;/artifactId&gt;<br>			&lt;version&gt;1.9.4&lt;/version&gt;<br>		&lt;/dependency&gt;<br>		&lt;dependency&gt;<br>			&lt;groupId&gt;com.alibaba&lt;/groupId&gt;<br>			&lt;artifactId&gt;fastjson&lt;/artifactId&gt;<br>			&lt;version&gt;1.1.41&lt;/version&gt;<br>		&lt;/dependency&gt;<br>		&lt;!-- Redis缓存 --&gt;<br>		&lt;dependency&gt;<br>    &lt;groupId&gt;redis.clients&lt;/groupId&gt;<br>    &lt;artifactId&gt;jedis&lt;/artifactId&gt;<br>    &lt;version&gt;2.9.0&lt;/version&gt;<br>&lt;/dependency&gt;<br>		&lt;dependency&gt;<br>    &lt;groupId&gt;org.mybatis&lt;/groupId&gt;<br>    &lt;artifactId&gt;mybatis-ehcache&lt;/artifactId&gt;<br>    &lt;version&gt;1.0.0&lt;/version&gt;<br>&lt;/dependency&gt;<br><br>&lt;dependency&gt;<br>    &lt;groupId&gt;org.springframework.data&lt;/groupId&gt;<br>    &lt;artifactId&gt;spring-&gt;    &lt;version&gt;2.0.7.RELEASE&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;!--shrio权限管理框架  --&gt;<br>&lt;dependency&gt;<br>    &lt;groupId&gt;org.apache.shiro&lt;/groupId&gt;<br>    &lt;artifactId&gt;shiro-core&lt;/artifactId&gt;<br>    &lt;version&gt;1.4.0&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;dependency&gt;<br>    &lt;groupId&gt;org.apache.shiro&lt;/groupId&gt;<br>    &lt;artifactId&gt;shiro-web&lt;/artifactId&gt;<br>    &lt;version&gt;1.4.0&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;dependency&gt;<br>    &lt;groupId&gt;org.apache.shiro&lt;/groupId&gt;<br>    &lt;artifactId&gt;shiro-spring&lt;/artifactId&gt;<br>    &lt;version&gt;1.4.0&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;dependency&gt;<br>    &lt;groupId&gt;org.apache.shiro&lt;/groupId&gt;<br>    &lt;artifactId&gt;shiro-ehcache&lt;/artifactId&gt;<br>    &lt;version&gt;1.4.0&lt;/version&gt;<br>&lt;/dependency&gt;<br>&lt;/dependencies&gt;<br>&lt;/project&gt;\n</code></pre><h2>再过来是Web配置</h2></div><div><pre><code>&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;<br>&lt;web-app xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://java.sun.com/xml/ns/javaee\" xsi:schemaLocation=\"http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd\" id=\"WebApp_ID\" version=\"3.0\"&gt;<br>    <br> &lt;context-param&gt;<br>     &lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;<br>     &lt;param-value&gt;classpath:Spring-*.xml&lt;/param-value&gt;<br> &lt;/context-param&gt;<br>   &lt;context-param&gt;<br>    &lt;param-name&gt;log4jConfigLocation&lt;/param-name&gt;<br>    &lt;param-value&gt;classpath:/log4j.properties&lt;/param-value&gt;<br>  &lt;/context-param&gt;<br>    &lt;context-param&gt;<br>    &lt;param-name&gt;log4jRefreshInterval&lt;/param-name&gt;<br>    &lt;param-value&gt;60000&lt;/param-value&gt;<br>  &lt;/context-param&gt;<br><br>    &lt;session-config&gt; <br>&lt;!-- Disables URL-based sessions (no more \'jsessionid\' in the URL using Tomcat) --&gt;<br>&lt;tracking-mode&gt;COOKIE&lt;/tracking-mode&gt;<br>&lt;/session-config&gt;<br>    <br>     &lt;!-- 编码过滤器 --&gt;<br>    	&lt;filter&gt;<br>		&lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;<br>		&lt;filter-class&gt;org.springframework.web.filter.CharacterEncodingFilter&lt;/filter-class&gt;<br>		&lt;async-supported&gt;true&lt;/async-supported&gt;<br>		&lt;init-param&gt;<br>			&lt;param-name&gt;encoding&lt;/param-name&gt;<br>			&lt;param-value&gt;UTF-8&lt;/param-value&gt;<br>		&lt;/init-param&gt;<br>	&lt;/filter&gt;<br>	&lt;filter-mapping&gt;<br>		&lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;<br>		&lt;url-pattern&gt;/*&lt;/url-pattern&gt;<br>	&lt;/filter-mapping&gt;<br>  &lt;!-- shrio过滤器 --&gt;<br>	  &lt;filter&gt;  <br>      &lt;description&gt;shiro 权限拦截&lt;/description&gt;  <br>      &lt;filter-name&gt;shiroFilter&lt;/filter-name&gt;  <br>      &lt;filter-class&gt;org.springframework.web.filter.DelegatingFilterProxy&lt;/filter-class&gt;  <br>      &lt;init-param&gt;  <br>          &lt;param-name&gt;targetFilterLifecycle&lt;/param-name&gt;  <br>          &lt;param-value&gt;true&lt;/param-value&gt;  <br>      &lt;/init-param&gt;  <br>      &lt;/filter&gt;  <br>      &lt;filter-mapping&gt;  <br>          &lt;filter-name&gt;shiroFilter&lt;/filter-name&gt;  <br>          &lt;url-pattern&gt;/*&lt;/url-pattern&gt;  <br>             <br>      &lt;/filter-mapping&gt;  <br>      <br>      <br>     	&lt;!-- Spring MVC servlet --&gt;<br>	 	&lt;servlet&gt;<br>		&lt;servlet-name&gt;SpringMVC&lt;/servlet-name&gt;<br>		&lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;<br>		&lt;init-param&gt;<br>			&lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;<br>			&lt;param-value&gt;classpath:SpringMvc.xml&lt;/param-value&gt;<br>		&lt;/init-param&gt;<br>		&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;<br>		&lt;async-supported&gt;true&lt;/async-supported&gt;<br>	&lt;/servlet&gt;<br>	<br>	&lt;servlet-mapping&gt;<br>		&lt;servlet-name&gt;SpringMVC&lt;/servlet-name&gt;<br>		&lt;!-- 此处可以可以配置成*.do，对应struts的后缀习惯 --&gt;<br>		&lt;url-pattern&gt;*.do&lt;/url-pattern&gt;<br>	&lt;/servlet-mapping&gt;<br> <br>      <br> &lt;!-- 地址重写过滤器 --&gt;<br> &lt;filter&gt;  <br>        &lt;filter-name&gt;UrlRewriteFilter&lt;/filter-name&gt;  <br>        &lt;filter-class&gt;org.tuckey.web.filters.urlrewrite.UrlRewriteFilter&lt;/filter-class&gt;  <br>        &lt;init-param&gt;  <br>            &lt;param-name&gt;confReloadCheckInterval&lt;/param-name&gt;  <br>            &lt;param-value&gt;500000&lt;/param-value&gt;  <br>        &lt;/init-param&gt;  <br>        &lt;init-param&gt;  <br>                &lt;param-name&gt;logLevel&lt;/param-name&gt;  <br>                &lt;param-value&gt;sysout:ERROR&lt;/param-value&gt;  <br>        &lt;/init-param&gt;  <br>    &lt;/filter&gt;   <br>    &lt;filter-mapping&gt;  <br>        &lt;filter-name&gt;UrlRewriteFilter&lt;/filter-name&gt;  <br>        &lt;url-pattern&gt;/*&lt;/url-pattern&gt;  <br>    &lt;/filter-mapping&gt;  <br>    <br><br>	  <br>	&lt;!-- Spring监听器 --&gt;<br>	&lt;listener&gt;<br>		&lt;listener-class&gt;org.springframework.web.context.ContextLoaderListener&lt;/listener-class&gt;<br>	&lt;/listener&gt;<br>	&lt;!-- 防止Spring内存溢出监听器 --&gt;<br>	&lt;listener&gt;<br>		&lt;listener-class&gt;org.springframework.web.util.IntrospectorCleanupListener&lt;/listener-class&gt;<br>		<br>	&lt;/listener&gt;<br><br>	&lt;welcome-file-list&gt;<br>		&lt;welcome-file&gt;/index.do&lt;/welcome-file&gt;<br>	&lt;/welcome-file-list&gt;<br>		 &lt;!--jsp-config&gt;  <br>    &lt;jsp-property-group&gt;  <br>        &lt;description&gt;html encoding&lt;/description&gt;  <br>        &lt;display-name&gt;JSPConfiguration&lt;/display-name&gt;  <br>        &lt;url-pattern&gt;*.html&lt;/url-pattern&gt;  <br>        &lt;el-ignored&gt;true&lt;/el-ignored&gt;  <br>        &lt;page-encoding&gt;UTF-8&lt;/page-encoding&gt;  <br>        &lt;scripting-invalid&gt;false&lt;/scripting-invalid&gt;  <br>        &lt;include-prelude&gt;&lt;/include-prelude&gt;  <br>        &lt;include-coda&gt;&lt;/include-coda&gt;  <br>    &lt;/jsp-property-group&gt;  <br>&lt;/jsp-config--&gt;  <br>&lt;/web-app&gt;</code></pre><p><i>Shrio过滤器最好放在编码过滤器后面，就是处理好字符集就是Shrio过滤器(建议放在其他过滤器前面，之前就是没注意过配置文件顺序进坑了。捣鼓了半天<img src=\"http://111.231.215.38/FriendChat/plugins/layui/images/face/29.gif\" alt=\"[拜拜]\" layer-index=\"2\">)。</i></p><h2><b>Spring配置</b></h2></div><div><pre><code>&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;<br>&lt;beans xmlns=\"http://www.springframework.org/schema/beans\"<br>	xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:p=\"http://www.springframework.org/schema/p\"<br>	xmlns:context=\"http://www.springframework.org/schema/context\"<br>	xmlns:mvc=\"http://www.springframework.org/schema/mvc\" xmlns:cache=\"http://www.springframework.org/schema/cache\"<br>	xmlns:tx=\"http://www.springframework.org/schema/tx\"<br>	xsi:schemaLocation=\"http://www.springframework.org/schema/beans  <br>		http://www.springframework.org/schema/beans/spring-beans-4.3.xsd<br>		http://www.springframework.org/schema/context<br>	http://www.springframework.org/schema/context/spring-context-4.3.xsd<br>	http://www.springframework.org/schema/tx<br>		http://www.springframework.org/schema/tx/spring-tx-4.3.xsd <br>		 http://www.springframework.org/schema/cache<br>        http://www.springframework.org/schema/cache/spring-cache.xsd\"&gt;<br><br>	&lt;context:component-scan base-package=\"com.MyBlog.Service\" /&gt;<br>	 &lt;context:component-scan base-package=\"com.MyBlog.ServiceImpl\"/&gt; <br>	&lt;!-- 数据配置 --&gt;<br>	&lt;bean id=\"propertyConfigurer\"<br>	&gt;<br>		&lt;property name=\"locations\"&gt;<br>			&lt;list&gt;<br>				&lt;value&gt;classpath:jdbc.properties&lt;/value&gt;<br>				&lt;value&gt;classpath:redis.properties&lt;/value&gt;<br>			&lt;/list&gt;<br>		&lt;/property&gt;<br>	&lt;/bean&gt;<br>	&lt;bean id=\"dataSource\"<br>		destroy-method=\"close\"&gt;<br>		&lt;property name=\"driverClassName\" value=\"${driver}\" /&gt;<br>		&lt;property name=\"url\" value=\"${url}\" /&gt;<br>		&lt;property name=\"username\" value=\"${username}\" /&gt;<br>		&lt;property name=\"password\" value=\"${password}\" /&gt;<br>		&lt;!-- 初始化连接大小 --&gt;<br>		&lt;property name=\"initialSize\" value=\"${initialSize}\"&gt;&lt;/property&gt;<br>		&lt;!-- 连接池最大数量 --&gt;<br>		&lt;property name=\"maxActive\" value=\"${maxActive}\"&gt;&lt;/property&gt;<br>		&lt;!-- 连接池最大空闲 --&gt;<br>		&lt;property name=\"maxIdle\" value=\"${maxIdle}\"&gt;&lt;/property&gt;<br>		&lt;!-- 连接池最小空闲 --&gt;<br>		&lt;property name=\"minIdle\" value=\"${minIdle}\"&gt;&lt;/property&gt;<br>		&lt;!-- 获取连接最大等待时间 --&gt;<br>		&lt;property name=\"maxWait\" value=\"${maxWait}\"&gt;&lt;/property&gt;<br>	&lt;/bean&gt;<br>	&lt;!-- bean id=\"sqlSessionFactory\"&gt; <br>		&lt;property name=\"dataSource\" ref=\"dataSource\" /&gt; &lt;property name=\"mapperLocations\" <br>		value=\"classpath:com/MyBlog/Mapping/*.xml\"&gt;&lt;/property&gt; &lt;/bean --&gt;<br>	&lt;bean id=\"sqlSessionFactory\"&gt;<br>		&lt;property name=\"dataSource\" ref=\"dataSource\" /&gt;<br><br>		&lt;property name=\"configLocation\" value=\"classpath:mybatis-config.xml\" /&gt;<br><br>	&lt;/bean&gt;<br>	&lt;bean&gt;<br>		&lt;property name=\"basePackage\" value=\"com.MyBlog.Dao\" /&gt;<br>		&lt;property name=\"sqlSessionFactoryBeanName\" value=\"sqlSessionFactory\"&gt;&lt;/property&gt;<br><br>	&lt;/bean&gt;<br>	&lt;tx:advice id=\"txAdvice\" transaction-manager=\"txManager\"&gt;<br>		&lt;!-- 事务传播属性 --&gt;<br>		&lt;tx:attributes&gt;<br>			&lt;!-- 所有已get、query、select开头的方法都是只读 --&gt;<br>			&lt;tx:method name=\"get*\" read-only=\"true\" /&gt;<br>			&lt;tx:method name=\"query*\" read-only=\"true\" /&gt;<br>			&lt;tx:method name=\"select*\" read-only=\"true\" /&gt;<br>			&lt;!-- 其它的所有方法支持事务设置的属性（异常回滚） --&gt;<br>			&lt;tx:method name=\"*\" rollback-for=\"java.lang.Throwing\" /&gt;<br>		&lt;/tx:attributes&gt;<br>	&lt;/tx:advice&gt;<br><br>	&lt;bean id=\"txManager\"<br>	&gt;<br>		&lt;property name=\"dataSource\" ref=\"dataSource\"&gt;&lt;/property&gt;<br>	&lt;/bean&gt;<br><br>	&lt;!-- redis数据源 --&gt;<br>	&lt;bean id=\"poolConfig\"&gt;<br>		&lt;property name=\"maxIdle\" value=\"${redis.maxIdle}\" /&gt;<br>		&lt;property name=\"maxTotal\" value=\"${redis.maxActive}\" /&gt;<br>		&lt;property name=\"maxWaitMillis\" value=\"${redis.maxWait}\" /&gt;<br>		&lt;property name=\"testOnBorrow\" value=\"${redis.testOnBorrow}\" /&gt;<br>	&lt;/bean&gt;<br>	&lt;!-- Spring-redis连接池管理工厂 --&gt;<br>	&lt;bean id=\"jedisConnectionFactory\"<br>	<br>		p:host-name=\"${redis.host}\" p:port=\"${redis.port}\" p:password=\"${redis.pass}\"<br>		p:pool-config-ref=\"poolConfig\" /&gt;<br>	&lt;!-- 配置RedisTemplate，提供了对缓存的增删改查 --&gt;<br>	&lt;bean id=\"redisTemplate\"&gt;<br>		&lt;property name=\"connectionFactory\" ref=\"jedisConnectionFactory\" /&gt;<br>	&lt;/bean&gt;<br>	&lt;!-- 使用中间类解决RedisCache.jedisConnectionFactory的静态注入，从而使MyBatis实现第三方缓存 --&gt;<br><br>	&lt;bean id=\"redisCacheTransfer\"&gt;<br>		&lt;property name=\"jedisConnectionFactory\" ref=\"jedisConnectionFactory\" /&gt;<br>	&lt;/bean&gt;<br>	&lt;!-- 配置RedisCacheConfig --&gt;<br>	&lt;!--bean id=\"SpringcacheManager\"&gt; <br>		&lt;property name=\"caches\"&gt; &lt;set&gt; &lt;bean&gt; <br>		&lt;property name=\"redisTemplate\" ref=\"redisTemplate\" /&gt; &lt;property name=\"name\" <br>		value=\"lf_cache\"/&gt; &lt;/bean&gt; &lt;/set&gt; &lt;/property&gt; &lt;/bean --&gt;<br><br><br>&lt;/beans&gt;</code></pre><h2>jdbc配置文件</h2></div><div><pre><code>driver=com.mysql.cj.jdbc.Driver<br>url=jdbc:mysql://localhost:3306/MyBlog?serverTimezone=UTC  <br>username=root<br>password=admin<br>initialSize=0  <br>maxActive=20  <br>maxIdle=20  <br>minIdle=1  <br>maxWait=60000</code></pre><h2><b>Redis配置</b></h2></div><div><pre><code>redis.host=127.0.0.1<br>redis.port=6379  <br>redis.pass=<br>redis.maxIdle=300  <br>redis.maxActive=600  <br>redis.maxWait=1000  <br>redis.testOnBorrow=true</code></pre><h2><b>SpringMVC配置</b></h2></div><div><pre><code>&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;<br>&lt;beans xmlns=\"http://www.springframework.org/schema/beans\"<br>	xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:p=\"http://www.springframework.org/schema/p\"<br>	xmlns:context=\"http://www.springframework.org/schema/context\"<br>	xmlns:mvc=\"http://www.springframework.org/schema/mvc\"<br>		xmlns:aop=\"http://www.springframework.org/schema/aop\"<br>			 xmlns:task=\"http://www.springframework.org/schema/task\"<br>	xsi:schemaLocation=\"http://www.springframework.org/schema/beans  <br>	http://www.springframework.org/schema/beans/spring-beans-4.3.xsd  <br>	http://www.springframework.org/schema/context  <br>	http://www.springframework.org/schema/context/spring-context-4.3.xsd<br>		http://www.springframework.org/schema/aop<br>	 http://www.springframework.org/schema/aop/spring-aop-4.3.xsd<br>	http://www.springframework.org/schema/mvc  <br>	http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd<br>	  http://www.springframework.org/schema/task<br>    http://www.springframework.org/schema/task/spring-task-4.3.xsd\"&gt;<br>	&lt;!-- 自动扫描该包，使SpringMVC认为包下用了@controller注解的类是控制器 --&gt;<br>	<br>	 <br>	&lt;context:component-scan base-package=\"com.MyBlog.Controller\" /&gt;<br>	 &lt;mvc:annotation-driven /&gt;<br>	<br>	&lt;!--避免IE执行AJAX时，返回JSON出现下载文件 --&gt;<br>	 &lt;bean id=\"mappingJacksonHttpMessageConverter\"<br> &gt;<br>  &lt;property name=\"supportedMediaTypes\"&gt;<br>   &lt;list&gt;<br>    &lt;value&gt;text/html;charset=UTF-8&lt;/value&gt;<br>   &lt;/list&gt;<br>  &lt;/property&gt;<br> &lt;/bean&gt; <br> 	&lt;!-- 配置静态资源，直接映射到对应的文件夹，不被DispatcherServlet处理，3.04新增功能，需要重新设置spring-mvc-3.0.xsd --&gt;<br>	&lt;mvc:resources mapping=\"/img/**\" location=\"/images/\" /&gt;<br>	&lt;mvc:resources mapping=\"/fonts/**\" location=\"/user2/images/\" /&gt;<br>	&lt;mvc:resources mapping=\"/Html\" location=\"/Html\" /&gt;<br>	&lt;mvc:resources mapping=\"/plugins/**\" location=\"/plugins/\" /&gt;<br>	&lt;mvc:resources mapping=\"/js/**\" location=\"/js/\" /&gt;<br>	&lt;mvc:resources mapping=\"/css/**\" location=\"/css/\" /&gt;<br>	  &lt;mvc:default-servlet-handler/&gt; <br>	&lt;!-- 启动SpringMVC的注解功能，完成请求和注解POJO的映射 --&gt;<br>&lt;bean&gt;<br>  &lt;property name=\"messageConverters\"&gt;<br>   &lt;list &gt;<br>    &lt;ref bean=\"mappingJacksonHttpMessageConverter\" /&gt;<br>   &lt;/list&gt;<br>  &lt;/property&gt;<br> &lt;/bean&gt;<br> <br>	&lt;!-- 定义跳转的文件的前后缀 ，视图模式配置--&gt;<br>	&lt;bean&gt;<br>		&lt;!-- 这里的配置我的理解是自动给后面action的方法return的字符串加上前缀和后缀，变成一个 可用的url地址 --&gt;<br>		&lt;property name=\"prefix\" value=\"/\" /&gt;<br>		&lt;property name=\"suffix\" value=\".jsp\" /&gt;<br>	&lt;/bean&gt;<br><br><br>	&lt;!-- 配置文件上传，如果没有使用文件上传可以不用配置，当然如果不配，那么配置文件中也不必引入上传组件包 --&gt;<br>	&lt;bean id=\"multipartResolver\"  <br>       &gt;  <br>        &lt;!-- 默认编码 --&gt;<br>        &lt;property name=\"defaultEncoding\" value=\"utf-8\" /&gt;  <br>        &lt;!-- 文件大小最大值 --&gt;<br>        &lt;property name=\"maxUploadSize\" value=\"10485760000\" /&gt;  <br>        &lt;!-- 内存中的最大值 --&gt;<br>        &lt;property name=\"maxInMemorySize\" value=\"40960\" /&gt;  <br>    &lt;/bean&gt; <br>&lt;!-- 切面层扫描 --&gt;<br>   &lt;context:component-scan base-package=\"com.share.AOP\"/&gt;<br>&lt;!-- 定时任务扫描 --&gt;<br> &lt;context:component-scan base-package=\"com.share.quartz\" /&gt;<br>    &lt;!--启动@AspectJ支持 默认是false--&gt;<br>    &lt;aop:aspectj-autoproxy proxy-target-/&gt;<br>   &lt;task:annotation-driven /&gt;<br>&lt;/beans&gt;</code></pre><p>在Spring 4.x后 MappingJacksonHttpMessageConverter改为了MappingJackson2HttpMessageConverter，不然会找不到</p><h2><b>Shrio配置文件</b></h2></div><div><pre><code>&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;<br>&lt;beans xmlns=\"http://www.springframework.org/schema/beans\"  <br>        xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"  <br>        	xmlns:cache=\"http://www.springframework.org/schema/cache\"<br>        xsi:schemaLocation=\"http://www.springframework.org/schema/beans <br>        http://www.springframework.org/schema/beans/spring-beans-4.3.xsd<br>        http://www.springframework.org/schema/cache<br>        http://www.springframework.org/schema/cache/spring-cache.xsd\"&gt;      <br>   &lt;bean id=\"shiroEhcacheManager\"&gt;<br>        &lt;property name=\"cacheManagerConfigFile\" value=\"classpath:ehcache-shiro.xml\"/&gt;<br>    &lt;/bean&gt;<br> &lt;bean id=\"shiroFilter\"&gt;<br>&lt;property name=\"securityManager\" ref=\"securityManager\"/&gt;<br> &lt;property name=\"loginUrl\" value=\"/login\" /&gt;<br>        &lt;property name=\"successUrl\" value=\"/suc.htm\" /&gt;<br>        &lt;property name=\"unauthorizedUrl\" value=\"/jsp/erro.htm\" /&gt;<br>        &lt;property name=\"filterChainDefinitions\"&gt;<br>            &lt;value&gt;<br><br>             /login.htm = anon<br>         /login = anon<br>              /index.htm = anon<br>              /index = anon<br>            /erro.htm = anon<br>            /Nav.htm = anon<br>            /plugins/** = anon<br>    /images/** = anon<br>    /css/** = anon<br>    /js/** = anon<br>            /SignOut.html = anon<br>            /QuickLogin.html=anon<br>            /LogOut.html=anon<br>             /login.do = anon<br>             <br>               /Newarchives.html=perms[普通:文章:create]  <br>               /Createarchives.html=perms[普通:文章:create] <br>            /admin/** = authc<br>            &lt;/value&gt;<br>              &lt;/property&gt;<br>&lt;/bean&gt;<br><br>     &lt;!-- 会话Cookie --&gt; <br>       &lt;bean id=\"sessionIdCookie\"&gt;  <br>    &lt;constructor-arg value=\"sid\"/&gt;  <br>    &lt;property name=\"httpOnly\" value=\"true\"/&gt;  <br>    <br>    &lt;property name=\"maxAge\" value=\"-1\"/&gt; <br>&lt;/bean&gt;  <br>&lt;bean id=\"sessionManager\"&gt; <br>        &lt;!-- 会话超时时间，单位：毫秒  20m=1200000ms, 30m=1800000ms, 60m=3600000ms--&gt;<br>        &lt;property name=\"globalSessionTimeout\" value=\"7200000\"/&gt;<br>        &lt;property name=\"sessionValidationInterval\" value=\"1200000\"/&gt;<br>        &lt;!-- 去掉 JSESSIONID --&gt;<br>        &lt;property name=\"sessionIdUrlRewritingEnabled\" value=\"false\" /&gt;<br>        &lt;property name=\"sessionValidationSchedulerEnabled\" value=\"true\"/&gt;<br>        &lt;property name=\"sessionIdCookie\" ref=\"sessionIdCookie\"/&gt;<br>        &lt;property name=\"sessionIdCookieEnabled\" value=\"true\"/&gt;<br>&lt;/bean&gt;<br>  &lt;bean id=\"rememberMeCookie\"&gt;<br>         &lt;constructor-arg value=\"COOKIE_NAME\" /&gt;<br>        &lt;property name=\"httpOnly\" value=\"true\" /&gt;<br>        &lt;property name=\"maxAge\" value=\"604800\" /&gt;<br>    &lt;/bean&gt;<br>    &lt;bean id=\"rememberMeManager\"&gt;<br>         &lt;property name=\"cipherKey\" value=\"#{T(org.apache.shiro.codec.Base64).decode(\'4AvVhmFLUs0KTA3Kprsdag==\')}\" /&gt;<br>         &lt;property name=\"cookie\" ref=\"rememberMeCookie\" /&gt;<br>     &lt;/bean&gt;<br>      &lt;bean&gt;<br>         &lt;property name=\"securityManager\" ref=\"securityManager\" /&gt;<br>     &lt;/bean&gt;<br>      <br>      &lt;!-- 配置进行授权和认证的 Realm --&gt;  <br>        &lt;bean id=\"myRealm\"&gt;  <br>             &lt;property name=\"userService\" ref=\"userService\" /&gt;  <br>         &lt;/bean&gt;  <br>         &lt;bean id=\"userService\" /&gt;  <br>   <br>   &lt;bean id=\"securityManager\"&gt;  <br>            &lt;property name=\"cacheManager\" ref=\"shiroEhcacheManager\"/&gt;   <br>             &lt;property name=\"realm\" ref=\"myRealm\"/&gt;   <br>             &lt;property name=\"sessionMode\" value=\"native\"&gt;  <br>            <br>             &lt;/property&gt;  <br>              &lt;property name=\"rememberMeManager\" ref=\"rememberMeManager\"/&gt; <br>       &lt;/bean&gt;  <br>      &lt;bean id=\"lifecycleBeanPostProcessor\"/&gt;  <br>  <br> <br><br>        &lt;/beans&gt;</code></pre><h2><b>Mybaits配置文件</b></h2></div><div><pre><code>&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;<br>&lt;!DOCTYPE configuration PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\" <br>\"http://mybatis.org/dtd/mybatis-3-config.dtd\"&gt;<br>&lt;configuration&gt;<br><br>	 &lt;!-- 配置mybatis的缓存，延迟加载等相关属性 --&gt;<br> &lt;settings&gt;<br><br>        &lt;!-- 全局映射器启用缓存 --&gt;<br>        &lt;setting name=\"cacheEnabled\" value=\"true\"/&gt;<br><br>        &lt;!-- 查询时，关闭关联对象即时加载以提高性能 --&gt;<br>        &lt;setting name=\"lazyLoadingEnabled\" value=\"false\"/&gt;<br><br>        &lt;!-- 对于未知的SQL查询，允许返回不同的结果集以达到通用的效果 --&gt;<br>        &lt;setting name=\"multipleResultSetsEnabled\" value=\"true\"/&gt;<br><br>        &lt;!-- 允许使用列标签代替列名 --&gt;<br>        &lt;setting name=\"useColumnLabel\" value=\"true\"/&gt;<br><br>        &lt;!-- 不允许使用自定义的主键值(比如由程序生成的UUID 32位编码作为键值)，数据表的PK生成策略将被覆盖 --&gt;<br>        &lt;setting name=\"useGeneratedKeys\" value=\"false\"/&gt;<br><br>        &lt;!-- 给予被嵌套的resultMap以字段-属性的映射支持 FULL,PARTIAL --&gt;<br>        &lt;setting name=\"autoMappingBehavior\" value=\"PARTIAL\"/&gt;<br><br>        &lt;!-- 对于批量更新操作缓存SQL以提高性能 BATCH,SIMPLE --&gt;<br>        &lt;!-- &lt;setting name=\"defaultExecutorType\" value=\"BATCH\" /&gt; --&gt;<br><br>        &lt;!-- 数据库超过25000秒仍未响应则超时 --&gt;<br>        &lt;!-- &lt;setting name=\"defaultStatementTimeout\" value=\"25000\" /&gt; --&gt;<br><br>        &lt;!-- Allows using RowBounds on nested statements --&gt;<br>        &lt;setting name=\"safeRowBoundsEnabled\" value=\"false\"/&gt;<br><br>        &lt;!-- Enables automatic mapping from classic database column names A_COLUMN to camel case classic Java property names aColumn. --&gt;<br>        &lt;setting name=\"mapUnderscoreToCamelCase\" value=\"true\"/&gt;<br><br>        &lt;!-- MyBatis uses local cache to prevent circular references and speed up repeated nested queries. By default (SESSION) all queries executed during a session are cached. If localCacheScope=STATEMENT <br>            local session will be used just for statement execution, no data will be shared between two different calls to the same SqlSession. --&gt;<br>        &lt;setting name=\"localCacheScope\" value=\"SESSION\"/&gt;<br><br>        &lt;!-- Specifies the JDBC type for null values when no specific JDBC type was provided for the parameter. Some drivers require specifying the column JDBC type but others work with generic values <br>            like NULL, VARCHAR or OTHER. --&gt;<br>        &lt;setting name=\"jdbcTypeForNull\" value=\"OTHER\"/&gt;<br><br>        &lt;!-- Specifies which Object\'s methods trigger a lazy load --&gt;<br>        &lt;setting name=\"lazyLoadTriggerMethods\" value=\"equals,clone,hashCode,toString\"/&gt;<br><br>        &lt;!-- 设置关联对象加载的形态，此处为按需加载字段(加载字段由SQL指 定)，不会加载关联表的所有字段，以提高性能 --&gt;<br>        &lt;setting name=\"aggressiveLazyLoading\" value=\"true\"/&gt;<br><br>    &lt;/settings&gt;<br>    	&lt;typeAliases&gt;<br>	<br><br>		&lt;!-- 当所有的model类都在统一一个package下，且别名与类名相同，可以配置一个package减少配置，代码可读性更好 --&gt;<br>		&lt;package name=\"com.MyBlog.entity\" /&gt;<br><br>	&lt;/typeAliases&gt;<br>	&lt;plugins&gt;<br>    &lt;plugin interceptor=\"com.github.pagehelper.PageInterceptor\"&gt;<br>    &lt;property name=\"rowBoundsWithCount\" value=\"true\"/&gt;<br><br>     &lt;property name=\"reasonable\" value=\"true\"/&gt;<br>        &lt;property name=\"offsetAsPageNum\" value=\"true\"/&gt;<br>           &lt;property name=\"pageSizeZero\" value=\"true\"/&gt;<br>        <br>	&lt;/plugin&gt;<br>&lt;/plugins&gt;<br>&lt;/configuration&gt;</code></pre><p>在配置文件中的位置必须符合要求，否则会报错，顺序如下:&nbsp;<br>properties,&nbsp;<br>settings,&nbsp;<br>typeAliases,&nbsp;<br>typeHandlers,&nbsp;<br>objectFactory,&nbsp;<br>objectWrapperFactory,&nbsp;<br>plugins,&nbsp;<br>environments,&nbsp;<br>databaseIdProvider,&nbsp;</p><p>mappers</p><h2><b>Shrio缓存配置</b></h2></div><div><pre><code>&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;<br>&lt;ehcache updateCheck=\"false\"  name=\"shiroCache\"&gt;<br><br>    &lt;diskStore path=\"java.io.tmpdir\"/&gt;<br>    &lt;defaultCache<br>            maxElementsInMemory=\"10000\"<br>            eternal=\"false\"<br>            timeToIdleSeconds=\"120\"<br>            timeToLiveSeconds=\"120\"<br>            overflowToDisk=\"false\"<br>            diskPersistent=\"false\"<br>            diskExpiryThreadIntervalSeconds=\"120\"<br>    /&gt;<br><br>    &lt;cache name=\"passwordRetryCache\"<br>        <br>           eternal=\"false\"<br>           timeToIdleSeconds=\"3600\"<br>           timeToLiveSeconds=\"0\"<br>           overflowToDisk=\"false\"<br>           statistics=\"true\"&gt;<br>    &lt;/cache&gt;<br>    &lt;cache name=\"authorizationCache\"<br>   <br>           eternal=\"false\"<br>           timeToIdleSeconds=\"3600\"<br>           timeToLiveSeconds=\"0\"<br>           overflowToDisk=\"false\"<br>           statistics=\"true\"&gt;<br>    &lt;/cache&gt;<br>    &lt;cache name=\"authenticationCache\"<br><br>           eternal=\"false\"<br>           timeToIdleSeconds=\"3600\"<br>           timeToLiveSeconds=\"0\"<br>           overflowToDisk=\"false\"<br>           statistics=\"true\"&gt;<br>    &lt;/cache&gt;<br>    &lt;cache name=\"shiro-activeSessionCache\"<br>        <br>           eternal=\"false\"<br>           timeToIdleSeconds=\"3600\"<br>           timeToLiveSeconds=\"0\"<br>           overflowToDisk=\"false\"<br>           statistics=\"true\"&gt;<br>    &lt;/cache&gt;<br>    &lt;cache name=\"shiro_cache\"<br>           maxElementsInMemory=\"2000\"<br><br>           eternal=\"false\"<br>           timeToIdleSeconds=\"0\"<br>           timeToLiveSeconds=\"0\"<br>           maxElementsOnDisk=\"0\"<br>           overflowToDisk=\"true\"<br>           memoryStoreEvictionPolicy=\"FIFO\"<br>           statistics=\"true\"&gt;<br>    &lt;/cache&gt;<br>&lt;/ehcache&gt;</code></pre><p>注意该Shrio缓存配置文件里不要加任何中文注释。不然会报错</p><p>写到这里，我的博客也差不多建好了。这是我博客第一条博文</p><p><img src=\"http://localhost:8090/MyBlog1/userTempImg/180706_232130_header-darling2.jpg\"></p></div>',1,'Beloya','2018-07-07 01:38:18',NULL,NULL,0,191,0,1),(9,'Mybatis插入返回主键','<p>这个还需求很常见，所以列出来。</p><h2><span style=\"font-weight: bold;\">一、实现方式</span></h2><h5 id=\"1-使用usegeneratedkeyskeyproperty-推荐\">1. 使用useGeneratedKeys+keyProperty (推荐)</h5><p>简单来说就是配置：</p><pre><code>&lt;insert id=\"\" useGeneratedKeys=\"true\" keyProperty=\"id\"&gt;</code></pre><p>将插入的ID赋值给设置的keyProperty对象属性字段里面，一般也就是对象的ID，比如插入User对象，设置赋值主键ID给id字段。</p><h5 id=\"2-使用selectkey\">2. 使用selectKey</h5><p>MySQL 数据库可以使用如下方式。</p><pre><code>&lt;selectKey resultType=\"int\" order=\"AFTER\" keyProperty=\"aid\"&gt;  <br>                SELECT LAST_INSERT_ID() <br>     &lt;/selectKey&gt;</code></pre><p><br></p>',1,'Beloya','2018-07-07 07:29:29',NULL,NULL,0,82,0,1),(10,'NoSuchBeanDefinitionException: No qualifying bean of type报错问题','<p>昨天还运行好好地，今天新增模块时莫名其妙就跑不起来了，找了一大堆资料，排查N年后发现，是我的l配置文件中没有扫描到我的serviceImpl实现类导致无法注入，解决方法：1.添加serviceImpl扫描的路径，2.把现实类和服务接口放在一个包下统一扫描。</p><p>明明昨天都还跑着，今天就要加扫描路径。没弄明白<img src=\"http://111.231.215.38/FriendChat/plugins/layui/images/face/61.gif\" alt=\"[囧]\" layer-index=\"0\"></p><p><b>还有一种情况也会导致这种问题，也就记录下来</b></p><p>造成这一异常的原因可能是Spring上下文中存在两个或以上该bean的定义。如果接口IService 有两个实现类 ServiceImplA 和ServiceImplB&nbsp;<br>接口：IService.java</p><pre name=\"code\"><code>package com.csdn.training.service;\n\npublic interface IService {\n\n}</code></pre><p>两个实现类：ServiceImplA.java</p><pre name=\"code\"><code>package com.csdn.training.service;\n\nimport org.springframework.stereotype.Service;\n@Service\npublic class ServiceImplA implements IService {\n\n}</code></pre><p>ServiceImplB.java</p><pre name=\"code\"><code>package com.csdn.training.service;\n\nimport org.springframework.stereotype.Service;\n@Service\npublic class ServiceImplB implements IService {\n\n}</code></pre><p>如果BeanA 自动注入这一接口，Spring就无法分辨到底注入哪一个实现类：</p><pre name=\"code\"><code>package com.csdn.training.model;\n\nimport com.csdn.training.service.IService;\n@Component\npublic class BeanA {    \n    @Autowired\n    private IService serviceImpl;\n}</code></pre><p>然后，BeanFactory就抛出异常NoSuchBeanDefinitionException&nbsp;<br>Spring会提示：”<em>expected single matching bean but found 2</em>“（只应该匹配一个bean但是找到了多个）</p><pre name=\"code\"><code>Caused by: org.springframework.beans.factory.NoSuchBeanDefinitionException: \nNo qualifying bean of type [com.csdn.training.service.IService] is defined: \nexpected single matching bean but found 2: serviceImplA,serviceImplB</code></pre><p>上例中，有时你看到的异常信息是NoUniqueBeanDefinitionException，它是NoSuchBeanDefinitionException 它的子类，在Spring 3.2.1中，修正了这一异常，为的是和bean未定义这一异常区分开。</p><pre name=\"code\"><code>nested exception is org.springframework.beans.factory.NoUniqueBeanDefinitionException: No qualifying bean of type [com.csdn.training.service.IService] is defined: expected single matching bean but found 2: serviceImplA,serviceImplB</code></pre><p>解决这一异常可以用注解@Qualifier 来指定想要注入的bean的名字。</p><pre name=\"code\"><code>package com.csdn.training.model;\n\nimport com.csdn.training.service.IService;\n@Component\npublic class BeanA {\n    @Autowired\n    @Qualifier(\"serviceImplA\")\n    private IService serviceImpl;\n}</code></pre><p>修改以后，Spring就可以区分出应该注入那个bean的实例，需要注意的是ServiceImplA的默认实例名称是serviceImplA</p><p><br></p>',1,'Beloya','2018-07-07 07:32:20','Beloya','2018-07-13 11:34:02',0,70,0,1),(12,'Shiro 编码加密','<p>博客准备弄个注册账号功能，原本准备随便弄弄的，但是想想前不久发生在AcFun的脱裤闹得沸沸扬扬的，没有任何系统不存在漏洞，不可能不犯错，那就只有把翻车的概率降低</p><p>在做数据的存储方案时，我们需要假设储存的数据已经被泄露出去了，如用户密码这种隐私数据的存储就是一个重点。</p><blockquote>讲密码的存储方案前，先要记住三条前提：<br>用户喜欢到处使用一样的密码<br>用户喜欢使用简单好记的密码<br>世界上没有绝对的安全，但当攻击成本远高于收益时，整个系统达到相对安全</blockquote><p>这次打算用Shrio框架自带的密码加密功能</p><p>在使用前先熟悉一下</p><h2>编码 / 解码</h2><div>Shiro 提供了 base64 和 16 进制字符串编码 / 解码的 API 支持，方便一些编码解码操作。Shiro 内部的一些数据的存储 / 表示都使用了 base64 和 16 进制字符串。</div><pre><code>String str = \"userName\";<br>		 String base64Encoded = Base64.encodeToString(str.getBytes());<br>		 String str2 = Base64.decodeToString(base64Encoded);<br>		 System.out.println(\"编码结果:\"+base64Encoded);<br>		 System.out.println(\"解码结果:\"+str2);</code></pre><p>输出结果：</p><blockquote>编码结果:dXNlck5hbWU=<br>解码结果:userName</blockquote><p>还可以进行 16 进制字符串编码 / 解码操作</p><pre><code>String str = \"hello\";<br>		 String base64Encoded = Hex.encodeToString(str.getBytes());<br>		 String str2 = new String(Hex.decode(base64Encoded.getBytes()));<br>		System.out.println(\"编码结果：\"+base64Encoded);<br>		System.out.println(\"解码结果：\"+str2);</code></pre><p>输出结果：</p><blockquote>编码结果：68656c6c6f<br>解码结果：hello</blockquote><h2>散列算法</h2><div>散列算法一般用于生成数据的摘要信息，是一种不可逆的算法，一般适合存储密码之类的数据，常见的散列算法如 MD5、SHA 等。一般进行散列时最好提供一个 salt（盐），比如加密密码 “admin”，产生的散列值是 “21232f297a57a5a743894a0e4a801fc3”</div><pre><code>String str = \"hello\";<br>		 String md5 = new Md5Hash(str).toString();<br>		System.out.println(\"结果：\"+md5);</code></pre><p>输出结果：</p><blockquote>结果：5d41402abc4b2a76b9719d911017c592</blockquote><p>散列时还可以指定散列次数，如 2 次表示：md5(md5(str))：“new Md5Hash(str, salt, 2).toString()”。</p><p>使用 SHA256 算法生成相应的散列数据，另外还有如 SHA1、SHA512 算法。</p><p>Shiro 还提供了通用的散列支持：</p><pre><code>String str = \"hello\";<br>String salt = \"123\";<br>//内部使用MessageDigest<br>String simpleHash = new SimpleHash(\"SHA-1\", str, salt).toString();&nbsp;</code></pre><blockquote>通过调用 SimpleHash 时指定散列算法，其内部使用了 Java 的 MessageDigest 实现。</blockquote><p>为了方便使用，Shiro 提供了 HashService，默认提供了 DefaultHashService 实现。</p><blockquote>DefaultHashService hashService = new&nbsp;DefaultHashService();&nbsp;//默认算法SHA-512&nbsp;hashService.setHashAlgorithmName(\"SHA-512\"); hashService.setPrivateSalt(new&nbsp;SimpleByteSource(\"123\"));&nbsp;//私盐，默认无&nbsp;hashService.setGeneratePublicSalt(true);//是否生成公盐，默认false&nbsp;hashService.setRandomNumberGenerator(new&nbsp;SecureRandomNumberGenerator());//用于生成公盐。默认就这个&nbsp;hashService.setHashIterations(1);&nbsp;//生成Hash值的迭代次数&nbsp;HashRequest request =&nbsp;new&nbsp;HashRequest.Builder() .setAlgorithmName(\"MD5\").setSource(ByteSource.Util.bytes(\"hello\")) .setSalt(ByteSource.Util.bytes(\"123\")).setIterations(2).build();&nbsp;String&nbsp;hex = hashService.computeHash(request).toHex();</blockquote><ol><li>首先创建一个 DefaultHashService，默认使用 SHA-512 算法；</li><li>以通过 hashAlgorithmName 属性修改算法；</li><li>可以通过 privateSalt 设置一个私盐，其在散列时自动与用户传入的公盐混合产生一个新盐；</li><li>可以通过 generatePublicSalt 属性在用户没有传入公盐的情况下是否生成公盐；</li><li>可以设置 randomNumberGenerator 用于生成公盐；</li><li>可以设置 hashIterations 属性来修改默认加密迭代次数；</li><li>需要构建一个 HashRequest，传入算法、数据、公盐、迭代次数。</li></ol><h2>SecureRandomNumberGenerator 用于生成一个随机数：</h2><pre><code>SecureRandomNumberGenerator randomNumberGenerator =<br>     new SecureRandomNumberGenerator();<br>randomNumberGenerator.setSeed(\"123\".getBytes());<br>String hex = randomNumberGenerator.nextBytes().toHex();</code></pre><h2>Shiro 还提供对称式加密 / 解密算法的支持，如 AES、Blowfish 等；</h2><p>AES 算法实现：</p><pre><code>AesCipherService aesCipherService = new AesCipherService();<br>aesCipherService.setKeySize(128); //设置key长度<br>//生成key<br>Key key = aesCipherService.generateNewKey();<br>String text = \"hello\";<br>//加密<br>String encrptText = <br>aesCipherService.encrypt(text.getBytes(), key.getEncoded()).toHex();<br>//解密<br>String text2 =<br> new String(aesCipherService.decrypt(Hex.decode(encrptText), key.getEncoded()).getBytes());<br>Assert.assertEquals(text, text2);</code></pre><h2>PasswordService/CredentialsMatcher</h2><pre><code>public interface PasswordService {<br>    //输入明文密码得到密文密码<br>    String encryptPassword(Object plaintextPassword) throws IllegalArgumentException;<br>}</code></pre><pre><code>public interface CredentialsMatcher {<br>    //匹配用户输入的token的凭证（未加密）与系统提供的凭证（已加密）<br>    boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info);<br>}</code></pre><p>Shiro 默认提供了 PasswordService 实现 DefaultPasswordService；CredentialsMatcher 实现 PasswordMatcher 及 HashedCredentialsMatcher（更强大）。</p><h3><strong>DefaultPasswordService 配合 PasswordMatcher 实现简单的密码加密与验证服务</strong></h3><div>1、定义 Realm</div><pre><code>public class MyRealm extends AuthorizingRealm {<br>    private PasswordService passwordService;<br>    public void setPasswordService(PasswordService passwordService) {<br>        this.passwordService = passwordService;<br>    }<br>     //省略doGetAuthorizationInfo，具体看代码 <br>    @Override<br>    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {<br>        return new SimpleAuthenticationInfo(<br>                \"wu\",                passwordService.encryptPassword(\"123\"),<br>                getName());<br>    }<br>}</code></pre><p>为了方便，直接注入一个 passwordService 来加密密码，实际使用时需要在 Service 层使用 passwordService 加密密码并存到数据库。</p><p>2、ini 配置（shiro-passwordservice.ini）</p><pre><code>[main]\npasswordService=org.apache.shiro.authc.credential.DefaultPasswordService\nhashService=org.apache.shiro.crypto.hash.DefaultHashService\npasswordService.hashService=$hashService\nhashFormat=org.apache.shiro.crypto.hash.format.Shiro1CryptFormat\npasswordService.hashFormat=$hashFormat\nhashFormatFactory=org.apache.shiro.crypto.hash.format.DefaultHashFormatFactory\npasswordService.hashFormatFactory=$hashFormatFactory\npasswordMatcher=org.apache.shiro.authc.credential.PasswordMatcher\npasswordMatcher.passwordService=$passwordService\nmyRealm=com.github.zhangkaitao.shiro.chapter5.hash.realm.MyRealm\nmyRealm.passwordService=$passwordService\nmyRealm.credentialsMatcher=$passwordMatcher\nsecurityManager.realms=$myRealm\n</code></pre><ol><li>passwordService 使用 DefaultPasswordService，如果有必要也可以自定义；</li><li>hashService 定义散列密码使用的 HashService，默认使用 DefaultHashService（默认 SHA-256 算法）；</li><li>hashFormat 用于对散列出的值进行格式化，默认使用 Shiro1CryptFormat，另外提供了 Base64Format 和 HexFormat，对于有 salt 的密码请自定义实现 ParsableHashFormat 然后把 salt 格式化到散列值中；</li><li>hashFormatFactory 用于根据散列值得到散列的密码和 salt；因为如果使用如 SHA 算法，那么会生成一个 salt，此 salt 需要保存到散列后的值中以便之后与传入的密码比较时使用；默认使用 DefaultHashFormatFactory；</li><li>passwordMatcher 使用 PasswordMatcher，其是一个 CredentialsMatcher 实现；</li><li>将 credentialsMatcher 赋值给 myRealm，myRealm 间接继承了 AuthenticatingRealm，其在调用 getAuthenticationInfo 方法获取到 AuthenticationInfo 信息后，会使用 credentialsMatcher 来验证凭据是否匹配，如果不匹配将抛出 IncorrectCredentialsException 异常。</li></ol><p><strong>HashedCredentialsMatcher 实现密码验证服务</strong></p><p>Shiro 提供了 CredentialsMatcher 的散列实现 HashedCredentialsMatcher，和之前的 PasswordMatcher 不同的是，它只用于密码验证，且可以提供自己的盐，而不是随机生成盐，且生成密码散列值的算法需要自己写，因为能提供自己的盐。</p><p>1、生成密码散列值</p><p>此处我们使用 MD5 算法，“密码 + 盐（用户名 + 随机数）” 的方式生成散列值：</p><pre><code>String algorithmName = \"md5\";\nString username = \"liu\";\nString password = \"123\";\nString salt1 = username;\nString salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();\nint hashIterations = 2;\nSimpleHash hash = new SimpleHash(algorithmName, password, salt1 + salt2, hashIterations);\nString encodedPassword = hash.toHex();</code></pre><p>如果要写用户模块，需要在新增用户 / 重置密码时使用如上算法保存密码，将生成的密码及 salt2 存入数据库（因为我们的散列算法是：md5(md5(密码 +username+salt2))）。</p><p>2、生成 Realm（com.github.zhangkaitao.shiro.chapter5.hash.realm.MyRealm2）</p><pre><code>protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {\n    String username = \"liu\"; //用户名及salt1\n    String password = \"202cb962ac59075b964b07152d234b70\"; //加密后的密码\n    String salt2 = \"202cb962ac59075b964b07152d234b70\";\nSimpleAuthenticationInfo ai = \n        new SimpleAuthenticationInfo(username, password, getName());\n    ai.setCredentialsSalt(ByteSource.Util.bytes(username+salt2)); //盐是用户名+随机数\n        return ai;\n}&amp;nbsp;</code></pre><p>此处就是把步骤 1 中生成的相应数据组装为 SimpleAuthenticationInfo，通过 SimpleAuthenticationInfo 的 credentialsSalt 设置盐，HashedCredentialsMatcher 会自动识别这个盐。</p><p>如果使用 JdbcRealm，需要修改获取用户信息（包括盐）的&nbsp;<code>sql：“select password, password_salt from users where username = ?”</code>，而我们的盐是由 username+password_salt 组成，所以需要通过如下 ini 配置（shiro-jdbc-hashedCredentialsMatcher.ini）修改：</p><pre><code>jdbcRealm.saltStyle=COLUMN\njdbcRealm.authenticationQuery=select password, concat(username,password_salt) from users where username = ?\njdbcRealm.credentialsMatcher=$credentialsMatcher</code></pre><ul><li>saltStyle 表示使用密码 + 盐的机制，authenticationQuery 第一列是密码，第二列是盐；</li><li>通过 authenticationQuery 指定密码及盐查询 SQL；</li></ul><p>此处还要注意 Shiro 默认使用了 apache commons BeanUtils，默认是不进行 Enum 类型转型的，此时需要自己注册一个 Enum 转换器 “BeanUtilsBean.getInstance().getConvertUtils().register(new EnumConverter(), JdbcRealm.SaltStyle.class);” 具体请参考示例 “com.github.zhangkaitao.shiro.chapter5.hash.PasswordTest” 中的代码。</p><p>另外可以参考配置 shiro-jdbc-passwordservice.ini，提供了 JdbcRealm 的测试用例，测试前请先调用 sql/shiro-init-data.sql 初始化用户数据。</p><p>3、ini 配置（shiro-hashedCredentialsMatcher.ini）</p><pre><code>[main]\ncredentialsMatcher=org.apache.shiro.authc.credential.HashedCredentialsMatcher\ncredentialsMatcher.hashAlgorithmName=md5\ncredentialsMatcher.hashIterations=2\ncredentialsMatcher.storedCredentialsHexEncoded=true\nmyRealm=com.github.zhangkaitao.shiro.chapter5.hash.realm.MyRealm2\nmyRealm.credentialsMatcher=$credentialsMatcher\nsecurityManager.realms=$myRealm</code></pre><ul><li>通过 credentialsMatcher.hashAlgorithmName=md5 指定散列算法为 md5，需要和生成密码时的一样；</li><li>credentialsMatcher.hashIterations=2，散列迭代次数，需要和生成密码时的意义；</li><li>credentialsMatcher.storedCredentialsHexEncoded=true 表示是否存储散列后的密码为 16 进制，需要和生成密码时的一样，默认是 base64；</li></ul><p>此处最需要注意的就是 HashedCredentialsMatcher 的算法需要和生成密码时的算法一样。另外 HashedCredentialsMatcher 会自动根据 AuthenticationInfo 的类型是否是 SaltedAuthenticationInfo 来获取 credentialsSalt 盐。</p><h2><strong>密码重试次数限制</strong></h2><div>如在 1 个小时内密码最多重试 5 次，如果尝试次数超过 5 次就锁定 1 小时，1 小时后可再次重试，如果还是重试失败，可以锁定如 1 天，以此类推，防止密码被暴力破解。我们通过继承 HashedCredentialsMatcher，且使用 Ehcache 记录重试次数和超时时间。</div><pre><code>public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {<br>       String username = (String)token.getPrincipal();<br>        //retry count + 1<br>        Element element = passwordRetryCache.get(username);<br>        if(element == null) {<br>            element = new Element(username , new AtomicInteger(0));<br>            passwordRetryCache.put(element);<br>        }<br>        AtomicInteger retryCount = (AtomicInteger)element.getObjectValue();<br>        if(retryCount.incrementAndGet() &gt; 5) {<br>            //if retry count &gt; 5 throw<br>            throw new ExcessiveAttemptsException();<br>        }<br>        boolean matches = super.doCredentialsMatch(token, info);<br>        if(matches) {<br>            //clear retry count<br>            passwordRetryCache.remove(username);<br>        }<br>        return matches;<br>}</code></pre><p><br></p>',1,'Beloya','2018-07-10 15:31:59','Beloya','2018-07-13 11:28:44',0,75,0,1);
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivescommit`
--

DROP TABLE IF EXISTS `archivescommit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `archivescommit` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `Context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PID` int(11) DEFAULT NULL,
  `REVISION` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `AID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=1365;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivescommit`
--

LOCK TABLES `archivescommit` WRITE;
/*!40000 ALTER TABLE `archivescommit` DISABLE KEYS */;
INSERT INTO `archivescommit` VALUES (1,'<img src=\"../img/expression/face1.jpg\">',NULL,NULL,'Beloya','2018-07-09 14:15:23',NULL,NULL,0,9,0,NULL),(2,'',NULL,NULL,'Beloya','2018-07-09 14:35:02',NULL,NULL,0,9,0,NULL),(3,'',NULL,NULL,'Beloya','2018-07-09 14:35:55',NULL,NULL,0,9,0,NULL),(4,'',NULL,NULL,'Beloya','2018-07-09 14:36:03',NULL,NULL,0,9,0,NULL),(5,'(ฅ´ω`ฅ)',NULL,NULL,'Beloya','2018-07-09 14:36:12',NULL,NULL,0,9,0,NULL),(6,'(ฅ´ω`ฅ)<img src=\"../img/expression/face7.jpg\">',NULL,NULL,'Beloya','2018-07-09 14:38:53',NULL,NULL,0,9,0,NULL),(7,'',5,NULL,'Beloya','2018-07-09 15:11:48',NULL,NULL,0,9,0,NULL),(8,'',6,NULL,'Beloya','2018-07-09 15:11:54',NULL,NULL,0,9,0,NULL),(9,'|´・ω・)ノ',6,NULL,'Beloya','2018-07-09 15:12:28',NULL,NULL,0,9,0,NULL),(10,'',5,NULL,'Beloya','2018-07-09 15:13:30',NULL,NULL,0,9,0,NULL),(11,'',2,NULL,'Beloya','2018-07-09 15:19:06',NULL,NULL,0,9,0,NULL),(12,'',4,NULL,'Beloya','2018-07-09 15:19:14',NULL,NULL,0,9,0,NULL),(14,'( ,,´･ω･)ﾉ\"(´っω･｀｡)',NULL,NULL,'sa','2018-07-12 02:05:49',NULL,NULL,0,9,0,NULL),(15,'<img src=\"../img/emjoy/1.jpg\">',NULL,NULL,'sa','2018-07-12 03:44:45',NULL,NULL,0,9,0,NULL),(16,'( ๑´•ω•) \"(ㆆᴗㆆ)',NULL,NULL,'sa','2018-07-12 11:46:07',NULL,NULL,0,9,0,NULL),(17,'|´・ω・)ノ',NULL,NULL,'sa','2018-07-12 14:50:43',NULL,NULL,0,12,0,NULL),(18,'<img src=\"../img/emjoy/6.jpg\">',NULL,NULL,'sa','2018-07-12 17:23:33',NULL,NULL,0,1,0,NULL),(19,'|´・ω・)ノ',NULL,NULL,'sa','2018-07-12 17:44:57',NULL,NULL,0,1,0,NULL),(20,'∠( ᐛ 」∠)＿',NULL,NULL,'sa','2018-07-12 17:45:02',NULL,NULL,0,1,0,NULL),(21,'Hello',NULL,NULL,'游客','2018-07-13 10:24:29',NULL,NULL,0,10,1,'HelloWorld'),(22,'∠( ᐛ 」∠)＿',NULL,NULL,'游客','2018-07-13 11:46:26',NULL,NULL,0,10,0,'Beloya'),(23,'|´・ω・)ノ',NULL,NULL,'sa','2018-07-13 11:48:14',NULL,NULL,0,10,0,NULL),(24,'|´・ω・)ノ',NULL,NULL,'游客','2018-07-13 11:49:36',NULL,NULL,0,10,0,'<a style=\"color:red;\">Beloya</a>'),(25,'|´・ω・)ノ',NULL,NULL,'游客','2018-07-13 11:52:53',NULL,NULL,0,10,0,'<a href=\"www.baidu.com\" style=\"color:blue\">Hello</a>'),(26,'123',NULL,NULL,'游客','2018-07-13 11:55:07',NULL,NULL,0,10,0,'_Be'),(27,'|´・ω・)ノ',NULL,NULL,'游客','2018-07-13 12:02:09',NULL,NULL,0,10,0,'_aa'),(29,'321',NULL,NULL,'游客','2018-07-13 12:54:33',NULL,NULL,0,10,0,'123'),(30,'321',NULL,NULL,'游客','2018-07-13 12:54:37',NULL,NULL,0,10,0,'123'),(31,'321',NULL,NULL,'游客','2018-07-13 12:54:42',NULL,NULL,0,10,0,'aaaa'),(32,'123',NULL,NULL,'游客','2018-07-13 12:57:27',NULL,NULL,0,10,0,'ba'),(33,'321',NULL,NULL,'游客','2018-07-13 13:01:49',NULL,NULL,0,10,0,'as'),(34,'321',NULL,NULL,'游客','2018-07-13 13:04:32',NULL,NULL,0,10,0,'_sa'),(35,'321',NULL,NULL,'游客','2018-07-13 13:04:39',NULL,NULL,0,10,0,'_as'),(36,'<img src=\"../img/emjoy/4.jpg\">',NULL,NULL,'游客','2018-07-13 13:12:40',NULL,NULL,0,10,0,'sa');
/*!40000 ALTER TABLE `archivescommit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivesvisibility`
--

DROP TABLE IF EXISTS `archivesvisibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `archivesvisibility` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vdescribe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REVISION` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivesvisibility`
--

LOCK TABLES `archivesvisibility` WRITE;
/*!40000 ALTER TABLE `archivesvisibility` DISABLE KEYS */;
INSERT INTO `archivesvisibility` VALUES (1,'公开',NULL,'Beloya','2018-07-05 20:31:45',NULL,NULL,0),(2,'私有',NULL,'Beloya','2018-07-05 20:32:20',NULL,NULL,0);
/*!40000 ALTER TABLE `archivesvisibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BlogName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客名',
  `REVISION` int(11) DEFAULT NULL COMMENT '乐观锁',
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `CREATED_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `Title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `CREATED_BY` (`CREATED_BY`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Beloya',NULL,'Beloya','2018-07-02 21:35:32',NULL,NULL,'Hello World');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flag` (
  `FID` int(11) NOT NULL AUTO_INCREMENT,
  `Fdescribe` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REVISION` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
INSERT INTO `flag` VALUES (1,'原创',NULL,'Beloya','2018-07-06 21:13:58',NULL,NULL,0),(2,'分享',NULL,'Beloya','2018-07-06 21:14:18',NULL,NULL,0),(3,'转载',NULL,'Beloya','2018-07-06 21:14:33',NULL,NULL,0);
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `ID` int(11) NOT NULL COMMENT '主键;自增',
  `Context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `Link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接',
  `REVISION` int(11) DEFAULT NULL COMMENT '乐观锁',
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `CREATED_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `Status` int(11) NOT NULL COMMENT '状态;1审核||0正常||-1失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_board`
--

DROP TABLE IF EXISTS `message_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message_board` (
  `MBID` int(11) NOT NULL,
  `Context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REVISION` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`MBID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_board`
--

LOCK TABLES `message_board` WRITE;
/*!40000 ALTER TABLE `message_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `R_Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatorId` int(11) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `DataLevel` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`R_Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'管理员','管理员',NULL,'2018-06-15 00:00:00',0),(2,'测试','测试角色',NULL,'2018-06-17 11:16:10',0),(3,'博主','博客创建者',NULL,'2018-07-05 22:55:08',0),(4,'观光团','观光团',NULL,'2018-07-05 22:55:08',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles_permissions` (
  `RP_Id` int(11) NOT NULL AUTO_INCREMENT,
  `RId` int(11) NOT NULL,
  `permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreatorId` int(11) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `DataLevel` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`RP_Id`) USING BTREE,
  KEY `PRid_idx` (`RId`) USING BTREE,
  CONSTRAINT `roles_permissions_fk1` FOREIGN KEY (`RId`) REFERENCES `roles` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=3276;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permissions`
--

LOCK TABLES `roles_permissions` WRITE;
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;
INSERT INTO `roles_permissions` VALUES (1,1,'普通:文章:update',NULL,'2018-06-15 00:00:00',0),(2,1,'普通:文章:view',NULL,'2018-06-15 00:00:00',0),(3,1,'普通:文章:*',NULL,'2018-06-17 11:18:01',0),(4,1,'普通:文章:create',NULL,'2018-07-05 22:55:52',0),(5,1,'普通:评论:*',NULL,'2018-07-09 21:12:45',0);
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `TID` int(11) NOT NULL AUTO_INCREMENT,
  `Tdescribe` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REVISION` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '状态;1审核||0正常||-1失效',
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'分享',NULL,'System','2018-07-06 21:13:58',NULL,NULL,0),(2,'原创',NULL,'System','2018-07-06 21:13:58',NULL,NULL,0),(3,'杂记',NULL,'System','2018-07-06 21:13:58',NULL,NULL,0),(4,'心情',NULL,'System','2018-07-06 21:13:58',NULL,NULL,0);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `U_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rid` int(11) NOT NULL,
  `userName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `passWord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreatorId` int(11) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `DataLevel` tinyint(4) NOT NULL DEFAULT '0',
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Sex` tinyint(4) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `UserImg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`U_Id`) USING BTREE,
  UNIQUE KEY `userName_UNIQUE` (`userName`) USING BTREE,
  KEY `Rid_idx` (`Rid`) USING BTREE,
  CONSTRAINT `users_fk1` FOREIGN KEY (`Rid`) REFERENCES `roles` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Beloya','2fe432cb14fa1c3b33ea6156669648ce',NULL,'2018-06-15 00:00:00',0,NULL,0,1,'/images/10.jpg'),(2,2,'test','test',NULL,'2018-06-17 11:16:38',0,NULL,0,1,'0'),(3,4,'sa','c4ca4238a0b923820dcc509a6f75849b',0,'2018-07-11 08:54:40',0,'123@qq.com',3,1,'/images/MyT.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13 14:40:00
