package com.MyBlog.quartz;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import com.MyBlog.Service.archivesService;


@Component
public class ReadCountTask {
	@Autowired
	private archivesService as;
	@Scheduled(cron = " 0 0 0/1 * * ?  ")
	public void UpdateReadCount(){
	as.UpdateReadCount();
	}
}
