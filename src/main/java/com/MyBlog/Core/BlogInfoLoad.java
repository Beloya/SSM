package com.MyBlog.Core;

import java.util.Calendar;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.MyBlog.Dao.archivesMapper;
import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Message.QQEmail;
import com.MyBlog.Service.SyslinkService;
import com.MyBlog.Service.UrlPermissionsService;
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.ServiceImpl.TrainServiceImpl;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Syslink;
import com.MyBlog.entity.Archives;
import com.MyBlog.quartz.ReadCountTask;

@Component
public class BlogInfoLoad  implements ApplicationListener<ContextRefreshedEvent>,DisposableBean{

	 @Autowired
	private blogService blogService;
	@Autowired
	private SyslinkService syslinkservice;
	@Autowired
	private archivesService as;
	@Autowired
	private UrlPermissionsService upService;
	public  void BlogInfoInit() {
		Blog blog=null;
		List<Syslink> syslinks=null;
   			boolean	inited=false;
   			inited=BlogInfoSignle.blogInfoSignle.isInited();
   	 if(!inited){
   		
   		 blog= blogService.FindByUserName("Beloya");
   		 syslinks=syslinkservice.FindBase();
   		 BlogInfoSignle.blogInfoSignle.init(blog, syslinks); 	
   		 MyLogger.INFO(BlogInfoLoad.class, "初始化信息完成");
   	 }
	}

	
	public  void BlogInfoInit( HttpServletRequest request ) {
		Blog blog=null;
		List<Syslink> syslinks=null;
   			boolean	inited=false;
   			inited=BlogInfoSignle.blogInfoSignle.isInited();
   	 if(!inited){
   		 MyLogger.INFO(BlogInfoLoad.class, "初始化信息完成");
   		 blog= blogService.FindByUserName("Beloya");
   		 syslinks=syslinkservice.FindBase();
   		 BlogInfoSignle.blogInfoSignle.init(blog, syslinks); 
   		 request.getServletContext().setAttribute("BlogInfo", BlogInfoSignle.blogInfoSignle.getBlog());
		 request.getServletContext().setAttribute("MenuLink",  BlogInfoSignle.blogInfoSignle.getMenulink());
		 request.getServletContext().setAttribute("CommunionLink",  BlogInfoSignle.blogInfoSignle.getCommunionlink());
		 request.getServletContext().setAttribute("FoundLink",  BlogInfoSignle.blogInfoSignle.getFoundlink());
	
   	 }
	}
	
	
	public void urlFilterLoad() {
		
	}
	public void onApplicationEvent(ContextRefreshedEvent event) {
		BlogInfoInit();
	}
	public void destroy() throws Exception {
		QQEmail qqeamil=new QQEmail();
		BlockingQueue<QQEmail> emailqueue=qqeamil.getEmailqueue();
		 for (Object object :  TrainServiceImpl.buyTask) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
				  TrainServiceImpl.faileAndStopBuyTask(t,"服务重启中，任务已重置");
				
			  }
		}
		 TrainServiceImpl.p.shutdown();
		for(int i=0;i<emailqueue.size();i++) {
			
			qqeamil= emailqueue.take();
			qqeamil.SendAttMail();
		}
		
		as.UpdateReadCount();
		
	}

	
}
