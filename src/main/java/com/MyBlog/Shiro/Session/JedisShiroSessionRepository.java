package com.MyBlog.Shiro.Session;

import java.io.Serializable;
import java.util.Collection;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.Shiro.Utils.ShiroSessionUtils;
import com.MyBlog.cache.RedisUtil;
import com.MyBlog.utils.SerializeUtil;


public class JedisShiroSessionRepository  implements ShiroSessionRepository{
	 public  static String REDIS_SHIRO_SESSION;
	    //这里有个小BUG，因为Redis使用序列化后，Key反序列化回来发现前面有一段乱码，解决的办法是存储缓存不序列化
	    public static  String REDIS_SHIRO_ALL;
	    //Redis过期时间。精度为秒
	    private  static int SESSION_VAL_TIME_SPAN;
	    private static  int DB_INDEX;
	  
private RedisUtil redisUtil;
public void saveSession(Session session) {
    if (session == null || session.getId() == null)
        throw new NullPointerException("session is empty");
    try {
        byte[] key = SerializeUtil.serialize(session.getId());
        //不存在才添加。
        if(null == session.getAttribute(CustomSessionManager.SESSION_STATUS)){
        	//Session 踢出自存存储。
        	SessionStatus sessionStatus = new SessionStatus();
        	session.setAttribute(CustomSessionManager.SESSION_STATUS, sessionStatus);
        }
        byte[] value = SerializeUtil.serialize(session);
        redisUtil.hset(SerializeUtil.serialize(buildRedisSessionKey(session.getId())),key, value,SESSION_VAL_TIME_SPAN);
    } catch (Exception e) {
    	LoggerUtil.fmtError(getClass(), e, "save session error，id:[%s]",session.getId());
    }
}

public void deleteSession(Serializable id) {
    if (id == null) {
        throw new NullPointerException("session id is empty");
    }
    try {
    
    	redisUtil.del(DB_INDEX,SerializeUtil.serialize(buildRedisSessionKey(id)));
    } catch (Exception e) {
    	LoggerUtil.fmtError(getClass(), e, "删除session出现异常，id:[%s]",id);
    }
}


@SuppressWarnings("unchecked")
public Session getSession(Serializable id) {
	
    if (id == null)
    	 throw new NullPointerException("session id is empty");
    Session session = null;
    try {
    	
    	     
        byte[] value = redisUtil.hget(SerializeUtil.serialize(buildRedisSessionKey(id)), SerializeUtil
                .serialize(id));
        session = SerializeUtil.deserialize(value, Session.class);
     

        
    } catch (Exception e) {
    	LoggerUtil.fmtError(getClass(), e, "获取session异常，id:[%s]",id);
    }
  
    return session;
}

public Collection<Session> getAllSessions() {
	Collection<Session> sessions = null;
	try {
		sessions = redisUtil.AllSession(DB_INDEX,REDIS_SHIRO_SESSION);
	} catch (Exception e) {
		LoggerUtil.fmtError(getClass(), e, "获取全部session异常");
	}
   
    return sessions;
}




public RedisUtil getRedisUtil() {
	return redisUtil;
}
public void setRedisUtil(RedisUtil redisUtil) {
	this.redisUtil = redisUtil;
}

public int getSESSION_VAL_TIME_SPAN() {
	return SESSION_VAL_TIME_SPAN;
}

public void setSESSION_VAL_TIME_SPAN(int sESSION_VAL_TIME_SPAN) {
	SESSION_VAL_TIME_SPAN = sESSION_VAL_TIME_SPAN;
}

public int getDB_INDEX() {
	return DB_INDEX;
}

public void setDB_INDEX(int dB_INDEX) {
	DB_INDEX = dB_INDEX;
}

public  String getRedisShiroSession() {
	return REDIS_SHIRO_SESSION;
}

public  String getRedisShiroAll() {
	return REDIS_SHIRO_ALL;
}

public static String getREDIS_SHIRO_SESSION() {
	return REDIS_SHIRO_SESSION;
}

public static void setREDIS_SHIRO_SESSION(String rEDIS_SHIRO_SESSION) {
	REDIS_SHIRO_SESSION = rEDIS_SHIRO_SESSION;
}

public static String getREDIS_SHIRO_ALL() {
	return REDIS_SHIRO_ALL;
}

public static void setREDIS_SHIRO_ALL(String rEDIS_SHIRO_ALL) {
	REDIS_SHIRO_ALL = rEDIS_SHIRO_ALL;
}

private String buildRedisSessionKey(Serializable sessionId) {
    return REDIS_SHIRO_SESSION + sessionId;
}




}
