package com.MyBlog.quartz;

import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.ServiceImpl.TrainServiceImpl;


@EnableAsync
@Component
public class trainTask{
	private ExecutorService p=Executors.newFixedThreadPool(20);
	  @Async
	@Scheduled(cron = " 0/3 * 8,9,10,11,12,13,14,15,16,17,18 * * ?  ")
	public void tryBuy(){
		
	
			
		  for (Object object :  TrainServiceImpl.buyTask) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
				  p.execute(t);
			
			
			  
			  }
		}
	
		  
	}

}
