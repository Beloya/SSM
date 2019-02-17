package com.MyBlog.HttpRequest;


import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.http.impl.client.HttpClientBuilder;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.ServiceImpl.TrainServiceImpl;
import com.MyBlog.entity.trainData;
import com.alibaba.fastjson.JSONObject;

public class trainRequest extends httpRequest implements Runnable{
private trainData userTrain;

private Lock lock=new ReentrantLock();


private trainRequest() {
	userTrain=new trainData();


}
public trainData getUserTrain() {
	return userTrain;
}

public void setUserTrain(trainData userTrain) {
	this.userTrain = userTrain;
}





public  String doPost(String url, Map<String, Object> paramMap) {
String result=null;

    // 设置请求头
    setHeaders(new HashMap<String, String>());
    putHeaders("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"); // 设置请求头消息User-Agent
    putHeaders("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    putHeaders("X-Requested-With", "XMLHttpRequest"); 
    putHeaders("Accept-Language", "zh-CN,zh;q=0.9"); 
    putHeaders("Accept-Encoding", "gzip, deflate, br"); 
    putHeaders("Accept", "application/json, text/javascript, */*; q=0.01"); 
    putHeaders("Origin", "https://kyfw.12306.cn"); 
    result=super.doPost(url, paramMap);
    return result;
}


@SuppressWarnings("unchecked")
public   boolean processTask() {
	  
	  LocalDateTime now=LocalDateTime.now();
	  LocalDateTime delayTime=userTrain.getLastExecuteTime().plusSeconds(userTrain.getDelayTime());
	  LocalDateTime trainDate=
			  LocalDateTime.parse(userTrain.getTrainDate(),DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	  if(now.compareTo(delayTime)<0)
		  return false;  
	  else {
			userTrain.setExecuteCount(userTrain.getExecuteCount()+1);
		userTrain.setLastExecuteTime(LocalDateTime.now());
	  }
	  
	  if(LocalDateTime.now().plusHours(1).
			  compareTo(trainDate)>0) {
		  TrainServiceImpl.faileAndStopBuyTask(this, 
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
					"已过抢票时间，停止抢票");
		  return false;
	  }
	  
	if(!userTrain.isStart()||userTrain.isComplete()) {
		System.out.println("isStart:"+userTrain.isStart()+" isComplete:"+userTrain.isComplete());
		return true;
	}
	Calendar c=Calendar.getInstance();
	JSONObject jsonObjectone = null;
	  List<Map<String,String>> Multimap =null;
	  Map<String,Object> postMap=null;
	  postMap=new HashMap<>();
	  Multimap= null; 

	  if(lock.tryLock()) {
try {
	
	

	
	
	  //拉取余票信息
	  Multimap=(List<Map<String, String>>) TrainServiceImpl.queryTicket(this,userTrain.getFromStationTelecode(),userTrain.getToStationTelecode(),userTrain.getTrainQueryDate());
	
if(Multimap==null) {
	userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+" 获取余票信息失败");
return false;
}

//无访问错误将恢复间隔时间
userTrain.setDelayTime(0L);	 
	  for (Map<String, String> map : Multimap) {
		 
		  //是否存在该趟
		if(map.get("train_no").equals(userTrain.getTrain_no())
				&&map.get("station_train_code").equals(userTrain.getStationTrainCode())) {
		
			
			 //检测是否有票
			if(!TrainServiceImpl.queryHasTicket(map, this)) {
				 userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+" "+
						 userTrain.getStationTrainCode()+"车次 的 "
						 +userTrain.seatMap.get(userTrain.getSeatType())+"无票");
				return false;
			}
			
			
			//有票则获取下单密匙
			postMap.put("secretStr", URLDecoder.decode(map.get("secretStr")));
			
			
			break;
		}
		
	
	}
if(postMap.get("secretStr")==null) {
	userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+" 获取车次信息失败");	
return false;
}
	 
//检查用户状态
jsonObjectone=(JSONObject) TrainServiceImpl.CheckUser(this);
if(!jsonObjectone.getBoolean("status")
	||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("flag")) {
TrainServiceImpl.faileAndStopBuyTask(this, 
		LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
		"登录也许或许已经失效了，停止运行");
	return false;
} 


	  postMap.put("tour_flag", userTrain.getTour_flag());
	  postMap.put("to_station_name", userTrain.getToStationTeleName());
	  postMap.put("query_from_station_name", userTrain.getFromStationName());
	  postMap.put("train_date", userTrain.getTrain_date());
	  postMap.put("back_train_date", c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DAY_OF_MONTH));
	  postMap.put("purpose_codes",userTrain.getPurpose_codes());


	  
	  //提交预订单
	  jsonObjectone=(JSONObject) TrainServiceImpl.submitOrderRequest(this,postMap);
	
	 if(!jsonObjectone.getBoolean("status")) {
		 userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
				 "提交预订单失败["+jsonObjectone.getString("messages")+"]");
		 return false;
	 }
	 //获取乘客信息
	 TrainServiceImpl.getPassenger(this);


postMap.clear();


postMap.put("tour_flag", userTrain.getTour_flag());
postMap.put("bed_level_order_num", "000000000000000000000000000000");
postMap.put("whatsSelect", "1");
postMap.put("passengerTicketStr",userTrain.getPassengerTicketStr());
postMap.put("oldPassengerStr",userTrain.getOldPassengerStr());
postMap.put("_json_att","");
postMap.put("randCode","");
postMap.put("cancel_flag",2);
//订单检查
jsonObjectone=(JSONObject) TrainServiceImpl.checkOrderInfo(this,postMap);
if(!jsonObjectone.getBoolean("status")
		||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("submitStatus")) {
	 userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
			 "订单确认状态失败["+JSONObject.parseObject(jsonObjectone.getString("data"))
	 .getString("errMsg")+"]");
	 return false;
}
postMap.clear();
postMap.put("seatType", userTrain.getSeatType());
postMap.put("stationTrainCode", userTrain.getStationTrainCode());
postMap.put("fromStationTelecode",userTrain.getFromStationTelecode());
postMap.put("train_location", userTrain.getTrain_location());
postMap.put("train_no", userTrain.getTrain_no());
postMap.put("train_date", userTrain.getTrain_date().replace("-", "/"));
postMap.put("_json_att", "");
postMap.put("toStationTelecode", userTrain.getToStationTelecode());
postMap.put("purpose_codes", "00");
//获取订单队列
jsonObjectone=(JSONObject) TrainServiceImpl.getQueueCount(this,postMap);
if(!jsonObjectone.getBoolean("status")) {
	 userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
			 "确认订单状态失败["+jsonObjectone.getString("messages")+"]");
	 return false;
}
postMap.clear();
postMap.put("seatDetailType", "000");
postMap.put("whatsSelect", "1");
postMap.put("randCode", "");
postMap.put("oldPassengerStr",userTrain.getOldPassengerStr());
postMap.put("passengerTicketStr",userTrain.getPassengerTicketStr());
postMap.put("purpose_codes", "00");
postMap.put("train_location", userTrain.getTrain_location());
postMap.put("dwAll", "N");
postMap.put("choose_seats", "");
postMap.put("_json_att", "");
postMap.put("roomType", "00");
jsonObjectone=(JSONObject) TrainServiceImpl.confirmSingleQueue(this,postMap);
if(!jsonObjectone.getBoolean("status")
		||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("submitStatus")) {
	 userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
			 "下单失败["+JSONObject.parseObject(jsonObjectone.getString("data"))
	 .getString("errMsg")+"]");
	 return false;
}
long timstamp=System.currentTimeMillis();
postMap.clear();
postMap.put("random", timstamp);
postMap.put("tourFlag", userTrain.getTour_flag());
jsonObjectone=(JSONObject) TrainServiceImpl.getQueryOrderWaitTime(this,postMap);


postMap=null;
TrainServiceImpl.completeBuyTask(this);
return true;
}
catch (Exception e) {
	MyLogger.error(getClass(), e.getMessage());
	e.printStackTrace();
userTrain.setDelayTime(userTrain.getDelayTime()<30?userTrain.getDelayTime()+((int)Math.random( )*5+5):userTrain.getDelayTime());
userTrain.addMsgList(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))+
		"状态异常，将在"+userTrain.getDelayTime()+"秒后重新启动抢票");

}
finally{

	lock.unlock();
}
	  }
	
return false;
}



public httpRequest useMyHeader(boolean h) {
	useMyHeader=h;
	return this;
}
public static trainRequest create() {
	return new trainRequest();
}
public httpRequest Builder() {
httpClient=httpClientBuilder.build();
	return this;
}
public  httpRequest custom() {
	HttpClientBuilder.create();
	return this;
}
@Override
public void run() {
	processTask();
	
}


}
