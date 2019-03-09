package com.MyBlog.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Message.QQEmailUtilFactory;
import com.MyBlog.ServiceImpl.TrainBuyService;
import com.MyBlog.entity.Email;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.trainData;
import com.MyBlog.utils.JsonUtils;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.ImmutableMap;

/**
 * 
 * @author Beloya
 *
 */
@Component
public abstract class TrainService {

	protected final static String getVerifyUrl = "https://kyfw.12306.cn/passport/captcha/captcha-image64?login_site=E&module=login&rand=sjrand&";
	protected final static String checkVerifyUrl = "https://kyfw.12306.cn/passport/captcha/captcha-check?callback=jQuery19100155250425586555_1542871515363&rand=sjrand&login_site=E&_=";
	protected final static String loginUrl = "https://kyfw.12306.cn/passport/web/login";
	protected final static String checkUserUrl = "https://kyfw.12306.cn/otn/login/checkUser";
	protected final static String queryBase = "https://kyfw.12306.cn/otn/leftTicket/init";
	protected final static String queryBaseUrl = "https://kyfw.12306.cn/otn/";
	protected final static String uamtkUrl = "https://kyfw.12306.cn/passport/web/auth/uamtk";
	protected final static String uamauthclientUrl = "https://kyfw.12306.cn/otn/uamauthclient";
	protected final static String getPassengerUrl = "https://kyfw.12306.cn/otn/confirmPassenger/getPassengerDTOs";
	protected final static String initDcUrl = "https://kyfw.12306.cn/otn/confirmPassenger/initDc";
	protected final static String submitOrderUrl = "https://kyfw.12306.cn/otn/leftTicket/submitOrderRequest";
	protected final static String checkOrderUrl = "https://kyfw.12306.cn/otn/confirmPassenger/checkOrderInfo";
	protected final static String getQueueCountUrl = "https://kyfw.12306.cn/otn/confirmPassenger/getQueueCount";
	protected final static String confirmSingleForDcQueueUrl = "https://kyfw.12306.cn/otn/confirmPassenger/confirmSingleForQueue";
	protected final static String queryOrderWaitTimeUrl = "https://kyfw.12306.cn/otn/confirmPassenger/queryOrderWaitTime";
	protected final static String initloginUrl = "https://kyfw.12306.cn/otn/login/init";
	protected long timestamp;
	protected static String queryUrl;
	protected static String CLeftTicketUrl;
	protected trainRequest trainrequest;
	protected static ConcurrentHashMap<String, Object> sessionTask = new ConcurrentHashMap<>();
	protected static CopyOnWriteArraySet<Object> buyTask = new CopyOnWriteArraySet<>();
	protected static Map<String, String> seatMap = ImmutableMap.<String, String>builder().put("9", "swz_num")
			.put("M", "zy_num").put("O", "ze_num").put("6", "gr_num").put("4", "rw_num").put("3", "yw_num")
			.put("2", "rz_num").put("1", "yz_num").build();

	/**
	 * 登录接口
	 * 
	 * @param trainusername
	 *            12306用户名
	 * @param trainpassword
	 *            12306密码
	 * @param verifyCode
	 *            验证码
	 * @return 登录Json字符串
	 */
	public Object userLogin(String trainusername, String trainpassword, String verifyCode) {

		getJession();
		Map<String, Object> postmap = new HashMap<>(12);
		trainRequest trainRequst = (trainRequest) getUserSession();
		JSONObject jsonObject;
		postmap.put("username", trainusername);
		postmap.put("password", trainpassword);
		postmap.put("appid", "otn");
		postmap.put("answer", verifyCode);
		// 登录请求
		String loginResult = trainRequst.doPost(loginUrl, postmap);
		jsonObject = JSONObject.parseObject(loginResult);
		if (jsonObject.getInteger("result_code") == 0) {
			postmap.clear();
			postmap.put("appid", "otn");
			// 验证请求
			String result = trainRequst.doPost(uamtkUrl, postmap);
			JSONObject jsonuamtk = JSONObject.parseObject(result);
			String uamtkstr = jsonuamtk.getString("newapptk");
			postmap.clear();
			postmap.put("tk", uamtkstr);
			// 提交登录验证码
			trainRequst.doPost(uamauthclientUrl, postmap);

		}
		return jsonObject;
	};

	/**
	 * 获取登录后ResponseHeader
	 */
	protected void getJession() {
		trainRequest trainRequest = getUserSession();
		trainRequest.DoGet(initloginUrl);
	}

	/**
	 * 获取验证码
	 * 
	 * @return 验证码Json串
	 */
	public Object getVerify() {
		String result, verifyImg;
		trainRequest trainRequest = getUserSession();
		JSONObject jsonObjectone;
		result = trainRequest.DoGet(getVerifyUrl + System.currentTimeMillis());
		jsonObjectone = JSONObject.parseObject(result);
		verifyImg = jsonObjectone.getString("image");
		return verifyImg;

	};

	/**
	 * 获取查票链接
	 * 
	 * @param postmap
	 *            请求参数
	 * @return
	 */
	public String getCLeftTicketUrl(Map<String, Object> postmap) {
		String result = null, temp = null, TOKEN = null;
		trainRequest trainRequest = null;
		int n = 0, m = 0;
		trainRequest = (trainRequest) getUserSession();
		result = trainRequest.DoGet(queryBase + "?linktypeid=" + postmap.get("linktypeid") + "&fs=" + postmap.get("fs")
				+ "&ts=" + postmap.get("ts") + "&date=" + postmap.get("date") + "&flag=" + postmap.get("flag"));

		if ((n = result.indexOf(trainData.CLeftTicketUrlStr)) != -1) {
			n += trainData.CLeftTicketUrlStr.length();
			temp = result.substring(n);
			m = n + temp.indexOf("';");
			TOKEN = result.substring(n, m);
			trainRequest.getUserTrain().setRepeat_submit_token(TOKEN);
			CLeftTicketUrl = TOKEN;
			queryUrl = queryBaseUrl + CLeftTicketUrl;
		}
		postmap = null;
		return queryUrl;
	}

	/**
	 * 检查验证码
	 * 
	 * @param verifyCode
	 *            验证码
	 * @return 验证码Json串
	 */
	public Object checkVerify(String verifyCode) {
		timestamp = System.currentTimeMillis();
		trainRequest trainRequest = null;
		JSONObject jsonObjectone = null;
		Map<String, Object> postmap = new HashMap<>(12);
		trainRequest = getUserSession();
		postmap.put("callback", "jQuery19100155250425586555_1542871515363");
		postmap.put("login_site", "E");
		postmap.put("rand", "sjrand");
		postmap.put("answer", verifyCode);
		postmap.put("_", timestamp);
		String login = trainRequest.doPost(checkVerifyUrl + timestamp, postmap);
		String loginPreJsonStr = login.substring(login.indexOf("(") + 1, login.length() - 2);
		jsonObjectone = JSONObject.parseObject(loginPreJsonStr);
		// String result_code=jsonObjectone.getString("result_code");
		// String message=jsonObjectone.getString("result_message");
		return jsonObjectone;
	};

	/**
	 * 查询车次
	 * 
	 * @param startStation
	 *            起始站
	 * @param endStation
	 *            终点站
	 * @return json串
	 */
	public Object queryTicket(String from_station, String to_station, String time) {
		String result, tempdata;
		trainRequest trainRequest = getUserSession();
		JSONObject jsonObjectone;
		Map<String, Object> postMap = new HashMap<>(12);
		List<Map<String, String>> Multimap = new ArrayList<>();
		if (CLeftTicketUrl == null || CLeftTicketUrl.trim().equals("")) {
			postMap.put("linktypeid", "dc");
			postMap.put("fs", from_station);
			postMap.put("ts", to_station);
			postMap.put("date", time);
			postMap.put("flag", "N,N,Y");
			getCLeftTicketUrl(postMap);

		}
		try {
			trainRequest.getUserTrain().setTrainQueryDate(
					!trainRequest.getUserTrain().isStart() ? time : trainRequest.getUserTrain().getTrainQueryDate());
			result = trainRequest.DoGet(queryUrl + "?leftTicketDTO.train_date=" + time + "&leftTicketDTO.from_station="
					+ from_station + "&leftTicketDTO.to_station=" + to_station + "&purpose_codes=ADULT");
			Multimap = (List<Map<String, String>>) JsonUtils.trainJsonQuery(result);

			return Multimap;
		} catch (Exception e) {
			postMap.clear();
			postMap.put("linktypeid", "dc");
			postMap.put("fs", from_station);
			postMap.put("ts", to_station);
			postMap.put("date", time);
			postMap.put("flag", "N,N,Y");
			getCLeftTicketUrl(postMap);
			postMap = null;
			return null;
		}
	};

	/**
	 * 检查是否有余票
	 * 
	 * @param map
	 *            车次信息
	 * @param 作为
	 * @return boolean
	 */
	public boolean queryHasTicket(Map<String, String> map) {
		trainRequest t = getUserSession();
		String seatType = t.getUserTrain().getSeatType();

		if (!map.get(seatMap.get(seatType)).equals("--") && !map.get(seatMap.get(seatType)).equals("无")
				&& !map.get(seatMap.get(seatType)).equals("0")) {
			return true;
		}

		return false;

	}

	/**
	 * 
	 * @return 检查是否登录
	 */
	public Object CheckUser() {
		String result = null;
		trainRequest trainRequest = getUserSession();
		Map<String, Object> postmap = new HashMap<>(12);
		JSONObject jsonObjectone = null;
		postmap.put("_json_att", "");
		result = trainRequest.doPost(checkUserUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		postmap = null;
		result = null;
		return jsonObjectone;

	}

	/**
	 * 
	 * @param trainRequest
	 * @return
	 */
	public Object requestInit(trainRequest t, String userName) {

		t = (trainRequest) Optional.ofNullable(TrainBuyService.sessionTaskGet(userName))
				.orElse(t.create().custom().useSSL().useMyHeader(true).Builder());
		sessionTaskPut(userName, t);
		return t;
	};

	/**
	 * 拉取乘客信息
	 * 
	 * @return 乘客信息Json
	 */
	public Object getPassenger() {
		String result = null;
		trainRequest trainRequest = null;
		Map<String, Object> postmap = new HashMap<>(12);
		JSONObject jsonObjectone = null;
		getinitDcTOKEN();
		trainRequest = (trainRequest) getUserSession();
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		result = trainRequest.doPost(getPassengerUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		postmap = null;
		return jsonObjectone;

	};

	/**
	 * 获取加密字段
	 * 
	 * @return
	 */
	protected Object getinitDcTOKEN() {
		String result = null, temp = null, TOKEN = null;
		trainRequest trainRequest = null;
		Map<String, Object> postmap = new HashMap<>(12);
		Map<String, String> tokenMap = new HashMap<>(12);
		int n = 0, m = 0;
		postmap.put("_json_att", "");
		trainRequest = (trainRequest) getUserSession();
		result = trainRequest.doPost(initDcUrl, postmap);
		if ((n = result.indexOf(trainData.REPEAT_SUBMIT_TOKENinitDc)) != -1) {
			n += trainData.REPEAT_SUBMIT_TOKENinitDc.length();
			temp = result.substring(n);
			m = n + temp.indexOf("';");
			TOKEN = result.substring(n, m);
			trainRequest.getUserTrain().setRepeat_submit_token(TOKEN);
			tokenMap.put("REPEAT_SUBMIT_TOKEN", TOKEN);
		}
		if ((n = result.indexOf(trainData.key_check_isChangeinitDc)) != -1) {
			n += trainData.key_check_isChangeinitDc.length();
			temp = result.substring(n);
			m = n + temp.indexOf("',");
			TOKEN = result.substring(n, m);
			trainRequest.getUserTrain().setKey_check_isChange(TOKEN);
			tokenMap.put("key_check_isChange", TOKEN);
		}
		if ((n = result.indexOf(trainData.leftTicketStrinitDc)) != -1) {
			n += trainData.leftTicketStrinitDc.length();

			temp = result.substring(n);
			m = n + temp.indexOf("',");
			TOKEN = result.substring(n, m);

			trainRequest.getUserTrain().setLeftTicket(TOKEN);
			tokenMap.put("leftTicket", TOKEN);
		}
		postmap = null;
		return tokenMap;

	}

	/**
	 * 获取登录用户的12306会话
	 * 
	 * @return 返回会话对象
	 */
	public abstract trainRequest getUserSession();

	/**
	 * 提交预订单
	 * 
	 * @param postmap
	 *            提交时post的参数
	 * @return 返回Json
	 */
	public Object submitOrderRequest(Map<String, Object> postmap) {
		String result = null;
		trainRequest trainRequest = getUserSession();
		JSONObject jsonObjectone = null;
		trainRequest.getUserTrain().setTour_flag((String) postmap.get("tour_flag"));
		trainRequest.getUserTrain().setToStationTeleName((String) postmap.get("query_to_station_name"));
		trainRequest.getUserTrain().setFromStationName((String) postmap.get("query_from_station_name"));
		trainRequest.getUserTrain().setTrain_date((String) postmap.get("train_date"));
		trainRequest.getUserTrain().setPurpose_codes((String) postmap.get("purpose_codes"));
		trainRequest.getUserTrain().setTrainStartDateTime((String) postmap.get("start_time"));
		trainRequest.getUserTrain().setTrainNeedDateTime((String) postmap.get("lishi"));
		postmap.remove("start_time");
		postmap.remove("lishi");
		result = trainRequest.doPost(submitOrderUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		return jsonObjectone;
	};

	/**
	 * 检查订单信息
	 * 
	 * @param postmap
	 *            提交时post的参数
	 * @return 返回Json
	 */
	public Object checkOrderInfo(Map<String, Object> postmap) {
		String result = null;
		trainRequest trainRequest = getUserSession();
		JSONObject jsonObjectone = null;
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		trainRequest.getUserTrain().setPassengerTicketStr((String) postmap.get("passengerTicketStr"));
		trainRequest.getUserTrain().setOldPassengerStr((String) postmap.get("oldPassengerStr"));
		result = trainRequest.doPost(checkOrderUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		return jsonObjectone;
	}

	/**
	 * 获取余票队列信息
	 * 
	 * @param postmap
	 *            提交时post的参数
	 * @return
	 */
	public Object getQueueCount(Map<String, Object> postmap) {
		String result = null;
		trainRequest trainRequest = getUserSession();
		JSONObject jsonObjectone = null;
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		postmap.put("leftTicket",
				trainRequest.getUserTrain().getLeftTicket() != null ? trainRequest.getUserTrain().getLeftTicket() : "");
		trainRequest.getUserTrain().setSeatType((String) postmap.get("seatType"));
		trainRequest.getUserTrain().setTrain_no((String) postmap.get("train_no"));
		trainRequest.getUserTrain().setStationTrainCode((String) postmap.get("stationTrainCode"));
		trainRequest.getUserTrain().setFromStationTelecode((String) postmap.get("fromStationTelecode"));
		trainRequest.getUserTrain().setToStationTelecode((String) postmap.get("toStationTelecode"));
		trainRequest.getUserTrain().setTrain_location((String) postmap.get("train_location"));

		result = trainRequest.doPost(getQueueCountUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		result = null;
		postmap = null;
		return jsonObjectone;
	}

	/**
	 * 确认订单
	 * 
	 * @param postmap
	 *            提交时post的参数
	 * @return
	 */
	public Object confirmSingleQueue(Map<String, Object> postmap) {
		String result = null;
		trainRequest trainRequest = getUserSession();
		JSONObject jsonObjectone = null;
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		postmap.put("leftTicketStr",
				trainRequest.getUserTrain().getLeftTicket() != null ? trainRequest.getUserTrain().getLeftTicket() : "");
		postmap.put("key_check_isChange",
				trainRequest.getUserTrain().getKey_check_isChange() != null
						? trainRequest.getUserTrain().getKey_check_isChange()
						: "");
		result = trainRequest.doPost(confirmSingleForDcQueueUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		return jsonObjectone;

	}

	/**
	 * 加入抢票队列
	 * 
	 * @param postmap
	 * @return
	 */
	public Object joinConfirmSingleQueue(Map<String, Object> postmap) {
		String result = null;
		trainRequest trainRequest = getUserSession();
		Users Principaluser = null;
		Subject subject = SecurityUtils.getSubject();
		Object Principal = subject.getPrincipal();

		JSONObject jsonObjectone = null;
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		postmap.put("leftTicketStr",
				trainRequest.getUserTrain().getLeftTicket() != null ? trainRequest.getUserTrain().getLeftTicket() : "");
		postmap.put("key_check_isChange",
				trainRequest.getUserTrain().getKey_check_isChange() != null
						? trainRequest.getUserTrain().getKey_check_isChange()
						: "");
		trainRequest.getUserTrain().setStart(true);
		trainRequest.getUserTrain().setComplete(false);
		trainRequest.getUserTrain().setRemark("");
		if (Principal != null) {
			Principaluser = (Users) Principal;
			trainRequest.getUserTrain().setEmail(Principaluser.getEmail());
			;

		}
		addBuyTask(trainRequest);
		return true;
	}

	/**
	 * 获取订单是否完成
	 * 
	 * @param postmap
	 *            提交时post的参数
	 * @return
	 */
	public Object getQueryOrderWaitTime(Map<String, Object> postmap) {
		String result = null;
		trainRequest trainRequest = (trainRequest) getUserSession();
		JSONObject jsonObjectone = null;
		postmap.put("REPEAT_SUBMIT_TOKEN",
				Optional.ofNullable(trainRequest.getUserTrain().getRepeat_submit_token()).orElse(""));
		result = trainRequest.doPost(queryOrderWaitTimeUrl, postmap);
		jsonObjectone = JSONObject.parseObject(result);
		return jsonObjectone;
	}

	/**
	 * 完成任务并停止
	 * 
	 * @param t
	 * @return
	 */
	public boolean completeBuyTask(trainRequest t) {
		buyTask.remove(t);
		if (t != null) {
			t.getUserTrain().setStart(false);
			t.getUserTrain().setComplete(true);
			t.getUserTrain().addMsgList("购买完成");
			t.getUserTrain()
					.addMsgList("由 " + t.getUserTrain().getFromStationName() + " 开往 "
							+ t.getUserTrain().getToStationTeleName() + "的 " + t.getUserTrain().getStationTrainCode()
							+ "次列车购票完成，请前往12306官网付款");
			t.getUserTrain().setRemark("已完成");

			Email email = new Email();
			email.setSubject("12306购票成功")
					.setText("由 " + t.getUserTrain().getFromStationName() + " 开往 "
							+ t.getUserTrain().getToStationTeleName() + "的 " + t.getUserTrain().getStationTrainCode()
							+ "次列车购票完成，请前往12306官网付款")
					.setTomail(t.getUserTrain().getEmail());
			new QQEmailUtilFactory().CreateEmail().JoinEmailQueue(email);

		} else {
			return false;
		}
		return true;
	}

	/**
	 * 任务失败并停止
	 * 
	 * @param t
	 * @param remark
	 *            停止备注
	 */
	public void faileAndStopBuyTask( String remark) {
		trainRequest t=getUserSession();
		buyTask.remove(t);
		t.getUserTrain().setRemark("抢票任务已停止");
		t.getUserTrain().setStart(false);
		t.getUserTrain().setComplete(false);
		t.getUserTrain().addMsgList(remark);
		Email email = new Email();
		email.setSubject("抢票任务已停止").setText("原因:" + remark).setTomail(t.getUserTrain().getEmail());
		new QQEmailUtilFactory().CreateEmail().JoinEmailQueue(email);
	}

	/**
	 * 加入队列
	 * 
	 * @param obj
	 */
	public void addBuyTask(trainRequest obj) {
		TrainBuyService.buyTask.add(obj);
		obj.getUserTrain().setStart(true);
	}

	/**
	 * 停止抢票任务
	 */
	public void StopTask() {

		trainRequest t = getUserSession();
		t.getUserTrain().setRemark("抢票任务已停止");
		t.getUserTrain().setStart(false);
		buyTask.remove(t);

	}

	/**
	 * 任务重启
	 */
	public void restartTask() {

		trainRequest t = getUserSession();
		t.getUserTrain().setStart(true);
		t.getUserTrain().setComplete(false);
		t.getUserTrain().addMsgList("抢票任务重新启动");
		buyTask.add(t);

	}

	public static void setBuyTask(CopyOnWriteArraySet<Object> buyTask) {
		TrainBuyService.buyTask = buyTask;
	}

	public static CopyOnWriteArraySet<Object> getBuyTask() {

		return buyTask;
	}

	public synchronized static Object sessionTaskTake(String key) {
		Object obj = sessionTask.get(key);
		sessionTask.remove(key);
		return obj;
	}

	public static Object sessionTaskGet(String key) {
		Object obj = sessionTask.get(key);
		return obj;
	}

	public static void sessionTaskPut(String key, Object value) {
		sessionTask.put(key, value);
	}
	public void setTrainrequest(trainRequest trainrequest) {
		this.trainrequest = trainrequest;
	
	}
}
