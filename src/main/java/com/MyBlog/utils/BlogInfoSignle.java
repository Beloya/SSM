package com.MyBlog.utils;

import java.text.DateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;

public enum  BlogInfoSignle {
blogInfoSignle;
private  Blog blog;

private BlogInfoSignle(){

}
public Blog getblog(){

	return blog;
}
public Blog getBlog() {
	return blog;
}
public void setBlog(Blog blog) {
	this.blog = blog;
}


}
