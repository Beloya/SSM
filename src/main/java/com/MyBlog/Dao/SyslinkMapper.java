package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.Syslink;


public interface SyslinkMapper {
	public List<Syslink> FindAll();
	public List<Syslink> FindMenuBase();
	public void Addsyslink(Syslink syslink);
	public void Update(Syslink syslink);
	public void delete(int MENU_ID);
}
