package com.MyBlog.quartz;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Service.archivesService;


@Component
public class ReadCountTask {
	@Autowired
	private archivesService as;
	 
	@Scheduled(cron = " 0 0 0/1 * * ?  ")
	public void UpdateReadCount(){
		try {
	as.UpdateReadCount();
		}
		catch (Exception e) {
			MyLogger.error(getClass(), "更新阅读数量定时器异常",e);
		}
	}
}
