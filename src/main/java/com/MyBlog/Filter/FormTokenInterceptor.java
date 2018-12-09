package com.MyBlog.Filter;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.MyBlog.Core.FormToken;
import com.MyBlog.Logger.MyLogger;
import com.MyBlog.utils.JsonUtils;
import com.MyBlog.utils.ShiroFilterUtils;

public class FormTokenInterceptor extends HandlerInterceptorAdapter{
	  @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        if (handler instanceof HandlerMethod) {
	            HandlerMethod handlerMethod = (HandlerMethod) handler;
	            Method method = handlerMethod.getMethod();
	        	Map<String, String> resultMap = new HashMap<String, String>();
	            FormToken annotation = method.getAnnotation(FormToken.class);
	            if (annotation != null) {
	                boolean needSaveSession = annotation.save();
	                if (needSaveSession) {
	                	
	                    request.getSession(true).setAttribute("formToken", UUID.randomUUID().toString());
	               
	                }
	                boolean needRemoveSession = annotation.remove();
	                if (needRemoveSession) {
	                    if (isRepeatSubmit(request)) {
	                    	if (ShiroFilterUtils.isAjax(request) ) {
	            				MyLogger.debug(getClass(), "当前用户已经提交过，并且是Ajax请求！");
	            				resultMap.put("code", "503");
	            				resultMap.put("msg", "请不要重复提交！");
	            				JsonUtils.out(response, resultMap);
	            			}
	                        return false;
	                    }
	                    request.getSession(true).removeAttribute("formToken");
	                }
	            }
	            return true;
	        } else {
	            return super.preHandle(request, response, handler);
	        }
	    }
	 
	    private boolean isRepeatSubmit(HttpServletRequest request) {
	        String serverToken = (String) request.getSession(false).getAttribute("formToken");
	        if (serverToken == null) {
	            return true;
	        }
	        String clinetToken = request.getParameter("formToken");
	        if (clinetToken == null) {
	            return true;
	        }
	        if (!serverToken.equals(clinetToken)) {
	            return true;
	        }
	        return false;
	    }

}
