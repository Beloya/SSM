package com.MyBlog.Service;

import java.util.Map;

import com.MyBlog.HttpRequest.httpRequest;
import com.MyBlog.HttpRequest.trainRequest;
import com.google.common.collect.ImmutableMap;

/**
 * 
 * @author Beloya
 *
 */
public interface TrainService {
	
public final static String getVerifyUrl="https://kyfw.12306.cn/passport/captcha/captcha-image64?login_site=E&module=login&rand=sjrand&";
public final static String checkVerifyUrl="https://kyfw.12306.cn/passport/captcha/captcha-check?callback=jQuery19100155250425586555_1542871515363&rand=sjrand&login_site=E&_=";
public final static String loginUrl="https://kyfw.12306.cn/passport/web/login";
public final static String checkUserUrl="https://kyfw.12306.cn/otn/login/checkUser";
public final static String queryBase="https://kyfw.12306.cn/otn/leftTicket/init";
public final static String queryBaseUrl="https://kyfw.12306.cn/otn/";
public final static String uamtkUrl="https://kyfw.12306.cn/passport/web/auth/uamtk";
public final static String uamauthclientUrl="https://kyfw.12306.cn/otn/uamauthclient";
public final static String getPassengerUrl="https://kyfw.12306.cn/otn/confirmPassenger/getPassengerDTOs";
public final static String initDcUrl="https://kyfw.12306.cn/otn/confirmPassenger/initDc";
public final static String submitOrderUrl="https://kyfw.12306.cn/otn/leftTicket/submitOrderRequest";
public final static String checkOrderUrl="https://kyfw.12306.cn/otn/confirmPassenger/checkOrderInfo";
public final static String getQueueCountUrl="https://kyfw.12306.cn/otn/confirmPassenger/getQueueCount";
public final static String confirmSingleForDcQueueUrl="https://kyfw.12306.cn/otn/confirmPassenger/confirmSingleForQueue";
public final static String queryOrderWaitTimeUrl="https://kyfw.12306.cn/otn/confirmPassenger/queryOrderWaitTime";
public final static String initloginUrl="https://kyfw.12306.cn/otn/login/init";
public static Map<String,String> seatMap=ImmutableMap.<String, String>builder()
.put("9","swz_num")
.put("M","zy_num")
.put("O","ze_num")
.put("6","gr_num")
.put("4","rw_num")
.put("3","yw_num")
.put("2","rz_num")
.put("1","yz_num")
.build();

/**登录接口
 * 
 * @param trainusername 12306用户名
 * @param trainpassword 12306密码
 * @param verifyCode 验证码
 * @return 登录Json字符串
 */
	public Object userLogin(String trainusername,String trainpassword,String verifyCode);
	/**获取验证码
	 * 
	 * @return 验证码Json串
	 */
	public Object getVerify();
	/**检查验证码
	 * 
	 * @param verifyCode 验证码
	 * @return 验证码Json串
	 */
	public Object checkVerify(String verifyCode);
	/**查询车次
	 * 
	 * @param startStation 起始站
	 * @param endStation 终点站
	 * @return json串
	 */
	public Object queryTicket(String from_station,String to_station,String time);
	
	/**
	 * 检查是否有余票
	 * @param map 车次信息
	 * @param 作为
	 * @return boolean
	 */
	public boolean queryHasTicket(Map<String,Object> map);
/**
 * 
 * @return 检查是否登录
 */
public Object CheckUser();
	
	/**
	 * 
	 * @param trainRequest
	 * @return
	 */
	public Object requestInit(trainRequest trainRequest,String userName);
	

	
/**
 *  拉取乘客信息
 * @return 乘客信息Json
 */
	public Object getPassenger();
	
	/**
	 *  获取登录用户的12306会话
	 * @return  返回会话对象
	 */
	public   trainRequest getUserSession();
	
	/**
	 * 提交预订单
	 * @param postmap 提交时post的参数
	 * @return 返回Json
	 */
	public Object submitOrderRequest(Map<String,Object> postmap);
	
	/**
	 *  检查订单信息
	 * @param postmap 提交时post的参数
	 * @return 返回Json
	 */
	public Object checkOrderInfo(Map<String,Object> postmap);
	
	/**
	 * 获取余票队列信息
	 * @param postmap 提交时post的参数
	 * @return
	 */
	public Object getQueueCount(Map<String,Object> postmap);
	
	/**
	 *  确认订单
	 * @param postmap 提交时post的参数
	 * @return
	 */
	public Object confirmSingleQueue(Map<String,Object> postmap);
	
	/**
	 * 获取订单是否完成
	 * @param postmap 提交时post的参数
	 * @return
	 */
	public  Object getQueryOrderWaitTime(Map<String,Object> postmap);
}
