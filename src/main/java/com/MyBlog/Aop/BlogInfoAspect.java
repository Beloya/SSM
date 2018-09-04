package com.MyBlog.Aop;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.MyBlog.Base.EmailUtil;
import com.MyBlog.Base.EmailUtilFactory;
import com.MyBlog.Service.SyslinkService;
import com.MyBlog.Service.blogService;
import com.MyBlog.Shiro.Session.ShiroSession;
import com.MyBlog.Shiro.Session.redisSessionService;
import com.MyBlog.entity.Archivescommit;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Email;
import com.MyBlog.entity.MessageBoard;
import com.MyBlog.entity.Syslink;
import com.MyBlog.utils.BlogInfoSignle;
import com.MyBlog.utils.QQEmail;
import com.MyBlog.utils.QQEmailUtilFactory;

@Aspect
@Component
public class BlogInfoAspect {
	 @Autowired
	private blogService blogService;
	@Autowired
	private SyslinkService syslinkservice;

	    //定义切入点，提供一个方法，这个方法的名字就是改切入点的id  
	    @Pointcut("execution(* com.MyBlog.Controller.*.*(..))")  
	    private void allMethod(){}  
	    //针对指定的切入点表达式选择的切入点应用前置通知  
	    @Before("execution(* com.MyBlog.Controller.*.*(..))")    
	    public void before(JoinPoint call) {  
	    	Blog blog=null;
	    	List<Syslink> syslinks=null;
	     	 HttpServletRequest request =null;
	    			boolean	inited=false;
	    			inited=BlogInfoSignle.blogInfoSignle.isInited();
	    	 Calendar calendar=Calendar.getInstance();
	
	    	 if(!inited){
	    		 request=((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	    		 blog= blogService.FindByUserName("Beloya");
	    		 syslinks=syslinkservice.FindMenuBase();
	    		 BlogInfoSignle.blogInfoSignle.init(blog, syslinks);
	    		 
	    		 request.getServletContext().setAttribute("BlogInfo", blog);
	    		 request.getServletContext().setAttribute("MenuLink",  BlogInfoSignle.blogInfoSignle.getMenulink());
	    		 request.getServletContext().setAttribute("CommunionLink",  BlogInfoSignle.blogInfoSignle.getCommunionlink());
	    		 request.getServletContext().setAttribute("FoundLink",  BlogInfoSignle.blogInfoSignle.getFoundlink());
	    		 request.getServletContext().setAttribute("Calendar",calendar);
	    	 }
	      /* String className = call.getTarget().getClass().getName();
	        String methodName = call.getSignature().getName();
	        System.out.println("开始执行:"+className+"."+methodName+"()方法...");*/
	    }  
	    //访问命名切入点来应用后置通知  
	 //  @AfterReturning("execution(* com.MyBlog.Controller.*.New*(..))")  
	    public void afterReturn(JoinPoint call) {  
	    
	    	
		   HttpServletRequest request1 = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		   String className = call.getTarget().getClass().getName();
	        String methodName = call.getSignature().getName();
	        StringBuilder html = new StringBuilder();

	      
		   EmailUtilFactory eFactory=new QQEmailUtilFactory();
		   Email email=new Email();
		   email.setEmail("468501955@qq.com");
		   email.setPassword("bygjtnfrokbbbgdg");
		   email.setHost("smtp.qq.com");
		   email.setPort(465);
		   email.setSubject("博客有人类来啦");
		  if(methodName.indexOf("archivesCommit")!=-1){
			  html.append("<html>")
		    	.append("<body>")
		    	.append("<h2>有人在你的博客留言啦ლ(′◉❥◉｀ლ)</h2>")
		    	.append("<p>想要了解更多点击下面链接</p>")
		    	.append("<a href='"+request1+"'>"+request1.getRequestURL()+"</a>")
		    	.append("<p>♪(^∇^*)</p>")
			    .append("</body>")
			    .append("</html>");
		   email.setText(html.toString());
		  }
		  else{
			  email.setText("有人在你的博客留下了印记");
		  }
		   email.setSenddate(new Date());
		   email.setTomail("468501955@qq.com");
		   
		  EmailUtil emailUtil=eFactory.CreateEmail();
		  
		  emailUtil.SendAttMail(email);
		  System.out.println("@Before：参数为：" + Arrays.toString(call.getArgs()));
	        System.out.println(className+"."+methodName+"()方法正常执行结束...");
	    }  
	    //应用最终通知  
	   @After("execution(* com.MyBlog.Controller.*.New*(..))")  
	    public void after(JoinPoint call) {  
			long start=System.currentTimeMillis();
		
		   HttpServletRequest request1 = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	        String className = call.getTarget().getClass().getName();
	        String methodName = call.getSignature().getName();
	        StringBuilder html = new StringBuilder();
	  	  Archivescommit archivescommit = null;
	  	MessageBoard messageboard=null;
		   EmailUtilFactory eFactory=new QQEmailUtilFactory();
		   Email email=new Email();
		   email.setEmail("468501955@qq.com");
		   email.setPassword("bygjtnfrokbbbgdg");
		   email.setHost("smtp.qq.com");
		   email.setPort(465);
		   email.setSubject("博客有人类来啦");
			  Object[] cObjects=call.getArgs();
			if(methodName.equals("NewarchivesCommit")) {
				archivescommit=  (Archivescommit) cObjects[0];
				 html.append("有人给你评论了");
				  html.append(request1.getHeader("Refer")+"/archives/"+archivescommit.getAid()+"_1'");
			}
			else if(methodName.equals("NewSay")) {
				messageboard=  (MessageBoard) cObjects[0];
				 html.append("有人给你留言了");
				  html.append(request1.getHeader("Refer")+"/hall/");
			}
		  else{
			  html.append("有人在你的博客留下了印记");
			
		  }
			  email.setText(html.toString());
		   email.setSenddate(new Date());
		   email.setTomail("468501955@qq.com");
		   
		  EmailUtil emailUtil=eFactory.CreateEmail();
		 
		  emailUtil.SendAttMail(email);
	        System.out.println(className+"."+methodName+"()最终执行步骤(finally)...");
	    	long end=System.currentTimeMillis();
	    	
	    }  
	    //应用异常抛出后通知  
	   @AfterThrowing("execution(* com.MyBlog.Controller.*.*(..))")  
	    public void afterThrowing(JoinPoint call) {  
		   
	        String className = call.getTarget().getClass().getName();

	        String methodName = call.getSignature().getName();
	        StringBuilder html = new StringBuilder();
			   EmailUtilFactory eFactory=new QQEmailUtilFactory();
			   Email email=new Email();
			   email.setEmail("468501955@qq.com");
			   email.setPassword("bygjtnfrokbbbgdg");
			   email.setHost("smtp.qq.com");
			   email.setPort(465);
			   email.setSubject("系统发生异常，请检查");
					 html.append(className+"."+methodName+"()方法抛出了异常...");
				  email.setText(html.toString());
			   email.setSenddate(new Date());
			   email.setTomail("468501955@qq.com");
			  EmailUtil emailUtil=eFactory.CreateEmail();	  
			  emailUtil.SendAttMail(email);
	        System.out.println(className+"."+methodName+"()方法抛出了异常...");
	    }  
	    //应用周围通知  
	    //@Around("allMethod()")  
	    public Object doAround(ProceedingJoinPoint call) throws Throwable{  
	        Object result = null;  
	        this.before(call);//相当于前置通知  
	        try {  
	            result = call.proceed();  
	            this.afterReturn(call); //相当于后置通知  
	        } catch (Throwable e) {  
	            this.afterThrowing(call);  //相当于异常抛出后通知  
	            throw e;  
	        }finally{  
	            this.after(call);  //相当于最终通知  
	        }  
	        return result;  
	    }  
}
