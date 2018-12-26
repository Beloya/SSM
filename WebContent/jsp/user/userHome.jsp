<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/skins/_all-skins.min.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/AdminLTE.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/global.css">
		<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/UserInfoBox.css"
	media="all" />
</head>
<style type="text/css">
a{cursor: pointer;
}
</style>
<body>
<div id="container" class="skin-blue sidebar-mini">
	<%@ include file="../top_nav.jsp"%>
    <div class="fly-home fly-panel" style="background-image: url();margin-bottom: 0;">
    <img id="userHome_Img" src="<%=request.getContextPath() %>/${userImg}" alt="<%=userName%>">
    <!--<i class="iconfont icon-renzheng" title="iVusic"></i>-->
    <h1>
       <%=userName %>      <c:if test="${Myuser.sex<='男'}">    
    <i class="iconfont icon-nan"></i>
    </c:if>
     <c:if test="${Myuser.sex<='女'}">    
    <!-- <i class="iconfont icon-nv"></i>  -->
    </c:if>
            </h1>
    <c:if test="${Myuser.power<=2}">           
  <p style="padding: 10px 0; color: #5FB878;">认证信息：管理员</p>
</c:if>
    <p class="fly-home-info">
     
        <i class="iconfont icon-shijian"></i><span>${Myuser.registerTime } 加入</span>
       <c:if test="${user.wrongful==0}">
                                             <i class="fa fa-fw fa-credit-card" style="color: #5FB878;">         
                                            </i>
                                             </c:if>
                                            <c:if test="${user.wrongful<3&& Myuser.wrongful>0}">
                                            <c:forEach begin="1" end="${Myuser.wrongful}">
                                            <i class="fa fa-fw fa-credit-card" style="color: #FFB800;">         
                                            </i>
                                            </c:forEach>
                                            </c:if>
                                             <c:if test="${user.wrongful==3}">
                                             <i class="fa fa-fw fa-credit-card" style="color: #FF5722;">         
                                            </i>
                                             </c:if>
    </p><p class="fly-home-sign">(${Myuser.personSay })</p>

    <p class="fly-home-sign"></p>



</div>
<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear" style="text-align: center;">
            <li class=""><a href="<%=request.getContextPath() %>/user/userMeet.html" data-pjax="">我的活动</a></li>

                        <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
            <li class="layui-this"><a href="<%=request.getContextPath() %>/user/userHome.html" data-pjax="">用户中心</a></li>
            <!--  li class=""><a onclick="layer.tips('暂未开放.', this, {tips:4})"data-pjax="">消息中心</a></li-->
                    </ul>
    </div>
</div>
    <div class="layui-container fly-marginTop">

        <div class="fly-panel fly-panel-user" pad20="" id="containerUserNav">
            <div class="fly-msg" style="margin: 20px 0;"> Hi，<%=userName%>，你已是我们的${Myuser.info }。</div>
                        <div class="fly-msg" style="margin:20px 0;">您的邮箱尚未验证，这比较影响您的帐号安全，<a href="javascript:void(0)" onclick="layer.tips('稍后开放', this, {tips:1})">立即去激活？</a></div>
                        <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title" id="LAY_mine">
                    <li class="layui-this" lay-id="home">用户中心</li>
                    <li lay-id="info">我的资料</li>
                    <li lay-id="avatar">头像</li>
                    <li lay-id="pass">密码</li>
                    <li lay-id="bind">收藏管理</li>
                    <li lay-id="article">纸条管理<span class="layui-badge" id="post_count"></span></li>
                </ul>
                <div class="layui-tab-content" style="padding: 20px 0;">
                    <div class="layui-form layui-form-pane layui-tab-item layui-show">
                        <div class="layui-row layui-col-space20">
                            <!--div class="layui-col-md4">
                                < div class="layui-card" style="border: 1px solid #E6E6E6;">
                                    <div class="layui-card-header fly-signin">
                                        签到
                                        <i class="fly-mid"></i>
                                        <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
                                        <i class="fly-mid"></i>
                                        <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
                                                                                <span class="fly-signin-days">已连续签到<cite>0</cite>天</span>
                                                                            </div>
        
                                    <div class="layui-card-body text-center singIn-main fly-signin" style="padding: 34px 0;">
                                                                                <button class="layui-btn layui-btn-normal" id="LAY_signin">今日签到</button>
                                                                                <span class="mar-lft">可获得<cite>3</cite>积分</span>
                                                                            </div>
                                </div>

                            </div-->
                            <div class="layui-col-md4">
                                <div class="layui-card" style="border: 1px solid #E6E6E6;">
                                    <div class="layui-card-header">我的会员信息</div>
                                    <div class="layui-card-body" style="min-height: 106px;">
                                        <ul class="fly-list-static">
                                            <li>您当前的信誉：
                                             <c:if test="${Myuser.wrongful==0}">
                                             <i class="fa fa-fw fa-credit-card" style="color: #5FB878;">         
                                            </i>
                                             </c:if>
                                            <c:if test="${Myuser.wrongful<3&& Myuser.wrongful>0}">
                                            <c:forEach begin="1" end="${Myuser.wrongful}">
                                            <i class="fa fa-fw fa-credit-card" style="color: #FFB800;">         
                                            </i>
                                            </c:forEach>
                                            </c:if>
                                             <c:if test="${Myuser.wrongful==3}">
                                             <i class="fa fa-fw fa-credit-card" style="color: #FF5722;">         
                                            </i>
                                             </c:if>
                                            </li>
                                            <li>您当前的等级： <span class="text-danger">${Myuser.info }</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-col-md12">
                                <div class="layui-card" style="border: 1px solid #E6E6E6;">
                                    <div class="layui-card-header" style="border-bottom-color: #E6E6E6;">我的会员信息</div>
                                    <div class="layui-card-body" style="min-height: 106px;">
                                        <ul class="layui-row layui-col-space10 fly-shortcut">
                                            <li class="layui-col-sm2 layui-col-xs4"><div class="layui-btn layui-btn-radius layui-btn-primary" id="usertabChange"><a href="<%=request.getContextPath() %>/user/userHome.html#user=info" value="info" data-pjax="true"><i class="layui-icon "></i><cite>修改信息</cite></a></div></li>
                                            <li class="layui-col-sm2 layui-col-xs4" ><div class="layui-btn layui-btn-radius layui-btn-primary" id="usertabChange"><a href="<%=request.getContextPath() %>/user/userHome.html#user=avatar" value="avatar" data-pjax=""><i class="layui-icon"></i><cite>修改头像</cite></a></div></li>
                                            <li class="layui-col-sm2 layui-col-xs4"><div class="layui-btn layui-btn-radius layui-btn-primary" id="usertabChange"><a href="<%=request.getContextPath() %>/user/userHome.html#user=pass" value="pass" data-pjax="true"><i class="layui-icon"></i><cite>修改密码</cite></a></div></li>
                                            <li class="layui-col-sm2 layui-col-xs4"><div class="layui-btn layui-btn-radius layui-btn-primary" id="usertabChange"><a href="<%=request.getContextPath() %>/user/userHome.html#user=bind" value="bind"  data-pjax="true"><i class="layui-icon"></i><cite>收藏管理</cite></a></div></li>
                                            <li class="layui-col-sm2 layui-col-xs4"><div class="layui-btn layui-btn-radius layui-btn-primary" id="usertabChange"><a href="<%=request.getContextPath() %>/user/userHome.html#user=article" value="article" data-pjax="true"><i class="layui-icon"></i><cite>帖子管理</cite></a></div></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="layui-form layui-form-pane layui-tab-item">
                
                     
                            <div class="layui-form-item">
                                <label class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                 <c:if test="${Myuser.email!=null}">    
                                    <input type="text" id="email" name="email" disabled required="" lay-verify="email" autocomplete="off" value="${user.email}" class="layui-input">
                                </c:if>
                                  <c:if test="${Myuser.email==null}">    
                                    <input type="text" id="email" name="email" required="" lay-verify="email" autocomplete="off" value=" " class="layui-input">
                                </c:if>
                                </div>
                                <div class="layui-form-mid layui-word-aux">如果您在邮箱已激活的情况下，变更了邮箱，需<a href="javascript:;" id="LAY-activate" style="font-size: 12px; color: #4f99cf;">重新验证邮箱</a>。</div>
                            </div>
                            <div class="layui-form-item">
                               
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                  
                                        <input type="radio" id="sexm" name="sex" value="男" title="男"   <c:if test="${Myuser.sex=='男'}">checked=""</c:if>><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>男</div></div>
                                        <input type="radio" id="sexw"  name="sex" value="女" title="女" <c:if test="${Myuser.sex=='女'}">checked=""</c:if>><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
                                    </div>
                                </div>
                            </div>
                            <!--  div class="layui-form-item">
                                <label class="layui-form-label">地理位置</label>
                                <div class="layui-input-inline">
                                    <select name="province" class="layui-form" lay-filter="province">
                                        <option value="">省份</option>
                                                                                <option value="2">北京</option>
                                                                                <option value="3">安徽</option>
                                                                                <option value="4">福建</option>
                                                                                <option value="5">甘肃</option>
                                                                                <option value="6">广东</option>
                                                                                <option value="7">广西</option>
                                                                                <option value="8">贵州</option>
                                                                                <option value="9">海南</option>
                                                                                <option value="10">河北</option>
                                                                                <option value="11">河南</option>
                                                                                <option value="12">黑龙江</option>
                                                                                <option value="13">湖北</option>
                                                                                <option value="14">湖南</option>
                                                                                <option value="15">吉林</option>
                                                                                <option value="16">江苏</option>
                                                                                <option value="17">江西</option>
                                                                                <option value="18">辽宁</option>
                                                                                <option value="19">内蒙古</option>
                                                                                <option value="20">宁夏</option>
                                                                                <option value="21">青海</option>
                                                                                <option value="22">山东</option>
                                                                                <option value="23">山西</option>
                                                                                <option value="24">陕西</option>
                                                                                <option value="25">上海</option>
                                                                                <option value="26">四川</option>
                                                                                <option value="27">天津</option>
                                                                                <option value="28">西藏</option>
                                                                                <option value="29">新疆</option>
                                                                                <option value="30">云南</option>
                                                                                <option value="31">浙江</option>
                                                                                <option value="32">重庆</option>
                                                                                <option value="33">香港</option>
                                                                                <option value="34">澳门</option>
                                                                                <option value="35">台湾</option>
                                                                            </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="省份" value="广东" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">省份</dd><dd lay-value="2" class="">北京</dd><dd lay-value="3" class="">安徽</dd><dd lay-value="4" class="">福建</dd><dd lay-value="5" class="">甘肃</dd><dd lay-value="6" class="layui-this">广东</dd><dd lay-value="7" class="">广西</dd><dd lay-value="8" class="">贵州</dd><dd lay-value="9" class="">海南</dd><dd lay-value="10" class="">河北</dd><dd lay-value="11" class="">河南</dd><dd lay-value="12" class="">黑龙江</dd><dd lay-value="13" class="">湖北</dd><dd lay-value="14" class="">湖南</dd><dd lay-value="15" class="">吉林</dd><dd lay-value="16" class="">江苏</dd><dd lay-value="17" class="">江西</dd><dd lay-value="18" class="">辽宁</dd><dd lay-value="19" class="">内蒙古</dd><dd lay-value="20" class="">宁夏</dd><dd lay-value="21" class="">青海</dd><dd lay-value="22" class="">山东</dd><dd lay-value="23" class="">山西</dd><dd lay-value="24" class="">陕西</dd><dd lay-value="25" class="">上海</dd><dd lay-value="26" class="">四川</dd><dd lay-value="27" class="">天津</dd><dd lay-value="28" class="">西藏</dd><dd lay-value="29" class="">新疆</dd><dd lay-value="30" class="">云南</dd><dd lay-value="31" class="">浙江</dd><dd lay-value="32" class="">重庆</dd><dd lay-value="33" class="">香港</dd><dd lay-value="34" class="">澳门</dd><dd lay-value="35" class="">台湾</dd></dl></div>
                                </div>
                                <div class="layui-input-inline">
                                    <select name="city" class="layui-form" lay-filter="city">
                                        <option value="0" disabled="">请先选择省份</option>
                                                                                <option value="81" selected="">准备中...</option>
                                                                            </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="河源" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="0" class=" layui-disabled">请先选择省份</dd><dd lay-value="81" class="layui-this">河源</dd></dl></div>
                                </div>
                          
                            </div-->
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">签名</label>
                                <div class="layui-input-block">
                                    <textarea placeholder="随便写些什么刷下存在感" id="personSay" name="personSay" =  autocomplete="off" class="layui-textarea" style="height: 80px;">${user.personSay  }</textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                              <button class="layui-btn" key="set-mine"  id="My_Base"
								lay-submit>确认修改</button>
                               
                            </div>
                  
                    </div>

                    <div class="layui-form layui-form-pane layui-tab-item">
                    
                    	<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
				<li class="layui-this">系统头像</li>
				<li>自定义头像</li>
				<!--  li>自定义头像</li-->
			</ul>
			<div class="layui-tab-content" style="margin-top: 10px;">
		
                    <div class="layui-tab-item layui-show">
					<div class="layui-form layui-form-pane mine-view"
						style="display: block;">

						<img id="txtp1" src="<%=request.getContextPath() %>/${Myuser.userImg}"
							class="layui-circle"
							style="width: 72px; height: 72px; margin: 20px auto auto 40px;">

						<div class="layui-form-item"
							style="margin: 30px 31px; width: 90px; text-align: center">
							<button class="layui-btn" id="userImgbtn" lay-filter="pp" lay-submit>确认修改</button>
						</div>
						<div class="hg1" id="kk">
							<div class="im">
								<img id="1" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/1.jpg">
							</div>
							<div class="im">
								<img id="2" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/2.jpg">
							</div>
							<div class="im">
								<img id="3" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/3.jpg">
							</div>
							<div class="im">
								<img id="4" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/4.jpg">
							</div>
							<div class="im">
								<img id="5" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/5.jpg">
							</div>
							<div class="im">
								<img id="6" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/6.jpg">
							</div>
							<div class="im">
								<img id="7" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/7.jpg">
							</div>
							<div class="im">
								<img id="8" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/8.jpg">
							</div>
							<div class="im">
								<img id="9" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/9.jpg">
							</div>
							<div class="im">
								<img id="10" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/10.jpg">
							</div>
							<div class="im">
								<img id="11" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/11.gif">
							</div>
							<div class="im">
								<img id="12" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/12.jpg">
							</div>
							<div class="im">
								<img id="11" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/13.gif">
							</div>
							<div class="im">
								<img id="11" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/14.gif">
							</div>
							<div class="im">
								<img id="7" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/15.jpg">
							</div>
							<div class="im">
								<img id="7" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/16.jpg">
							</div>
							<div class="im">
								<img id="7" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/17.jpg">
							</div>
							<div class="im">
								<img id="7" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/18.jpg">
							</div>
							<div class="im">
								<img id="7" lay-filter="im"
									lay-src="<%=request.getContextPath() %>/img/19.jpg">
							</div>
						</div>
					</div>
				</div>
						<div class="layui-tab-item ">
                        <div class="layui-form-item">
                            <div class="avatar-add">
                                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                                <button type="button" id="userImgfile" class="layui-btn upload-img">
                                    <i class="layui-icon"></i>上传头像
                                </button><input class="layui-upload-file" type="file" name="file">
                                <img src="<%=request.getContextPath() %>/${Myuser.userImg }">
                                <span class="loading"></span>
                            </div>
                        </div>
                    </div>
                    </div>
                    
</div>
</div>
                    <div class="layui-form layui-form-pane layui-tab-item">
                     
                            <div class="layui-form-item">
                                <label class="layui-form-label">当前密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_nowpass" name="nowpass"  placeholder="请输入当前密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">新密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_pass" name="pass" placeholder="请输入新密码"   autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_repass" name="passWord" placeholder="请输入确认密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn"  id="PassWordxg" lay-submit>确认修改</button>
                            </div>
                    
                    </div>

                    <div class="layui-form layui-form-pane layui-tab-item">
                <table cellspacing="0" cellpadding="0" border="0" id="meet_collection" style="margin:0;" lay-filter="meet_collection" class="layui-table"></table>
          <div id="LAY_page2"></div>    
      <table cellspacing="0" cellpadding="0" border="0" id="my_collection" style="margin:0;" lay-filter="my_collection" class="layui-table"></table>
          <div id="LAY_page1"></div>
 
                    </div>

                    <div class="layui-form layui-form-pane layui-tab-item">
                    
  <div class="fly-panel fly-panel-user" pad20 style="min-height:620px;">
    <!--
    <div class="fly-msg" style="margin-top: 15px;">
      您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
    </div>
    -->

       
    <table cellspacing="0" cellpadding="0" border="0" id="my_post" style="margin:0;" lay-filter="my_post" class="layui-table"></table>
          <div id="LAY_page"></div>

     

  
  </div>
</div>
                    </div>
                </div>

            </div>
        </div>

    </div>
<div class="fly-footer">
  <p><a href="#" target="_blank">友聚</a> 2017 &copy; <a href="#" target="_blank">友聚社区</a></p>
</div>
	<script
			src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>

		<script
			src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"
		charset="utf-8"></script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="barc">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">取消收藏</a>
</script>
<script type="text/html" id="meetcancel">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">取消收藏</a>
</script>
<script>

layui.cache.page = 'user';
layui.cache.user = {
		  username: '<%=userName%>'
		  <% if(userName==null){ %>
		  ,uid: -1
		  <% }else{%>
			  ,uid: '<%=userName%>'
				  <% }%>
		  ,experience: 83
		};
layui.config({
  version: "3.0.0"
  ,base: '<%=request.getContextPath() %>/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
layui.define(['laypage', 'fly','upload'], function(exports){
layui.use(['table','element','flow'], function(){
	  var table = layui.table;
	 var fly = layui.fly;
	 var element = layui.element;
	 var layid = location.hash.replace(/^#tab=/, '');
	 var upload = layui.upload;
		var flow = layui.flow;
		var result;
		var msg;
		var index;
	  //执行实例
		  flow.lazyimg({
			    elem: '#kk img'
			    ,scrollElem:"#kk"
			  });
			  
	  
	  var uploadInst = upload.render({
	    elem: '#userImgfile' //绑定元素
	    ,url: '/upload/' //上传接口
	    ,accept:'images'
	    ,size:'50'
	    ,drag:true
	    ,done: function(res, index, upload,file){
	      //上传完毕回调
	    }
	    ,error: function(){
	      //请求异常回调
	    }
	  });
	  var layid = location.hash.replace(/^#user=/, '');
	  element.tabChange('user', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

	  element.on('tab(user)', function(){
	    location.hash = 'user='+ this.getAttribute('lay-id');
	  });
	  $("#usertabChange a").on('click',function(){
			  element.tabChange('user',$(this).attr("value")); 
	  });


		$("#My_Base").on('click',function(){
		
			 jy($('#personSay').val(),$('#email').val(),$("input[name='sex']:checked").val(),'${user.userName}',1);
					    if(result==0){
							$(window.parent.document).find("#toppersonSay").html("　"+$("#personSay").val());
							 msgg('帐号设置成功！',6);
			
				 };
			})

				$("#PassWordxg").on('click',function(){
		var value = $.trim($('#L_nowpass').val());
		var value1 =$.trim($('#L_pass').val());
		var value2 =$.trim($('#L_repass').val());
		if( (value=='')||(value1=='')||(value2=='')){
			msgg('所有密码项不能为空！',5);
			$("#L_nowpass").focus();
			return false;
		}else if(value1.length > 12 || value1.length < 6){
			msgg('新密码长度应在6-12位之间',5);
			$("#L_nowpass").focus();
			return false;
		}else if(value2!=value1){
			msgg('确认密码跟新密码不一致！',5);
			$("#L_repass").focus();
			return false;
		}else{
			jy(value,value1,value2,'${user.userName}',2);
			if(result==0){
			 $('#L_nowpass').val("")&&$('#L_pass').val("")&&$('#L_repass').val("");
			 msgg('密码设置成功！',6);
			}else if(result==1){
		     msgg(msg,5);
			 $("#L_pass").focus();
			}
		}
	})
	$("img[lay-filter='im']").on("click", function(){
		var id = $(this).attr("id");
		var src=$(this).attr("src");
		$("#txtp1").attr("src", src); 
	  })
	$("#userImgbtn").on("click", function(){
		jy($('#txtp1').attr('src'),3,3,'${user.userName}',3);
		if(result==0){
			$('#bttx').attr('src',$('#txtp1').attr('src'));
			$(document).find("#userImg").attr("src",$('#txtp1').attr('src'));
			$(document).find("#userImg1").attr("src",$('#txtp1').attr('src'));	
			$(document).find("#leftuserImg").attr("src",$('#txtp1').attr('src'));
			$(document).find("#userHome_Img").attr("src",$('#txtp1').attr('src'));
			msgg('个人头像更新成功！',6);
		
		}
	  })
		 $("#L_pass").hover(function(){
                           timer=setTimeout(function(){
							layer.tips('密码应该是6-16位','#L_pass',{
		                    tips: [2, '#00C1DE']
		                   ,tipsMore: false
		                     });
							},100);
                        },
                        function(){
                            if(timer) {
                                clearTimeout(timer);
                            };
                        }
                    );
			
		function jy(nr1,nr2,nr3,list,num){

			$.ajax({
	        url:'<%=request.getContextPath() %>/user/Update.html',
	       type:"POST",
			 async:false,
		     data:"nr1="+nr1+"&nr2="+nr2+"&nr3="+nr3+"&list="+list+"&num="+num,
	       success: function(data) {
			  result=data.code;
			  msg=data.msg;
			  }
			})
			return result;
		  }
	
		function msgg(txt,ico){
		    layer.msg(txt, {
	        icon: ico
	        ,time: 2*1000 
	        });
			 //clear();
			 $("div[lay-filter='popo']").hide();
			 c=0;
		    }

	  
	  table.render({
	    elem: '#my_post'
	    ,url:'<%=request.getContextPath() %>/user/my_post.html'
	    ,cols: [[
	      {field:'title', width:630, title: '纸条标题',templet: '<div><a href="<%=request.getContextPath() %>/forumfile/detail.html?noteID={{ d.id }}" target="_blank" class="layui-table-link">{{ d.title }}</a></div>'}
	      ,{field:'state', width:100, title: '状态',align: 'center', templet: function(d){
	          if(d.hot == 1){
	        	  return '<span class="layui-badge">加精</span>'
	             
	            } else if(d.status == -1){
	              return '<span style="color: #ccc;">审核中</span>';
	            } else if(d.state == 0){
	            	 return '<span style="color: #999;">正常</span>';
	              }
	      }}
	      ,{field:'post_time', width:212, title: '发表时间', sort: true}
	      ,{field:'tool', width:120, title: '操作',toolbar: '#barDemo'}

	    ]]
	    ,page: true
	    ,loading:true
	    ,even: false
	    ,skin: 'nob'
	
	    ,done: function(res, curr, count){
	    		  $("#post_count").html(count);
	    		  }
	  });
	  table.on('tool(my_post)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		  var data = obj.data; //获得当前行数据
		  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		  var tr = obj.tr; //获得当前行 tr 的DOM对象
		 
		  if(layEvent === 'detail'){ //查看
		    //do somehing
		  } else if(layEvent === 'del'){ //删除
		    layer.confirm('真的删除该帖么', function(index){
		   
		    	        layer.close(index);
		    	       fly.json('../forumfile/note_del.html', {
		    	          id: data.id
		    	        }, function(res){
		    	          if(res.status === 0){
		    	     
		    	            obj.del();
		    	    
		    	          } else {
		    	            layer.msg(res.msg);
		    	          }
		    	        });
		       //删除对应行（tr）的DOM结构，并更新缓存
		    });
		  } else if(layEvent === 'edit'){ //编辑
		    //do something
		    
		    //同步更新缓存对应的值
		    obj.update({
		      username: '123'
		      ,title: 'xxx'
		    });
		  }
		});
	  
	
	  //收藏
	  	  table.render({
		    elem: '#meet_collection'
		    ,url:'<%=request.getContextPath() %>/user/meet_collection.html'
		    ,cols: [[
		      {field:'collection_title', width:630, title: '活动收藏',templet: '<div><a href="<%=request.getContextPath() %>/meetdetail.html?meetid={{ d.meetid }}" target="_blank" class="layui-table-link">{{ d.collectiontitle }}</a></div>'}
		      ,{field:'part_time', width:212, title: '活动时间', sort: true}
		      ,{field:'tool', width:120, title: '操作',toolbar: '#barc'}
		    ]]
		    ,page: true
		    ,loading:true
		    ,even: false
		    ,skin: 'nob'
		    ,done: function(res, curr, count){
		    	console.log(res);
		    	//	 $("#collection_count").html(count);
		    		  }
		  });
	  table.render({
		    elem: '#my_collection'
		    ,url:'<%=request.getContextPath() %>/user/my_collection.html'
		    ,cols: [[
		      {field:'collectiontitle', width:630, title: '帖子收藏',templet: '<div><a href="<%=request.getContextPath() %>/forumfile/detail.html?noteID={{ d.noteID }}" target="_blank" class="layui-table-link">{{ d.collectiontitle }}</a></div>'}
		      ,{field:'collection_time', width:212, title: '收藏时间', sort: true}
		      ,{field:'tool', width:120, title: '操作',toolbar: '#barc'}

		    ]]
		    ,page: true
		    ,loading:true
		    ,even: false
		    ,skin: 'nob'
		    ,done: function(res, curr, count){
		    	console.log(res);
		    		//  $("#collection_count").html(count);
		    		  }
		  });

		  table.on('tool(my_collection)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  var tr = obj.tr; //获得当前行 tr 的DOM对象
			 
			  if(layEvent === 'detail'){ //查看
			    //do somehing
			  } else if(layEvent === 'del'){ //删除
			    layer.confirm('确定移除该收藏吗?', function(index){
			   console.log(data);
			    	        layer.close(index);
			    	       fly.json('../forumfile//bbs_collection/remove.html', {
			    	          cid: data.noteID
			    	        }, function(res){
			    	          if(res.status === 0){
			    	     
			    	            obj.del();
			    	    
			    	          } else {
			    	            layer.msg(res.msg);
			    	          }
			    	        });
			       //删除对应行（tr）的DOM结构，并更新缓存
			    });
			  } else if(layEvent === 'edit'){ //编辑
			    //do something
			    
			    //同步更新缓存对应的值
			    obj.update({
			      username: '123'
			      ,title: 'xxx'
			    });
			  }
			});
		  table.on('tool(meet_collection)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  var tr = obj.tr; //获得当前行 tr 的DOM对象
			 
			  if(layEvent === 'detail'){ //查看
			    //do somehing
			  } else if(layEvent === 'del'){ //删除
			    layer.confirm('确定移除该收藏吗?', function(index){
			   console.log(data);
			    	        layer.close(index);
			    	       fly.json('../meetcollection_remove.html', {
			    	          cid: data.meetid
			    	        }, function(res){
			    	          if(res.status === 0){
			    	            obj.del();
			    	    
			    	          } else {
			    	            layer.msg(res.msg);
			    	          }
			    	        });
			       //删除对应行（tr）的DOM结构，并更新缓存
			    });
			  } else if(layEvent === 'edit'){ //编辑
			    //do something
			    
			    //同步更新缓存对应的值
			    obj.update({
			      username: '123'
			      ,title: 'xxx'
			    });
			  }
			});
	});});
</script>  

</body>
</html>