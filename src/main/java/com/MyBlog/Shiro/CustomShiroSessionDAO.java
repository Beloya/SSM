package com.MyBlog.Shiro;

import java.io.Serializable;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.Shiro.Session.ShiroSession;
import com.MyBlog.Shiro.Session.ShiroSessionRepository;
import com.MyBlog.utils.Servlets;



public class CustomShiroSessionDAO extends AbstractSessionDAO   {
    private static ShiroSessionRepository shiroSessionRepository;  
	 public void update(Session session) throws UnknownSessionException {  
		 ShiroSession ss=null;
			HttpServletRequest request = Servlets.getRequest();
			if (request != null){
				String uri = request.getServletPath();
			//自定义Shiro判断是否只更新最后时间
				 if (session instanceof ShiroSession) {
					ss = (ShiroSession) session; 
					  if (!ss.isChanged()) {  
		                    return;  
		                }  
				 }
					// 如果是静态文件则不更新
				if (!Servlets.isStaticFile(uri)){
					   getShiroSessionRepository().saveSession(session);  
					  if(ss!=null) {
						  ss.setChanged(false);
					  }
				}
	    }
	 }
	  
	    public void delete(Session session) {  
	        if (session == null) {  
	        	LoggerUtil.error(getClass(), "Session 不能为null");
	            return;  
	        }  
	        Serializable id = session.getId();  
	        if (id != null)  
	            getShiroSessionRepository().deleteSession(id);  

	    }  
	  
	    public Collection<Session> getActiveSessions() {  
	    	
	        return getShiroSessionRepository().getAllSessions();  
	    }  
	  
	    @Override  
	    protected Serializable doCreate(Session session) {  
	        Serializable sessionId = this.generateSessionId(session);  
	        this.assignSessionId(session, sessionId);  
	        getShiroSessionRepository().saveSession(session);  
	 super.assignSessionId(session, sessionId);
	
	        return sessionId;  
	    }  
	  
	    @Override  
	    protected Session doReadSession(Serializable sessionId) {  
	    	  Session session=null;    	
			HttpServletRequest request = Servlets.getRequest();
			if (request != null){
		         Object s = request.getAttribute(sessionId.toString());
				String uri = request.getServletPath();
				// 如果是静态文件，则不获取SESSION
				if (Servlets.isStaticFile(uri)){
		            if (s != null) {
		                return (Session) s;
		            } 
		      
				}
				 
			}
				session= getShiroSessionRepository().getSession(sessionId);  
		if(request!=null){
			 request.setAttribute(sessionId.toString(),session);
		}
	      return session; 
	
	    }

	    public Session doReadAndWirterSession(Serializable sessionId) {  
	    	  Session session=null;
	    	  
				session= getShiroSessionRepository().getSession(sessionId);  
	
	
		
	      return session; 
	
	    }
	    public void uncache(Session session) {  
	    	delete(session);
	    	System.out.println("delete:"+session);
	
	    }
		public static ShiroSessionRepository getShiroSessionRepository() {
			return shiroSessionRepository;
		}

		public void setShiroSessionRepository(ShiroSessionRepository shiroSessionRepository) {
			this.shiroSessionRepository = shiroSessionRepository;
		}



}
