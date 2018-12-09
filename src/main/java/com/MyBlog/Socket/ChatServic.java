package com.MyBlog.Socket;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import com.MyBlog.Controller.WeChatController;
import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.entity.Users;
import com.MyBlog.utils.StringUtils;



/**
 * 
 * @author Beloya
 *
 */

@ServerEndpoint(value = "/websocket/{userName}/{sessionId}/{userImg}", configurator = SpringConfigurator.class)
public class ChatServic {
	
	 private static int onlineCount = 0;
	 private  String userName;
	 private  String userImg;
	 private String sessionId;
	 private  Session session;
	 public static  ConcurrentHashMap<String,ChatServic> webSocketSet = new ConcurrentHashMap<String,ChatServic>();
	 public static Set<Integer> NameNum=new HashSet<>(50);
	 public final static String MSG_CODE="#MSG#";
	 public final static String INIT_LOAD_CODE="#ILC#";
	 public final static String NEW_LOAD_CODE="#NLC#";
	 public final static String SUB_LOAD_CODE="#SLC#";
	 public final static String FRIEND_CHAT_CODE="#FCC#";
	 public final static String SYS_MSG_CODE="#SMC#";
	 public final static String SYS_PEPOLENUM_CODE="#SPC#";
	 public final static String SYS_ERR_CODE="#SEC#";
	  public ChatServic() {
	    }
	
	  @OnOpen
	    public void onOpen(Session session,@PathParam("userName") String userName ,@PathParam("sessionId") String sessionId,@PathParam("userImg") String userImg){
		 this.sessionId=sessionId;
		 this.session=session;
		
            if(!StringUtils.isIllegalCharacter(userName.trim())&&!webSocketSet.containsKey(userName.trim())) {
	        Map<String, String> msgmap=null;
	 	   msgmap=new HashMap<String,String>(2);
	 	   msgmap.put(userName.trim(),  Base64.decodeToString(userImg));
	 	   allMessage(NEW_LOAD_CODE,msgmap);
	   init(userName.trim(), Base64.decodeToString(userImg), Base64.decodeToString(sessionId));
            }
            else {
            	myErroClose(userName.trim());
            }
         //在线数加1
	       addOnlineCount();  
	     
	        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
	     //  WeChatController.removeConditoin.signal();
	    }
	  @OnClose
	    public void onClose(Session session, CloseReason reason){
		//从set中删除
		  chatWebSocketQueSub(this.userName.trim()); 
		  Map<String, String> msgmap=null;
		   msgmap=new HashMap<String,String>(2);
		   msgmap.put(userName, userImg);
		   allMessage(SUB_LOAD_CODE,msgmap);
		   WeChatController.websocktPostion.remove(userName.trim());
	        //在线数减1
	        subOnlineCount();          
	  /*      for(ChatServic item: webSocketSet.values()){
	            try {
	            	
	                item.sendMessage(megmap.get(MSG_CODE));
	            } catch (IOException e) {
	                e.printStackTrace();
	                continue;
	            }
	        }*/
	        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
	    }
	  @OnMessage
	    public void onMessage(String message, Session session) {
	        System.out.println("来自客户端的消息:" + message);
	        Map<String, String> msgmap=messageProcess(message);
	        Map<String, String> msg=null;
	        msg=new HashMap<>();

	        if(msgmap.get(MSG_CODE)!=null) {
		        msg.put(this.userName, msgmap.get(MSG_CODE));
	        //群发消息
	        	allMessage(MSG_CODE,msg);
	        }
	    }
	  @OnError
	    public void onError(Session session, Throwable error,@PathParam("userName") String userName){
	        System.out.println("发生错误");
	    	WeChatController.websocktPostion.remove(userName);
	        error.printStackTrace();
	    }
	  
	  public void sendMessage(String message) throws IOException{
	    /*    //保存数据到数据库
	        Content content = new Content() ;
	        content.setContent(message);
	        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:dd") ;
	        content.setCreateDate(sm.format(new Date()));
	        contentService.insertSelective(content) ;*/
	       this.session.getBasicRemote().sendText(message);
	      //  this.session.getAsyncRemote().sendText(message);
	    }
	  public void myErroClose(String userName) {
		  Map<String, String> infomap=null;
		  infomap=new HashMap<>();
		  try {
			  infomap.put(SYS_ERR_CODE, "连接失败");
			  sendMessage(SYS_ERR_CODE+infomap);
				WeChatController.websocktPostion.remove(userName.trim());
			//  chatWebSocketQueSub(this.userName); 
			this.session.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	  public synchronized void init(String userName,String userImg,String sessionId) {
		  this.userName=userName.trim();
		  this.userImg=userImg;
		  this.sessionId=sessionId;
		  Map<String, String> infomap=null;
		  infomap=new HashMap<>();
		//加入set中
		chatWebSocketQueAdd(this.userName,this);    
		     for(ChatServic item: webSocketSet.values()){
		    	 infomap.put(item.getUserName(), item.getUserImg());
		        }
		      try {	
	            	this.sendMessage(INIT_LOAD_CODE+infomap);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	  }
	  
	 public Map<String,String> messageProcess(String message){
		 Map<String, String> msgmap=null;
		 String code=null;
		 msgmap=new HashMap<>(1);
		 code=message.substring(0, 5);
		 msgmap.put(code, message.substring(5));
		 return msgmap;
	 } 
	 public static void allMessage(String type,Object message) {
		 for(ChatServic item:webSocketSet.values()){
	    
	       try {
	    	   item.sendMessage(type+message);
		} catch (IOException e) {
			e.printStackTrace();
			continue;
		}
		 }
	 }
	   public static synchronized int getOnlineCount() {
	        return onlineCount;
	    }
	    public static synchronized void addOnlineCount() {
	    	ChatServic.onlineCount++;
	    }
	    public static synchronized void subOnlineCount() {
	    	ChatServic.onlineCount--;
	    }
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserImg() {
			return userImg;
		}
		public void setUserImg(String userImg) {
			this.userImg = userImg;
		}

		public static void setOnlineCount(int onlineCount) {
			ChatServic.onlineCount = onlineCount;
		}
		public  void chatWebSocketQueSub(String key) {
			webSocketSet.remove(key);
			WeChatController.websocktPostion.remove(key);
		}
		public  void chatWebSocketQueAdd(String key,ChatServic value) {
			webSocketSet.put(key, value);
			
		}
}
