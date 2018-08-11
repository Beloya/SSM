package com.MyBlog.Session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;

import com.MyBlog.ServiceImpl.ShiroSession;
public class ShiroSessionFactory implements SessionFactory{

	public Session createSession(SessionContext initData) {
		 ShiroSession session = new ShiroSession();
	        return session;
	}

}
