package com.MyBlog.quartz;

import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Service.TrainService;
import com.MyBlog.ServiceImpl.TrainServiceImpl;
import com.MyBlog.entity.trainData;

@EnableAsync
@Component
public class trainTask{
	@Autowired
	private TrainService tsi;
	  private Lock lock = null;
	  @Async
	@Scheduled(cron = " 0/3 * * * * ?  ")
	public void tryBuy(){
		
		  CopyOnWriteArraySet<Object> buyTask=TrainServiceImpl.buyTask;
			
		  for (Object object : buyTask) {
			  trainRequest t=(trainRequest) object;
			  if(t.getUserTrain().isStart()&&!t.getUserTrain().isComplete()) {
			t.processTask(t);
			
			  
			  }
		}
	
		  
	}

}
