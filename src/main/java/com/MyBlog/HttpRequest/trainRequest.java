package com.MyBlog.HttpRequest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

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

import com.MyBlog.ServiceImpl.TrainServiceImpl;
import com.MyBlog.entity.trainData;
import com.alibaba.fastjson.JSONObject;

public class trainRequest extends httpRequest{
private trainData userTrain;




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


public  boolean processTask(trainRequest t) {
	Calendar c=Calendar.getInstance();
	JSONObject jsonObjectone = null,jsonData=null;
	  List<Map<String,String>> Multimap =null;
	  Map<String,Object> postMap=null;
	  postMap=new HashMap<>();
	  Multimap= null; 

	  
	  //拉取余票信息
	  Multimap=(List<Map<String, String>>) TrainServiceImpl.queryTicket(t,t.getUserTrain().getFromStationTelecode(),t.getUserTrain().getToStationTelecode(),t.getUserTrain().getTrainQueryDate());
	 if(Multimap==null) {
		 return false; 
	 }
	 
	  //检查用户状态
	  jsonObjectone=(JSONObject) TrainServiceImpl.CheckUser(t);
if(!jsonObjectone.getBoolean("status")
		||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("flag")) {

		return false;
	} 

	 
	  for (Map<String, String> map : Multimap) {
		if(map.get("train_no").equals(t.getUserTrain().getTrain_no())
				&&map.get("station_train_code").equals(t.getUserTrain().getStationTrainCode())) {
			postMap.put("secretStr", URLDecoder.decode(map.get("secretStr")));
			break;
		}
	}
	  
	 
	  postMap.put("tour_flag", t.getUserTrain().getTour_flag());
	  postMap.put("to_station_name", t.getUserTrain().getToStationTeleName());
	  postMap.put("query_from_station_name", t.getUserTrain().getFromStationName());
	  postMap.put("train_date", t.getUserTrain().getTrain_date());
	  postMap.put("back_train_date", c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DAY_OF_MONTH));
	  postMap.put("purpose_codes", t.getUserTrain().getPurpose_codes());


	  
	  
	  jsonObjectone=(JSONObject) TrainServiceImpl.submitOrderRequest(t,postMap);
	
	 if(!jsonObjectone.getBoolean("status")) {
		 return false;
	 }
	 TrainServiceImpl.getPassenger(t);


postMap.clear();
postMap.put("tour_flag", t.getUserTrain().getTour_flag());
postMap.put("bed_level_order_num", "000000000000000000000000000000");
postMap.put("whatsSelect", "1");
postMap.put("passengerTicketStr",t.getUserTrain().getPassengerTicketStr());
postMap.put("oldPassengerStr",t.getUserTrain().getOldPassengerStr());
postMap.put("_json_att","");
postMap.put("randCode","");
postMap.put("cancel_flag",2);
jsonObjectone=(JSONObject) TrainServiceImpl.checkOrderInfo(t,postMap);
if(!jsonObjectone.getBoolean("status")
		||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("submitStatus")) {
	 return false;
}
postMap.clear();
postMap.put("seatType", t.getUserTrain().getSeatType());
postMap.put("stationTrainCode", t.getUserTrain().getStationTrainCode());
postMap.put("fromStationTelecode", t.getUserTrain().getFromStationTelecode());
postMap.put("train_location", t.getUserTrain().getTrain_location());
postMap.put("train_no", t.getUserTrain().getTrain_no());
postMap.put("train_date", t.getUserTrain().getTrain_date().replace("-", "/"));
postMap.put("_json_att", "");
postMap.put("toStationTelecode", t.getUserTrain().getToStationTelecode());
postMap.put("purpose_codes", "00");
jsonObjectone=(JSONObject) TrainServiceImpl.getQueueCount(t,postMap);
if(!jsonObjectone.getBoolean("status")) {
	 return false;
}
postMap.clear();
postMap.put("seatDetailType", "000");
postMap.put("whatsSelect", "1");
postMap.put("randCode", "");
postMap.put("oldPassengerStr",t.getUserTrain().getOldPassengerStr());
postMap.put("passengerTicketStr",t.getUserTrain().getPassengerTicketStr());
postMap.put("purpose_codes", "00");
postMap.put("train_location", t.getUserTrain().getTrain_location());
postMap.put("dwAll", "N");
postMap.put("choose_seats", "");
postMap.put("_json_att", "");
postMap.put("roomType", "00");
jsonObjectone=(JSONObject) TrainServiceImpl.confirmSingleQueue(t,postMap);
if(!jsonObjectone.getBoolean("status")
		||!JSONObject.parseObject(jsonObjectone.getString("data")).getBoolean("submitStatus")) {
	 return false;
}
long timstamp=System.currentTimeMillis();
postMap.clear();
postMap.put("random", timstamp);
postMap.put("tourFlag", t.getUserTrain().getTour_flag());
jsonObjectone=(JSONObject) TrainServiceImpl.getQueryOrderWaitTime(t,postMap);




postMap=null;
TrainServiceImpl.completeBuyTask(t);
	return true;
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
}
