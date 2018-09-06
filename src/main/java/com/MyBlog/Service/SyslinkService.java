package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.Syslink;

public interface SyslinkService {
	public List<Syslink> FindAll();
	public List<Syslink> FindBase();
	public void Addsyslink(Syslink syslink);
	public void Update(Syslink syslink);
	public void delete(int MENU_ID);
}
