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

	<div class="wrapper">
		<%@ include file="../adminfile/top_nav.jsp"%>
		<%@ include file="../adminfile/left_nav.jsp"%>


		<div class="content-wrapper"
			style="height: 100%; min-height: 897px; background-color: #FFFFFF;">
			<section class="content-header" style="padding-top:4.5em;">
			<h1>
				<font><font> 发表文章 </font></font><small><font><font></font></font></small>
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

					<li class="layui-this">编辑</li>
				</ul>
				<div class="layui-tab-content">


					<!-- 选项卡2的开始 -->
					<div class="layui-tab-item layui-show">

						<form class="layui-form layui-form-pane" id="edit">
							<!-- 新增表单    没有action 在下面脚本实现功能 -->
							<input type="text" value="${information.informationID }"
								name="informationID" required lay-verify="required"
								placeholder="" autocomplete="off" class="layui-input layui-hide" />
								<div class="form-group">
									<label class="layui-form-label ">标题</label>
									<div class="layui-input-block ">
										<input type="text" value="${information.title }" name="title"
											required lay-verify="required" placeholder="请输入标题"
											autocomplete="off" class="layui-input" />
									</div>
								</div>
								<div class="form-group">
									<label class="layui-form-label ">来源</label>
									<div class="layui-input-block ">
										<input type="text" name="source"
											value="${information.source }" placeholder="可选填"
											autocomplete="off" class="layui-input" />
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">选择类别</label>
									<div class="layui-input-inline">
										<select name="Type" id="Type" lay-filter="Type"
											lay-verify="required">
											<option value="${information.type }">${information.type }</option>
											<option value="公告">公告</option>
											<option value="新闻">新闻</option>
											<option value="通知">通知</option>
											<option value="推送图文">推送图文</option>

										</select>
									</div>
								</div>

  <div class="layui-form-item">
    <label class="layui-form-label">推送海报</label>
    <div class="layui-input-block">
   <div class="row">
  <div class="col-xs-8 col-md-6" style="padding-left:0px;">
    <a href="#" class="thumbnail">
     <img data-src="" alt="" src="<%=request.getContextPath() %>/${information.img }" id="showImg" data-holder-rendered="true" style="height: 300px; width: 100%; display: block;" />
     <input type="text" name="Img" id="img" class="layui-hide" value="${information.img }" />
    </a>
  </div>
   <div class="col-xs-6 col-md-4">
  <div class="layui-upload-drag" id="test10">
  <i class="layui-icon"></i>
  <p>点击上传，或将文件拖拽到此处</p>
  </div>
   <p class="layui-word-aux">温馨提示： 
可以点击上传选择图片，也可以直接拖拽图片至此窗口。
<br/>
<br/>
<br/>
一张漂亮的海报，能让你的活动锦上添花，带来更多用户报名 
及增加传播效果！</p>
</div>
</div>
    </div>
   
  </div>
 

								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">内容</label>
									<div class="layui-input-block">
										<textarea class="layui-textarea" name="Content"
											lay-verify="content" id="LAY_demo_editor">${information.content }</textarea>
									</div>
									</div>
								
					

				



						<div class="layui-form-item">
							<button class="layui-btn" type='button' lay-submit="" lay-filter="*">提交</button>
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

	<!-- FastClick -->
	<script
		src="<%=request.getContextPath() %>/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath() %>/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"></script>
	<script type="text/javascript">
$("#infomation").addClass("active");
$("#infoManage").addClass("active");
$("#infoMenu").addClass("menu-open");
$("#infoMenu").css("display","block");

  layui.use(['element','form', 'layedit', 'laydate','upload','layer'], function(){
	  var $ = layui.jquery
	  ,element = layui.element
	  , form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	var layer = layui.layer;
   layedit.set({
						  uploadImage: {
						    url:'<%=request.getContextPath()%>/upload.html'
						    	,type:'POST'
						        ,done: function(res){
						  
							    	if(res.code==0){
							    		
							    	}
							    }
						  }
						});
	  var editIndex = layedit.build('LAY_demo_editor');
	  //自定义验证规则

	  function Success() {
			layer.msg("修改成功", {icon:6, time:2000}, function(index){
	        layer.close(index);
	        location.href="<%=request.getContextPath()%>/adminfile/infomation/list.html";
	        
	    });
		}
	  function Error() {
			layer.msg("修改失败", {icon:5, time:2000}, function(index){
	      layer.close(index);
	  });
		}
	  form.on('submit(*)', function(data){
		  //下面是新增表单提交,自行修改网址
		      data.field.content=layedit.getContent(editIndex);
						    $("#LAY_demo_editor").text(data.field.content);
						
		  //记得返回msg数据
		  $.post('<%=request.getContextPath() %>/adminfile/infomation/doedit.html', data.field, function(msg) {
	  			msg.code == 0 ? Success() : Error();			
	  		});
		    return false;
		  });
	});

  layui.use('upload', function(){
	  var upload = layui.upload;
	  upload.render({
		    elem: '#test10'
		    ,url: '<%=request.getContextPath()%>/upload.html'
		    ,accept:'images'
		    ,acceptMime:'image/*'
		   // ,auto:false
		  //,bindAction:'#sumbit'
		    ,size:'512'
		/*  ,choose: function(obj){
		    	var files = obj.pushFile();
		    	 obj.preview(function(index, file, result){
		    	     /* console.log(index); //得到文件索引
		    	      console.log(file); //得到文件对象
		    	      console.log(result); //得到文件base64编码，比如图片
		    	      //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
		    	      $('#showImg').attr("src",result);
		    	      $('#showImg').attr("alt",file.name);
		    	    });
		    
		    }*/
		    ,done: function(res){
		    	if(res.code==0){
		   
		      $("#showImg").attr("src","<%=request.getContextPath()%>/"+res.msg);
		      $("#img").attr("value",res.msg);
		    	}
		    }
		  });
	});

  //下面是新增表单的提交方法


  
  
</script>
</body>
</html>