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
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/Nav.css"
	media="all" />
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://libs.cdnjs.net/fakeLoader.js/1.1.0/fakeLoader.css">
<style type="text/css">
.Top{
background-image: url("<%=request.getContextPath()%>/images/${applicationScope.BlogInfo.headerskin}");

	z-index:10;
}
.layui-nav  .layui-nav-more{
border-color:#333 transparent transparent
}
.layui-nav .layui-nav-mored, .layui-nav-itemed>a .layui-nav-more{
border-color:transparent transparent #333;
}

</style>
</head>
<body>
<% 

Subject subject = SecurityUtils.getSubject();
Users users=null;
if(subject.getSession()!=null&&subject.getSession().getAttribute("user")!=null){
	users=(Users)subject.getSession().getAttribute("user");
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
			src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>
				<script
			src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.bootstrap-autohidingnavbar.min.js"></script>
<script src="https://libs.cdnjs.net/fakeLoader.js/1.1.0/fakeLoader.min.js"></script>
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
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击  
  element.on('nav(demo)', function(elem){
   
    layer.msg(elem.text());
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
				console.log("错误");
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
				console.log("错误");
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
    		 if(result.code=="1"){
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