package com.MyBlog.utils;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FormTokenInterceptor extends HandlerInterceptorAdapter{
	  @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        if (handler instanceof HandlerMethod) {
	            HandlerMethod handlerMethod = (HandlerMethod) handler;
	            Method method = handlerMethod.getMethod();
	            FormToken annotation = method.getAnnotation(FormToken.class);
	            if (annotation != null) {
	                boolean needSaveSession = annotation.save();
	                if (needSaveSession) {
	                	
	                    request.getSession(true).setAttribute("formToken", UUID.randomUUID().toString());
	               
	                }
	                boolean needRemoveSession = annotation.remove();
	                if (needRemoveSession) {
	                    if (isRepeatSubmit(request)) {
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
