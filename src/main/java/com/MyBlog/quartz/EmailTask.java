package com.MyBlog.quartz;






import java.util.concurrent.BlockingQueue;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.MyBlog.Message.QQEmail;



@Component
public class EmailTask {

	@Scheduled(cron = " 0/30 * * * * ?")
	public void pro() throws InterruptedException {
		QQEmail qqeamil=new QQEmail();
		BlockingQueue<QQEmail> emailqueue=null;
		emailqueue=qqeamil.getEmailqueue();
		for(int i=0;i<emailqueue.size();i++) {
			
			qqeamil= emailqueue.take();
			qqeamil.SendAttMail();
		}
	}
}
