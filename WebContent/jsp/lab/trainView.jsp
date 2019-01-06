<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>抢票</title>
<link rel="stylesheet" href="https://tuxiang-1251384861.cos.ap-guangzhou.myqcloud.com/css/main.css"
	media="all" />
	<style type="text/css">
	#canvas {
/*   position: absolute;
  top: 0; right: 0; left: 0;
  margin: auto; */
  
	margin: auto;
	margin-bottom: 1em;
	max-width: 100%;
	height: auto;
/* 	background:#000; */
}

.comment-content  img{
width: 64px;
height:64px;
}
.post-body_detail blockquote{
word-wrap:break-word; 
word-break:break-all; 
padding:5px 15px 5px 15px;
}
.comment-author img{
width:65px;
height:65px;
}
.body_detail{
word-wrap:break-word; 
word-break:break-all; 
}

</style>
</head>
<body>
<div class="container sidebar-position-right page-home">
	<nav class="Top">
		 <%@ include file="../Nav.jsp"%>
		<p id="offscreen-text" class="offscreen-text"></p>
		<p id="text" class="text"></p>
		<svg id="svg"> </svg> <input type="hidden" class="input" value=""
			id="input" /> </nav>
	<div class="site-master " itemprop="author" itemscope=""
			itemtype="">

			<img class="site-master-avatar" itemprop="image"
				src="<%=request.getContextPath()%>${applicationScope.BlogInfo.users.userImg}"
				alt="">
			<h2 class="site-master-description" itemprop="description">
				<span style="color: #3369e8">如果</span> <span style="color: #d50f25">结果</span>
				<span style="color: #eeb211">不如你所愿,</span> <span
					style="color: #3369e8">就在</span> <span style="color: #009925">尘埃落定前</span>
				<span style="color: #d50f25">奋力一搏.</span>
			</h2>
		</div>

		<div id="main" class="main" style="background-color: white;margin: 20px 20px 20px 20px">
		<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">查票</li>
    <li>我的任务</li>
  </ul>
  <div class="layui-tab-content">
     <div class="layui-tab-item layui-show" style="padding:20px 20px 20px 20px;">
     <span class="layui-badge" style="margin-bottom: 15px;">该功能仅供娱乐。任务并不会持久化，仅在内存中保存</span>
   
  <form class="layui-form" action="" style="margin-top: 15px;">
 
   <div class="layui-inline" >
      <label class="layui-form-label">出发地</label>
      <div class="layui-input-inline">
        <select name="modules" lay-verify="required" name="from_station" id="fromStationText" lay-search="">
        <option value=""></option>
        </select>
      </div>
    </div>
    
     <div class="layui-inline">
      <label class="layui-form-label">目的地</label>
      <div class="layui-input-inline">
        <select name="modules" lay-verify="required" id="toStationText" name="to_station" lay-search="">
        <option value=""></option>
        </select>
      </div>
    </div>
    
    
    <div class="layui-inline"> 
<label class="layui-form-label">出发日</label>
 <div class="layui-input-inline">
  <input type="text" lay-verify="required"  class="layui-input" id="train_date" name="time">
  </div>
</div>
<button class="layui-btn layui-btn-normal" id="train_query"   lay-submit lay-filter="train_query">
<i class="layui-icon layui-icon-search"></i>   查询</button>


  </form>
		<table class="layui-table" lay-data="{url:'<%=request.getContextPath()%>/trainqueryJson?time=${nowDay }&from_station=SHH&to_station=BJP', page:false, id:'yp_info'}" lay-filter="trainList">
  <thead>
    <tr>
   <th lay-data="{fixed: 'left',field:'start_train_date', sort: true}">日期</th>
   <th lay-data="{fixed: 'left',field:'station_train_code'}">车次</th>
      <th lay-data="{field:'from_station_name'}">出发站</th>
      <th lay-data="{field:'to_station_name'}">到达站</th>
      <th lay-data="{field:'start_time',sort: true}">出发时间</th>
      <th lay-data="{field:'arrive_time'}">到达时间</th>
      <th lay-data="{field:'lishi'}">历时</th>
      
      <th lay-data="{field:'swz_num'}">商务座</th>
            <th lay-data="{field:'zy_num'}">一等座</th>
                <th lay-data="{field:'ze_num'}">二等座</th>
      
      <th lay-data="{field:'gr_num'}">高级软卧</th>
      <th lay-data="{field:'rw_num'}">软卧</th>
           <th lay-data="{field:'yw_num'}">硬卧</th>
      
       <th lay-data="{field:'rz_num'}">软座</th>
        <th lay-data="{field:'yz_num'}">硬座</th>
               <th lay-data="{field:'wz_num'}">站票</th>
                <th lay-data="{field:'qt_num'}">其他</th>
      <th lay-data="{fixed: 'right',  align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
  </thead>
</table>
  </div>


    <div class="layui-tab-item"> 
    <div class="layui-card">
  <div class="layui-card-header"><c:if test="${!empty trainData }">
  <span class="layui-badge layui-bg-cyan">
  由   ${trainData.fromStationName} 开往 ${trainData.toStationTeleName} ${trainData.train_date } ${trainData.trainStartDateTime } 出发
   历时${trainData.trainNeedDateTime }  ${trainData.stationTrainCode }次列车
    </span>
  </c:if></div>

  <div class="layui-card-body">
  <c:if test="${!empty trainData }">

  <div class="layui-collapse" >
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">状态</h2>
    
     <div class="layui-colla-content layui-show">
     <p>
     <c:if test="${trainData.isComplete==true }">
      <i class="layui-icon layui-icon-ok" style="font-size: 30px; color: #009688;"></i>已完成 (${trainData.remark })</c:if>
      </p>   <p>
     <c:if test="${trainData.isStart==true }">
     <i class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 30px; color: #1E9FFF;"></i>
     进行中   <a class="layui-btn layui-btn-xs layui-btn-danger" href="<%=request.getContextPath()%>/stoptraintask">停止任务</a></c:if>
          <c:if test="${trainData.isStart==false }">
           <i class="layui-icon layui-icon-face-surprised" style="font-size: 30px; color: #FF5722;"></i>已停止 (${trainData.remark })
           <a class="layui-btn layui-btn-xs layui-btn-normal" href="<%=request.getContextPath()%>/restarttraintask">重启任务</a>
           </c:if>
          </p>
          <p>
          最近一次执行时间：${trainData.showlastExecuteTime}
          </p>
          <p>
          已尝试抢${trainData.executeCount}次
          </p>
     </div>
    </div>
  
 <div class="layui-colla-item">
    <h2 class="layui-colla-title">日志详情</h2>

<c:forEach items="${trainData.msgList }" var="msg">
 
    <div class="layui-colla-content ">${msg }</div>
  
</c:forEach>
</div>
</div>
</c:if>
  </div>
</div>
    
    </div>
    
    </div>
  </div>
</div>

		
		
		
		


	<%@ include file="../footer.jsp"%>
	</div>
	<script src="js/station_name.js"></script>
	<script src='https://tuxiang-1251384861.cos.ap-guangzhou.myqcloud.com/js/CSSPlugin.min.js'></script>
	<script src='js/EasePack.min.js'></script>
	<script src='https://tuxiang-1251384861.cos.ap-guangzhou.myqcloud.com/js/TweenLite.min.js'></script>
	<script src="js/index.js"></script>
	<c:if test="${!isStart}">
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="buy">预订</a>
</script>
</c:if>
	<c:if test="${isStart}">
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="isStart">停止任务</a>
</script>
</c:if>
		<script  type="text/javascript">
		 var sumbitdata;
layui.use(['table','laydate','form'], function(){
  var table = layui.table
  ,layer = layui.layer,
  laydate = layui.laydate
  ,form = layui.form;


  laydate.render({ 
	  elem: '#train_date'
	 ,type :'date'
    ,min: 0 //7天前
	,theme:'molv'
		,calendar: true
	});
  form.on('submit(train_query)', function(data){
	  var fromStationText=$("#fromStationText").val();
	  var toStationText=$("#toStationText").val();
	  var time=$("#train_date").val();
	  table.reload('yp_info', {
	  url: '<%=request.getContextPath()%>/trainqueryJson?time='+time+'&from_station='+fromStationText+'&to_station='+toStationText
	//  ,where: {} //设定异步数据接口的额外参数
	  //,height: 300
		
	});
	  return false;
 });
  //监听工具条
  table.on('tool(trainList)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'buy'){
  //    layer.alert('编辑行：<br>'+ JSON.stringify(data.yp_info));
      console.log(obj.data);
      $.ajax({ 
    	  	url: "<%=request.getContextPath()%>/trainCheckUser", 
    	  	type:'POST',
    	           success: function(result){

    	        	 console.log(result);
    	   if(result.status){
    		   console.log(result.data.flag);
    		   if(!result.data.flag){
    			   layer.open({
    				   type: 2, 
    				   title:'12306账号登录',
    				   skin: 'layui-layer-lan',
    				   area :['450px', '650px'],
    				   maxmin:true,
    				   fixed:true,
    				   content: '<%=request.getContextPath()%>/trainWindowLogin'
    				 }); 
    		   }
    		   
    		   else{
    			   sumbitdata=obj.data;
    			   layer.open({
    				   type: 2, 
    				   title:'确认信息',
    				   skin: 'layui-layer-lan',
    				   area :['800px', '500px'],
    				   maxmin:true,
    				   fixed:true,
    				   content: '<%=request.getContextPath()%>/trainsubmit'
    				 }); 
    		   }
    	   }
    	   else{
    	
    		   
    	   }}
    	  });
      
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});

function b5(cu, cw) {
	var ct = [];
	for (var cs = 0; cs < cu.length; cs++) {
		var cx = [];
		var cr = cu[cs].split("|");
		cx.secretStr = cr[0];
		cx.buttonTextInfo = cr[1];
		var cv = [];
		cv.train_no = cr[2];
		cv.station_train_code = cr[3];
		cv.start_station_telecode = cr[4];
		cv.end_station_telecode = cr[5];
		cv.from_station_telecode = cr[6];
		cv.to_station_telecode = cr[7];
		cv.start_time = cr[8];
		cv.arrive_time = cr[9];
		cv.lishi = cr[10];
		cv.canWebBuy = cr[11];
		cv.yp_info = cr[12];
		cv.start_train_date = cr[13];
		cv.train_seat_feature = cr[14];
		cv.location_code = cr[15];
		cv.from_station_no = cr[16];
		cv.to_station_no = cr[17];
		cv.is_support_card = cr[18];
		cv.controlled_train_flag = cr[19];
		cv.gg_num = cr[20] ? cr[20] : "--";
		cv.gr_num = cr[21] ? cr[21] : "--";
		cv.qt_num = cr[22] ? cr[22] : "--";
		cv.rw_num = cr[23] ? cr[23] : "--";
		cv.rz_num = cr[24] ? cr[24] : "--";
		cv.tz_num = cr[25] ? cr[25] : "--";
		cv.wz_num = cr[26] ? cr[26] : "--";
		cv.yb_num = cr[27] ? cr[27] : "--";
		cv.yw_num = cr[28] ? cr[28] : "--";
		cv.yz_num = cr[29] ? cr[29] : "--";
		cv.ze_num = cr[30] ? cr[30] : "--";
		cv.zy_num = cr[31] ? cr[31] : "--";
		cv.swz_num = cr[32] ? cr[32] : "--";
		cv.srrb_num = cr[33] ? cr[33] : "--";
		cv.yp_ex = cr[34];
		cv.seat_types = cr[35];
		cv.exchange_train_flag = cr[36];
		cv.from_station_name = cw[cr[6]];
		cv.to_station_name = cw[cr[7]];
		cx.queryLeftNewDTO = cv;
		ct.push(cx)
	}
	return ct
}


</script>
<script type="text/javascript">
var c = [];
var F = new Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
var o = [];
var w = [];
var P = [];
var O ;
for (var R = 0; R < 26; R++) {
	c[R] = []
}

var Z = station_names.split("@");
for (var Y = 0; Y < Z.length; Y++) {
	var ab = Z[Y];
	var aa = ab.toString().charAt(0);
	for (var X in F) {
		if (aa == F[X]) {
			c[X].push(ab.split("|"))
		}
	}
	if (ab.length > 0) {
		ab = ab.split("|");
		if (O != "" && ab[2] == O) {
			favcity = ab;
			w.unshift(ab);
			if (Y > 6) {
				w.push(ab)
				
			}
		} else {
			//w.push(ab);
			ab=ab+'';
			var r=ab.split(",");
			$("#fromStationText,#toStationText").append('<option value="'+r[2]+'">'+r[1]+'</option>');
			
			
		}
	}
}

f = c[0].concat(c[1]).concat(c[2]).concat(c[3]).concat(c[4]);
e = c[5].concat(c[6]).concat(c[7]).concat(c[8]).concat(c[9]);
d = c[10].concat(c[11]).concat(c[12]).concat(c[13]).concat(c[14]);
b = c[15].concat(c[16]).concat(c[17]).concat(c[18]).concat(c[19]);
V = c[20].concat(c[21]).concat(c[22]).concat(c[23]).concat(c[24]).concat(c[25]);
P[0] = [c[0], c[1], c[2], c[3], c[4]];
P[1] = [c[5], c[6], c[7], c[8], c[9]];
P[2] = [c[10], c[11], c[12], c[13], c[14]];
P[3] = [c[15], c[16], c[17], c[18], c[19]];
P[4] = [c[20], c[22], c[23], c[24], c[25]];
//console.log(P[3]);
for (var Y = 0; Y < w.length; Y++) {
	w[Y].push(Y)
}
var V = {
		O: 100,  //二等座
		M: 99, //一等座
		"3": 98,  //硬卧
		"1": 97,  //硬座
		"2": 96,   //软座
		"4": 95,   //软卧
		"7": 94,
		"8": 93,
		"9": 92, //商务座
		P: 91,
		"6": 90,  //高级软卧
		F: 89,
		A: 88,
		H: 87
	};
</script>
</body>
</html>