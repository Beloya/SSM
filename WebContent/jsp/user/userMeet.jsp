<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/datatables/dataTables.bootstrap.css" />
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
       <%=userName %>      <c:if test="${user.sex<='男'}">    
    <i class="iconfont icon-nan"></i>
    </c:if>
     <c:if test="${user.sex<='女'}">    
    <!-- <i class="iconfont icon-nv"></i>  -->
    </c:if>
            </h1>
    <c:if test="${user.power<=2}">           
  <p style="padding: 10px 0; color: #5FB878;">认证信息：管理员</p>
</c:if>
    <p class="fly-home-info">
      
        <i class="iconfont icon-shijian"></i><span>${user.registerTime } 加入</span>
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
    </p><p class="fly-home-sign">(${user.personSay })</p>

    <p class="fly-home-sign"></p>



</div>
<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear" style="text-align: center;">
            <li class="layui-this"><a href="<%=request.getContextPath() %>/user/userMeet.html" data-pjax="">我的活动</a></li>
     
                        <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
            <li class=""><a href="<%=request.getContextPath() %>/user/userHome.html" data-pjax="">用户中心</a></li>
            <!--  li class=""><a onclick="layer.tips('暂未开放.', this, {tips:4})"data-pjax="">消息中心</a></li-->
                    </ul>
    </div>
</div>
    <div class="layui-container fly-marginTop">
 <div class="fly-panel fly-panel-user" pad20="" id="containerUserNav">
  <div class="layui-tab layui-tab-brief" lay-filter="user">
    <ul class="layui-tab-title" id="LAY_mine">
                    <li class="layui-this" lay-id="MyPublish">发起的活动</li>
                    <li lay-id="MyJoin">参与的活动</li>
     
                </ul>
                    <div class="layui-tab-content" style="padding: 20px 0;">
                    <div class="layui-form layui-form-pane layui-tab-item layui-show">
    <section class="content">
      <!-- row -->
      <div class="row">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">
            <!-- timeline time label -->
            <c:set var="count" scope="session" value="1"/>
            <c:forEach items="${mUsernames }" var="mUsernames">
            <c:if test="${mUsernames.meet_userName==mUsernames.userName}">
            <li class="time-label">
             <c:if test="${mUsernames.meet_status==1}">
                  <span class="bg-green">
                  <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />    
                  </span>
                  </c:if>
                    <c:if test="${mUsernames.meet_status==0}">
                  <span class="bg-blue">
                  <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />    
                  </span>
                  </c:if>
                     <c:if test="${mUsernames.meet_status==-1}">
                  <span class="bg-red">
                  <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />    
                  </span>
                  </c:if>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-envelope bg-blue"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${mUsernames.time}" pattern="yyyy年MM月dd日  HH:mm" /></span>

                <h3 class="timeline-header"><a href="#">发起了活动</a>&nbsp; ${mUsernames.title	}</h3>

                <div class="timeline-body">
              活动于 <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />&nbsp; 在 &nbsp; ${mUsernames.cityName	}&nbsp; ${mUsernames.address} 举行
             <br/> 将 <fmt:formatDate value="${mUsernames.end_time}" pattern="yyyy年MM月dd日  HH:mm" />结束
                </div>
                <div class="timeline-footer">
                  <a href="<%=request.getContextPath() %>/meetdetail.html?meetid=${mUsernames.meetid}" class="btn btn-primary btn-xs">查看详情</a>
                  <c:if test="${mUsernames.meet_status==1}">
                  <a class="btn btn-danger btn-xs" onclick="meetCancel(${mUsernames.meetid});">撤销活动</a>
                  </c:if>
                </div>
              </div>
            </li>
            <!-- END timeline item -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-user bg-aqua"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> </span>

                <h3 class="timeline-header no-border"><a href="#">参与的用户</a> </h3>
                <div class="timeline-body">
                 		<div class="box">
						
										<!-- /.box-header -->
										<div class="box-body">

											<table id="example${count }"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>用户</th>
														<th>称呼</th>
														<th>联系电话</th>
														<th>联系方式</th>
														<th>信用牌</th>
														<th>参加时间</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
				<c:forEach items="${userMap.get(mUsernames.meetid)}" var="this_meetUser">
				<c:if test="${this_meetUser.userName!=mUsernames.userName&&this_meetUser.status>=0}">
														<tr>
															<td><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height: 56px; "> 
															<img id="userImg" src="<%=request.getContextPath() %>/${this_meetUser.userImg}" class="user-image" alt="User Image" style="height: 45px; width: 45px;border-radius:100%;"> 
															<span class="hidden-xs" style="font-size: 18px;">${this_meetUser.userName}</span></a></td>
															<td>${this_meetUser.name}</td>
															<td>${this_meetUser.phone}</td>
															<td>${this_meetUser.contact_way}</td>
															<td title="绿牌表示信用良好，一张黄牌表示一次违规记录，红牌表示严重违规">   <c:if test="${this_meetUser.wrongful==0}">
                                             <i class="fa fa-fw fa-credit-card" style="color: #5FB878;">         
                                            </i>
                                             </c:if>
                                            <c:if test="${this_meetUser.wrongful<3&& this_meetUser.wrongful>0}">
                                            <c:forEach begin="1" end="${this_meetUser.wrongful}">
                                            <i class="fa fa-fw fa-credit-card" style="color: #FFB800;">         
                                            </i>
                                            </c:forEach>
                                            </c:if>
                                             <c:if test="${this_meetUser.wrongful>=3}">
                                             <i class="fa fa-fw fa-credit-card" style="color: #FF5722;">         
                                            </i>
                                             </c:if></td>
															<td><fmt:formatDate value="${this_meetUser.time}" pattern="yyyy年MM月dd日  HH:mm" /></td>
													
														<c:if test="${mUsernames.meet_status==1}">	<td>
																<div class="layui-btn-group">

																	<button
																		class="layui-btn layui-btn-small layui-btn-danger"
																		onclick="deny(${this_meetUser.meetid},'${this_meetUser.userName}');">拒绝参加</button>
																
																</div>
															</td>
															</c:if>
															<c:if test="${mUsernames.meet_status==0}">	<td>
																<div class="layui-btn-group">

																	<button
																		class="layui-btn layui-btn-small layui-btn-danger layui-btn-disabled""
																		>活动已开始</button>
																
																</div>
															</td>
															</c:if>
														
																	<c:if test="${mUsernames.meet_status==-1&&this_meetUser.status==1}">
																	
																		<td>
																<div class="layui-btn-group">
																	<button onclick="Notuser(${this_meetUser.meetid},'${this_meetUser.userName}')"
																		class="layui-btn layui-btn-small layui-btn-danger "
																		>缺席</button>
																
																</div>
															</td>					
</c:if>

														<c:if test="${mUsernames.meet_status==-1&&this_meetUser.status==0}">
																	
																		<td>
																<div class="layui-btn-group">
																	<button 
																		class="layui-btn layui-btn-small layui-btn-danger layui-btn-disabled"
																		>已确认</button>
																
																</div>
															</td>					
</c:if>

														</tr>
														</c:if>
														 <c:set var="count" scope="session" value="${count+1}"/>
</c:forEach>

												</tbody>
					
											</table>
										</div>
										<!-- /.box-body -->
									</div>
                </div>
              </div>
            </li>
            
            <!-- END timeline item -->
            <!-- timeline item -->
                    <c:if test="${mUsernames.meet_status==1}">
            <li>
              <i class="fa fa-bolt bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>活动于</a> <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />  报名中 </h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                <div class="timeline-body">
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
            <c:if test="${mUsernames.meet_status==0}">
            <li>
              <i class="fa fa-play bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>活动于</a> <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />  已开始  </h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                <div class="timeline-body">
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
                 <c:if test="${mUsernames.meet_status==-1}">
            <li>
              <i class="fa  fa-calendar-times-o bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>活动于</a> <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />  已结束  </h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                <div class="timeline-body">
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
            </c:if>
            </c:forEach>
            <li>
              <i class="fa fa-clock-o bg-gray"></i>
            </li>
          </ul>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->


      <!-- /.row -->





    </section>
    </div>

            <div class="layui-form layui-form-pane layui-tab-item ">
                <section class="content">
      <!-- row -->
      <div class="row">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">
            <!-- timeline time label -->
            <c:set var="count" scope="session" value="1"/>
            <c:forEach items="${mUsernames }" var="mUsernames">
            <c:if test="${mUsernames.meet_userName!=mUsernames.userName}">
            <li class="time-label">
             <c:if test="${mUsernames.meet_status==1}">
                  <span class="bg-green">
                  <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />    
                  </span>
                  </c:if>
                    <c:if test="${mUsernames.meet_status==0}">
                  <span class="bg-blue">
                  <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />    
                  </span>
                  </c:if>
                     <c:if test="${mUsernames.meet_status==-1}">
                  <span class="bg-red">
                  <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />    
                  </span>
                  </c:if>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-envelope bg-blue"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${mUsernames.time}" pattern="yyyy年MM月dd日  HH:mm" /></span>

                <h3 class="timeline-header"><a href="#">参加了活动</a>&nbsp; ${mUsernames.title	}</h3>

                <div class="timeline-body">
              活动于 <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />&nbsp; 在 &nbsp; ${mUsernames.cityName	}&nbsp; ${mUsernames.address} 举行
             <br/> 将 <fmt:formatDate value="${mUsernames.end_time}" pattern="yyyy年MM月dd日  HH:mm" />结束
                </div>
                <div class="timeline-footer">
                  <a href="<%=request.getContextPath() %>/meetdetail.html?meetid=${mUsernames.meetid}" class="btn btn-primary btn-xs">查看详情</a>
                  <c:if test="${mUsernames.meet_status>=1}">
                  <a class="btn btn-danger btn-xs" onclick="meetQuit(${mUsernames.meetid});">取消报名</a>
                  </c:if>
                   
                </div>
              </div>
            </li>

            <c:if test="${mUsernames.meet_status==0}">
            <li>
              <i class="fa fa-play bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>活动于</a> <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />  已开始  </h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                <div class="timeline-body">
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
            
            
               <li>
              <i class="fa fa-user bg-aqua"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> </span>

                <h3 class="timeline-header no-border"><a href="#">活动发起人</a> </h3>
                <div class="timeline-body">
                <c:forEach items="${meet_MainUser }" var="meet_MainUser">
                <c:if test="${meet_MainUser.userName==mUsernames.meet_userName&&mUsernames.meetid==meet_MainUser.meetid }">
                <a href="<%=request.getContextPath() %>/user/detail.html?userName=${meet_MainUser.userName}" class="" target="_blank">
                	<img id="userImg" src="<%=request.getContextPath() %>/${meet_MainUser.userImg}" class="user-image" alt="User Image" style="height: 45px; width: 45px;border-radius:100%;"> 
															<span class="hidden-xs" style="font-size: 18px;">${mUsernames.meet_userName}</span>
															</a>
											<ul class="layui-timeline">
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title">发起人信息</h3>
      <p>称呼:<em>${meet_MainUser.name}</em></p>
      <ul>
        <li>联系电话：<em>${meet_MainUser.phone}</em></li>
        <li>其它联系方式：<em>${meet_MainUser.contact_way}</em></li>
      </ul>
    </div>
  </li>

</ul>
												</c:if>
													</c:forEach>
                </div>
                
                </div>
                </li>
            
          <c:if test="${mUsernames.meet_status==1}">
            <li>
              <i class="fa fa-bolt bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>现在时间为</a> 
                <fmt:formatDate var="now_Date" value="<%=new Date()%>" pattern="yyyy-MM-dd  HH:mm:ss" /><c:out value="${now_Date }"></c:out></h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy-MM-dd  HH:mm:ss" />">
                <div class="timeline-body">
                活动于<fmt:formatDate var="part_Date" value="${mUsernames.part_time}" pattern="yyyy-MM-dd  HH:mm:ss" /><c:out value="${part_Date }"></c:out>开始
              <fmt:parseDate value="${part_Date }" var="part_time" pattern="yyyy-MM-dd HH:mm:ss"/> 
 <fmt:parseDate value="${now_Date }" var="now_time" pattern="yyyy-MM-dd HH:mm:ss"/> 
 <fmt:formatNumber value="${(part_time.getTime()-now_time.getTime())/1000/60/60}" pattern="#0" var="num"/>
 <c:if test="${num<=24}">
 <div class="alert alert-warning alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-warning"></i> 活动即将开始</h4>
                请做好准备！
              </div>
 </c:if>

                
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
            <c:if test="${mUsernames.meet_status==0}">
            <li>
              <i class="fa fa-play bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>活动于</a> <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />  已开始  </h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                <div class="timeline-body">
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
                 <c:if test="${mUsernames.meet_status==-1}">
            <li>
              <i class="fa  fa-calendar-times-o bg-yellow"></i>

              <div class="timeline-item">
               

                <h3 class="timeline-header"><a href="#"> <span class="time"><i class="fa fa-clock-o"></i> </span>活动于</a> <fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm" />  已结束  </h3>
 <input type="text" class="layui-input layui-hide" id="part_time_count" value="<fmt:formatDate value="${mUsernames.part_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                <div class="timeline-body">
          <div id="time_count"></div>
                </div>
                <div class="timeline-footer">
                  <!-- a class="btn btn-warning btn-flat btn-xs">View comment</a-->
                </div>
              </div>
            </li>
            </c:if>
            </c:if>
            </c:forEach>
            <li>
              <i class="fa fa-clock-o bg-gray"></i>
            </li>
          </ul>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->


      <!-- /.row -->

    </section>
            
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
<script
		src="<%=request.getContextPath() %>/plugins/datatables/jquery.dataTables.min.js"></script>
			<script
		src="<%=request.getContextPath() %>/plugins/datatables/dataTables.bootstrap.min.js"></script>
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
layui.define(['laypage', 'fly','upload','util', 'laydate'], function(exports){
layui.use(['table','element','flow','util', 'laydate'], function(){
	  var table = layui.table;
	 var fly = layui.fly;
	 var element = layui.element;
	 var layid = location.hash.replace(/^#tab=/, '');
	 var upload = layui.upload;
		var flow = layui.flow;
		var result;
		var msg;
		var index; var util = layui.util;
	var	laydate = layui.laydate;
	
	 var thisTimer, setCountdown = function(y, M, d, H, m, s){
	
		    var endTime = new Date(y, M||0, d||1, H||0, m||0, s||0) //结束日期
		    ,serverTime = new Date(); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的
		    clearTimeout(thisTimer);
		    util.countdown(endTime, serverTime, function(date, serverTime, timer){
		      var str = date[0] + '天' + date[1] + '时' +  date[2] + '分' + date[3] + '秒';
		      lay('#time_count').html(str);
		 	 console.log(str);
		      thisTimer = timer;
		    });
		  };
		
			  laydate.render({
				    elem: '#part_time_count'
				    ,type: 'datetime'
				    ,done: function(value, date){
				    	console.log(date);
				      setCountdown(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
				    }
				  });
	    $('#example1').DataTable({
	        paging: true,
	        lengthChange: false,
	        searching: true,
	        ordering: true,
	        info: false,
	        autoWidth: true
	        ,hover:true
	        ,processing:true
	       
	      });
	    $('#example2').DataTable({
	        paging: true,
	        lengthChange: false,
	        searching: true,
	        ordering: true,
	        info: false,
	        autoWidth: true
	        ,hover:true
	        ,processing:true
	       
	      });
	    $('#example3').DataTable({
	        paging: true,
	        lengthChange: false,
	        searching: true,
	        ordering: true,
	        info: false,
	        autoWidth: true
	        ,hover:true
	        ,processing:true
	       
	      });
	  var layid = location.hash.replace(/^#user=/, '');
	  element.tabChange('user', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

	  element.on('tab(user)', function(){
	    location.hash = 'user='+ this.getAttribute('lay-id');
	  });
	  $("#usertabChange a").on('click',function(){
			  element.tabChange('user',$(this).attr("value")); 
	  });



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
		    	
		    		//  $("#collection_count").html(count);
		    		  }
		  });
	  table.render({
		    elem: '#meet_collection'
		    ,url:'<%=request.getContextPath() %>/user/meet_collection.html'
		    ,cols: [[
		      {field:'collection_title', width:630, title: '活动收藏',templet: '<div><a href="<%=request.getContextPath() %>/meetid.html?meetid={{ d.meetid }}" target="_blank" class="layui-table-link">{{ d.collectiontitle }}</a></div>'}
		      ,{field:'part_time', width:212, title: '活动时间', sort: true}
		      ,{field:'tool', width:120, title: '操作',toolbar: '#barc'}
		    ]]
		    ,page: true
		    ,loading:true
		    ,even: false
		    ,skin: 'nob'
		    ,done: function(res, curr, count){
		    	
		    	//	 $("#collection_count").html(count);
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
<script type="text/javascript">
function meetCancel(cid){
	layer.confirm('确认撤销活动？<br/>撤销活动将记一张黄牌', {icon: 2, title:'提示'}, function(index){
		$.ajax({
		        url:'<%=request.getContextPath()%>/meet_cancel.html',
		       type:"POST",
				 async:false,
			     data:"meetid="+cid,
		       success: function(data) {
		    	//   class="layui-btn layui-btn-primary" id=" CancelCollection" style="color:#f90;"
		    	   if(data.status==0){
		   		location.reload();
		   		
		   		}
		   		else if(data.status==1){
		   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
		   			
		   				});
		   			
		   		}
				  }
				});
		
		
	});
	}
function meetQuit(cid){
	var confirmindex;
	confirmindex=layer.confirm('确认取消报名？<br/>取消次数达到3次后将不可再参加', {icon: 2, title:'提示'}, function(index){
		  //do something	
	$.ajax({
        url:'<%=request.getContextPath()%>/meet_quit.html',
       type:"POST",
		 async:false,
	     data:"cid="+cid,
       success: function(data) {
    	//   class="layui-btn layui-btn-primary" id=" CancelCollection" style="color:#f90;"
    	   if(data.status==0){
   		location.reload();
   		}
   		else if(data.status==1){
   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
   			
   				});
   		}
   		else if(data.status==2){
   			console.log(data.data);
   			layer.close(layer.index);
   			layer.confirm(data.data+'<br/>此行为将记为一张黄牌', {icon: 2, title:'提示'}, function(index){
   				$.ajax({
   			        url:'<%=request.getContextPath()%>/meet_quit.html',
   			       type:"POST",
   					 async:false,
   				     data:"cid="+cid+'&type=1',
   			       success: function(data) {
   			    	//   class="layui-btn layui-btn-primary" id=" CancelCollection" style="color:#f90;"
   			    	   if(data.status==0){
   			   		location.reload();
   			   		}
   			   		else if(data.status==1){
   			   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
   			   			
   			   				});
   			   		}
   					  }
   					});
   			});
   		}
		  }
		});
	//  layer.close(index);
	});
}
	function deny(meetid,userName){
		layer.confirm('确认拒绝该用户参加？', {icon: 2, title:'提示'}, function(index){
			$.ajax({
			        url:'<%=request.getContextPath()%>/deny_meetUser.html',
			       type:"POST",
					 async:false,
				     data:"meetid="+meetid+'&userName='+userName,
			       success: function(data) {
			    	//   class="layui-btn layui-btn-primary" id=" CancelCollection" style="color:#f90;"
			    	   if(data.status==0){
			   		location.reload();
			   		
			   		}
			   		else if(data.status==1){
			   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
			   			
			   				});
			   			
			   		}
					  }
					});
			
			
		});
	}
	function Notuser(meetid,userName){
		layer.confirm('确认该用户缺席？', {icon: 2, title:'提示'}, function(index){
			$.ajax({
			        url:'<%=request.getContextPath()%>/confirm_NotUser.html',
			       type:"POST",
					 async:false,
				     data:"meetid="+meetid+'&userName='+userName,
			       success: function(data) {
			    	//   class="layui-btn layui-btn-primary" id=" CancelCollection" style="color:#f90;"
			    	   if(data.status==0){
			   		location.reload();
			   		
			   		}
			   		else if(data.status==1){
			   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
			   			
			   				});
			   			
			   		}
					  }
					});
			
			
		});
		
	}
</script>
</body>
</html>