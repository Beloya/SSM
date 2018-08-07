package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.Blog;

public interface blogService {
	public Blog FindByUserName(String UserName);
	public List<Blog> FindAll();
	public Blog FindById(int ID);
	public void AddBlog(Blog a);
	public void delete(int ID);
}
