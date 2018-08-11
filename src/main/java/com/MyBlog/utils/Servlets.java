package com.MyBlog.utils;




import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.resource.ResourceUrlProvider;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.resource.ResourceUrlProvider;

public class Servlets {
	public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
 
    public static boolean isStaticFile(String uri) {
        ResourceUrlProvider resourceUrlProvider = (ResourceUrlProvider) GenericUtils.getBean(ResourceUrlProvider.class);
        String staticUri = resourceUrlProvider.getForLookupPath(uri);
        return staticUri != null;
    }

}