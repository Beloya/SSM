package com.MyBlog.learn;

import com.google.common.eventbus.Subscribe;

public class GuavaBeautifulGirl {
	 @Subscribe
	public void update(GuavaMyBlog g) {
		 System.out.println(g.getBlogName()+"发布了新的文章，文章名为："+g.getArticleName());
	        read(g.getArticleName());
		
	}
	 @Subscribe
	public void update( String articleName) {
		 System.out.println("发布了新的文章，文章名为："+articleName);
	        read(articleName);
		
	}

    private void read(String articleName){
        System.out.println("即将阅读 "+articleName+" 这篇文章");
    }
}
