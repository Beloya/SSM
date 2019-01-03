package com.MyBlog.Shiro.Filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.utils.ShiroFilterUtils;



public class PermissionFilter extends AccessControlFilter{

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		
		//先判断带参数的权限判断
		Subject subject = getSubject(request, response);
		System.out.println("mappedValue:"+mappedValue);
		if(null != mappedValue){
			String[] arra = (String[])mappedValue;
			for (String permission : arra) {
				if(subject.isPermitted(permission)){
					return Boolean.TRUE;
				}
			}
	}
		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		String uri = httpRequest.getRequestURI();//获取URI
		String basePath = httpRequest.getContextPath();//获取basePath
		System.out.println("basePath:"+basePath+"\n uri:"+uri);
		if(null != uri && uri.startsWith(basePath)){
			uri = uri.replaceFirst(basePath, "");
		}
		if(subject.isPermitted(uri)){
			return Boolean.TRUE;
		}
		if(ShiroFilterUtils.isAjax(request)){
			Map<String,String> resultMap = new HashMap<String, String>();
			MyLogger.debug(getClass(), "当前用户没有登录，并且是Ajax请求！");
			resultMap.put("code", "300");
			resultMap.put("msg", "\u5F53\u524D\u7528\u6237\u6CA1\u6709\u767B\u5F55\uFF01");//当前用户没有登录！
			ShiroFilterUtils.out(response, resultMap);
		}
	
		WebUtils.saveRequest(httpRequest);
		return Boolean.FALSE;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);  
        if (null == subject.getPrincipal()) {//表示没有登录，重定向到登录页面  
            saveRequest(request);  
            WebUtils.issueRedirect(request, response, ShiroFilterUtils.LOGIN_URL);  
        } else {  
            if (StringUtils.hasText(ShiroFilterUtils.UNAUTHORIZED)) {//如果有未授权页面跳转过去  
                WebUtils.issueRedirect(request, response, ShiroFilterUtils.UNAUTHORIZED);  
            } else {//否则返回401未授权状态码  
                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);  
            }  
        }  
	return Boolean.FALSE;
	}

}
