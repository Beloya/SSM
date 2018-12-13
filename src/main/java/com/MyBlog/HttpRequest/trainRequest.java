package com.MyBlog.HttpRequest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

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


public   boolean processTask() {
	  
	  LocalDateTime now=LocalDateTime.now();
	  LocalDateTime delayTime=userTrain.getLastExecuteTime().plusMinutes(userTrain.getDelayTime());
	  if(now.compareTo(delayTime)<0)
		  return false;  
	if(!userTrain.isStart()||userTrain.isComplete())
		return true;
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
		 return false; 
	 }
	 
	  //检查用户状态
	  jsonObjectone=(JSONObject) TrainServiceImpl.CheckUser(this);
if(!jsonObjectone.getBoolean("status")
		||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("flag")) {
	TrainServiceImpl.faileAndStopBuyTask(this, "登录也许或许已经失效了，停止运行");
		return false;
	} 

	 
	  for (Map<String, String> map : Multimap) {
		if(map.get("train_no").equals(userTrain.getTrain_no())
				&&map.get("station_train_code").equals(userTrain.getStationTrainCode())) {
			postMap.put("secretStr", URLDecoder.decode(map.get("secretStr")));
			break;
		}
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
		 userTrain.addMsgList("提交预订单失败["+jsonObjectone.getString("messages")+"]");
		 return false;
	 }
	 //获取乘客信息
	 TrainServiceImpl.getPassenger(this);


postMap.clear();

userTrain.setDelayTime(0L);
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
	 userTrain.addMsgList("订单确认状态失败["+JSONObject.parseObject(jsonObjectone.getString("data"))
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
	 userTrain.addMsgList("确认订单状态失败["+jsonObjectone.getString("messages")+"]");
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
	 userTrain.addMsgList("下单失败["+JSONObject.parseObject(jsonObjectone.getString("data"))
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
MyLogger.error(getClass(), "抢票任务异常",e);

userTrain.setDelayTime(userTrain.getDelayTime()<30?userTrain.getDelayTime()+1:userTrain.getDelayTime());
userTrain.addMsgList("状态异常，将在"+userTrain.getDelayTime()+"分钟后重新启动抢票");
return false;
}
finally{
	userTrain.setExecuteCount(userTrain.getExecuteCount()+1);
	userTrain.setLastExecuteTime(LocalDateTime.now());
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
