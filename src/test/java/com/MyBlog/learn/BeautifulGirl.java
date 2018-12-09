package com.MyBlog.learn;

public class BeautifulGirl implements Observer{

	@Override
	public void update(String blogName, String articleName) {
		 System.out.println(blogName+"发布了新的文章，文章名为："+articleName);
	}
}
