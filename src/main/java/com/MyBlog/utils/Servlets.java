package com.MyBlog.utils;




import org.apache.shiro.util.AntPathMatcher;
import org.apache.shiro.util.PatternMatcher;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.resource.ResourceUrlProvider;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.resource.ResourceUrlProvider;

public class Servlets {

	private static PatternMatcher staticResourcePathMatcher = new AntPathMatcher();
	public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
 
    public static boolean isStaticFile(String uri) {
    
        ResourceUrlProvider resourceUrlProvider = (ResourceUrlProvider) GenericUtils.getBean(ResourceUrlProvider.class);
        String staticUri = resourceUrlProvider.getForLookupPath(uri);
    	if(uri.indexOf("/druid/")!=-1&&uri.indexOf(".html")!=-1) {
    		staticUri=null;
    	}
    	else if(uri.indexOf("/druid/")!=-1) {
    		staticUri=uri;
    	}
        return staticUri != null;
    }

}
