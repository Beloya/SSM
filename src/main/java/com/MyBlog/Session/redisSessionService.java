package com.MyBlog.Session;

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
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MyBlog.ServiceImpl.ShiroSession;
import com.MyBlog.cache.RedisDb;
import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.utils.Servlets;


public class redisSessionService extends EnterpriseCacheSessionDAO {
	  private static Logger logger =Logger.getLogger(redisSessionService.class);
	 private int expire;
	    @Override
	    protected Serializable doCreate(Session session) {
	        Serializable sessionId = super.doCreate(session);
	        RedisDb.setObject(sessionId.toString().getBytes(), sessionToByte(session),expire);
	     
	        return sessionId;
	    }

	    // 获取session
	    @Override
	    protected Session doReadSession(Serializable sessionId) {
	        // 先从缓存中获取session，如果没有再去数据库中获取
	        Session session = super.doReadSession(sessionId); 
	        HttpServletRequest request = Servlets.getRequest();
			if (request != null){
				String uri = request.getServletPath();
				// 如果是静态文件，则不获取SESSION
				if (Servlets.isStaticFile(uri)){
					return null;
				}
			
			}

	        if(session == null){
	            byte[] bytes = RedisDb.getObject(sessionId.toString().getBytes());
	          
	            if(bytes != null && bytes.length > 0){
	                session = byteToSession(bytes);    
	            }
	           
	        }
	   
	        return session;
	    }

	    // 更新session的最后一次访问时间
	    @Override
	    protected void doUpdate(Session session) {
	    	HttpServletRequest request = Servlets.getRequest();
	        if (session instanceof ShiroSession) {
	    	 ShiroSession ss = (ShiroSession) session;
	    	  if (session instanceof ValidatingSession && !((ValidatingSession) session).isValid()) {
	                return;
	            }
	    	  
               if (!ss.isChanged()) {
     
                   return;
               }
	    	if (request != null){
	    	     String uri = request.getServletPath();
	    	     // 如果是静态文件，则不更新SESSION
	    	     if (Servlets.isStaticFile(uri)){
	    	         return;
	    	     }
	    	  
	    	}
	        super.doUpdate(session);
	        ss.setChanged(false);
	        RedisDb.setObject(session.getId().toString().getBytes(), sessionToByte(session),expire);
	       
	        }
	        else{
	        	
	        	 logger.error("更新Session失败");
	        }
	    
	    }

	    // 删除session
	    @Override
	    protected void doDelete(Session session) {
	        super.doDelete(session);
	        RedisDb.delString(session.getId() + "");
	     
	    }

	    // 把session对象转化为byte保存到redis中
	    public byte[] sessionToByte(Session session){
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
