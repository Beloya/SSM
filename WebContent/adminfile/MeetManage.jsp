<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/bootstrap/css/bootstrap.min.css" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/font-awesome.min.css" />
<!-- Ionicons -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/ionicons.min.css" />
<!-- DataTables -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/datatables/dataTables.bootstrap.css" />
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/AdminLTE.min.css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/skins/_all-skins.min.css" />
<title>管理系统</title>
</head>

<body class="skin-blue sidebar-mini">
	<%


%>
	<div class="wrapper">
		<%@ include file="../adminfile/top_nav.jsp"%>
		<%@ include file="../adminfile/left_nav.jsp"%>


		<div class="content-wrapper"
			style="height: 100%; min-height: 897px; background-color: #FFFFFF;">
			<section class="content-header" style="padding-top:4.5em;">
			<h1>
				<font><font>活动管理 </font></font><small><font><font></font></font></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i><font><font>
						</font></font></a></li>
				<li class="active"><font><font></font></font></li>
			</ol>
			</section>
			<div class="layui-tab">
				<ul class="layui-tab-title">
					<!--     选项卡标题 -->
					<li class="layui-this"><a href="">列表</a></li>

				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<!--     选项卡1内容-->
						<section class="content" >
						<div class="row">
							<div class="col-xs-12">
								<div class="box" >

									<div class="box">
										<div class="box-header">
											<h3 class="box-title">活动管理</h3>

										</div>
										<!-- /.box-header -->
										<div class="box-body" id="layer-photos-demo">
											<!-- 表格 -->
											<table id="example1" class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>活动标题</th>
														<th>活动海报</th>
														<th>活动介绍</th>
														<th>发起人</th>
														<th>活动地点</th>
														<th>活动时间</th>
															
														<th>限定人数</th>
														<th>首页推荐</th>
														<th>活动状态</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${meets}" var="list">
														<tr>
															<td class="">${list.title}</td>
															<td><img  layer-pid="图片id，可以不写" layer-src="<%=request.getContextPath() %>/${list.img}" src="<%=request.getContextPath() %>/${list.img}" style="height: 80px; width: 120px;" alt="图片名" /></td>
															<td><button
																		class="layui-btn  layui-btn-normal"
																		onclick="SeeInfomation('${list.meetid}');">
																		<i class="layui-icon">&#xe705;</i>查看
																	</button>
																	</td>
																	<td class="">${list.userName}</td>
																	<td class="">
																	<c:if test="${list.sf!=list.cityName}">
																	${list.sf}省${list.cityName}市${list.address}
																	</c:if>
																		<c:if test="${list.sf==list.cityName}">
																	${list.cityName}${list.address}
																	</c:if>
																	</td>
																	<td><fmt:formatDate value="${list.part_time}"
																	pattern="yyyy年MM月dd日 HH:mm:ss" />~<br/><fmt:formatDate value="${list.end_time}"
																	pattern="yyyy年MM月dd日 HH:mm:ss" /></td>
																	<td class="">${list.pepolecount}</td>
															<td >
																<form class="layui-form" >
															<c:if test="${list.hot==0}">
															<input type="checkbox" id="set" name="hot"  value="${list.meetid }" title="推荐" lay-filter="meet_hot" />
															</c:if>
																<c:if test="${list.hot==1}">
															<input type="checkbox" id="Cancel" value="${list.meetid }" name="hot" title="推荐" lay-filter="meet_hot" checked />
															</c:if>
															</form>
															</td>
															
<td>
<c:if test="${list.status==2}">
<div class="btn-group">
  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    活动审核中<span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a onclick="Meet_Auditing(${list.meetid},'Ok')" >通过</a></li>
    <li role="separator" class="divider"></li>
    <li><a onclick="Meet_Auditing(${list.meetid},'Not')" >不通过</a></li>
  </ul>
</div>
</c:if>
<c:if test="${list.status==1}">
<div class="btn-group">
  <button type="button"  class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    活动报名中<span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a onclick="Meet_Auditing(${list.meetid},'Not')" >下架活动</a></li>
  </ul>
</div>
</c:if>
<c:if test="${list.status==0}">
<div class="btn-group">
  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    活动已开始<span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a onclick="Meet_Auditing(${list.meetid},'Not')" >下架活动</a></li>
  </ul>
</div>
</c:if>
<c:if test="${list.status==-1}">
<div class="btn-group">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    活动已结束<span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
  <li><a onclick="Meet_Auditing(${list.meetid},'Not')" >下架活动</a></li>
  </ul>
</div>
</c:if>
<c:if test="${list.status==-2}">
<div class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    审核不通过<span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
  <li><a onclick="Meet_Auditing(${list.meetid},'Ok')" >通过</a></li>
  </ul>
</div>
</c:if>
</td>
															<td>
																<div class="layui-btn-group">

																	<button
																		class="layui-btn layui-btn-small layui-btn-danger"
																		onclick="deletedata('${list.meetid}','${list.userName}');">
																		<i class="layui-icon"></i>
																	</button>

																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
												<!-- 表格尾，有需要自行修改 -->
												<!--tfoot>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                </tr>
                </tfoot-->
											</table>
										</div>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						</section>
					</div>
					<!-- 选项卡2的开始 -->

					<!--  选项卡2结束 -->
				</div>
			</div>
		</div>
	</div>

	<script
		src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="<%=request.getContextPath() %>/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="<%=request.getContextPath() %>/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath() %>/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath() %>/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->

	<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript">
$("#MeetMenu").addClass("active");
$("#MeetManage").addClass("active");
$("#MeetMenu").addClass("menu-open");
$("#MeetMenu").css("display","block");
  $(function () {

    $('#example1').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false
      ,"hover":true
     
    });

  });
  
  layui.use('element', function(){
	  var $ = layui.jquery
	  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

	});
 
  layui.use(['form', 'layedit', 'laydate','layer'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  //创建一个编辑器
	
	  layer.photos({
		  photos: '#layer-photos-demo'
, tab: function(pic, layero){
		  
		  }
		});
	    form.on('checkbox(meet_hot)', function(data){    	
	 if(data.elem.id=='set'){
		 $.ajax({
		        url:'<%=request.getContextPath()%>/adminfile/Meet/ChangeHot.html',
		       type:"POST",
				 async:false,
			     data:"id="+data.value+"&field=set",
		       success: function(data) {
		    	   if(data.status==0){
		   	
		   		}
		   		else{
		   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
		   			
		   				});
		   		}
				  } 
				}); 
	 }	  
	 if(data.elem.id=='Cancel'){
		 $.ajax({
		        url:'<%=request.getContextPath()%>/adminfile/Meet/ChangeHot.html',
		       type:"POST",
				 async:false,
			     data:"id="+data.value+"&field=cancel",
		       success: function(data) {
		    	   if(data.status==0){
		   	
		   		}
		   		else{
		   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
		   			
		   				});
		   		}
				  }
				});	 
	 }
	    	  
	    	}); 
	
	  $(document).ready(function() {
		    var eventFired = function(type) {
		        console.log('<div>' + type + ' 事件- ' + new Date().getTime() + '</div>');
		     
		    }
   
	  $('#example1').on('order.dt',
			 /*   function() {
			        eventFired('排序');
			    }).on('search.dt',
			    function() {
			        eventFired('搜索');
			    }).on('page.dt',*/
			    function() {
			    	form.render(); 
			        eventFired('翻页');
			    }).dataTable();
	  });
	});
  function Meet_Auditing(meetid,field){
	  if(field=='Ok'){
			 $.ajax({
			        url:'<%=request.getContextPath()%>/adminfile/Meet/ChangeStatus.html',
			       type:"POST",
					 async:false,
				     data:"id="+meetid+"&field=Ok",
			       success: function(data) {
			    	   if(data.status==0){
			   	location.reload();
			   		}
			   		else{
			   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
			   			
			   				});
			   		}
					  } 
					}); 
	  }
	  if(field=='Not'){
			 $.ajax({
			        url:'<%=request.getContextPath()%>/adminfile/Meet/ChangeStatus.html',
			       type:"POST",
					 async:false,
				     data:"id="+meetid+"&field=Not",
			       success: function(data) {
			    	   if(data.status==0){
			    		   location.reload();
			   		}
			   		else{
			   			layer.msg(data.msg, {icon:5, time:2000}, function(index){
			   			
			   				});
			   		}
					  } 
					}); 
	  }
	  
  }
  function SeeInfomation(meetid) {
		layui.use(['layer'], function(){
		  layer.open({
			  type: 2,
			  title: ['个人信息', 'font-size:18px;'],
			  shade: false,
			  scrollbar: false,
			  area: ['900px','600px'],
			  
			  maxmin: true,
			  content: '<%=request.getContextPath() %>/meetdetail.html?meetid='+meetid,

			  success: function(layero){

			  }
			}); });}
  function deletedata(meetid,userName){
	  
	  layer.confirm('确认删除?', {icon: 3, title:'提示'}, function(index){

		 location.href="<%=request.getContextPath() %>/adminfile/Meet/meet_del.html?meetid="+meetid;  	  
		  layer.close(index);
		});
	  }
	  
	  function editdata(informationID){
			 location.href="<%=request.getContextPath() %>/adminfile/infomation/toedit.html?informationID="+informationID;  	  

		  }
  

</script>
</body>
</html>