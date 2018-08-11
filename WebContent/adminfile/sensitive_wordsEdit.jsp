<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
			<section class="content-header">

			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i><font><font>
						</font></font></a></li>
				<li class="active"><font><font></font></font></li>
			</ol>
			</section>
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend>书籍编辑管理</legend>
			</fieldset>
			<div class="layui-tab" lay-filter="download">
				<!-- 选项卡管理 -->
				<ul class="layui-tab-title">
					<!-- 选项卡1 -->
					<li lay-id="1"><a
						href="<%=request.getContextPath() %>/adminfile/bookManage//list.html">列表</a></li>
					<!-- 选项卡2 -->
					<li class="layui-this" lay-id="2">编辑</li>
				</ul>
				<!--            选项卡1内容位置 -->
				<div class="layui-tab-content">
					<div class="layui-tab-item">
						<!--   选项卡1内容位置 -->

					</div>
					<!-- 选项卡内容2的开始 -->
					<div class="layui-tab-item layui-show">

						<!-- 选项卡内容2内容位置-->
						<form class="layui-form layui-form-pane" method="post"
							action="<%=request.getContextPath() %>/adminfile/sensitive_words/doedit.html"
							id="add">
							<!-- 新增表单    没有action 在下面脚本实现功能 -->
					
									<input type="hidden" id="swid" name="swid"
										value="${sword.swid }"
										class="layui-input"/>
						
							<div class="layui-form-item">

								<label class="layui-form-label ">敏感词</label>
								<div class="layui-input-inline ">
									<input type="text" id="sensitiveWord" readonly="readonly"
										value="${sword.sensitiveWord }" name="sensitiveWord" lay-verify="required"
										autocomplete="off" class="layui-input">
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">过滤后文本</label>
									<div class="layui-input-inline">
										<input type="text" id="filterword" name="filterword"
											value="${sword.filterword}" lay-verify="required"
											autocomplete="off" class="layui-input">
									</div>
								</div>
							</div>
			<div class="layui-form-item">
									<label class="layui-form-label">是否启用</label>
									<div class="layui-input-inline">
										<select name="statue" id="statue" lay-filter="statue"
											lay-verify="required">
											<option value="${sword.statue }"><c:if test="${sword.statue==0}">启用</c:if><c:if test="${sword.statue==1}">禁用</c:if></option>
											<c:if test="${sword.statue==0}"><option value="1">禁用</option></c:if>
											
										<c:if test="${sword.statue==1}"><option value="0">启用</option></c:if></option>
										</select>
									</div>
								</div>




							<div class="layui-form-item">
								<button class="layui-btn" type="" lay-submit=""
									lay-filter="submit">提交</button>
							</div>
						</form>
					</div>
					<!--  选项卡2结束 -->
					<div class="layui-tab-item">选项卡3内容</div>
				</div>
				<!-- 选项卡内容结束 -->
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

//这是表格的脚本，一般不用动
  $(function () {
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
//这是tab的脚本，一般不用动
  layui.use('element', function(){
	  var $ = layui.jquery
	  ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

	});
  layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form()
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
	  
	  //监听指定开关
	  form.on('switch(switchTest)', function(data){
	    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
	      offset: '6px'
	    });
	    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
	  });
	  
	  //监听提交
	  form.on('submit(demo1)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return false;
	  });
	});
//这是tab的脚本结束


</script>
</body>
</html>