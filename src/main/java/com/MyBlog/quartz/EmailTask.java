package com.MyBlog.quartz;






import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Message.QQEmail;



@Component
public class EmailTask {
	  QQEmail qqeamil=null;
	BlockingQueue<QQEmail> emailqueue;

	@Scheduled(cron = " 0/30 * * * * ?")
	public void pro() throws InterruptedException {
		  emailqueue= qqeamil.getEmailqueue();
		try {
		
		
		for(int i=0;i<emailqueue.size();i++) {
			
			qqeamil= emailqueue.poll();
			if(qqeamil!=null)
			qqeamil.SendAttMail();
		}
		}
		catch (Exception e) {
			MyLogger.error(getClass(), "邮件定时器异常", e);
		}
		finally {
			qqeamil=null;
		}
	}
}
