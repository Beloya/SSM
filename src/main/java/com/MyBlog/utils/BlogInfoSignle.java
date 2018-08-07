package com.MyBlog.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;

public enum  BlogInfoSignle {
blogInfoSignle;
private Blog blog;
private HttpServletRequest request;
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
public HttpServletRequest getRequest() {
	return request;
}
public void setRequest(HttpServletRequest request) {
	this.request = request;
}

}
