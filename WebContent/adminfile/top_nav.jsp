<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%Cookie[] cookies=request.getCookies();
if(session.getAttribute("userName")==null&&cookies!=null){
				for(Cookie cookie:cookies)
				{
				
						System.out.println(cookie.getName());
						if(cookie.getName().equals("CpassWord")){
						%><script type="text/javascript">  window.location.replace("/dologin.html");  
			</script>
<% 
						}
				}
			
	
				
			}%>

<header class="main-header" style="position:fixed; width:100%;">
<!-- Logo --> <a
	href="<%=request.getContextPath() %>/adminfile/index.html" class="logo">
	<!-- mini logo for sidebar mini 50x50 pixels --> <span
	class="logo-mini"><b>F</b>M</span> <!-- logo for regular state and mobile devices -->
	<span class="logo-lg"><b>FriendChat</b>Manage</span>
</a> <!-- Header Navbar: style can be found in header.less --> <nav
	class="navbar navbar-static-top">
<div class="navbar-custom-menu">
	<ul class="nav navbar-nav">
		<li class="dropdown user user-menu"><a href="#"
			class="dropdown-toggle" data-toggle="dropdown"> <img id="userImg"
				src="<%=request.getContextPath() %>/${userImg}" class="user-image"
				alt="User Image"> <span class="hidden-xs">${userName}</span></a>
			<ul class="dropdown-menu">
				<!-- User image -->
				<li class="user-header"><img id="userImg1"
					src="<%=request.getContextPath() %>/${userImg}" class="img-circle"
					alt="User Image">

						<p id="toppersonSay">简介:${user.personSay}</p></li>
				<!-- Menu Body -->
				<li class="user-body">
					<div class="row">
						<div class="col-xs-4 text-center">
							<a href="#">关注</a>
							<p>20</p>
						</div>
						<div class="col-xs-4 text-center">
							<a href="#">粉丝</a>
							<p>20</p>
						</div>
						<div class="col-xs-4 text-center">
							<a href="#">动态</a>
							<p>1</p>
						</div>
					</div> <!-- /.row -->
				</li>
				<!-- Menu Footer-->
				<li class="user-footer">
					<div class="pull-left">
						<a href="#" onclick="Update();" class="btn btn-default btn-flat">个人中心</a>
					</div>
					<div class="pull-right">
						<a href="<%=request.getContextPath() %>/logout.do"
							class="btn btn-default btn-flat">注销</a>
					</div>
				</li>
			</ul></li>
		<li><a href="#" data-toggle="control-sidebar"><i
				class="fa fa-gears"></i></a></li>
	</ul>
</div>
</nav> </header>


<aside class="control-sidebar control-sidebar-dark"> <!-- Create the tabs -->
<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
	<!--li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li-->
</ul>
<!-- Tab panes -->
<div class="tab-content">
	<!-- Home tab content -->
	<div class="tab-pane" id="control-sidebar-home-tab">

		<!-- /.control-sidebar-menu -->


		<!-- /.control-sidebar-menu -->

	</div>

	<!-- Settings tab content -->
	<div class="tab-pane" id="control-sidebar-settings-tab"></div>
	<!-- /.tab-pane -->
</div>
</aside>
<div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>
<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript">
function Update() {
	layui.use(['layer'], function(){
	  layer.open({
		  type: 2,
		  title: ['个人信息', 'font-size:18px;'],
		  shade: false,
		  scrollbar: false,
		  area: ['900px','600px'],
		  
		  maxmin: true,
		  content: '<%=request.getContextPath() %>/Updata.htm',

		  success: function(layero){

		  }
		}); });}

</script>
