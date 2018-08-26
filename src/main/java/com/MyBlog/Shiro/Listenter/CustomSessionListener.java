package com.MyBlog.Shiro.Listenter;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;

import com.MyBlog.Shiro.Session.ShiroSessionRepository;


public class CustomSessionListener implements SessionListener{
	 private ShiroSessionRepository shiroSessionRepository;

	    /**
	     * 一个回话的生命周期开始
	     */
	    public void onStart(Session session) {
	        //TODO
	        System.out.println("on start:"+session);
	    }
	    /**
	     * 一个回话的生命周期结束
	     */
	    public void onStop(Session session) {
	        System.out.println("on stop");
	    }

	    public void onExpiration(Session session) {
	        shiroSessionRepository.deleteSession(session.getId());
	    }

	    public ShiroSessionRepository getShiroSessionRepository() {
	        return shiroSessionRepository;
	    }

	    public void setShiroSessionRepository(ShiroSessionRepository shiroSessionRepository) {
	        this.shiroSessionRepository = shiroSessionRepository;
	    }
}
