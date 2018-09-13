package com.MyBlog.quartz;

import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.Dao.archivesMapper;
import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.entity.archives;
import com.sun.corba.se.impl.encoding.OSFCodeSetRegistry.Entry;

@Component
public class ReadCountTask {
	@Resource
	private archivesMapper amapper;
	@Scheduled(cron = " 0 0 0/2 * * ?  ")
	public void UpdateReadCount(){
		archives a=null;
		a=new archives();
		ConcurrentHashMap<Integer, Integer> readcountmap=BlogInfoSignle.blogInfoSignle.getReadcountmap();
		for (java.util.Map.Entry<Integer, Integer> e: readcountmap.entrySet()) {
			a.setAid(e.getKey());
			a.setReadcount(e.getValue());
			amapper.readCountUp(a);
		}
		LoggerUtil.INFO(getClass(), "更新阅读数");
		BlogInfoSignle.blogInfoSignle.getReadcountmap().clear();
	}
}
