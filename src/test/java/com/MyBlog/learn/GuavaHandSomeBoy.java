package com.MyBlog.learn;

import com.google.common.eventbus.Subscribe;

public class GuavaHandSomeBoy {
	 @Subscribe
	public void update(GuavaMyBlog g) {
		 System.out.println(g.getBlogName()+"发布了新的文章，文章名为："+g.getArticleName());
	    
		
	}
	 //可以注解多个，会根据形参类型来决定执行哪一个
	 @Subscribe
	public void update(String articleName) {
		 System.out.println("发布了新的文章，文章名为："+articleName);
		
	}
  
}
