package com.MyBlog.quartz;


import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.ServiceImpl.TrainServiceImpl;


@EnableAsync
@Component
public class trainTask{
	
	  @Async
	@Scheduled(cron = " 0/5 * 8,9,10,11,12,13,14,15,16,17,18 * * ?  ")
	public void tryBuy(){
		
	
		  if(!TrainServiceImpl.buyTask.isEmpty())
		  for (Object object :  TrainServiceImpl.buyTask) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
				  TrainServiceImpl.p.execute(t);
			
			  
			  }
		}
	
		  
	}
	  
	  
	
	@Scheduled(cron = " 0/20 * 19,20,21,22,23,0,1,2,3,4,5,6,7 * * ?  ")
	public void keepConnect(){
		
	
		  if(!TrainServiceImpl.buyTask.isEmpty())
		  for (Object object :  TrainServiceImpl.buyTask) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
				  TrainServiceImpl.p.execute(t);
			
			
			  
			  }
		}
	  }

}
