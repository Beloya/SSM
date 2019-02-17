package com.MyBlog.Socket;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;


import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


import org.apache.shiro.codec.Base64;

import org.springframework.web.socket.server.standard.SpringConfigurator;

import com.MyBlog.Controller.WeChatController;

import com.MyBlog.utils.myStringUtils;



/**
 * 
 * @author Beloya
 *
 */
//该注解用来指定一个URI，客户端可以通过这个URI来连接到WebSocket。
/**
类似Servlet的注解mapping。无需在web.xml中配置。
* configurator = SpringConfigurator.class是为了使该类可以通过Spring注入。
*/
@ServerEndpoint(value = "/websocket/{userName}/{sessionId}/{userImg}", configurator = SpringConfigurator.class)
public class ChatServic {
	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	 private static int onlineCount = 0;
	 private  String userName;
	 private  String userImg;
	 private String sessionId;
	 //与客户端的连接会话，需要通过它来给客户端发送数据
	 private  Session session;
	 //concurrent包的线程安全Map，用来存放每个客户端对应的MyWebSocket对象。
	    // 若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
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
	  /**
	     * 连接建立成功调用的方法
	     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	     */
	  @OnOpen
	    public void onOpen(Session session,@PathParam("userName") String userName ,@PathParam("sessionId") String sessionId,@PathParam("userImg") String userImg){
		 this.sessionId=sessionId;
		 this.session=session;
		
            if(!myStringUtils.isIllegalCharacter(userName.trim())&&!webSocketSet.containsKey(userName.trim())) {
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
	   /**
	     * 连接关闭调用的方法
	     */
	  @OnClose
	    public void onClose(Session session, CloseReason reason){
		//从set中删除
		  chatWebSocketQueSub(this.userName.trim()); 
		  Map<String, String> msgmap=new HashMap<String,String>(2);
		   msgmap.put(userName, userImg);
		   allMessage(SUB_LOAD_CODE,msgmap);
		   WeChatController.websocktPostion.remove(this.userName.trim());
	        //在线数减1
	        subOnlineCount();          
	
	        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
	    }
	  /**
	     * 收到客户端消息后调用的方法
	     * @param message 客户端发送过来的消息
	     * @param session 可选的参数
	     */
	  @OnMessage
	    public void onMessage(String message, Session session) {
	        System.out.println("来自客户端的消息:" + message);
	        Map<String, String> msgmap=messageProcess(message);
	        Map<String, String> msg=new HashMap<>();

	        if(msgmap.get(MSG_CODE)!=null) {
		        msg.put(this.userName, msgmap.get(MSG_CODE));
	        //群发消息
	        	allMessage(MSG_CODE,msg);
	        }
	    }
	   /**
	     * 发生错误时调用
	     * @param session
	     * @param error
	     */
	  @OnError
	    public void onError(Session session, Throwable error,@PathParam("userName") String userName){
	        System.out.println("发生错误");
	    	WeChatController.websocktPostion.remove(userName.trim());
	        error.printStackTrace();
	    }
	  /**
	     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	     * @param message
	     * @throws IOException
	     */
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
	  /**
	     * 自定义错误方法
	     * @param userName
	     * @throws IOException
	     */
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
	  /**
	     * 自定义初始化方法
	     * @param userName
	     * @param userImg
	     * @param sessionId
	     * @throws IOException
	     */
	  public  void init(String userName,String userImg,String sessionId) {
		  this.userName=userName.trim();
		  this.userImg=userImg;
		  this.sessionId=sessionId;
		  Map<String, String> infomap=new HashMap<>();
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
	  /**
	     * 自定义消息处理方法
	     * @param message
	     * @throws IOException
	     */
	 public Map<String,String> messageProcess(String message){
		 Map<String, String> msgmap=new HashMap<>(1);
		 String code=message.substring(0, 5);
		 msgmap.put(code, message.substring(5));
		 return msgmap;
	 } 
	 /**
	  *  群发消息
	  * @param type
	  * @param message
	  */
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
