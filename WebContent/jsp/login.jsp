<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/signin.css" />

<link rel="stylesheet"
	href="./css/index.css"
	media="all" />
<style type="text/css">
.layui-icon{

border:none;
}
</style>
</head>
<body>

<%@ include file="Nav.jsp" %>

<div class="cont">
 <div class="app">

    <div class="app__bgimg">
      <div class="app__bgimg-image app__bgimg-image--1"> </div>
      <div class="app__bgimg-image app__bgimg-image--2"> </div>
    </div>
    <div class="app__img"> <img onmousedown="return false" src="./images/whiteTest4.png" alt="city"> </div>
    <!-- 登录 -->
       <shiro:notAuthenticated>
    <shiro:guest>
    <div class="app__text app__text--1">
    <form class="layui-form layui-form-pane" action="">
      <div class="app__text-line app__text-line--3" style="text-align:center;color:#0099CC;">登录 </div>
      <div class="app__text-line app__text-line--2"> 
  <div class="layui-form-item" style="font-size:12px;">
    <label class="layui-form-label"><i class="layui-icon ">&#xe66f;</i>   </label>
    <div class="layui-input-inline"> 
      <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    </div>
  </div>
 </div>
      <div class="app__text-line app__text-line--2">
      <div class="layui-form-item" style="font-size:12px;">
    <label class="layui-form-label"><i class="layui-icon ">&#xe673;</i>   </label>
    <div class="layui-input-inline">
      <input type="password" name="passWord" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div> </div>
    <div class="app__text-line app__text-line--2">
     <div class="layui-form-item" style="font-size:12px;">
      <div class="layui-input-line">
<input type="checkbox" name="RememberMe" title="记住我" >
   </div>
   </div>
   </div>
   <div class="app__text-line app__text-line--2">
   
   <button class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal" id="loginbtn" lay-submit="" lay-filter="SignOut"><i class="layui-icon ">&#xe609;</i>登录</button>
  </div>
      <div class="app__text-line app__text-line--1"><img src="./images/opus-attachment.png" alt=""></div>
      </form>
   
      <div class="app__text-line app__text-line--2">忘记密码？</div>
    </div>
    </shiro:guest>
    </shiro:notAuthenticated>
    <!-- 快速登录 -->
       <shiro:notAuthenticated>
<shiro:user>
   <div class="app__text app__text--1">

      <div class="app__text-line app__text-line--3" style="text-align:center;color:#0099CC;">快速登录</div>
          <div class="app__text-line app__text-line--3" style="text-align:center;color:#0099CC;">你好</div>
       <div class="app__text-line app__text-line--3" style="text-align:center;color:#0099CC;"><%=users.getUserName() %></div>

  <div class="app__text-line app__text-line--2">
    <button class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal" id="quickloginbtn" onclick="QuickLogin();" ><i class="layui-icon ">&#xe609;</i>快速登录</button>

     </div>
       </div>
</shiro:user>
</shiro:notAuthenticated>
<!-- 已登录 -->
    <shiro:authenticated>
    <div class="app__text app__text--1">

      <div class="app__text-line app__text-line--4" style="text-align:center;color:#0099CC;">欢迎 </div>
       <div class="app__text-line app__text-line--3"> <img src="<%=request.getContextPath() %>/<%=users.getUserImg() %>" class="layui-nav-img"><%=users.getUserName() %></div>

  <div class="app__text-line app__text-line--2">
     <a href="<%=request.getContextPath()%>/"><button class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal" ><i class="layui-icon ">&#xe609;</i>进入首页</button>
</a>
     </div>
       </div>
    </shiro:authenticated>
       <!-- 注册 -->
    <div class="app__text app__text--2 " id="Signin">
       <form class="layui-form layui-form-pane" action="">
      <div class="app__text-line app__text-line--3"  style="text-align:center;color:#0099CC;">注册</div>
      <div class="app__text-line app__text-line--2"> 
  <div class="layui-form-item" style="font-size:12px;">
    <label class="layui-form-label"><i class="layui-icon ">&#xe66f;</i>   </label>
    <div class="layui-input-inline">
      <input type="text" name="userName" id="userName" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    </div>
    
  </div>
   


 </div>
      <div class="app__text-line app__text-line--2">
      <div class="layui-form-item" style="font-size:12px;">
    <label class="layui-form-label"><i class="layui-icon ">&#xe673;</i>   </label>
    <div class="layui-input-inline">
      <input type="password" name="passWord" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div> </div>
     <div class="app__text-line app__text-line--2">
      <div class="layui-form-item" style="font-size:12px;">
    <label class="layui-form-label"><i class="layui-icon ">&#xe673;</i>   </label>
    <div class="layui-input-inline">
      <input type="password" name="SamepassWord" lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input">
    </div>
  </div> </div>
   <div class="app__text-line app__text-line--2">
      <div class="layui-form-item" style="font-size:12px;">
    <label class="layui-form-label"><i class="layui-icon ">&#xe63c;</i>   </label>
    <div class="layui-input-inline">
      <input type="text" name="Email" lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
    </div>
  </div> </div>
   <div class="app__text-line app__text-line--2">
   <button class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal" lay-submit="" id="SigInbtn" lay-filter="SigInbtn"><i class="layui-icon ">&#xe756;</i>注册</button>
  </div>
      <div class="app__text-line app__text-line--1"><img src="img/opus-attachment.png" alt=""></div>
      </form>
 
      <div class="app__text-line app__text-line--2">已有账号？</div>
      <div class="app__text-line app__text-line--1"><img src="./images/opus-attachment.png" alt=""></div>
    </div>

  </div>
  </div>

<script src="<%=request.getContextPath() %>/js/jquery-2.1.1.min.js"></script> 
<script src="<%=request.getContextPath() %>/js/activate-power-mode.js"
			charset="utf-8"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/signin.js"></script>
<script type="text/javascript">
POWERMODE.colorful = true; // ture 为启用礼花特效 
POWERMODE.shake = false; // false 为禁用震动特效
document.body.addEventListener('input', POWERMODE);

layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  form.on('submit(SignOut)', function(data){
		$("#loginbtn").html("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
		$("#loginbtn").addClass("layui-btn-disabled");

		    $.ajax({ 
		    	url: "<%=request.getContextPath()%>/SignOut", 
		    	type:'POST',
		    	data:'UserName='+data.field.username+'&PassWord='+data.field.passWord+'&RememberMe='+data.field.RememberMe,
                     success: function(result){
                    	 
         if(result.code!="0"){
        	 layer.msg(result.Msg, {
       		  icon: 5,
       		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
       		}, function(){
       		  
       		});  
                    
                    		$("#loginbtn").html("<i class='layui-icon'>&#xe609;</i>登录");
                    		$("#loginbtn").removeClass("layui-btn-disabled");
         }
         if(result.code=="0"){
             if(result.preUrl==undefined||result.preUrl=='undefined'){
      window.location.href="<%=request.getContextPath()%>/";
           
}else{

      }
             
         }
         else{
        		console.log(result);
        	  	 layer.msg(result.msg, {
        	  		  icon: 5,
        		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
        		}, function(){
        			$("#loginbtn").html("登录");
        			$("#loginbtn").removeClass("layui-btn-disabled");
        		}); 
         }
		      }});
		    return false;
		  });
	  

	  
	  form.on('submit(SigInbtn)', function(data){
	
			$("#SigInbtn").html("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
			$("#SigInbtn").addClass("layui-btn-disabled");

			    $.ajax({ 
			    	url: "<%=request.getContextPath()%>/SignIn", 
			    	type:'POST',
			    	data:data.field,
	                     success: function(result){
	         if(result.code!="0"){
	        	 layer.msg(result.Msg, {
	       		  icon: 5,
	       		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	       		}, function(){
	       			$("#loginbtn").html("登录");
	       			$("#loginbtn").removeClass("layui-btn-disabled");
	       		});  
	                    
	                    		$("#SigInbtn").html("<i class='layui-icon'>&#xe609;</i>登录");
	                    		$("#SigInbtn").removeClass("layui-btn-disabled");
	         }
	         if(result.code=="0"){
	      window.location.href="<%=request.getContextPath()%>/index"
	}
	         else{
	        	 layer.msg(result.msg, {
		       		  icon: 5,
	   		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	   		}, function(){
	   	
	   		}); 
	         }
			      }});
		    return false;
		  });
	  
	  
});


function QuickLogin(){
	$("#quickloginbtn").html("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
	$("#quickloginbtn").addClass("layui-btn-disabled");
  $.ajax({ 
    	url: "<%=request.getContextPath()%>/QuickLogin", 
    	type:'POST',
    	 success: function(result){
    		 if(result.code!="0"){
    			 layer.Msg(result.msg, {
	        		  icon: 5,
	        		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	        		}, function(){
	        		
	        		});  
            
            		$("#quickloginbtn").html("<i class='layui-icon'>&#xe609;</i>登录");
            		$("#quickloginbtn").removeClass("layui-btn-disabled");
 }
 if(result.code=="0"){
window.location.href="<%=request.getContextPath()%>/"
} 
    	 }
    	 });
}
</script>
</body>
</html>