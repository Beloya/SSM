<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>用户主页</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
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
</head>
<body class="skin-blue sidebar-mini">

		<%@ include file="../top_nav.jsp"%>
<div class="fly-home fly-panel" style="background-image: url();">
  <img src="<%=request.getContextPath() %>/${userTa.userImg }" alt="${userTa.userName }">
  <i class="iconfont icon-renzheng" title="认证"></i>
  <h1>
 ${userTa.userName }
 <c:if test="${userTa.sex<='男'}">    
    <i class="iconfont icon-nan"></i>
    </c:if>
     <c:if test="${userTa.sex<='女'}">    
    <!-- <i class="iconfont icon-nv"></i>  -->
    </c:if>
    <!--
    <span style="color:#c00;">（管理员）</span>
    <span style="color:#5FB878;">（社区之光）</span>
    <span>（该号已被封）</span>
    -->
  </h1>
<c:if test="${userTa.power<=2}">           
  <p style="padding: 10px 0; color: #5FB878;">认证信息：管理员</p>
</c:if>
  <p class="fly-home-info">
    <!-- i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">66666 飞吻</span-->
    <i class="iconfont icon-shijian"></i><span><fmt:formatDate value="${userTa.registerTime }"
															pattern="yyyy-MM-dd" /></time>加入</span>
  <span>     <c:if test="${user.wrongful==0}">
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
                                             </c:if></span>
  </p>

  <p class="fly-home-sign">(${userTa.personSay })</p>

  <div class="fly-sns" data-user="">
    <a href="javascript:;" onclick="layer.tips('稍后推出.', this, {tips:4})" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">关注</a>
  </div>

</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6 fly-home-jie">
      <div class="fly-panel">
        <h3 class="fly-panel-title">${userTa.userName } 最近参与或发起的活动</h3>
        <ul class="jie-row">
        <c:forEach items="${meet_usernames }" var="musernames">
          <li>
            <span class="fly-jing">   
      
            </span>
            <a href="<%=request.getContextPath() %>/meetdetail.html?meetid=${musernames.meetid}" class="jie-title">${musernames.title }</a>
            <i><fmt:formatDate value="${musernames.part_time}"
															pattern="yyyy年MM月dd日 " /></i>
            <em class="layui-hide-xs">${musernames.readcount}浏览</em>
          </li>
         </c:forEach>
          <!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div> -->
        </ul>
      </div>
    </div>

    <div class="layui-col-md6 fly-home-da">
      <div class="fly-panel">
        <h3 class="fly-panel-title">${userTa.userName } 最近的讨论</h3>
        <ul class="home-jieda">
         <c:forEach items="${bbsdetails}" var="bbsdetails">
            <c:if test="${bbsdetails.comment_time==null}">
    <li>
     <p>
    <span><fmt:formatDate value="${bbsdetails.time}"
															pattern="yyyy年MM月dd日 " /></span>发表了：
															</p>
            <a href="" class="jie-title">${bbsdetails.title}</a>
            <em class="layui-hide-xs">${bbsdetails.readcount}阅/${bbsdetails.commentcount}答</em>
          </li>
   </c:if>
     <c:if test="${bbsdetails.comment_time!=null}">

   <li>
          <p>
          <span><fmt:formatDate value="${bbsdetails.comment_time}"
															pattern="yyyy年MM月dd日 " /></span>
          在<a href="" target="_blank">${bbsdetails.title}</a>中回答：
          </p>
          <div class="home-dacontent">
   ${bbsdetails.comment_content}
          </div>
        </li>
   </c:if>
          
        </c:forEach>
        
          <!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div> -->
        </ul>
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

<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/js/activate-power-mode.js"
			charset="utf-8"></script>
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
</script>

</body>