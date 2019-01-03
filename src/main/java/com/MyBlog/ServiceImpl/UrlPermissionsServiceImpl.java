package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.MyBlog.Dao.UrlPermissionsMapper;
import com.MyBlog.Service.UrlPermissionsService;
import com.MyBlog.entity.UrlPermissions;

@Service
public class UrlPermissionsServiceImpl implements UrlPermissionsService{
@Resource
private UrlPermissionsMapper upMapper;
	@Override
	public List<UrlPermissions> FindAll() {
		// TODO Auto-generated method stub
		return upMapper.FindAll();
	}

	@Override
	public UrlPermissions FindById(int upID) {
		// TODO Auto-generated method stub
		return upMapper.FindById(upID);
	}

	@Override
	public List<UrlPermissions> FindByParam(UrlPermissions up) {
		// TODO Auto-generated method stub
		return upMapper.FindByParam(up);
	}

	@Override
	public void Update(UrlPermissions up) {
		// TODO Auto-generated method stub
		upMapper.Update(up);
	}

	@Override
	public int insert(UrlPermissions urlPermissions) {
		// TODO Auto-generated method stub
		return upMapper.insert(urlPermissions);
	}

	@Override
	public void delete(int upID) {
		// TODO Auto-generated method stub
		upMapper.delete(upID);
	}

}
