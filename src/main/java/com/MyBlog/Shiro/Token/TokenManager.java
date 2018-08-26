package com.MyBlog.Shiro.Token;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

import com.MyBlog.Shiro.Realm.WebRealm;
import com.MyBlog.Shiro.Session.CustomSessionManager;
import com.MyBlog.entity.Users;





public class TokenManager {
	//用户登录管理
		public static  WebRealm realm ;
		//用户session管理
	public static  CustomSessionManager customSessionManager;
	/**
	 * 获取当前登录的用户User对象
	 * @return
	 */
	public static Users getToken(){
		Users token = (Users)SecurityUtils.getSubject().getPrincipal();
		return token ;
	}
	
	/**
	 * 获取当前用户的Session
	 * @return
	 */
	public static Session getSession(){
		return SecurityUtils.getSubject().getSession();
	}
	/**
	 * 获取当前用户NAME
	 * @return
	 */
	public static String getNickname(){
		return getToken().getUserName();
	}
	/**
	 * 获取当前用户ID
	 * @return
	 */
	public static Long getUserId(){
		return getToken()==null?null:getToken().getU_Id();
	}
	
	
	public static CustomSessionManager getCustomSessionManager() {
		return customSessionManager;
	}
	/**
	 * 把值放入到当前登录用户的Session里
	 * @param key
	 * @param value
	 */
	public static void setVal2Session(Object key ,Object value){
		getSession().setAttribute(key, value);
	}
	/**
	 * 从当前登录用户的Session里取值
	 * @param key
	 * @return
	 */
	public static Object getVal2Session(Object key){
		return getSession().getAttribute(key);
	}
	/**
	 * 获取验证码，获取一次后删除
	 * @return
	 */
	public static String getYZM(){
		String code = (String) getSession().getAttribute("verify_code");
		getSession().removeAttribute("verify_code");
		return code ;
	}
	
	/**
	 * 登录
	 * @param user
	 * @param rememberMe
	 * @return
	 */
	public static Users login(Users user,Boolean rememberMe){
		ShiroToken token = new ShiroToken(user.getEmail(), user.getPassWord());
		token.setRememberMe(rememberMe);
		SecurityUtils.getSubject().login(token);
		return getToken();
	}
	
	public static void setCustomSessionManager(CustomSessionManager customSessionManager) {
		TokenManager.customSessionManager = customSessionManager;
	}

	public static WebRealm getRealm() {
		return realm;
	}

	public static void setRealm(WebRealm realm) {
		TokenManager.realm = realm;
	}
	
	
	
	
	
	
	
	
}
