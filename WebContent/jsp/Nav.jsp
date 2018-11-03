<%@page import="com.MyBlog.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="referrer" content="never">
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Nav.css"
	media="all" />

	<link rel="stylesheet" href="http://cdn.staticfile.org/fakeLoader.js/1.1.0/fakeLoader.css">
<style type="text/css">
.Top{
background-image: url("${applicationScope.BlogInfo.headerskin}");                       
  
	z-index:10;
}
.layui-nav  .layui-nav-more{
border-color:#333 transparent transparent
}
.layui-nav .layui-nav-mored, .layui-nav-itemed>a .layui-nav-more{
border-color:transparent transparent #333;
}


#SearchForm{
  position: absolute;
  margin: auto;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 300px;
  height: 100px;
}



.search_container {
  position: absolute;
  margin: auto;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 300px;
  height: 100px;
}
.search_container .search {
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width:40px;
  height:40px;
  background: white;
  opacity:0.3;
  border-radius: 50%;
  transition: all 1s;
  z-index: 4;

  box-shadow: 0 0 25px 0 rgba(0, 0, 0, 0.2);
  	-webkit-animation-timing-function:ease-in-out;
	-webkit-animation-name:search;
	-webkit-animation-duration:3600ms;
	-webkit-animation-iteration-count:infinite;
	-webkit-animation-direction:alternate;
}
@-webkit-keyframes search {
	0% {
	opacity:.8;
	box-shadow:0 1px 2px rgba(255,255,255,0.1);
}
100% {
	opacity:1;
	box-shadow:0 1px 15px rgba(0,0,0,0.6);
}
}
.search_container .search:hover {
  cursor: pointer;
    background: white;
  opacity:1;
}
.search_container .search::before {
  content: "";
  position: absolute;
  margin: auto;
  top: 16px;
  right: 0;
  bottom: 0;
  left: 16px;
  width: 12px;
  height: 2px;
  background: skyblue;
  transform: rotate(45deg);
  transition: all .5s;
}

.search_container .search::after {
  content: "";
  position: absolute;
  margin: auto;
  top: -5px;
  right: 0;
  bottom: 0;
  left: -5px;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  border: 2px solid skyblue;
  transition: all .5s;
}
.search_container input {
  font-family: 'Inconsolata', monospace;
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width: 20px;
  height: 50px;
  outline: none;
  border: none;
  background: white;
  color: #333;
  text-shadow: 0 0 10px white;
  padding: 0 80px 0 20px;
  border-radius: 30px;
  box-shadow: 0 0 25px 0 white, 0 20px 25px 0 rgba(0, 0, 0, 0.2);
  transition: all 1s;
  opacity: 0;
  z-index: 5;
  font-weight: bolder;
  letter-spacing: 0.1em;
}
.search_container input:hover {
  cursor: pointer;
}
.search_container input:focus {
  width: 200px;
  opacity: 1;
  cursor: text;
}
.search_container input:hover ~ .search{
 opacity:1;
}
.search_container input:hover ~ .search::before {
  background: skyblue;
}
.search_container input:hover ~ .search::after  {
  border: 2px solid skyblue;
}
.search_container input:focus ~ .search {
  right: -250px;
  background: white;
   opacity:1;
  z-index: 6;

}
.search_container input:focus ~ .search::before {
  top: 0;
  left: 0;
     opacity:1;
  width: 25px;
  
}
.search_container input:focus ~ .search::after {
  top: 0;
  left: 0;
  width: 25px;
  height: 2px;
  border: none;
  background: skyblue;
  border-radius: 0%;
  transform: rotate(-45deg);
}
.search_container input::placeholder {
  color: white;
  opacity: 0.5;
  font-weight: bolder;
}

</style>
</head>
<body>
<% 

Subject subject = SecurityUtils.getSubject();
Users users=null;
if(request.getSession()!=null&&request.getSession().getAttribute("user")!=null){
	users=(Users)request.getSession().getAttribute("user");
}
%>
<c:set var="Calendar" value="${applicationScope.Calendar}"></c:set>
<c:set var="Calendar_Year" value="1"></c:set>
<c:set var="Calendar_MONTH" value="2"></c:set>
<c:set var="Calendar_DAY_OF_MONTH" value="5"></c:set>
<c:set var="Calendar_HOUR_OF_DAY" value="11"></c:set>
<c:set var="Calendar_MINUTE" value="12"></c:set>
<c:set var="Calendar_SECOND" value="13"></c:set>


<ul class="layui-nav  MyNav">
<div class="layui-row">
<c:forEach items="${applicationScope.MenuLink}" var="menulink">
<c:if test="${menulink.pmId==0 }">

<c:if test="${menulink.pmenu.size()!=0 }">
 <li class="layui-nav-item" id="${menulink.name }">
 <a href="${menulink.link}">${menulink.name }</a>
   <dl class="layui-nav-child">
<c:forEach items="${menulink.pmenu }" var="chilmenu">
  <dd><a <c:if test="${chilmenu.isblank==1}"> target='_BLANK' </c:if>  href='<c:if test="${chilmenu.isthis==0 }"><%=request.getContextPath()%></c:if>${chilmenu.link}'>${chilmenu.name }</a></dd>
  </c:forEach>
  </dl>
  </li>
  </c:if>
 <c:if test="${menulink.pmenu.size()==0  }">
  <li class="layui-nav-item" id="${menulink.name }">
  <a <c:if test="${menulink.isblank==1}"> target='_BLANK' </c:if> href='<c:if test="${menulink.isthis==0 }"><%=request.getContextPath()%></c:if>${menulink.link}'>${menulink.name }</a>
  </li>
 </c:if>
 
 </c:if>
  </c:forEach>
  <form id="SearchForm" action="http://www.google.com/search" method="get" target="_blank">  
<div class="search_container">
  <input id="Search_In" name="q" type="text" placeholder="搜索">
    <input name="ie" value="UTF-8" type="hidden" />  
    <input name="sitesearch" value="iyo.red" type="hidden" />  
  <div class="search"></div>
</div>
</form>  
<shiro:guest>
  <li class="layui-nav-item" lay-unselect="" style="opacity:1;right:15px; float:right;margin-right:10%;">
<a href="${pageContext.request.contextPath}${applicationScope.FoundLink['登录'].link }" style="opacity:1;float:right;">登录</a>
</li>

  <li class="layui-nav-item" lay-unselect="" style=" float:right;">
     
<a target="_BLANK" href="${pageContext.request.contextPath}${applicationScope.FoundLink['注册'].link }" style="opacity:1;float:right;" >注册</a>
</li>

</shiro:guest>&nbsp;
<shiro:notAuthenticated>
<shiro:user>       
  <li class="layui-nav-item" lay-unselect="" style="float:right;">
 <a href="javascript:;" ><img src="<%=request.getContextPath() %><shiro:principal property="userImg"/>" class="layui-nav-img"><shiro:principal property="userName"/></a>
 <dl class="layui-nav-child">
  <dd><a style="cursor:pointer;"  onclick="QuickLogin();">快速登录</a></dd>
      <dd><a style="cursor:pointer;"  onclick="userChange();">切换</a></dd>
 </dl>
</li>
</shiro:user>&nbsp;
</shiro:notAuthenticated>
<shiro:authenticated>

   <li class="layui-nav-item" lay-unselect="" style="opacity:1; float:right;margin-right:10%;">
    <a href="javascript:;"><img src="<%=request.getContextPath() %><%=users.getUserImg() %>" class="layui-nav-img"><%=users.getUserName() %></a>
    <dl class="layui-nav-child">
      <dd><a href="javascript:;">修改信息</a></dd>
      <shiro:hasAnyRoles name="管理员,博主"> 
      <dd><a href="<%=request.getContextPath() %>/Newarchives">发布</a></dd>
    </shiro:hasAnyRoles>
      <dd><a onclick="LogOut();">注销</a></dd>
    </dl>
  </li>

</shiro:authenticated>

</div>

</ul>  

<div class="sidebar"></div>
<div class="fakeloader" style=" ">
</div>
<script
			src="https://cdn.staticfile.org/jquery/2.2.3/jquery.min.js"></script>
				<script
			src="https://cdn.staticfile.org/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"></script>
<script src="http://cdn.staticfile.org/bootstrap-autohidingnavbar/4.0.0/jquery.bootstrap-autohidingnavbar.min.js"></script>
<script src="http://cdn.staticfile.org/fakeLoader.js/1.1.0/fakeLoader.min.js"></script>
<script type="text/javascript">

$(".fakeloader").fakeLoader({
	//加载效果的持续时间
	  zIndex:"999",//
	  spinner:"spinner1",//可选值 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 对应有7种效果
	  bgColor:"#3385ff" ,//加载时的背景颜色
	 
	});
</script>
<script  type="text/javascript">

$(document).ready(function(){
	$("head").append("<link rel='icon' href='<%=request.getContextPath() %>/img/favicon.ico' type='image/x-icon' /> <link rel='shortcut icon' href='<%=request.getContextPath() %>/img/favicon.ico' type='image/x-icon'/> <link rel='bookmark' href='<%=request.getContextPath() %>/img/favicon.ico' type='image/x-icon' />");
});
$(".MyNav").autoHidingNavbar({

});
layui.use(['element','layer'], function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  var layer = layui.layer;
  //监听导航点击  
  element.on('nav(demo)', function(elem){

  });
  


//搜索窗口
$("#Search_In").keypress(function(e){
    if(e.which == 13) {  
    	$("#SearchForm").submit(function(e){
    	 
    	  });
    	/*var index = layer.open({
    		  type: 2,
    		  content: 'http://layim.layui.com',
    		  area: ['320px', '195px'],
    		  maxmin: true
    		});*/
    	
    }
});
});
function LogOut(){
	$.ajax({
		url:'<%=request.getContextPath()%>/LogOut', 
		type:'post',
			   success: function(result){
			if(result.code="0"){
				location.reload();
			}
			else{
				 layer.alert(JSON.stringify(result), {
	       		      title: '返回信息'
	       		    });
			}
		}
		
	});
}
function userChange(){
	$.ajax({
		url:'<%=request.getContextPath()%>/LogOut',
		type:'post',
			   success: function(result){
			if(result.code=="0"){
				location.href="<%=request.getContextPath()%>/login";
			}
			else{
				 layer.alert(JSON.stringify(result), {
	       		      title: '返回信息'
	       		    });
			}
		}
		
	});
}
function QuickLogin(){
	$("#quickloginbtn").html("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
	$("#quickloginbtn").addClass("layui-btn-disabled");
  $.ajax({ 
    	url: "<%=request.getContextPath()%>/QuickLogin", 
    	type:'POST',
    	 success: function(result){
    		 if(result.code!="0"){
            	 layer.alert(JSON.stringify(result), {
       		      title: '返回信息'
       		    });
            
            		$("#quickloginbtn").html("<i class='layui-icon'>&#xe609;</i>登录");
            		$("#quickloginbtn").removeClass("layui-btn-disabled");
 }
 if(result.code=="0"){
location.reload();
} 
    	 }
    	 });
}
$(function(){
    var Rightsidebar = $(".sidebar");
  
	var MenuPosition = Rightsidebar.offset().top;
	var before=0;
	var headflag=1,Downflag=1,Upflag=1;
	$(window).scroll(function(){
	var scrollTop = $(window).scrollTop();
	var screenH=$(window).height();
	var divH=Rightsidebar.height();
	if(scrollTop>390){
		headflag=1;
		if((scrollTop>before)&&Downflag!=0){
		//	$('.MyNav').attr('style','background-color:hsla(0,0%,10%,.4)')
			//$('.MyNav').fadeOut();
			Downflag=0;Upflag=1; 
	}
		if((scrollTop<before)&&Upflag!=0){
			//$('.MyNav').fadeIn();
			Downflag=1;
			Upflag=0;
	}
	if((screenH-divH-scrollTop)<100){
	var offsetTop = MenuPosition + $(window).scrollTop()-300+"px";
	
	Rightsidebar.attr("style","z-index:0;top:"+offsetTop);
	}
	}
	if(scrollTop<=390&&headflag!=0){
		flag=0;
		Rightsidebar.animate({top:0},{duration:1,queue:false});
	//	$('.MyNav').attr('style','')
		//$('.MyNav').fadeIn();
		Rightsidebar.attr("style","z-index:0;top:"+offsetTop);
	}
	before=scrollTop;
	})
    
	});
</script>

</body>
</html>