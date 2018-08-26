package com.MyBlog.Shiro.Filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import com.MyBlog.Shiro.Token.ShiroToken;

public class MyFormAuthenticationFilter  extends FormAuthenticationFilter {
    protected ShiroToken createToken(ServletRequest request, ServletResponse response) {
        String username = getUsername(request);
        String password = getPassword(request);
        String loginType = request.getParameter("loginType");
        System.out.println("loginType"+loginType);
            return new ShiroToken(username, password);
      
    }
}
