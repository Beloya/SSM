package com.MyBlog.ServiceImpl;

import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.Service.SyslinkService;
import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Syslink;

@Component
public class BlogInfoLoad  implements ApplicationListener<ContextRefreshedEvent>{

	 @Autowired
	private blogService blogService;
	@Autowired
	private SyslinkService syslinkservice;

	private void BlogInfoInit() {
		Blog blog=null;
		List<Syslink> syslinks=null;
   			boolean	inited=false;
   			inited=BlogInfoSignle.blogInfoSignle.isInited();
   	 if(!inited){
   		 LoggerUtil.INFO(BlogInfoLoad.class, "初始化信息完成");
   		 blog= blogService.FindByUserName("Beloya");
   		 syslinks=syslinkservice.FindBase();
   		 BlogInfoSignle.blogInfoSignle.init(blog, syslinks); 	
   	 }
	}

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		BlogInfoInit();
	}

	
}
