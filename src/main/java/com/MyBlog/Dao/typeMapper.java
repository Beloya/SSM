package com.MyBlog.Dao;

import java.util.List;


import com.MyBlog.entity.type;

public interface typeMapper {
	public List<type> FindAll();
	public List<type> FindParam(type type);
	public void AddType(type type);
	public void Update(type type);
	public void delete(int tid);
}
