<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>御坂电网</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/WeChat/amazeui.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/WeChat/main.css" />
</head>

<body>
 <%@ include file="../Nav.jsp"%>
 <% 
 String userName;
 String userImg;
 if(users!=null){
 userName=users.getUserName();
userImg=users.getUserImg();
}
else{
	userName=(String)request.getAttribute("chatName");
	 userImg="/images/MyT.jpg";
}%>
<div class="box">
	<div class="wechat">
		
		<div class="sidestrip">
			<div class="am-dropdown" data-am-dropdown>
				<!--头像插件-->
				<div id="me_headImg" class="own_head am-dropdown-toggle" style="background: url(<%=request.getContextPath() %><%=userImg %>);background-size:100%;"></div>
				<div class="am-dropdown-content">
					<div class="own_head_top">
						<div class="own_head_top_text">



							
				 
<p class="own_name"><%=userName %><img src="<%=request.getContextPath() %>/images/icon/head.png" alt="" /></p>
							<p class="own_numb"><% if(users!=null){ %><%=users.getEmail()%><%}else{ %> HelloWorld<% }%></p>
					
						</div>
				
						<img src="<%=request.getContextPath() %><%=userImg%>" alt="" />
					
					</div>
					<div class="own_head_bottom">
						<p><span></span></p>
						<div class="own_head_bottom_img">
							<a href=""><img src="images/icon/head_1.png"/></a>
							<a href=""><img src="images/icon/head_2.png"/></a>
						</div>
					</div>
				</div>
			</div>
			<!--三图标-->
			<div class="sidestrip_icon">
				<a id="si_1" style="background: url(images/icon/head_2_1.png) no-repeat;"></a>
				<a id="si_2"></a>
				<a id="si_3"></a>
			</div>
			
			<!--底部扩展键-->
			<div id="doc-dropdown-justify-js">
				<div class="am-dropdown" id="doc-dropdown-js" style="position: initial;">
					<div class="sidestrip_bc am-dropdown-toggle"></div>
					<ul class="am-dropdown-content" style="">
						<li>
							<a href="#" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 225}">意见反馈</a>
							<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
							  <div class="am-modal-dialog">
								<div class="am-modal-hd">Modal 标题
								  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
								</div>
								<div class="am-modal-bd">
								  Modal 内容。本 Modal 无法通过遮罩层关闭。
								</div>
							  </div>
							</div>
						</li>
						
						<li><a href="#">备份与恢复</a></li>
						<li><a href="#">设置</a></li>
					</ul>
				</div>	
			</div>	
		</div>
		
		<!--聊天列表-->
		<div class="middle on">
			<div class="wx_search">
				<input type="text" placeholder="搜索"/>
				<button>+</button>
			</div>
			<div class="office_text">
				<ul id="user_list" class="user_list">
					<li class="user_active">
						<div class="user_head"><img src="images/head/9.jpg"/></div>
						<div class="user_text">
							<p class="user_name">杀猪群</p>
							<p class="user_message"> </p>
						</div>
						<div class="user_time"></div>
					</li>
				<!-- li>
						<div class="user_head"><img src="images/head/2.jpg"/></div>
						<div class="user_text">
							<p class="user_name">夏继涛</p>
							<p class="user_message">[小程序]</p>
						</div>
						<div class="user_time">上午 11：03</div>
					</li-->
				</ul>
			</div>	
		</div>
		
		<!--好友列表-->
		<div class="middle">
			<div class="wx_search">
				<input type="text" placeholder="搜索"/>
				<button>+</button>
			</div>
			<div class="office_text">
				<ul class="friends_list">
					<li>
						<p>新的朋友</p>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/1.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">新的朋友</p>
							</div>
						</div>
					</li>
					<li>
						<p>公众号</p>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/2.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">公众号</p>
							</div>
						</div>
					</li>
					<li>
						<p>A</p>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/3.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">彭于晏丶plus</p>
							</div>
						</div>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/4.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">陈依依</p>
							</div>
						</div>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/5.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">毛毛</p>
							</div>
						</div>
					</li>
					<li>
						<p>B</p>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/6.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">苏笑言</p>
							</div>
						</div>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/7.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">往事不再提</p>
							</div>
						</div>
					</li>
					<li>
						<p>C</p>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/8.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">夏继涛</p>
							</div>
						</div>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/9.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">早安无恙</p>
							</div>
						</div>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/10.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">王鹏</p>
							</div>
						</div>
					</li>
					<li>
						<p>D</p>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/11.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">涨了潮了</p>
							</div>
						</div>
						<div class="friends_box">
							<div class="user_head"><img src="images/head/12.jpg"/></div>
							<div class="friends_text">
								<p class="user_name">Ktz丶中融资</p>
							</div>
						</div>
					</li>
				</ul>
			</div>	
		</div>
		
		<!--程序列表-->
		<div class="middle">
			<div class="wx_search">
				<input type="text" placeholder="搜索收藏内容"/>
				<button>+</button>
			</div>
			<div class="office_text">
				<ul class="icon_list">
					<li class="icon_active">
						<div class="icon"><img src="images/icon/icon.png" alt="" /></div>
						<span>全部收藏</span>
					</li>
					<li>
						<div class="icon"><img src="images/icon/icon1.png" alt="" /></div>
						<span>链接</span>
					</li>
					<li>
						<div class="icon"><img src="images/icon/icon2.png" alt="" /></div>
						<span>相册</span>
					</li>
					<li>
						<div class="icon"><img src="images/icon/icon3.png" alt="" /></div>
						<span>笔记</span>
					</li>
					<li>
						<div class="icon"><img src="images/icon/icon4.png" alt="" /></div>
						<span>文件</span>
					</li>
					<li>
						<div class="icon"><img src="images/icon/icon5.png" alt="" /></div>
						<span>音乐</span>
					</li>
					<li>
						<div class="icon"><img src="images/icon/icon6.png" alt="" /></div>
						<span>标签</span>
					</li>
				</ul>
			</div>	
		</div>
	
		<!--聊天窗口-->
		<div class="talk_window">
			<div class="windows_top">
				<div class="windows_top_box">
					<span>早安无恙</span>
					<ul class="window_icon">
						<li><a href=""><img src="images/icon/icon7.png"/></a></li>
						<li><a href=""><img src="images/icon/icon8.png"/></a></li>
						<li><a href=""><img src="images/icon/icon9.png"/></a></li>
						<li><a href=""><img src="images/icon/icon10.png"/></a></li>
					</ul>
					<div class="extend" class="am-btn am-btn-success" data-am-offcanvas="{target: '#doc-oc-demo3'}"></div>
					<!-- 侧边栏内容 -->
					<div id="doc-oc-demo3" class="am-offcanvas">
						<div class="am-offcanvas-bar am-offcanvas-bar-flip">
							<div class="am-offcanvas-content">
								<p><a href="http://music.163.com/#/song?id=385554" target="_blank">网易音乐</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--聊天内容-->
			<div class="windows_body">
				<div class="office_text" style="height: 100%;">
					<ul class="content" id="chatbox">
						<!--li class="me"><img src="images/own_head.jpg" title="金少凯"><span>疾风知劲草，板荡识诚臣</span></li-->
						<li class="other"><img src="images/head/9.jpg" title="杀猪刀"><span>Hello World!</span></li>
					</ul>
				</div>
			</div>
			
			<div class="windows_input" id="talkbox">
				<div class="input_icon">
					<a href="javascript:;"></a>
					<a href="javascript:;"></a>
					<a href="javascript:;"></a>
					<a href="javascript:;"></a>
					<a href="javascript:;"></a>
					<a href="javascript:;"></a>
				</div>
				<div class="input_box">
					<textarea name="" rows="" cols="" id="input_box"></textarea>
					<button id="send">发送（S）</button>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="<%=request.getContextPath() %>/js/WeChat/amazeui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/WeChat/zUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/WeChat/wechat.js"></script>
<script src="http://cdn.staticfile.org/Base64/1.0.1/base64.min.js"></script>
<script type="text/javascript">
layui.use(['form', 'layedit', 'laydate'], function(){

	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	
		 
var userImg;
var userName;
var userSession;
var MSG_CODE="#MSG#";
var INIT_LOAD_CODE="#ILC#";
var NEW_LOAD_CODE="#NLC#";
var SUB_LOAD_CODE="#SLC#";
var FRIEND_CHAT_CODE="#FCC#";
var SYS_MSG_CODE="#SMC#";
var SYS_PEPOLENUM_CODE="#SPC#";
var SYS_ERR_CODE="#SEC#";
userName='<%=userName%>'.trim();
userImg='<%=userImg %>'.trim();


userImg=window.btoa(userImg);
userSession=window.btoa('<%=request.getSession().getId()%>');
var websocket = null;
if ('WebSocket' in window) { 
    websocket = new WebSocket("ws://127.0.0.1:8080/MyBlog1/websocket/"+userName.trim()+"/"+userSession+"/"+userImg);
} 
else {
    alert("对不起！你的浏览器不支持webSocket");
}
websocket.onerror = function () {

	 layer.alert('连接失败', {icon: 2});
  //  setMessageInnerHTML("error");
};
//连接成功建立的回调方法
websocket.onopen = function (event) {
	 layer.alert('已进入聊天', {icon: 1});
//	alert("加入连接");
   //setMessageInnerHTML("加入连接");
};
//接收到消息的回调方法
websocket.onmessage = function (event) {
	var data=event.data;
	var code=data.substring(0,5);
	var result=data.substring(6,data.length-1);
	switch(code){
	case MSG_CODE:
 var index=result.indexOf("=");

			var myUserName=result.substring(0,index); 
			if(userName.trim()!=myUserName){
			var myUserImg=$("#"+myUserName).attr("head");
			var mycontext=result.substring(index+1);
$("#chatbox").append('<li class="other"><img src="<%=request.getContextPath()%>/'+myUserImg+'" title="'+myUserName+'"><span>'+mycontext+'</span></li>');
			}
	
		break;
	case INIT_LOAD_CODE:
		var users=result.split(",");
		for(var i=0;i<users.length;i++)
			{
			var user=users[i].split("=");
			var myUserName=user[0]; 
			var myUserImg=user[1];
$("#user_list").append('<li id="'+myUserName.trim()+'" head="'+myUserImg+'"><div class="user_head"><img src="<%=request.getContextPath()%>'+myUserImg+'"/></div><div class="user_text"><p class="user_name">'+myUserName+'</p><p class="user_message">[恭喜发财]</p></div><div class="user_time"></div></li>');
			console.log(myUserName);
			}

		break;
	case NEW_LOAD_CODE:
		var users=result.split(",");
		for(var i=0;i<users.length;i++)
			{
			var user=users[i].split("=");
			var myUserName=user[0]; 
			var myUserImg=user[1];
$("#user_list").append('<li id="'+myUserName.trim()+'" head="'+myUserImg+'"><div class="user_head"><img src="<%=request.getContextPath()%>'+myUserImg+'"/></div><div class="user_text"><p class="user_name">'+myUserName+'</p><p class="user_message">[恭喜发财]</p></div><div class="user_time"></div></li>');
			
			}
		break;
	case SUB_LOAD_CODE:
		var users=result.split(",");
		for(var i=0;i<users.length;i++)
			{
			var user=users[i].split("=");
			var myUserName=user[0]; 
			var myUserImg=user[1];
			console.log(myUserName);
$("li[id="+myUserName+"]").remove();
			}
		break;
	case FRIEND_CHAT_CODE:
		
		break;
	case SYS_MSG_CODE:
		
		break;
	case SYS_PEPOLENUM_CODE:
		
		break;
	case SYS_ERR_CODE:
		var SYSERROMSG=result.split("=");
		 layer.alert(SYSERROMSG[1], {icon: 2});
		break;
	}
	console.log(event.data);
   // setMessageInnerHTML(event.data);
};
//连接关闭的回调方法
websocket.onclose = function () {
	 layer.alert('断开连接', {icon: 2});
//	alert("断开连接");
   // setMessageInnerHTML("断开连接");
};
//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，
// 防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function () {
	 websocket.close();
	return false;
};
//关闭连接
function closeWebSocket() {
    websocket.close();
}
//发送消息
function send(message) {
  //  var message = $("#text").val() ;
    websocket.send(message);
   // $("#text").val("") ;
}
function sendMsg(){ 
    var msg = ue.getContent();
    websocket.send(msg);
    ue.setContent('');
}

//三图标
window.onload=function(){
	function a(){
		var si1 = document.getElementById('si_1');
		var si2 = document.getElementById('si_2');
		var si3 = document.getElementById('si_3');
		si1.onclick=function(){
			si1.style.background="url(images/icon/head_2_1.png) no-repeat"
			si2.style.background="";
			si3.style.background="";
		};
		si2.onclick=function(){
			si2.style.background="url(images/icon/head_3_1.png) no-repeat"
			si1.style.background="";
			si3.style.background="";
		};
		si3.onclick=function(){
			si3.style.background="url(images/icon/head_4_1.png) no-repeat"
			si1.style.background="";
			si2.style.background="";
		};
	};
	function b(){
		var text = document.getElementById('input_box');
		var chat = document.getElementById('chatbox');
		var btn = document.getElementById('send');
		var talk = document.getElementById('talkbox');
		btn.onclick=function(){
			if(text.value ==''){
				alert('不能发送空消息');
			}else{
				send(MSG_CODE+text.value);
				chat.innerHTML += '<li class="me"><img src="<%=request.getContextPath()%>/<%=userImg %>"><span>'+text.value+'</span></li>';
				text.value = '';
				chat.scrollTop=chat.scrollHeight;
				talk.style.background="#fff";
				text.style.background="#fff";
			};
		};
	};
	a();
	b();
};

	  
	
});
</script>


</body>
</html>