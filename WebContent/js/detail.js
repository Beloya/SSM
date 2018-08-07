var userName;
var laypage;
$("#nav4").addClass('layui-this');
$("#nav1").removeClass('layui-this');
$("#nav2").removeClass('layui-this');
$("#nav3").removeClass('layui-this');
$("#nav5").removeClass('layui-this');
layui.cache.page = 'jie';
layui.cache.user = {
  username: userName
  ,experience: 83
};
layui.config({
  version: "3.0.0"
  ,base: '../res/mods/'
}).extend({
	 fly1: 'index'
}).use(['fly1', 'face'], function(){
  var $ = layui.$
  ,fly1 = layui.fly1;
});
layui.use(['layer','form','layedit','laypage'], function(){
	 var form = layui.form
	 ,laypage = layui.laypage
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  var curr=document.getElementById("currpage").value;
	  	  var count=document.getElementById("pagecount").value;
	  	var limit=document.getElementById("pagesize").value;
	 var editindex= layedit.build('L_content');
	  layedit.set({
		  uploadImage: {
		    url: '' //接口url
		    ,type: '' //默认post
		  }
		});
	  laypage.render({
		    elem: 'page'
		    ,count:count
		    ,limit: limit
		    ,limits: [100, 300, 500]
		    ,curr: curr
	  ,jump: function(obj, first){
		 curr=document.getElementById("currpage").value;
		    url=window.location.href;
		    curr=document.getElementById("currpage").value;
		    count=document.getElementById("pagecount").value;
		    limit=document.getElementById("pagesize").value;
		    //首次不执行
		    if(!first){
		
		       	$.ajax({
		              url:url,
		             type:"POST",
					 async:true,
				     data:"page="+obj.curr,
		             success: function(data) {
					document.getElementById("jiedaParent").innerHTML=data;
					  var stateObject = {};
				  	  var title = document.title;
				 //	 $('#jiedaParent').load(url+ ' #jieda').fadeIn('slow');
					  }
					})
		
		    	}
		  }
		  });
form.on('submit(submit)', function(data){

	data.field.content=layedit.getContent(editindex);
	  //下面是新增表单提交,自行修改网址
	  //记得返回msg数据
	  $.post('../forumfile/bbs_commentAdd.html', data.field, function(msg) {
			msg.status == 0 ? Success(msg) : Error(msg);			
		});
	    return false;
	  });
function Success(msg) {
		var index = layer.load(1);
	    location.href=msg.data;
 

 

}
function Error(msg) {
	layer.msg(msg.msg, {icon:5, time:2000}, function(index){
 layer.close(index);
});
}
});
function a(url,obj){
	  var stateObject = {};
	  var title = document.title;
	 history.pushState(stateObject, title,url);
	 $('#layui-container').load(url+ ' #replace','',  function () {
	  	  var curr=document.getElementById("currpage").value;
	  	  var count=document.getElementById("pagecount").value;
	  	var limit=document.getElementById("pagesize").value;
		laypage.render({
		    elem: 'page'
			    ,count: count
			    ,curr:curr
			    ,limit: limit
				 ,limits: [100, 300, 500]
	  ,jump: function(obj, first){
		    //obj包含了当前分页的所有参数，比如：
		    url=window.location.href;
		    if(!first){
				
		       	$.ajax({
		              url:url,
		             type:"POST",
					 async:false,
				     data:"page="+obj.curr,
		             success: function(data) {
					document.getElementById("notes").innerHTML=data;
					  var stateObject = {};
				  	  var title = document.title;
				
					  }
					})
		
		    	}
		}});
		$("#container .layui-this").removeClass('layui-this');
	  $(obj).parent().addClass('layui-this');
	  	}).fadeIn('slow')

	
}

