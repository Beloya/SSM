package com.MyBlog.Controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.spel.ast.OpInc;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Service.TrainService;
import com.MyBlog.ServiceImpl.TrainBuyService;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.trainData;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


@Controller
public class trainFunctionController {
@Autowired
@Qualifier("TrainBuy")
private TrainService tsi;
	@RequestMapping("trainquery")
	public String trainquery(Model model) {
		Calendar c=  Calendar.getInstance();
		String nowDay=c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+(c.get(Calendar.DAY_OF_MONTH)+1);
		String username=null;
		Users Principaluser=null;
		trainRequest train=null;
		Subject subject = SecurityUtils.getSubject(); 
	
			Principaluser= (Users) Optional.ofNullable(subject.getPrincipal()).orElse(null);
			username=Principaluser!=null?Principaluser.getUserName():"";
			train=(trainRequest) TrainBuyService.sessionTaskGet(username);

		model.addAttribute("trainData", train!=null?train.getUserTrain():null);
		model.addAttribute("nowDay", nowDay);
		return "/jsp/lab/trainView";
	}
	
	@RequestMapping("trainWindowLogin")
	public String trainWindowLogin(HttpServletRequest request,Model model) {
		String verifyImg=null;
				verifyImg=(String) tsi.getVerify();
	model.addAttribute("verifyImg", verifyImg);
	
	
	return "/jsp/lab/trainWinowLogin";
	}
	@RequestMapping("trainsubmit")
	public String trainsubmit(HttpServletRequest request,Model model) {

	
	
	return "/jsp/lab/trainSubmit";
	}
	

	@SuppressWarnings("unchecked")
	@RequestMapping("trainqueryJson")
	  @ResponseBody
	  public Object query(String from_station,String to_station,String time,HttpServletRequest request) {
		Map<String,Object> resultMap=new HashMap<>();
		 List<Map<String,String>> Multimap =new ArrayList<>(); 
		 Multimap=(List<Map<String, String>>) tsi.queryTicket(from_station, to_station, time);
		 if(Multimap!=null) {
		resultMap.put("code",0);
		resultMap.put("msg","");
		resultMap.put("count",20);
		resultMap.put("data",Multimap);
		MyLogger.INFO(getClass(), Multimap.toString());
		 }
		 else {
				resultMap.put("code",404);
				resultMap.put("msg","很抱歉，按您的查询条件，未找到对应的列车。");
		 }
			 return resultMap;
		
		
	}
	@RequestMapping("trainGetverifyImg")
	@ResponseBody
	public Object trainGetVerify(HttpServletRequest request) {
		Map<String,Object> resultMap=new HashMap<>();
		String verifyImg=(String) tsi.getVerify();
		resultMap.put("code", 0);
		resultMap.put("verifyImg", verifyImg);
			return resultMap;
	}
	
	@RequestMapping("trainCheckUser")
	@ResponseBody
	public Object trainCheckUser(HttpServletRequest request) {

		JSONObject jsonObjectone = null;
		jsonObjectone=(JSONObject) tsi.CheckUser();
			return jsonObjectone;
	}
	
	@RequestMapping("trainLogin")
	@ResponseBody
	public Object trainLogin(String userName,String passWord,String answer,HttpServletRequest request) {
		JSONObject jsonObjectone = null;
		jsonObjectone=(JSONObject) tsi.userLogin(userName, passWord, answer);

			return jsonObjectone;
	}
	@RequestMapping("traincheckverify")
	@ResponseBody
	public Object traincheckverify(String answer,HttpServletRequest request) {
		JSONObject jsonObjectone = null;
		jsonObjectone=(JSONObject) tsi.checkVerify(answer);
			return jsonObjectone;
	}
	@RequestMapping("traingetPassengerDTOs")
	@ResponseBody
	public Object traingetPassengerDTOs(String answer,HttpServletRequest request) {
		JSONObject jsonObjectone = null;
		jsonObjectone=(JSONObject) tsi.getPassenger();
			return jsonObjectone;
	}
	@RequestMapping("trainsubmitOrderRequest")
	@ResponseBody
	public Object trainsubmitOrderRequest(String secretStr,String start_train_date,
			String from_station_name,String to_station_name,
			String start_time,String lishi,HttpServletRequest request) {
		
		JSONObject jsonObjectone = null;
		Map<String,Object> postMap=new HashMap<>();
			Map<String,Object> resultMap=new HashMap<>();
			String train_date;
			train_date=start_train_date.substring(0,4)+"-"+start_train_date.substring(4,6)+"-"+start_train_date.substring(6,8);
		Calendar c=Calendar.getInstance();
		postMap.put("secretStr", URLDecoder.decode(secretStr));
		postMap.put("train_date", train_date);
		postMap.put("back_train_date", c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DAY_OF_MONTH));
		postMap.put("query_from_station_name", from_station_name);
		postMap.put("query_to_station_name", to_station_name);
		postMap.put("tour_flag", "dc");
		postMap.put("purpose_codes", "ADULT");
		postMap.put("undefined", "");
		postMap.put("start_time", start_time);
		postMap.put("lishi", lishi);
		jsonObjectone=(JSONObject) tsi.submitOrderRequest(postMap);
		jsonObjectone=(JSONObject) tsi.getPassenger();
		JSONArray array =jsonObjectone.parseArray(jsonObjectone.parseObject(jsonObjectone.getString("data")).getString("normal_passengers"));
		resultMap.put("code",0);
		resultMap.put("msg","");
		resultMap.put("count",20);
		resultMap.put("data",array);
		return resultMap;
	
	}
	
	
	@RequestMapping("trainSumbitOrder")
	@ResponseBody
	public Object trainSumbitOrder(String oldPassengerStr,String passengerTicketStr,String tour_flag,String whatsSelect,String train_date,trainData traindata,HttpServletRequest request) {

		JSONObject jsonObjectone = null;
		Map<String,Object> postmap=new HashMap<>();
		postmap.put("oldPassengerStr", oldPassengerStr);
		postmap.put("passengerTicketStr", passengerTicketStr);
		postmap.put("tour_flag", tour_flag);
		postmap.put("whatsSelect", whatsSelect);
		postmap.put("_json_att","");
		postmap.put("randCode","");
		postmap.put("cancel_flag",2);
		postmap.put("bed_level_order_num","000000000000000000000000000000");
		jsonObjectone=(JSONObject) tsi.checkOrderInfo(postmap);
		
		postmap.clear();
		postmap.put("train_date", train_date);
		postmap.put("train_no", traindata.getTrain_no());
		postmap.put("stationTrainCode", traindata.getStationTrainCode());
		postmap.put("seatType", traindata.getSeatType());
		postmap.put("fromStationTelecode", traindata.getFromStationTelecode());
		postmap.put("toStationTelecode", traindata.getToStationTelecode());
		postmap.put("train_location", traindata.getTrain_location());
		postmap.put("_json_att","");
		postmap.put("purpose_codes","00");
		jsonObjectone=(JSONObject) tsi.getQueueCount(postmap);
			return jsonObjectone;
	}
	@RequestMapping("trainconfirmSingleForQueue")
	@ResponseBody
	public Object trainconfirmSingleForQueue(String oldPassengerStr,String passengerTicketStr,String whatsSelect,trainData traindata,HttpServletRequest request) {
		Map<String,Object> postmap=new HashMap<>(),resultMap=new HashMap<>();
		postmap.put("oldPassengerStr", oldPassengerStr);
		postmap.put("passengerTicketStr", passengerTicketStr);
		postmap.put("whatsSelect", whatsSelect);
		postmap.put("choose_seats","");
		postmap.put("purpose_codes","00");
		postmap.put("whatsSelect", 1);
		postmap.put("dwAll", "N");
		postmap.put("roomType", "00");
		postmap.put("seatDetailType", "000");
		postmap.put("_json_att","");
		postmap.put("randCode","");
		postmap.put("train_location", traindata.getTrain_location());
		boolean join=(boolean) tsi.joinConfirmSingleQueue(postmap);
		if(join) {
		resultMap.put("code",0);
		resultMap.put("msg","");

		}
		else {
			resultMap.put("code",500);
			resultMap.put("msg","失败");
		}
			return resultMap;
	}
	
	@RequestMapping("trainqueryOrderWaitTime")
	@ResponseBody
	public Object trainqueryOrderWaitTimeUrl(String tour_flag,HttpServletRequest request) {
		JSONObject jsonObjectone = null;
		Map<String,Object> postmap=new HashMap<>();
		long timestamp=System.currentTimeMillis();
		postmap.put("tourFlag", tour_flag);
	
		postmap.put("random", timestamp);
		jsonObjectone=(JSONObject) tsi.getQueryOrderWaitTime(postmap);
		
			return jsonObjectone;
	}
	@RequestMapping("stoptraintask")
	public String trainStop(HttpServletRequest request,Model model) {

	tsi.StopTask();
	
	return "redirect:.."+request.getContextPath()+"/trainquery";
	}
	@RequestMapping("restarttraintask")
	public String trainRestart(HttpServletRequest request,Model model) {

	tsi.restartTask();
	
	return "redirect:.."+request.getContextPath()+"/trainquery";
	}
}
