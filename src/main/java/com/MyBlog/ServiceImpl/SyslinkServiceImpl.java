package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.MyBlog.Dao.SyslinkMapper;
import com.MyBlog.Service.SyslinkService;
import com.MyBlog.entity.Syslink;
@Component
public class SyslinkServiceImpl implements SyslinkService{

	@Resource
	private SyslinkMapper syslinkmapper;
	public List<Syslink> FindAll() {
		// TODO Auto-generated method stub
		return syslinkmapper.FindAll();
	}

	public void Addsyslink(Syslink syslink) {
		// TODO Auto-generated method stub
		syslinkmapper.Addsyslink(syslink);
	}

	public void Update(Syslink syslink) {
		// TODO Auto-generated method stub
		syslinkmapper.Update(syslink);
	}

	public void delete(int MENU_ID) {
		// TODO Auto-generated method stub
		syslinkmapper.delete(MENU_ID);
	}

	public List<Syslink> FindBase() {
		// TODO Auto-generated method stub
		return syslinkmapper.FindMenuBase();
	}

}
