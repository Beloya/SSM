<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://kyfw.12306.cn/otn/resources/merged/queryLeftTicket_end_css.css?cssVersion=1.9049"
	media="all" />

<title>Insert title here</title>
</head>
<body>
<div style="top: 0px; left: 20px; display: block;" class="modal-login">
<!--  仅显示账户登录添加样式login-box-account，验证码隐藏添加样式 login-box-account-nocode -->
<div class="login-box"><ul class="login-hd" style="list-style: none;">
<li class="login-hd-account active"><a href="javascript:;" shape="rect">账号登录</a>
</li>
</ul>
<div class="login-bd"><!-- 扫码登录 -->
<!-- 账号登录 -->
<div class="login-account" style=""><div class="login-item"><label for="user" class="item-label"><i class="icon icon-user"></i>
</label>
<input type="text" class="input" id="J-userName" placeholder="用户名／邮箱／手机号">
</div>
<div class="login-item"><label for="pwd" class="item-label"><i class="icon icon-pwd"></i>
</label>
<input type="password" class="input" id="J-password" placeholder="密码">
</div>
<div class="login-pwd-code"><!-- 验证码区域 -->
<div style="border: 0; width: 300px; height: 188px; margin: 0 10px;" class="touclick-wrapper lgcode-2018"><div class="lgcode-error" style="display: none;"></div>
<div class="lgcode-success" style="display: none;"></div>
<div id="lgcode-refresh" class="lgcode-refresh"></div>
<div id="J-loginImgArea" class="loginImg"><img id="J-loginImg" class="imgCode" alt="" src="data:image/jpg;base64,${verifyImg}" style="display: inline;">
</div>
<div id="J-passCodeCoin">
<!--div randcode="1,8" class="lgcode-active" style="top: 24px; left: -12px;"></div-->
</div>

</div>
</div>
<div class="login-error" id="J-login-error" style="display: none;"><i class="icon icon-plaint-fill"></i>
<span>用户名或密码输入错误</span>
</div>
<div class="login-btn"><a id="J-login" href="javascript:;" class="btn btn-primary form-block" shape="rect">立即登录</a>
</div>
<div class="login-txt"><a href="https://kyfw.12306.cn/otn/regist/init" class="txt-primary" shape="rect">注册12306账号</a>
 | <a href="https://kyfw.12306.cn/otn/forgetPassword/initforgetMyPassword" class="txt-lighter" shape="rect">忘记密码？</a>
</div>
</div>
</div>
<div class="login-ft"><p>1、12306.cn网站每日06:00~23:00提供服务。</p>
<p>2、在12306.cn网站购票、改签和退票须不晚于开车前30分钟；办理“变更到站”业务时，请不晚于开车前48小时。</p>
</div>
</div>
</div>
<script
			src="https://cdn.staticfile.org/jquery/2.2.3/jquery.min.js"></script>
			<script type="text/javascript">
			var verifypostion;
			$(document).ready(function(){
			$("#lgcode-refresh").click(function(){
				getverify();
				
			});
			$("#J-loginImg").click(function(e){
				var y=e.pageY-$(this).offset().top-30;
		        var x=e.pageX-$(this).offset().left;
$("#J-passCodeCoin").append('<div id="codeConind" randcode="'+x+','+y+'" class="lgcode-active" style="top:'+(y+15)+'px; left: '+(x-12)+'px;z-index:9;"></div>');
		        console.log("x:"+x+" "+"y:"+y);
			});
			
			$("#J-passCodeCoin").on('click','#codeConind',function(){
				$(this).remove();
				
			});
			$("#J-login").click(function(){
				var username=$("#J-userName").val();
				var password=$("#J-password").val();
				var codeCoin="";
				$("div[id=codeConind]").each(function(){
					if(codeCoin!="")
						codeCoin+=",";
					codeCoin+=$(this).attr("randcode");
				
				});
				 $.ajax({ 
			    	  	url: "<%=request.getContextPath()%>/traincheckverify", 
			    	  	type:'POST',
			    	  	data:'userName='+username+'&passWord='+password+'&answer='+codeCoin,
			    	           success: function(result){
			    	        	   console.log(result);
			    	        	if(result.result_code=="4"){
			    	        		 $.ajax({ 
			    				    	  	url: "<%=request.getContextPath()%>/trainLogin", 
			    				    	  	type:'POST',
			    				    	  	data:'userName='+username+'&passWord='+password+'&answer='+codeCoin,
			    				    	           success: function(result){
			    				    	        	   console.log(result);
			    				    	        	   if(result.result_code==0){
			    				    	        		   parent.layer.closeAll('iframe');
			    				    	        	   }
			    				    	        	   else{
			    				    	        		   $("#J-login-error").find("span").text(result.result_message);
			    				    	        		   $("#J-login-error").attr("style","display:block");
			    				    	        		   getverify();
			    				    	        		   $("#J-passCodeCoin").html("");
			    				    	        	   }
			    				    	        	   
			    				    	           }
			    	        		 });
			    	        	}
			    	        	else{
			    	        		getverify();
			    	        		   $("#J-passCodeCoin").html("");
			    	        	}
			    	        	
			    	        	
			    	           }
			    	           });
			});
			
			
			function getverify(){
				 $.ajax({ 
			    	  	url: "<%=request.getContextPath()%>/trainGetverifyImg", 
			    	  	type:'POST',
			    	           success: function(result){
			    	        	   if(result.code==0){
			    	        		
			    	        		   $("#J-loginImg").attr("src","data:image/jpg;base64,"+result.verifyImg);
			    	        	   }
			    	           }
			    	           });
				
			}
			
			//document.ready
			});
			</script>
</body>
</html>