package com.MyBlog.ServiceImpl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Service.TrainService;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.trainData;
import com.MyBlog.utils.JsonUtils;
import com.alibaba.fastjson.JSONObject;
/**
 * 
 * @author Beloya
 *
 */
@Service
public class TrainServiceImpl implements TrainService{
    private static ConcurrentHashMap<String, Object> sessionTask=new ConcurrentHashMap<>();
    public static CopyOnWriteArraySet<Object> buyTask=new CopyOnWriteArraySet<>();
	private long timstamp=0; 
	@Override
	public Object userLogin(String trainusername, String trainpassword, String verifyCode) {
		getJession();
		Map<String,Object> postmap=null;
		trainRequest trainRequst=null;
			JSONObject jsonObject =null;
		postmap=new HashMap<>();
		postmap.put("username", trainusername);
		postmap.put("password", trainpassword);
		postmap.put("appid", "otn");
		postmap.put("answer", verifyCode);
			trainRequst=(trainRequest) getUserSession();
		String login_result=trainRequst.doPost(loginUrl,postmap);
	   jsonObject = JSONObject.parseObject(login_result);
	   if(jsonObject.getInteger("result_code")==0) {
	   HashMap<String,Object> hm=null ;
	   hm= new HashMap<>();
	   hm.put("appid", "otn");
		  String result= trainRequst.doPost(uamtkUrl,hm);
			JSONObject jsonuamtk =JSONObject.parseObject(result);
		String uamtkstr=jsonuamtk.getString("newapptk");
		hm=new HashMap<>();
		hm.put("tk", uamtkstr);
	trainRequst.doPost(uamauthclientUrl,hm);
	
	   }
		return jsonObject;
	}

	@Override
	public Object getVerify() {
		String result=null,verifyImg=null;
		trainRequest trainRequest=null;
JSONObject jsonObjectone = null;
long timstamp=System.currentTimeMillis();   
	trainRequest=getUserSession();
	result=trainRequest.DoGet(getVerifyUrl+timstamp);
	jsonObjectone = JSONObject.parseObject(result);
	verifyImg=	jsonObjectone.getString("image");
	

		return verifyImg;
	}

	@Override
	public Object checkVerify(String verifyCode) {
		timstamp=System.currentTimeMillis();
		trainRequest trainRequest=null;
		JSONObject jsonObjectone = null;
		Map<String,Object> postmap=new HashMap<>();
			trainRequest=getUserSession();
		postmap.put("callback", "jQuery19100155250425586555_1542871515363");
		postmap.put("login_site", "E");
		postmap.put("rand", "sjrand");
		postmap.put("answer", verifyCode);
		postmap.put("_", timstamp);
		String login=trainRequest.doPost(checkVerifyUrl+timstamp,postmap);
		String loginPreJsonStr=login.substring(login.indexOf("(")+1,login.length()-2);
		jsonObjectone = JSONObject.parseObject(loginPreJsonStr);
	//	String result_code=jsonObjectone.getString("result_code");
	//	String message=jsonObjectone.getString("result_message");	
		return jsonObjectone;
	}

	@Override
	public Object queryTicket(String from_station,String to_station,String time) {
		String result=null;
		String tempdata=null;
	//String mapstr=null,queryResult=null;
		trainRequest trainRequest=null;
		JSONObject jsonObjectone = null;
		try {
		  List<Map<String,String>> Multimap =new ArrayList<>(); 
			trainRequest=getUserSession();		
			  trainRequest.getUserTrain().setTrainQueryDate(time);	
			result=trainRequest.
DoGet(queryUrl+"train_date="+time+"&leftTicketDTO.from_station="+from_station+
		"&leftTicketDTO.to_station="+to_station+"&purpose_codes=ADULT");
			jsonObjectone=JSONObject.parseObject(result);
	         tempdata=jsonObjectone.getString("data");
	         jsonObjectone= JSONObject.parseObject(tempdata);
	     	// mapstr=jsonObjectone.getString("map");
	    	//queryResult=jsonObjectone.getString("result");
	        //	JSONObject map=JSONObject.parseObject(mapstr);
	    	Multimap=(List<Map<String, String>>) JsonUtils.trainJsonQuery(result);
		
		return Multimap;
		 }
		 catch (Exception e) {
			 
			 return null;
		}
		
	}
	
	public static Object queryTicket(trainRequest trainRequest,String from_station,String to_station,String time) {
		String result=null;
		String tempdata=null;
	//String mapstr=null,queryResult=null;
	
		JSONObject jsonObjectone = null;
		try {
		  List<Map<String,String>> Multimap =new ArrayList<>(); 
		  trainRequest.getUserTrain().setTrainQueryDate(time);	
			result=trainRequest.
DoGet(queryUrl+"train_date="+time+"&leftTicketDTO.from_station="+from_station+
		"&leftTicketDTO.to_station="+to_station+"&purpose_codes=ADULT");
			
			jsonObjectone=JSONObject.parseObject(result);
	         tempdata=jsonObjectone.getString("data");
	         jsonObjectone= JSONObject.parseObject(tempdata);
	     	// mapstr=jsonObjectone.getString("map");
	    	//queryResult=jsonObjectone.getString("result");
	        //	JSONObject map=JSONObject.parseObject(mapstr);
	    	Multimap=(List<Map<String, String>>) JsonUtils.trainJsonQuery(result);
		
		return Multimap;
		 }
		 catch (Exception e) {
			 
			 return null;
		}
		
	}


	@Override
	public synchronized  Object requestInit(trainRequest t,String userName) {
	
	 	t=(trainRequest) Optional.ofNullable(TrainServiceImpl.sessionTaskGet(userName)).orElse(trainRequest.create().custom().useSSL().useMyHeader(true).Builder());
		TrainServiceImpl.sessionTaskPut(userName, t);
return t;
	}
	
	public synchronized static  Object sessionTaskTake(String key) {
		Object obj=  sessionTask.get(key);
		sessionTask.remove(key);
		return obj;
	}
	
public synchronized static Object sessionTaskGet(String key) {
	Object obj=  sessionTask.get(key);
	return obj;
}
public synchronized static void sessionTaskPut(String key,Object value) {
	sessionTask.put(key, value);
}

@Override
public Object CheckUser() {
	String result=null;
	trainRequest trainRequest=null;
	Map<String,Object> postmap=null;
	JSONObject jsonObjectone = null;
	postmap=new HashMap<>();
		trainRequest=getUserSession();
		postmap.put("_json_att", "");
		result=trainRequest.
				doPost(checkUserUrl, postmap);
		jsonObjectone=JSONObject.parseObject(result);
		postmap=null;
		return jsonObjectone;
}


public static Object CheckUser(trainRequest trainRequest) {
	String result=null;

	Map<String,Object> postmap=null;
	JSONObject jsonObjectone = null;
	postmap=new HashMap<>();
		postmap.put("_json_att", "");
		result=trainRequest.
				doPost(checkUserUrl, postmap);
		jsonObjectone=JSONObject.parseObject(result);
		postmap=null;
		return jsonObjectone;
}

public Object getPassenger() {
	String result=null;
	trainRequest trainRequest=null;
	Map<String,Object> postmap=null;
	JSONObject jsonObjectone = null;
	postmap=new HashMap<>();

	getinitDcTOKEN();
		trainRequest=(trainRequest) getUserSession();
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		result=trainRequest.
				doPost(getPassengerUrl, postmap);
		jsonObjectone=JSONObject.parseObject(result);
		postmap=null;
	return jsonObjectone;
}

public static Object getPassenger(trainRequest trainRequest) {
	String result=null;

	Map<String,Object> postmap=null;
	JSONObject jsonObjectone = null;
	postmap=new HashMap<>();

	getinitDcTOKEN(trainRequest);
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		result=trainRequest.
				doPost(getPassengerUrl, postmap);
		jsonObjectone=JSONObject.parseObject(result);
		postmap=null;
	return jsonObjectone;
}

private Object getinitDcTOKEN() {
	String result=null,temp=null,TOKEN=null;
	trainRequest trainRequest=null;
	Map<String,Object> postmap=null;
	Map<String,String> tokenMap=null;
	tokenMap=new HashMap<>();
	int n=0,m=0;
	postmap=new HashMap<>();
	postmap.put("_json_att", "");
		trainRequest=(trainRequest) getUserSession();
		result=trainRequest.
				doPost(initDcUrl, postmap);
		if((n=result.indexOf(trainData.REPEAT_SUBMIT_TOKENinitDc))!=-1) {
			n+=trainData.REPEAT_SUBMIT_TOKENinitDc.length();
			temp=result.substring(n);
			m=n+temp.indexOf("';");
			TOKEN=result.substring(n, m);
			trainRequest.getUserTrain().setRepeat_submit_token(TOKEN);
			tokenMap.put("REPEAT_SUBMIT_TOKEN",TOKEN);
		}
		if((n=result.indexOf(trainData.key_check_isChangeinitDc))!=-1) {
			n+=trainData.key_check_isChangeinitDc.length();
			temp=result.substring(n);
			m=n+temp.indexOf("',");
			TOKEN=result.substring(n, m);
			trainRequest.getUserTrain().setKey_check_isChange(TOKEN);
			tokenMap.put("key_check_isChange",TOKEN);
		}
		if((n=result.indexOf(trainData.leftTicketStrinitDc))!=-1) {
			n+=trainData.leftTicketStrinitDc.length();
			
			temp=result.substring(n);
			m=n+temp.indexOf("',");
			TOKEN=result.substring(n, m);
			
			trainRequest.getUserTrain().setLeftTicket(TOKEN);
			tokenMap.put("leftTicket",TOKEN);
		}
		postmap=null;
		return tokenMap;
		
}

private static Object getinitDcTOKEN(trainRequest trainRequest) {
	String result=null,temp=null,TOKEN=null;

	Map<String,Object> postmap=null;
	Map<String,String> tokenMap=null;
	tokenMap=new HashMap<>();
	int n=0,m=0;
	postmap=new HashMap<>();
	postmap.put("_json_att", "");
		result=trainRequest.
				doPost(initDcUrl, postmap);
		if((n=result.indexOf(trainData.REPEAT_SUBMIT_TOKENinitDc))!=-1) {
			n+=trainData.REPEAT_SUBMIT_TOKENinitDc.length();
			temp=result.substring(n);
			m=n+temp.indexOf("';");
			TOKEN=result.substring(n, m);
			trainRequest.getUserTrain().setRepeat_submit_token(TOKEN);
			tokenMap.put("REPEAT_SUBMIT_TOKEN",TOKEN);
		}
		if((n=result.indexOf(trainData.key_check_isChangeinitDc))!=-1) {
			n+=trainData.key_check_isChangeinitDc.length();
			temp=result.substring(n);
			m=n+temp.indexOf("',");
			TOKEN=result.substring(n, m);
			trainRequest.getUserTrain().setKey_check_isChange(TOKEN);
			tokenMap.put("key_check_isChange",TOKEN);
		}
		if((n=result.indexOf(trainData.leftTicketStrinitDc))!=-1) {
			n+=trainData.leftTicketStrinitDc.length();
			
			temp=result.substring(n);
			m=n+temp.indexOf("',");
			TOKEN=result.substring(n, m);
			
			trainRequest.getUserTrain().setLeftTicket(TOKEN);
			tokenMap.put("leftTicket",TOKEN);
		}
		postmap=null;
		return tokenMap;
		
}

public   trainRequest getUserSession() {
	String username=null;
	trainRequest trainRequest=null;
	Users Principaluser=null;
	Subject subject = SecurityUtils.getSubject(); 
	Object Principal=  subject.getPrincipal();
	if(Principal!=null) {
		Principaluser=(Users) Principal;
		username=Principaluser.getUserName();
		trainRequest=(trainRequest) requestInit(trainRequest,username);
	
	}
	
	return trainRequest;
}

public Object submitOrderRequest(Map<String,Object> postmap) {

	String result=null;
	trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	trainRequest=(trainRequest) getUserSession();
	trainRequest.getUserTrain().setTour_flag((String)postmap.get("tour_flag"));
	trainRequest.getUserTrain().setToStationTeleName((String)postmap.get("to_station_name"));
	trainRequest.getUserTrain().setFromStationName((String)postmap.get("query_from_station_name"));
	trainRequest.getUserTrain().setTrain_date((String)postmap.get("train_date"));
	trainRequest.getUserTrain().setPurpose_codes((String)postmap.get("purpose_codes"));
	result=trainRequest.
			doPost(submitOrderUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);

	return jsonObjectone;
}

public static Object submitOrderRequest(trainRequest trainRequest,Map<String,Object> postmap) {

	String result=null;

	JSONObject jsonObjectone = null;
	
	trainRequest.getUserTrain().setTour_flag((String)postmap.get("tour_flag"));
	trainRequest.getUserTrain().setToStationTeleName((String)postmap.get("to_station_name"));
	trainRequest.getUserTrain().setFromStationName((String)postmap.get("query_from_station_name"));
	trainRequest.getUserTrain().setTrain_date((String)postmap.get("train_date"));
	trainRequest.getUserTrain().setPurpose_codes((String)postmap.get("purpose_codes"));
	result=trainRequest.
			doPost(submitOrderUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);

	return jsonObjectone;
}

public  Object checkOrderInfo(Map<String,Object> postmap) {
	String result=null;
	trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	trainRequest=(trainRequest) getUserSession();
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	trainRequest.getUserTrain().setPassengerTicketStr((String)postmap.get("passengerTicketStr"));
	trainRequest.getUserTrain().setOldPassengerStr((String)postmap.get("oldPassengerStr"));
	result=trainRequest.
			doPost(checkOrderUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

public static Object checkOrderInfo(trainRequest trainRequest,Map<String,Object> postmap) {
	String result=null;

	JSONObject jsonObjectone = null;
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	trainRequest.getUserTrain().setPassengerTicketStr((String)postmap.get("passengerTicketStr"));
	trainRequest.getUserTrain().setOldPassengerStr((String)postmap.get("oldPassengerStr"));
	result=trainRequest.
			doPost(checkOrderUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

public Object getQueueCount(Map<String,Object> postmap) {
	String result=null;
	trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	trainRequest=(trainRequest) getUserSession();
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	postmap.put("leftTicket",trainRequest.getUserTrain().getLeftTicket()!=null?trainRequest.getUserTrain().getLeftTicket():"");
	trainRequest.getUserTrain().setSeatType((String)postmap.get("seatType"));
	trainRequest.getUserTrain().setTrain_no((String)postmap.get("train_no"));
	trainRequest.getUserTrain().setStationTrainCode((String)postmap.get("stationTrainCode"));
	trainRequest.getUserTrain().setFromStationTelecode((String)postmap.get("fromStationTelecode"));
	trainRequest.getUserTrain().setToStationTelecode((String)postmap.get("toStationTelecode"));
	trainRequest.getUserTrain().setTrain_location((String)postmap.get("train_location"));
	
	result=trainRequest.
			doPost(getQueueCountUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

public static Object getQueueCount(trainRequest trainRequest,Map<String,Object> postmap) {
	String result=null;
	//trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	//trainRequest=(trainRequest) getUserSession();
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	postmap.put("leftTicket",trainRequest.getUserTrain().getLeftTicket()!=null?trainRequest.getUserTrain().getLeftTicket():"");
	trainRequest.getUserTrain().setSeatType((String)postmap.get("seatType"));
	trainRequest.getUserTrain().setTrain_no((String)postmap.get("train_no"));
	trainRequest.getUserTrain().setStationTrainCode((String)postmap.get("stationTrainCode"));
	trainRequest.getUserTrain().setFromStationTelecode((String)postmap.get("fromStationTelecode"));
	trainRequest.getUserTrain().setToStationTelecode((String)postmap.get("toStationTelecode"));
	trainRequest.getUserTrain().setTrain_location((String)postmap.get("train_location"));
	
	result=trainRequest.
			doPost(getQueueCountUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

public Object confirmSingleQueue(Map<String,Object> postmap) {
	String result=null;
	trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	trainRequest=(trainRequest) getUserSession();
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	postmap.put("leftTicketStr",trainRequest.getUserTrain().getLeftTicket()!=null?trainRequest.getUserTrain().getLeftTicket():"");
	postmap.put("key_check_isChange",trainRequest.getUserTrain().getKey_check_isChange()!=null?trainRequest.getUserTrain().getKey_check_isChange():"");
	result=trainRequest.
			doPost(confirmSingleForDcQueueUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

public Object joinConfirmSingleQueue(Map<String,Object> postmap) {
	String result=null;
	trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	trainRequest=(trainRequest) getUserSession();
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	postmap.put("leftTicketStr",trainRequest.getUserTrain().getLeftTicket()!=null?trainRequest.getUserTrain().getLeftTicket():"");
	postmap.put("key_check_isChange",trainRequest.getUserTrain().getKey_check_isChange()!=null?trainRequest.getUserTrain().getKey_check_isChange():"");
	trainRequest.getUserTrain().setStart(true);
	addBuyTask(trainRequest);
	//result=trainRequest.
	//		doPost(confirmSingleForDcQueueUrl, postmap);

	return true;
}

public static Object confirmSingleQueue(trainRequest trainRequest,Map<String,Object> postmap) {
	String result=null;

	JSONObject jsonObjectone = null;

	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	postmap.put("leftTicketStr",trainRequest.getUserTrain().getLeftTicket()!=null?trainRequest.getUserTrain().getLeftTicket():"");
	postmap.put("key_check_isChange",trainRequest.getUserTrain().getKey_check_isChange()!=null?trainRequest.getUserTrain().getKey_check_isChange():"");
	trainRequest.getUserTrain().setStart(true);
	
	result=trainRequest.
			doPost(confirmSingleForDcQueueUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}


public  Object getQueryOrderWaitTime(Map<String,Object> postmap) {
	String result=null;
	trainRequest trainRequest=null;
	JSONObject jsonObjectone = null;
	trainRequest=(trainRequest) getUserSession();
	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	result=trainRequest.
			doPost(queryOrderWaitTimeUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

public static Object getQueryOrderWaitTime(trainRequest trainRequest,Map<String,Object> postmap) {
	String result=null;

	JSONObject jsonObjectone = null;

	postmap.put("REPEAT_SUBMIT_TOKEN",
			Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
	result=trainRequest.
			doPost(queryOrderWaitTimeUrl, postmap);
	jsonObjectone=JSONObject.parseObject(result);
	return jsonObjectone;
}

private void getJession() {
	trainRequest trainRequest=null;
	trainRequest=(trainRequest) getUserSession();
	trainRequest.DoGet(initloginUrl);
}



public static synchronized CopyOnWriteArraySet<Object> getBuyTask() {

	return buyTask;
}

public static synchronized boolean completeBuyTask(trainRequest t) {
	buyTask.remove(t);
	if(t!=null) {
	t.getUserTrain().setStart(false);
	t.getUserTrain().setComplete(true);
	
	}
	else {
		return false;
	}
	return true;
}

public synchronized static void setBuyTask(CopyOnWriteArraySet<Object> buyTask) {
	TrainServiceImpl.buyTask = buyTask;
}
public synchronized static void addBuyTask(trainRequest obj) {
	TrainServiceImpl.buyTask.add(obj);
	obj.getUserTrain().setStart(true);
}


}