package com.MyBlog.Shiro.Filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.Shiro.Session.CustomSessionManager;
import com.MyBlog.Shiro.Session.SessionStatus;
import com.MyBlog.utils.ShiroFilterUtils;
import com.alibaba.fastjson.JSONObject;




public class SimpleAuthFilter extends AccessControlFilter{
	private	static  String LOGIN_URL ;
	private	static  String UNAUTHORIZED_URL;
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		String url = httpRequest.getRequestURI();
		if(url.startsWith("/")){
			return Boolean.TRUE;
		}
		Subject subject = getSubject(request, response);
		Session session = subject.getSession();
		Map<String, String> resultMap = new HashMap<String, String>();
		SessionStatus sessionStatus = (SessionStatus) session.getAttribute(CustomSessionManager.SESSION_STATUS);
		if (null != sessionStatus && !sessionStatus.isOnlineStatus()) {
			//判断是不是Ajax请求
			if (ShiroFilterUtils.isAjax(request) ) {
				LoggerUtil.debug(getClass(), "当前用户已经被踢出，并且是Ajax请求！");
				resultMap.put("code", "300");
				resultMap.put("msg", "您已经被踢出，请重新登录！");
				out(response, resultMap);
			}
			return  Boolean.FALSE;
		}
		return Boolean.TRUE;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		//先退出
				Subject subject = getSubject(request, response);
				subject.logout();
				/**
				 * 保存Request，用来保存当前Request，然后登录后可以跳转到当前浏览的页面。
				 * 比如：
				 * 我要访问一个URL地址，/admin/index.html，这个页面是要登录。然后要跳转到登录页面，但是登录后要跳转回来到/admin/index.html这个地址，怎么办？
				 * 传统的解决方法是变成/user/login.shtml?redirectUrl=/admin/index.html。
				 * shiro的解决办法不是这样的。需要：<code>WebUtils.getSavedRequest(request);</code>
				 * 							 然后：{@link UserLoginController.submitLogin(...)}中的<code>String url = WebUtils.getSavedRequest(request).getRequestUrl();</code>
				 * 如果还有问题，请咨询我。
				 */
				WebUtils.saveRequest(request);
				//再重定向
				WebUtils.issueRedirect(request, response, UNAUTHORIZED_URL);
				return false;
	}
	private void out(ServletResponse hresponse, Map<String, String> resultMap)
			throws IOException {
		hresponse.setContentType("text/json");
		hresponse.setCharacterEncoding("UTF-8");
		PrintWriter out = hresponse.getWriter();
		out.println(JSONObject.toJSON(resultMap).toString());
		out.flush();
		out.close();
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
