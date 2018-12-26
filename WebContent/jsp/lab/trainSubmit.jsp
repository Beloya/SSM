<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />
</head>
<body>
<form class="layui-form" action="">
<div style="margin:20px 20px 20px 20px;">
<p id="select_Order"></p>
<hr class="layui-bg-blue">
	<table class="layui-table" lay-data="{url:'', page:false, id:'passenger_id_no'}" lay-filter="passengerList">
  <thead>
    <tr>
<th lay-data="{fixed: 'left', type:'checkbox'}">选择</th>
   <th lay-data="{field:'passenger_name',  sort: true}">乘客</th>
   <th lay-data="{field:'passenger_id_type_name'}">证件类型</th>
      <th lay-data="{field:'passenger_id_no'}">证件号码</th>
      <th lay-data="{field:'mobile_no'}">手机号码</th>
    </tr>
  </thead>
</table>
    <div class="layui-inline"> 
 <div class="layui-input-inline">
<select name="seat" lay-verify="" required  >
  <option value="">请选择座位</option>

<option value="9">商务座</option>
  <option value="M">一等座</option>
  <option value="O">二等座</option>
  <option value="6">高级软卧</option>
    <option value="4">软卧</option>
      <option value="3">硬卧</option>
        <option value="2">软座</option>
           <option value="1">硬座</option>
</select>     
</div>
</div>
      <button class="layui-btn layui-btn-normal" id="train_sumbit"   lay-submit lay-filter="train_sumbit">
<i class="layui-icon layui-icon-release"></i> 确认</button>
</div>

</form>
<script
			src="https://cdn.staticfile.org/jquery/2.2.3/jquery.min.js"></script>
				<script
			src="https://cdn.staticfile.org/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"></script>
<script src="http://cdn.staticfile.org/bootstrap-autohidingnavbar/4.0.0/jquery.bootstrap-autohidingnavbar.min.js"></script>
<script src="http://cdn.staticfile.org/fakeLoader.js/1.1.0/fakeLoader.min.js"></script>

	<script  type="text/javascript">
layui.use(['table','laydate','form'], function(){
  var table = layui.table
  ,layer = layui.layer,
  laydate = layui.laydate
  ,form = layui.form;
  var data=parent.sumbitdata;
  if(data!=null&&data!=undefined){

var seat=data.swz_num=="--"?"":"商务座";
		seat+=data.zy_num=="--"?"":" 一等座";
		seat+=data.ze_num=="--"?"":" 二等座";
		seat+=data.gr_num=="--"?"":" 高级软卧";
		seat+=data.rw_num=="--"?"":" 软卧";
		seat+=data.yw_num=="--"?"":" 硬卧";
		seat+=data.rz_num=="--"?"":" 软座";
		seat+=data.yz_num=="--"?"":" 硬座";
		seat+=data.wz_num=="--"?"":" 站票";
   $("#select_Order").html("车次："+data.station_train_code+"  当前可选座位：<br/>"+seat);
  // var desecretStr=decodeURIComponent(data.secretStr);
  table.reload('passenger_id_no', {
	  url: '<%=request.getContextPath()%>/trainsubmitOrderRequest'
	  ,where: {
		
		  secretStr:data.secretStr,
		  start_train_date:data.start_train_date,
		  from_station_name:data.from_station_name,
		  to_station_name:data.to_station_name,
		  start_time:data.start_time,
		  lishi:data.lishi
	  } //设定异步数据接口的额外参数
	  //,height: 300
		
	});
  }
 
  /*
  ticket_type_name: {
		"1": "成人票",
		"2": "孩票",
		"3": "学生票",
		"4": "伤残军人票"
	},
  */
  
  form.on('submit(train_sumbit)', function(formdata){
	 //   layer.msg(JSON.stringify(formdata.field.seat));
	var ticket_type=1;
	    var seatType=formdata.field.seat;
	    var idate=data.start_train_date+"";
	    var passengerInfos=table.checkStatus('passenger_id_no');
	    var passengerInfo=passengerInfos.data[0];
	    var oldPassengerStr=passengerInfo.passenger_name+","+passengerInfo.passenger_id_type_code+","+passengerInfo.passenger_id_no+",1_";
	    var passengerTicketStr=seatType+","+"0"+","+ticket_type+","+passengerInfo.passenger_name+","+passengerInfo.passenger_id_type_code+","+passengerInfo.passenger_id_no+",,"+"N";
	    var tour_flag="dc";
	    var whatsSelect=1;
	   // let  train_date=new Date(idate.substring(0,4)+"/"+idate.substring(4,6)+"/"+idate.substring(6,8));
	  //  train_date.setFullYear(idate.substring(0,4),idate.substring(4,6),idate.substring(6,8))
	    var train_date= idate.substring(0,4)+"/"+idate.substring(4,6)+"/"+idate.substring(6,8);
	    var train_no=data.train_no;
	    var stationTrainCode=data.station_train_code;
	    var fromStationTelecode=data.from_station_telecode;
	    var toStationTelecode=data.to_station_telecode;
	    var train_location=data.location_code;
	    
	  for(var i=1;i<passengerInfos.data.length;i++){
		  passengerTicketStr+="_"+seatType+","+"0"+","+ticket_type+","+passengerInfos.data[i].passenger_name+","+passengerInfos.data[i].passenger_id_type_code+","+passengerInfos.data[i].passenger_id_no+",,"+"N";
		  oldPassengerStr+=passengerInfos.data[i].passenger_name+","+passengerInfos.data[i].passenger_id_type_code+","+passengerInfos.data[i].passenger_id_no+",1_";
	  }
	    $.ajax({ 
    	  	url: "<%=request.getContextPath()%>/trainSumbitOrder", 
    	  	type:'POST',
data:"passengerTicketStr="+passengerTicketStr+"&oldPassengerStr="+oldPassengerStr+"&tour_flag="+tour_flag+"&whatsSelect="+whatsSelect+"&train_date="+train_date+"&train_no="+train_no+"&stationTrainCode="+stationTrainCode+"&seatType="+seatType+"&fromStationTelecode="+fromStationTelecode+"&toStationTelecode="+toStationTelecode+"&train_location="+train_location
,success: function(result){
	 console.log(result);  
      	 
   $.ajax({ 
    url: "<%=request.getContextPath()%>/trainconfirmSingleForQueue", 
    type:'POST',
 data:"passengerTicketStr="+passengerTicketStr+"&oldPassengerStr="+oldPassengerStr+"&whatsSelect="+whatsSelect+"&train_location="+train_location
    	        ,success: function(result){
    	        	console.log(result);
    	        	if(result.code==0){
    	        		layer.confirm('已加入队列', {icon: 1, title:'提示'}, function(index){
    	        			var index = parent.layer.getFrameIndex(window.name); 
        	        		parent.layer.close(index); 
    	        			});
    	        	
    	        	}
    	        		
    	        }});
    	        	 
    	        	 
	
    	           }});
	    
	    return false;
	  });
		 
		});
  
  

</script>
</body>
</html>