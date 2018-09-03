package com.MyBlog.Shiro.Utils;

import java.io.Serializable;
import java.util.HashMap;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

public class ShiroSessionUtils {
	private static ThreadLocal<HashMap<Serializable, Session>> threadLocal = new ThreadLocal<HashMap<Serializable, Session>>();
	private static HashMap<Serializable, Session> SessionMap;
	public static  Object getSession(Serializable sessionId) {
		SessionMap=threadLocal.get();
		Session s=null;
		if(SessionMap!=null) {
	s=SessionMap.get(sessionId);
		}
		return s;
	}
	public static  void setObj(Session s) {
		HashMap<Serializable, Session> sm=new HashMap<>();
		sm.put(s.getId(), s);
		threadLocal.set(sm);
	}
	public static  void clear() {
		HashMap<Serializable, Session> sm=new HashMap<>();
		sm.clear();
		threadLocal.set(sm);
	}
	
	
}
