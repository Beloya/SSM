package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.MyBlog.Dao.SyslinkMapper;
import com.MyBlog.Service.SyslinkService;
import com.MyBlog.entity.Syslink;
@Service
public class SyslinkServiceImpl implements SyslinkService{

	@Resource
	private SyslinkMapper syslinkmapper;
	@Override
	public List<Syslink> FindAll() {
		// TODO Auto-generated method stub
		return syslinkmapper.FindAll();
	}

	@Override
	public void Addsyslink(Syslink syslink) {
		// TODO Auto-generated method stub
		syslinkmapper.Addsyslink(syslink);
	}

	@Override
	public void Update(Syslink syslink) {
		// TODO Auto-generated method stub
		syslinkmapper.Update(syslink);
	}

	@Override
	public void delete(int MENU_ID) {
		// TODO Auto-generated method stub
		syslinkmapper.delete(MENU_ID);
	}

	@Override
	public List<Syslink> FindMenuBase() {
		// TODO Auto-generated method stub
		return syslinkmapper.FindMenuBase();
	}

}
