<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台登录</title>
<link href="plugins/bootstrap-3.3.0/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css"
	rel="stylesheet" />
<link href="plugins/waves-0.7.5/waves.min.css" rel="stylesheet" />
<link href="plugins/checkbix/css/checkbix.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/signin1.css"
	rel="stylesheet">
<script src="plugins/jquery.1.12.4.min.js"></script>
<script src="plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="plugins/waves-0.7.5/waves.min.js"></script>
<script src="plugins/checkbix/js/checkbix.min.js"></script>
<script src="<%=request.getContextPath() %>/js/signin1.js"></script>
<title>后台登录</title>
</head>
<body>
	<%
String CuserName="";
	Cookie[] cookies=request.getCookies();
	if(session.getAttribute("userName")==null&&cookies!=null){
					for(Cookie cookie:cookies)
					{
					
							System.out.println(cookie.getName());
							if(cookie.getName().equals("CpassWord")){
							%><script type="text/javascript">  window.location.replace("<%=request.getContextPath()%>/dologin.html");  
				</script>
	<% 
							}
					}
				
		
					
				}%>
	<div id="login-window">
		<form name="loginform" id="loginform" action="<%=request.getContextPath()%>/dologin.html"
			method="post">
			<div class="input-group m-b-20">
				<span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
				<div class="fg-line">
					<input id="userName" type="text" class="form-control"
						name="userName" placeholder="帐号" required autofocus
						value="<%=CuserName%>">
				</div>
			</div>
			<div class="input-group m-b-20">
				<span class="input-group-addon"><i class="zmdi zmdi-male"></i></span>
				<div class="fg-line">
					<input id="passWord" type="password" class="form-control"
						name="passWord" placeholder="密码" required value="">
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="checkbox">
				<input id="remenber" style="width: 10em;" type="checkbox"
					class="checkbix" data-text="自动登录" name="remenber">
			</div>
			<a id="login-bt" class="waves-effect waves-button waves-float"
				onclick="dologin();"><i class="zmdi zmdi-arrow-forward"></i></a>


		</form>
		<%
if(session.getAttribute("errorMsg")!=null){ %>
		<div class="alert alert-warning">
			<a href="#" class="close" data-dismiss="alert"> &times; </a> <strong>警告！</strong>${errorMsg}
		</div>

	</div>
	<%} 
%>
	<script type="text/javascript">

document.onkeydown = function(e){
	   if(!e){
	    e = window.event;
	   }

	   if((e.keyCode || e.which) == 13){
		   dologin();
	   }
	   }
function dologin(){
	
	document.loginform.submit();
	
}

</script>
</body>
</html>