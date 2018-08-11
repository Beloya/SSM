package com.MyBlog.Session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class ShiroSessionListener implements SessionListener {
	  private static final Logger logger = LoggerFactory.getLogger(ShiroSessionListener.class);
	  @Autowired
	    private redisSessionService sessionDao;
	public void onStart(Session session) {
		// TODO Auto-generated method stub
		   logger.info("ShiroSessionListener session {} 被创建", session.getId());
	}

	public void onStop(Session session) {
		// TODO Auto-generated method stub
		 sessionDao.delete(session);
	}

	public void onExpiration(Session session) {
		// TODO Auto-generated method stub
		 sessionDao.delete(session);
	}

}
