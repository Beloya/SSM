package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.type;

public interface typeService {
	public List<type> FindAll();
	public List<type> FindById(type type);
	
	public void AddType(type type);
	public void Update(type type);
	public void delete(int tid);
}
