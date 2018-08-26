package com.MyBlog.Shiro.Filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;




public class RoleFilter extends AccessControlFilter{
private	static  String LOGIN_URL ;
private	static  String UNAUTHORIZED_URL;
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
String[] arra = (String[])mappedValue;
		
		Subject subject = getSubject(request, response);
		for (String role : arra) {
			if(subject.hasRole("role:" + role)){
				return true;
			}
		}
		return false;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);  
		HttpServletRequest request1=(HttpServletRequest) request;
		if (subject.getPrincipal() == null) {//表示没有登录，重定向到登录页面  
            saveRequest(request);  
            WebUtils.issueRedirect(request, response,request1.getContextPath()+LOGIN_URL);  
        } else {  
            if (StringUtils.hasText(UNAUTHORIZED_URL)) {//如果有未授权页面跳转过去  
                WebUtils.issueRedirect(request, response,request1.getContextPath()+ UNAUTHORIZED_URL);  
            } else {//否则返回401未授权状态码  
                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);  
            }  
        }  
	return false;
	}

	public static String getLOGIN_URL() {
		return LOGIN_URL;
	}

	public  void setLOGIN_URL(String lOGIN_URL) {
		LOGIN_URL = lOGIN_URL;
	}

	public static String getUNAUTHORIZED_URL() {
		return UNAUTHORIZED_URL;
	}

	public  void setUNAUTHORIZED_URL(String uNAUTHORIZED_URL) {
		UNAUTHORIZED_URL = uNAUTHORIZED_URL;
	}

}
