<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/SigmarOne.woff2"
	type="text/css">
	<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />
		<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/formSelectsv4/formSelects-v4.css"
	media="all" />
	<style type="text/css">
	.xm-select-parent .xm-form-select dl dd, .xm-select-parent .xm-form-select dl dt{
	padding:10px 10px 10px 10px;
	}
.layui-form-pane .xm-select, .layui-form-pane .xm-select:hover{
	border-color:#000;
	}
	.layui-form-pane .xm-select-title{
	border:1px solid #e6e6e6!important;}
	</style>
</head>

<body>
<div class="container sidebar-position-right page-home">
<nav class="Top"> <%@ include file="Nav.jsp"%>
		<p id="offscreen-text" class="offscreen-text"></p>
		<p id="text" class="text"></p>
		<svg id="svg"> </svg> <input type="hidden" class="input" value=""
			id="input" /> </nav>
			
<div id="main" class="main" style="padding-bottom:500px; margin-top: 100px;">
<div class="layui-row">
<div class="layui-col-xs10 layui-col-sm10 layui-col-md10 layui-col-md-offset1 layui-xs-md-offset1 layui-col-sm-offset1 fly-panel" style="background-color: #fff;box-shadow:0 1px 2px 0 rgba(100,100,100,.7);border-radius:2px;">
<div class="layui-tab layui-tab-brief">
<ul class="layui-tab-title">
          <li class="layui-this">发表新文章<!-- 编辑帖子 --></li>
        </ul>
<form class="layui-form layui-form-pane" >

<div class="layui-row layui-col-space15 layui-form-item" style="padding-top: 25px;">
                <div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-md-offset1 layui-xs-md-offset1 layui-col-sm-offset1">
                  <label class="layui-form-label">文章类别</label>
                  <div class="layui-input-block">
                    <select id="type" name="type" lay-verify="" lay-verify="required" lay-filter="typeSelect">
                    <c:forEach items="${types}" var="type">
  <option value="${type.tid}" <c:if test="${archives.type==type.tid}"> selected</c:if>>${type.tdescribe}</option>
  </c:forEach>

</select>   

                  </div>
                  
                </div>
                  <div class="layui-col-xs1 layui-col-sm1 layui-col-md1" style="padding-top:10px;">
              <a id="NewType" style="cursor:pointer;"> <i class="layui-icon " style="font-size: 25px; color: #2F4056;">&#xe61f;</i>  
               </a>
         
                  </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                  <label for="L_title" class="layui-form-label">标题</label>
                  <div class="layui-input-block">
                    <input type="text" id="Title" name="title" required="" value="${archives.title}" lay-verify="required" autocomplete="off" class="layui-input">
                    <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                  </div>
                </div>
              </div>
  <div class="layui-row ">
   <div class="layui-col-md10 layui-col-sm10 layui-col-xs10  layui-col-md-offset1 layui-xs-md-offset1 layui-col-sm-offset1 ">
<div id="editor" name="context" style="background-color:#fff;padding-bottom:20px;position: sticky;height:400px;" layer-pid="图片id，可以不写"  >
  ${archives.context}

</div>


</div>

</div>
		
  <div class="layui-row ">
  <c:if test="${empty archives.archivesflags }">
   <div class="layui-col-md5 layui-col-sm5 layui-col-xs5  layui-col-md-offset1 layui-xs-md-offset1 layui-col-sm-offset1 ">
<div  class="layui-form" style="max-width: 400px; margin-top: 20px; " >

			<select name="Flag" id="Flag" xm-select="flag"  xm-select-skin="normal"  xm-select-search xm-select-search-type="dl">
		
			<c:forEach items="${flags}" var="flag">
			<option value="${flag.fid}"
				<c:forEach items="${archives.archivesflags }" var="afs">
				 <c:if test="${afs.fid==flag.fid }">selected</c:if>
</c:forEach>
>${flag.fdescribe}</option>
				</c:forEach>
			</select>
		
		</div>
		</div>
		         <div class="layui-col-xs1 layui-col-sm1 layui-col-md1" style="padding-top:25px;">
              <a id="NewFlag" style="cursor:pointer;"> <i class="layui-icon " style="font-size: 25px; color: #2F4056;">&#xe61f;</i>  
               </a>
       
                  </div>
                  	</c:if>
		     <div class="layui-col-xs3 layui-col-sm3 layui-col-md3 " style="max-width: 400px; margin: 20px; ">
                  <label class="layui-form-label">可见性</label>
                  <div class="layui-input-block">
                    <select name="VID" lay-verify="" >
                    

  <c:forEach items="${archivesvisibilities }" var="avs">
  
  <option value="${avs.id }" <c:if test="${archives.vid==avs.id }">selected</c:if>>${avs.vdescribe }</option>

  </c:forEach>
</select>   
                  </div>
                </div>
		</div>
		<input type="hidden"name="formToken" value="${formToken}" />
		<input type="hidden"name="AID" value=" ${archives.aid}" />
		<input type="hidden"name="readcount" value=" ${archives.readcount}" />
  <div class="layui-row ">
   <div class="layui-col-md4 layui-col-sm4layui-col-xs4  layui-col-md-offset1 layui-xs-md-offset1 layui-col-sm-offset1 " style="margin-top:20px;">
   
      <button class="layui-btn layui-btn-normal" type ="submit" id="FormBtn" lay-submit="" lay-filter="FormBtn"><i class="layui-icon">&#xe609;</i>发送</button>
  
    </div>
  </div>
</form>
</div>
</div>
</div>
</div>


 <%@ include file="footer.jsp"%>
 </div>
 <script src="<%=request.getContextPath() %>/js/jquery-2.1.1.min.js" charset="utf-8"></script> 


 <script type="text/javascript" src="<%=request.getContextPath() %>/plugins/wangEditor-3.1.1/release/wangEditor.min.js"></script>
 	<script src='js/CSSPlugin.min.js'></script>
	<script src='js/EasePack.min.js'></script>
	<script src='js/TweenLite.min.js'></script>
	<script src="js/index.js"></script>

 <script src="<%=request.getContextPath() %>/js/autoSave.js" type="text/javascript"></script>
    <script type="text/javascript">
 
    var formSelects;
    layui.config({
        base: '<%=request.getContextPath() %>/plugins/formSelectsv4/' //此处路径请自行处理, 可以使用绝对路径
    }).extend({
        formSelects: 'formSelects-v4'
    });
    function Newtype(){
    	
 

    	}
    
    
    
    
    function NewFlag(){
    	layer.prompt({
    			title: '新的标签'
    },
    			function(value, index, elem){
    	
    		  alert(value); //得到value
    		  layer.close(index);
    		});
    	
    	}
    
    layui.use(['form', 'layedit', 'laydate'], function(){
    	  var form = layui.form
    	,$ = layui.jquery
    	  ,layer = layui.layer
    	   ,formSelects = layui.formSelects
    	  ,laydate = layui.laydate,
    	  _LastContent;
     
    	  
    	    if(( _LastContent=GetCookie('AutoSaveContent'))!=null){
    	    	 var cfindex=  layer.open({
    	    		   content: '发现草稿,是否加载'
    	    		   ,btn: ['确认', '取消']
    	    		   ,yes: function(index, layero){
    	    			   editor.txt.html(_LastContent);
    	    			   layer.close(cfindex);
    	    		   }
    	    		   ,btn2: function(index, layero){
    	    			   layer.confirm('纳尼？此操作会清空草稿，请再次确认', {
    	    				   btn: ['清空', '加载'] //可以无限个按钮
    	    				  
    	    				 }, function(index, layero){
    	    					 DeleteCookie('AutoSaveContent');
    	    					 layer.msg('草稿已清空', {icon: 1});
    	    				 }, function(index){
    	    					   editor.txt.html(_LastContent);
    	    	    			  
    	    				 });
    	    		   }
    	    			   
    	    		 
    	    		   ,cancel: function(){ 
    	    		     //右上角关闭回调
    	    		     
    	    		     //return false 开启该代码可禁止点击该按钮关闭
    	    		   }
    	    		 });
    	       }
    	  
    	  form.on('select(typeSelect)', function(data){
    		  console.log(data);
    		});
       	  form.on('submit(FormBtn)', function(data){
       		 var sele=layui.formSelects.value('flag', 'name'); 
       		 console.log(sele);
       		data.field.context=editor.txt.html();
      	  $("#FormBtn").val("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
			$("#FormBtn").addClass("layui-btn-disabled");
 		    $.ajax({ 
 		    	<c:if test="${empty archives}">
 		    	url: "<%=request.getContextPath()%>/Createarchives", 
 		    	</c:if>
 		   	<c:if test="${!empty archives}">
		    	url: "<%=request.getContextPath()%>/Updatearchives", 
		    	</c:if>
 		    	type:'POST',
 		    	data:data.field,
                      success: function(result){
          if(result.code=="1"){
        		$("#submit").html("<i class='layui-icon'>&#xe609;</i>发送");
        		$("#submit").removeClass("layui-btn-disabled");
        		 layer.msg(result.Msg, {
	        		  icon: 5,
	        		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	        		}, function(){
	        		  //do something
	        		});  
            
          }
          if(result.code=="0"){
        	  var AID=result.AID;
        	  DeleteCookie('AutoSaveContent');
       window.location.href="<%=request.getContextPath()%>/archives/"+AID+"_1"
 }
                      }});
  
  		    return false;
  		  });

    
       	
       	
       	//新类型
     $("#NewType").click(function(){
    	   	layer.prompt({
    			title: '新的类型'
    },
    	function(value, index, elem){
    	var loadindex = layer.load(2, {time: 10*1000}); 
        $.ajax({ 
	    	url: "<%=request.getContextPath()%>/NewType", 
	    	type:'POST',
	    	data:"tdescribe="+value,
                 success: function(result){
                	 
     if(result.code=="1"){
    	 layer.msg(result.Msg, {
   		  icon: 5,
   		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
   		}, function(){
   		  //do something
   		});  
　　　　 	 layer.msg('请求失败', {
	       		  icon: 5,
      		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
      		}, function(){
      		  //do something
      		}); 
     }
     if(result.code=="0"){
    	 
    	 $("#type").append('<option value="'+result.tid+'">'+value+'</option>');
    	 form.render('select');
　　　　 	 layer.msg('添加完成', {
      		  icon: 6,
 		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
 		}, function(){
 		  //do something
 		}); 
}
	      }
	    	
        });
    	  
    	  
		  layer.close(index);
		  layer.close(loadindex);
    	  }); 	 
     });
       	
       	//新类型结束
       //新标签

     $("#NewFlag").click(function(){
 	   	layer.prompt({
 			title: '新的标签'
 },
 	function(value, index, elem){
 	var loadindex = layer.load(2, {time: 10*1000}); 
     $.ajax({ 
	    	url: "<%=request.getContextPath()%>/NewFlag", 
	    	type:'POST',
	    	data:"fdescribe="+value,
              success: function(result){
             	 
  if(result.code=="1"){
 	 layer.msg(result.Msg, {
		  icon: 5,
		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
		}, function(){
		  //do something
		});  
　 	 layer.msg('请求失败', {
	       		  icon: 5,
   		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
   		}, function(){
   		  //do something
   		}); 
  }
  if(result.code=="0"){
	  $(".xm-select-dl ").append('<dd lay-value="'+result.tid+'" class=" "><div class="xm-unselect xm-form-checkbox "><i class="xm-icon-yes"></i><span name="'+value+'">'+value+'</span></div></dd>"></option>');
　 	 layer.msg('添加完成', {
   		  icon: 6,
		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
		}, function(){
			
		}); 
}
	      }
	    	
     });
		  layer.close(index);
		  layer.close(loadindex);
 	  }); 	 
  });
       	//新标签结束
       	
       	

    });
    
    
    
    
      layui.use(['jquery', 'formSelects'], function(){
         formSelects = layui.formSelects;
          formSelects.render('flag', {      //默认值
        	    skin: "normal",                 //多选皮肤
        	    height: "auto",                 //是否固定高度, 38px | auto
        	    radio: false,                   //是否设置为单选模式
        	    direction: "auto",
        	    create: function(id, name){

        	         
        	        return Date.now();  //返回该标签对应的val
        	    },          
    //搜索框的位置            
        	    template: function(name, value, selected, disabled){
   

        	        //例如: 反转字符串
        	        //return name.split('').reverse().join('');
        	        return name;        //返回一个html结构, 用于显示选项
        	    },
          });
      });
      
var emjoy;
var tmp;
        var E = window.wangEditor
        var editor = new E('#editor');
        // 或者 var editor = new E( document.getElementById('editor') )
       editor.customConfig.uploadImgTimeout = 30000;
        editor.customConfig.uploadImgServer = '<%=request.getContextPath()%>/upload';
        editor.customConfig.uploadFileName = 'file';
        editor.customConfig.uploadImgMaxSize = 1 * 1024 * 1024;
        
        editor.customConfig.uploadImgMaxLength = 1;
        editor.customConfig.customAlert = function (info) {
            // info 是需要提示的内容
            alert('提示：' + info);
        }
        editor.customConfig.uploadImgHooks = {
        	    customInsert: function (insertImg, result, editor) {
        	                // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
        	                // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
        	         
        	                // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
        	                var url =result.data;
        	                insertImg(url);
        	         
        	                // result 必须是一个 JSON 格式字符串！！！否则报错
        	            }
        	        }
        $.ajax({ 
 	    	url: "https://api.weibo.com/2/emotions.json?source=1362404091", 
 	    	type:'GET',
 	    	dataType:'jsonp',
 	        processData: false, 
 	 
               success: function(result){
              	 
              	 if(result.code=1){
              		tmp= result.data
              		 
              	 }
            
               }
      });
        
   	 editor.customConfig.emotions = [
         {
             // tab 的标题
             title: '默认',
             // type -> 'emoji' / 'image'
             type: 'image',
             // content -> 数组
             content: tmp
         }
    
     ]
        
        editor.customConfig.colors = [
            '#000000',
            '#eeece0',
            '#1c487f',
            '#4d80bf',
            '#c24f4a',
            '#8baa4a',
            '#7b5ba1',
            '#46acc8',
            '#f9963b',
            '#ffffff'
        ]
      
        editor.create();
        var content
       $(document).keydown(function(event){
    	content=editor.txt.html();
    	  if(content.length>300){
    		  AutoSave(content);
    	  }
    	  
       });
   
        	
    $('.MyNav').attr('style','background-color:hsla(0,0%,10%,.4)');
 
 
        
      
    </script>
</body>
</html>