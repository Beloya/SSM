
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<aside class="main-sidebar" style="position:fixed; height:100%;">
<!-- sidebar: style can be found in sidebar.less -->
<div class="slimScrollDiv"
	style="position: relative; overflow: hidden; width: auto; height: 875px;">
	<section class="sidebar"
		style="height: 875px; overflow: hidden; width: auto;"> <!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img id="leftuserImg" src="<%=request.getContextPath() %>/${userImg}"
				class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>${userName}</p>
			<a href="#"><i class="fa fa-circle text-success"></i>欢迎超级管理员</a>
		</div>
	</div>
	<!-- search form --> <!--form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search">搜索</i>
                </button>
              </span>
        </div>
      </form-->

	<ul class="sidebar-menu">
		<li class="header">内容管理</li>

		<li class="treeview" id="infomation"><a href="#"> <i
				class="fa fa-laptop text-light-blue"></i> <span>推送管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
			<ul class="treeview-menu" id="infoMenu" style="display: none;">
				<li id="addinfo"><a
					href="<%=request.getContextPath() %>/adminfile/infomationAdd.htm"><i
						class="fa fa-circle-o"></i> 发表推送</a></li>
				<li id="infoManage"><a
					href="<%=request.getContextPath() %>/adminfile/infomation/list.html"><i
						class="fa fa-circle-o"></i>推送详情</a></li>
						<li id="info_commentManage"><a
					href="<%=request.getContextPath() %>/adminfile/infomation/Info_commentList.html"><i
						class="fa fa-circle-o"></i>推送评论管理</a></li>
			</ul></li>
			
	<li class="treeview" id="sensitive"><a href="#"> <i
				class="fa fa-warning text-red"></i> <span>敏感词管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
			<ul class="treeview-menu" id="sensitiveMenu" style="display: none;">
				<li id="sensitiveManage"><a
					href="<%=request.getContextPath() %>/adminfile/sensitive_words/list.html"><i
						class="fa fa-circle-o"></i>敏感词清单</a></li>
			</ul></li>

		<li class="treeview" id="infomation"><a href="#"> <i
				class="fa fa-paper-plane-o text-aqua"></i> <span>社区管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
			<ul class="treeview-menu" id="BBsMenu" style="display: none;">
			
				<li id="bbs_noteManage"><a
					href="<%=request.getContextPath() %>/adminfile/bbs/bbs_noteList.html"><i
						class="fa fa-circle-o"></i>帖子管理</a></li>
						<li id="bbs_commentManage"><a
					href="<%=request.getContextPath() %>/adminfile/bbs/bbs_commentList.html"><i
						class="fa fa-circle-o"></i>评论管理</a></li>
			</ul></li>
			
		<li class="treeview" id="Meet"><a href="#"> <i
				class="fa fa-certificate "></i> <span>活动管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
			<ul class="treeview-menu" id="MeetMenu" style="display: none;">
				<li id="MeetManage"><a
					href="<%=request.getContextPath() %>/adminfile/Meet/MeetList.html"><i
						class="fa fa-circle-o"></i>活动管理</a></li>
						<li id="MeetUserManage"><a
					href="<%=request.getContextPath() %>/adminfile/Meet/MeetUserList.html"><i
						class="fa fa-circle-o"></i>参与用户管理</a></li>
			</ul></li>
		

			<!--  li class="treeview" id="infomation"><a href="#"> <i
				class="fa  fa-gratipay text-light-blue"></i> <span>消息</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
			<ul class="treeview-menu" id="infoMenu" style="display: none;">
				<li id="addinfo"><a
					href="<%=request.getContextPath() %>/adminfile/infomationAdd.htm"><i
						class="fa fa-circle-o"></i>发布消息</a></li>
				<li id="infoManage"><a
					href="<%=request.getContextPath() %>/adminfile/infomation/list.html"><i
						class="fa fa-circle-o"></i>消息列表</a></li>
			</ul></li-->


		<!-- li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>图表</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a target="navTab" href=""><i class="fa fa-circle-o"></i> ChartJS</a></li>

          </ul>
        </li-->

<% if(session.getAttribute("rootlogin")!=null){ %>
		<li class="header">高级管理</li>
		<li><a
			href="<%=request.getContextPath() %>/managefile/userManage/list.html"><i
				class="fa fa-user text-red"></i> <span>用户管理</span><span
				class="label pull-right bg-red">U</span></a></li>
		<li><a
			href="<%=request.getContextPath() %>/managefile/roleManage/list.html"><i
				class="fa fa-user-secret text-blue"></i> <span>角色管理</span><span
				class="label pull-right bg-blue">R</span></a></li>
						<!-- li class="treeview"><a target=""
			href="<%=request.getContextPath() %>/adminfile/typeManage/list.html">
				<i class="fa fa-file-word-o text-green"></i> <span>系统日志</span> <span
				class="pull-right-container"> <span
					class="label label-primary pull-right"></span>
			</span>
		</a></li-->
				<%} %>
		<!--li><a href="javascript:void(0);"><i class="fa fa-circle-o text-yellow"></i> <span>警告</span></a></li>
        <li><a href="javascript:void(0);"><i class="fa fa-circle-o text-aqua"></i> <span>消息</span></a></li-->
	</ul>
	</section>
	<div class="slimScrollBar"
		style="background: rgba(0, 0, 0, 0.2); width: 3px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 826.809px;"></div>
	<div class="slimScrollRail"
		style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
</div>
<!-- /.sidebar --> </aside>
