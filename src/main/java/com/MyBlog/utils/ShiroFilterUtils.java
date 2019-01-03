package com.MyBlog.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.MyBlog.Logger.MyLogger;
import com.alibaba.fastjson.JSONObject;


public class ShiroFilterUtils {
	final static Class<? extends ShiroFilterUtils> CLAZZ = ShiroFilterUtils.class;
	//登录页面
	public static  String LOGIN_URL;
	//踢出登录提示
	public  static String KICKED_OUT;
	//没有权限提醒
	public  static String UNAUTHORIZED;
	/**
	 * 是否是Ajax请求
	 * @param request
	 * @return
	 */
	public static boolean isAjax(ServletRequest request){
		return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
	}
	
	/**
	 * response 输出JSON
	 * @param hresponse
	 * @param resultMap
	 * @throws IOException
	 */
	public static void out(ServletResponse response, Map<String, String> resultMap){
		
		PrintWriter out = null;
		try {
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.println(JSONObject.toJSON(resultMap).toString());
			System.out.println(JSONObject.toJSON(resultMap).toString());
		} catch (Exception e) {
			MyLogger.fmtError(CLAZZ, e, "输出JSON报错。");
		}finally{
			if(null != out){
				out.flush();
				out.close();
			}
		}
	}
public static String urlSuffix(String url) {
	
	return url.replace(".do","");
}
	public static String getLoginUrl() {
		return LOGIN_URL;
	}

	public static String getKickedOut() {
		return KICKED_OUT;
	}

	public static String getUnauthorized() {
		return UNAUTHORIZED;
	}

	public static String getLOGIN_URL() {
		return LOGIN_URL;
	}

	public  void setLOGIN_URL(String lOGIN_URL) {
		LOGIN_URL = lOGIN_URL;
	}

	public static String getKICKED_OUT() {
		return KICKED_OUT;
	}

	public  void setKICKED_OUT(String kICKED_OUT) {
		KICKED_OUT = kICKED_OUT;
	}

	public static String getUNAUTHORIZED() {
		return UNAUTHORIZED;
	}

	public  void setUNAUTHORIZED(String uNAUTHORIZED) {
		UNAUTHORIZED = uNAUTHORIZED;
	}
	
	
}
