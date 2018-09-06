package com.MyBlog.Shiro.Filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.Shiro.Session.ShiroSessionRepository;
import com.MyBlog.Shiro.Token.TokenManager;
import com.MyBlog.cache.RedisUtil;
import com.MyBlog.utils.JsonOutUtils;
import com.MyBlog.utils.SerializeUtil;
import com.MyBlog.utils.Servlets;
import com.MyBlog.utils.ShiroFilterUtils;
import com.alibaba.fastjson.JSONObject;









@SuppressWarnings({"unchecked","static-access"})
public class KickoutSessionFilter extends AccessControlFilter {
	//静态注入
	private static String kickoutUrl;
	//在线用户
	private static String ONLINE_USER;
	//踢出状态，true标示踢出
	private static String KICKOUT_STATUS;
	static RedisUtil redisutil;
	private static int expire;
	//session获取
		static ShiroSessionRepository shiroSessionRepository;
		  private static  int DB_INDEX;
   /*
    * 单用户登录检查
    * @see org.apache.shiro.web.filter.AccessControlFilter#isAccessAllowed(javax.servlet.ServletRequest, javax.servlet.ServletResponse, java.lang.Object)
    */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object obj) throws Exception {
		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		String url = httpRequest.getRequestURI();
		Subject subject = getSubject(request, response);
		Session session = subject.getSession();
		if(url.startsWith("/css/")|| url.startsWith("/js/")|| (!subject.isAuthenticated() && !subject.isRemembered())){
			return Boolean.TRUE;
		}
		Serializable sessionId = session.getId();  
		/**
		 * 判断是否已经踢出
		 * 1.如果是Ajax 访问，那么给予json返回值提示。
		 * 2.如果是普通请求，直接跳转到登录页
		 */
		Boolean marker = (Boolean)session.getAttribute(KICKOUT_STATUS);
		if (null != marker && marker ) {
			Map<String, String> resultMap = new HashMap<String, String>();
			//判断是不是Ajax请求
			if (ShiroFilterUtils.isAjax(request) ) {
				LoggerUtil.debug(getClass(), "当前用户已经在其他地方登录，并且是Ajax请求！");
				resultMap.put("code", "300");
				resultMap.put("msg", "您已经在其他地方登录，请重新登录！");
				JsonOutUtils.out(response, resultMap);
			}
			return  Boolean.FALSE;
	}
		
		
		//从缓存获取用户-Session信息 <UserId,SessionId>
		byte[] key = SerializeUtil.serialize(ONLINE_USER);
	//	HashMap<Long, Serializable> infoMap = null;
		Serializable online_sessionId=null;
		//获取tokenId
		 Long	userId = TokenManager.getUserId();
		 //如果未登录则不检查
		 if(userId==null){
			 return  Boolean.TRUE;
		 }
		online_sessionId=(Serializable) SerializeUtil.unserialize(redisutil.hget(key,SerializeUtil.serialize(userId)));
				//如果已经包含当前Session，且是同一个用户，跳过。
				if(sessionId.equals(online_sessionId)){
					//更新存储到缓存（这个时间最好和session的有效期一致或者大于session的有效期）
					
					return Boolean.TRUE;
				}
				//如果用户相同，Session不相同，处理
				/**
				 * 如果用户Id相同,Session不相同
				 * 1.获取到原来的session，并且标记为踢出。
				 */
				if(online_sessionId!=sessionId&&online_sessionId!=null){
					Serializable oldSessionId =online_sessionId;
					Session oldSession = shiroSessionRepository.getSession(oldSessionId);
					
					//System.out.println("oldSession:"+oldSession);
					if(null != oldSession){
						//标记session已经踢出
						oldSession.setAttribute(KICKOUT_STATUS, Boolean.TRUE);
						shiroSessionRepository.saveSession(oldSession);//更新session
						shiroSessionRepository.deleteSession(oldSession.getId());
						redisutil.hset(key, SerializeUtil.serialize(userId),SerializeUtil.serialize(sessionId), expire);
						LoggerUtil.fmtDebug(getClass(), "kickout old session success,oldId[%s]",oldSessionId);
					}else{
						shiroSessionRepository.deleteSession(oldSessionId);
						//infoMap.remove(userId);
						//存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
						redisutil.hset(key, SerializeUtil.serialize(userId),SerializeUtil.serialize(sessionId), expire);
					}
					return  Boolean.TRUE;
				} else{
					redisutil.hset(key, SerializeUtil.serialize(userId),SerializeUtil.serialize(sessionId), expire);
				}
           
				return Boolean.TRUE;
		
	}
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		//先退出
				Subject subject = getSubject(request, response);
				subject.logout();
				WebUtils.getSavedRequest(request);
				//再重定向
				WebUtils.issueRedirect(request, response,kickoutUrl);
				return false;
	}


	public static String getKickoutUrl() {
		return kickoutUrl;
	}
	public static void setKickoutUrl(String kickoutUrl) {
		KickoutSessionFilter.kickoutUrl = kickoutUrl;
	}
	public static RedisUtil getRedisutil() {
		return redisutil;
	}
	public static void setRedisutil(RedisUtil redisutil) {
		KickoutSessionFilter.redisutil = redisutil;
	}
	public static ShiroSessionRepository getShiroSessionRepository() {
		return shiroSessionRepository;
	}
	public static void setShiroSessionRepository(ShiroSessionRepository shiroSessionRepository) {
		KickoutSessionFilter.shiroSessionRepository = shiroSessionRepository;
	}
	public static int getDB_INDEX() {
		return DB_INDEX;
	}
	public static void setDB_INDEX(int dB_INDEX) {
		DB_INDEX = dB_INDEX;
	}
	public static String getOnlineUser() {
		return ONLINE_USER;
	}
	public static String getKickoutStatus() {
		return KICKOUT_STATUS;
	}
	public static int getExpire() {
		return expire;
	}
	public static void setExpire(int expire) {
		KickoutSessionFilter.expire = expire;
	}
	public static String getONLINE_USER() {
		return ONLINE_USER;
	}
	public static void setONLINE_USER(String oNLINE_USER) {
		ONLINE_USER = oNLINE_USER;
	}
	public static String getKICKOUT_STATUS() {
		return KICKOUT_STATUS;
	}
	public static void setKICKOUT_STATUS(String kICKOUT_STATUS) {
		KICKOUT_STATUS = kICKOUT_STATUS;
	}
	
	
}
