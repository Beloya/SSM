package com.MyBlog.quartz;


import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.ServiceImpl.TrainBuyService;


@EnableAsync
@Component
public class trainTask{
	
	  @Async
	@Scheduled(cron = " 0/7 * 8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 * * ?  ")
	public void tryBuy(){
		
	
		
		  for (Object object :  TrainBuyService.getBuyTask()) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
				  trainRequest.p.execute(t);
			  }
			  
		}
	
		  
	}
	  
	  
	
	@Scheduled(cron = " 0/20 * 23,0,1,2,3,4,5,6,7 * * ?  ")
	public void keepConnect(){
		
	
		
		  for (Object object :  TrainBuyService.getBuyTask()) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
				  trainRequest.p.execute(t); 
			
			
			  
			  }
		}
	  }

}
