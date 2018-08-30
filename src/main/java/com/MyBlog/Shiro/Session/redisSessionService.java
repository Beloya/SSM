package com.MyBlog.Shiro.Session;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.convert.RedisData;
import org.springframework.stereotype.Service;

import com.MyBlog.ServiceImpl.ShiroSession;

import com.MyBlog.cache.RedisUtil;
import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.utils.SerializeUtil;
import com.MyBlog.utils.Servlets;


public class redisSessionService extends EnterpriseCacheSessionDAO {
	  private static Logger logger =Logger.getLogger(redisSessionService.class);
	 private int expire;
private final static String key="Shiro_Session";
	 RedisUtil redisOP=new RedisUtil();
	    @Override
	    protected Serializable doCreate(Session session) {
	    	super.doCreate(session);
	        Serializable sessionId = generateSessionId(session);  
	        redisOP.hset(key.getBytes(),sessionId.toString().getBytes(), sessionToByte(session),expire);
	        System.out.println("创建Session:"+session);
	        return sessionId;
	    }

	    // 获取session
	    @Override
	    public Session doReadSession(Serializable sessionId) {
	        // 先从缓存中获取session，如果没有再去数据库中获取
	   
	        
	        Session session =null;
	        System.out.println("读取Session:"+session);
	        HttpServletRequest request = Servlets.getRequest();
			if (request != null){
				String uri = request.getServletPath();
				// 如果是静态文件，则不获取SESSION
				if (Servlets.isStaticFile(uri)){
			
					//return (Session) request.getAttribute("shiro_session");
					System.out.println("request:"+request.getSession());
				}
		
			}
		
	        if(session == null){
	        	byte[] bytes = redisOP.hget(key.getBytes(),sessionId.toString().getBytes());
				if(bytes != null && bytes.length > 0){
	                session = byteToSession(bytes); 
	            
	                System.out.println("读取RedisSession用户信息:"+session.getAttribute("user"));
	                if(session.getAttribute("user")!=null){
	                	System.out.println("user:"+session.getAttribute("user").toString());
	                }
	                assignSessionId(session, sessionId);
	                super.doReadSession(sessionId);
	            }
                
	        }
	    
	       
	        return session;
	    }

	    // 更新session的最后一次访问时间
	    @Override
	    public void doUpdate(Session session) {
	    	HttpServletRequest request = Servlets.getRequest();
	       super.doUpdate(session);
	    	  if (session instanceof ValidatingSession && !((ValidatingSession) session).isValid()) {
	                return;
	            }
	  
	    	if (request != null){
	    	     String uri = request.getServletPath();
	    	     // 如果是静态文件，则不更新SESSION
	    	     if (Servlets.isStaticFile(uri)){
	    	         return;
	    	     }
	    	  
	    	}
	 
				 redisOP.hset(key.getBytes(),session.getId().toString().getBytes(), sessionToByte(session),expire);
				  
				    System.out.println("Session中用户信息:"+session.getAttribute("user"));
	    
			
	        
	    
	        	
	      
				   
	    }

	    // 删除session
	    @Override
	    protected void doDelete(Session session) {
	      //
	        redisOP.hdel(key.getBytes(),session.getId().toString().getBytes());
	        System.out.println("删除Session:"+session);
	    }

	    // 把session对象转化为byte保存到redis中
	    public byte[] sessionToByte(Object session){
	        ByteArrayOutputStream bo = new ByteArrayOutputStream();
	        byte[] bytes = null;
	        try {
	            ObjectOutputStream oo = new ObjectOutputStream(bo);
	            oo.writeObject(session);
	            bytes = bo.toByteArray();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        return bytes;
	    }
	    
	    // 把byte还原为session
	    public Session byteToSession(byte[] bytes){
	        ByteArrayInputStream bi = new ByteArrayInputStream(bytes);
	        ObjectInputStream in;
	        SimpleSession session = null;
	        try {
	            in = new ObjectInputStream(bi);
	            session = (SimpleSession) in.readObject();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    
	        return session;
	    }

		public int getExpire() {
			return expire;
		}

		public void setExpire(int expire) {
			this.expire = expire;
		}
	    
}
