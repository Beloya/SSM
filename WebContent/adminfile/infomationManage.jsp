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
				<font><font> 文章管理 </font></font><small><font><font></font></font></small>
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
											<h3 class="box-title">文章管理</h3>

										</div>
										<!-- /.box-header -->
										<div class="box-body" id="layer-photos-demo">
											<!-- 表格 -->
											<table id="example1" class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>标题</th>
														<th>类型</th>
														<th>内容</th>
														<th>来源</th>
														<th>推送海报</th>
														<th>时间</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${informations}" var="list">
														<tr>
															<td class="">${list.title}</td>
															<td>${list.type}</td>
															<td><button
																		class="layui-btn  layui-btn-normal"
																		onclick="SeeInfomation('${list.informationID}');">
																		<i class="layui-icon">&#xe705;</i>查看
																	</button>
																	</td>
															<td>${list.source}</td>
															<td "><img  layer-pid="图片id，可以不写" layer-src="<%=request.getContextPath() %>/${list.img}" src="<%=request.getContextPath() %>/${list.img}" style="height: 80px; width: 120px;" alt="图片名"></td>
															<td><fmt:formatDate value="${list.time}"
																	pattern="yyyy年MM月dd日 HH:mm:ss" /></td>

															<td>
																<div class="layui-btn-group">

																	<button
																		class="layui-btn layui-btn-small layui-btn-normal"
																		onclick="editdata('${list.informationID}');">
																		<i class="layui-icon"></i>
																	</button>
																	<button
																		class="layui-btn layui-btn-small layui-btn-danger"
																		onclick="deletedata('${list.informationID}');">
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
$("#infomation").addClass("active");
$("#infoManage").addClass("active");
$("#infoMenu").addClass("menu-open");
$("#infoMenu").css("display","block");
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
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
	  form.verify({
	    title: function(value){
	      if(value.length < 5){
	        return '标题至少得5个字符啊';
	      }
	    }
	  
	    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
	    ,content: function(value){
	      layedit.sync(editIndex);
	    }
	  });
	  layer.photos({
		  photos: '#layer-photos-demo'
, tab: function(pic, layero){
		    console.log(pic) //当前图片的一些信息
		  }
		});
	  //监听指定开关
	  form.on('switch(switchTest)', function(data){
	    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
	      offset: '6px'
	    });
	    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
	  });
	  
	  //监听提交


	  
	});
  
  function SeeInfomation(InformationID) {
		layui.use(['layer'], function(){
		  layer.open({
			  type: 2,
			  title: ['个人信息', 'font-size:18px;'],
			  shade: false,
			  scrollbar: false,
			  area: ['900px','600px'],
			  
			  maxmin: true,
			  content: '<%=request.getContextPath() %>/info.html?informationID='+InformationID,

			  success: function(layero){

			  }
			}); });}
  function deletedata(informationID){
	  
	  layer.confirm('确认删除?', {icon: 3, title:'提示'}, function(index){

		 location.href="<%=request.getContextPath() %>/adminfile/infomation/delete.html?informationID="+informationID;  	  
		  layer.close(index);
		});
	  }
	  
	  function editdata(informationID){
			 location.href="<%=request.getContextPath() %>/adminfile/infomation/toedit.html?informationID="+informationID;  	  

		  }
  

</script>
</body>
</html>