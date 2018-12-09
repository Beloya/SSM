package com.MyBlog.quartz;






import java.util.concurrent.BlockingQueue;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Message.QQEmail;


@EnableAsync
@Component
public class EmailTask {
	  @Async
	@Scheduled(cron = " 0/30 * * * * ?")
	public void pro() throws InterruptedException {
		try {
		QQEmail qqeamil=new QQEmail();
		BlockingQueue<QQEmail> emailqueue=null;
		emailqueue=qqeamil.getEmailqueue();
		for(int i=0;i<emailqueue.size();i++) {
			
			qqeamil= emailqueue.take();
			qqeamil.SendAttMail();
		}
		}
		catch (Exception e) {
			MyLogger.error(getClass(), "邮件定时器异常", e);
		}
	}
}
