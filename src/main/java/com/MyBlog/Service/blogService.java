package com.MyBlog.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.MyBlog.entity.Blog;
@Service
public interface blogService {
	public Blog FindByUserName(String UserName);
	public List<Blog> FindAll();
	public Blog FindById(int ID);
	public void AddBlog(Blog a);
	public void delete(int ID);
}
