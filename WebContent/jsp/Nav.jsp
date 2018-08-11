<%@page import="com.MyBlog.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<style type="text/css">
.Top{
background-image: url("<%=request.getContextPath()%>/images/${applicationScope.BlogInfo.headerskin}");

	z-index:10;
}
</style>
</head>
<body>
<% 
Users users=new Users();
if((users=(Users)session.getAttribute("user"))!=null){
	
}

%>
<ul class="layui-nav  MyNav">
<div class="layui-row">

  <li class="layui-nav-item layui-this" id="首页"><a href="<%=request.getContextPath()%>/">首页</a></li>
  <li class="layui-nav-item" id="归档"><a href="<%=request.getContextPath()%>/time_axis_1">归档</a></li>
  <li class="layui-nav-item" id="联系">
    <a href="javascript:;" >联系</a>
    <dl class="layui-nav-child">
      <dd><a href="mailto:468501955@qq.com?subject=加入后宫">申请友链</a></dd>
      <dd><a href="">有${applicationScope.ActiveNum}朋至远方来</a></dd>

    </dl>
  </li>
  <li class="layui-nav-item" id="留言板"><a href="<%=request.getContextPath()%>/hall/">留言板</a></li>
 <li class="layui-nav-item" id="实验室"><a href="<%=request.getContextPath()%>/test">实验室</a></li>



<shiro:guest>
  <li class="layui-nav-item" lay-unselect="" style="opacity:1;right:15px; float:right;margin-right:10%;">
<a href="${pageContext.request.contextPath}/login" style="opacity:1;float:right;">登录</a>
</li>

  <li class="layui-nav-item" lay-unselect="" style=" float:right;">
     
<a href="${pageContext.request.contextPath}/login#SignIn" style="opacity:1;float:right;" >注册</a>
</li>

</shiro:guest>&nbsp;
<shiro:notAuthenticated>
<shiro:user>       
  <li class="layui-nav-item" lay-unselect="" style="float:right;">
 <a href="javascript:;" >你好&nbsp;<shiro:principal/></a>
 <dl class="layui-nav-child">
  <dd><a style="cursor:pointer;"  onclick="QuickLogin();">快速登录</a></dd>
      <dd><a style="cursor:pointer;"  onclick="userChange();">切换</a></dd>
 </dl>
</li>
</shiro:user>&nbsp;
</shiro:notAuthenticated>
<shiro:authenticated>

   <li class="layui-nav-item" lay-unselect="" style="opacity:1; float:right;margin-right:10%;">
    <a href="javascript:;"><img src="<%=request.getContextPath() %><%=users.getUserImg() %>" class="layui-nav-img"><shiro:principal/></a>
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

<script
			src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>
				<script
			src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.bootstrap-autohidingnavbar.min.js"></script>
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
    //console.log(elem)
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