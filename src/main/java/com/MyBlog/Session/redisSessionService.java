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

import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;

import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.utils.Servlets;



public class redisSessionService extends EnterpriseCacheSessionDAO {
	  private static Logger logger =Logger.getLogger(redisSessionService.class);
	  private long expire;
	    private String KEY="shrio_session";
	   // private static JedisPool jedisPool = null;
	@Autowired
		SpringRedisCache sre;
	public void delete(Session session) {
		 if(session == null || session.getId() == null){
	            System.out.println("Session is null");
	            logger.error("Session is null");
	            return;
	        }
		 System.out.println("删除ID="+session.getId());
	        sre.hdel(KEY,session.getId().toString());
	        System.out.println("删除ID结束="+session.getId());
	}

	public Collection<Session> getActiveSessions() {
		  List<Session> list = sre.slget();
		return list;
	}

	public void update(Session session) throws UnknownSessionException {

		 HttpServletRequest request = Servlets.getRequest();
	
		if(session == null || session.getId() == null){
            System.out.println("Session is null");
            logger.error("Session is null");
            return;
        }
		if (request != null){
		     String uri = request.getServletPath();
		     // 如果是静态文件，则不更新SESSION
		     if (Servlets.isStaticFile(uri)){
		         return;
		     }
		     // 如果是视图文件，则不更新SESSION
		   
		}
	System.out.println("开始更新ID="+session.getId());
		 Serializable sessionId = session.getId();
		 System.out.println("开始更新session="+session);
		   super.doUpdate(session);
		   sre.hset(KEY,session.getId().toString(), session, 180);
	       // RedisDb.setObject(session.getId().toString().getBytes(), sessionToByte(session));
	        System.out.println("结束更新session="+session);
	       
	}

	@Override
	protected Serializable doCreate(Session session) {
		 Serializable sessionId = this.generateSessionId(session);
		 
		 this.assignSessionId(session, sessionId);
		 logger.error("创建seesion,id="+session.getId().toString());
		System.out.println("创建seesion,id="+session.getId().toString());
		//RedisDb.setObject(sessionId.toString().getBytes(), sessionToByte(session));
		 sre.hset(KEY,session.getId().toString(), session, 180);
		 System.out.println("结束创建seesion,session="+session);
	        return sessionId;
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
		Session s = null;
		HttpServletRequest request = Servlets.getRequest();
		Session session = super.doReadSession(sessionId); 
		if (request != null){
			String uri = request.getServletPath();
			// 如果是静态文件，则不获取SESSION
			if (Servlets.isStaticFile(uri)){
				return null;
			}
			s = (Session)request.getAttribute("session_"+sessionId);
		}
		if (s != null){
			return s;
		}
		   if(session == null){
	        //    byte[] bytes = RedisDb.getObject(sessionId.toString().getBytes());
	         //   if(bytes != null && bytes.length > 0){
	          //      session = byteToSession(bytes);    
	        //    }
		   
	    System.out.println("sessionId:"+sessionId);
		 session=sre.sget(sessionId.toString());
		System.out.println("读取到:"+sre.sget(sessionId.toString()));
		   }
		 return session;
		   
	}

	public long getExpire() {
		return expire;
	}

	public void setExpire(long expire) {
		this.expire = expire;
	}

    public Session doReadSessionWithoutExpire(Serializable sessionId) {
        Session session = null;
    
     
        
        	session =sre.sget(sessionId.toString());
          
       

        return session;
    }
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
}
