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
				<font><font>敏感词管理 </font></font><small><font><font></font></font></small>
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
					<li class="layui-this"><a
						href="<%=request.getContextPath() %>/adminfile/sensitive_words/list.html">列表</a></li>
					<li>新增</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<!--     选项卡1内容-->
						<section class="content">
						<div class="row">
							<div class="col-xs-12">
								<div class="box">

									<div class="box">
										<div class="box-header">
											<h3 class="box-title">敏感词清单</h3>

										</div>
										<!-- /.box-header -->
										<div class="box-body">
											<!-- 表格 -->
											<table id="example1"
												class="table table-bordered table-striped">
												<thead>

													<tr>
														<th>敏感词编码</th>
														<th>敏感词</th>
														<th>过滤后文本</th>
														<th>修改时间</th>
														<th>状态</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${Swords}" var="list">
														<tr>
															<td>${list.swid}</td>
															<td>${list.sensitiveWord}</td>
															<td>${list.filterword}</td>
															<td><fmt:formatDate value="${list.ctime}"
																	pattern="yyyy年MM月dd日 HH:mm:ss" /></td>
															<td>
															<form class="layui-form" action="">
															  
  

      <input type="checkbox" <c:if test="${list.statue==0}"> checked </c:if> name="statue" lay-skin="switch" value="${list.swid}" lay-filter="switchTest" lay-text="启用|禁用" />

															</form>
															</td>
															<td>
																<div class="layui-btn-group">

																	<button
																		class="layui-btn layui-btn-small layui-btn-normal"
																		onclick="editdata('${list.swid}');">
																		<i class="layui-icon"></i>
																	</button>
																	<button
																		class="layui-btn layui-btn-small layui-btn-danger"
																		onclick="deletedata('${list.swid}');">
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
					<div class="layui-tab-item">

						<form class="layui-form layui-form-pane" id="add">
							<!-- 新增表单    没有action 在下面脚本实现功能 -->
							<div class="form-group">
								<label class="layui-form-label ">敏感词</label>
								<div class="layui-input-inline ">
									<input type="text" id="sensitiveWord" name="sensitiveWord"
										lay-verify="required" autocomplete="off" class="layui-input">
										<p id="sensitiveWordtip" style="color: #FF5722;" class="layui-hide">该敏感词已存在</p>
								</div>
							</div>
							<div class="layui-form-item">

								<label class="layui-form-label ">过滤后文本</label>
								<div class="layui-input-inline ">
									<input type="text" id="filterword" name="filterword"
										lay-verify="required" autocomplete="off" class="layui-input">
								</div>

						





							<div class="layui-form-item">
								<button class="layui-btn" type="" lay-submit=""
									lay-filter="submit">提交</button>
							</div>
						</form>
					</div>
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
  $(function () {
	  $("#sensitive").addClass("active");
	  $("#sensitiveManage").addClass("active");
	  $("#sensitiveMenu").addClass("menu-open");
	  $("#sensitiveMenu").css("display","block");
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
  layui.use('element', function(){
	  var $ = layui.jquery
	  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

	});
  layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  
	 
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
	  
	  
	  //监听提交
	/*  form.on('submit(submit)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return false;
	  });
	  */
	  
	});
  
  function deletedata(swid){
	  
	  layer.confirm('确认删除?', {icon: 3, title:'提示'}, function(index){

		 location.href="<%=request.getContextPath() %>/adminfile/sensitive_words/delete.html?swid="+swid;  	  
		  layer.close(index);
		});
	  }
	  
	  function editdata(swid){
			 location.href="<%=request.getContextPath() %>/adminfile/sensitive_words/toedit.html?swid="+swid;  	  

		  }
  
  //下面是新增表单的提交方法
  layui.use(['layer','form'], function(){
		var $ = layui.jquery
		,form = layui.form
		,layer = layui.layer;
		 //新增表单成功回馈,一般不动
  function Success() {
		layer.msg("添加成功", {icon:6, time:2000}, function(index){
        layer.close(index);
        $('#add')[0].reset();
      
    });
	}
		 
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
		 
  form.on('switch(switchTest)', function(data){
	  
	   var statue= this.checked ? 'true' : 'false'
			  
	
	   var swid=this.value;
	    $.ajax({
            url:'<%=request.getContextPath() %>/adminfile/sensitive_words/changeStatue.html',
           type:"POST",
			 async:false,
		     data:"statue="+statue+"&swid="+swid,
           success: function(data) {
        	   if(data.code==0){
        	   layer.msg(data.msg, {
        		      offset: '6px'
        		    });
        	   }
        	   else{
        		   layer.msg('更新失败', {
         		      offset: '6px'
         		    }); 
        		   
        	   }
			  }
			});
	  });
  function Error() {
		layer.msg("添加失败", {icon:5, time:2000}, function(index){
      layer.close(index);
  });
	}
  form.on('submit(submit)', function(data){
	  //下面是新增表单提交,自行修改网址
	  //记得返回msg数据
	  $.post('<%=request.getContextPath() %>/adminfile/sensitive_words/add.html', data.field, function(msg) {
  			msg.code == 0 ? Success() : Error();			
  		});
	    return false;
	  });
  });
  function sensitiveWordError(msg){

	  var $tip=$("#sensitiveWordtip");
		
		$tip.removeClass('layui-hide');
  }
  function vsensitiveWord(){
	  var $tip=$("#sensitiveWordtip");
		 
		$tip.addClass('layui-hide');
	 
	 
  }
  $("#sensitiveWord").blur(function (data){
	  var sensitiveWord=document.getElementById("sensitiveWord").value;
	  $.post('<%=request.getContextPath() %>/adminfile/sensitive_words/vadd.html?sensitiveWord='+sensitiveWord, function(msg) {
		  msg.code == 0 ? sensitiveWordError(msg.msg) : vsensitiveWord();		
	
		});
	    return false;
	});
  
</script>
</body>
</html>