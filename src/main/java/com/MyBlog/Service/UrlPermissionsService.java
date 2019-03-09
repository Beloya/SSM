package com.MyBlog.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.MyBlog.entity.UrlPermissions;
@Service
public interface UrlPermissionsService {
	public List<UrlPermissions> FindAll();
	public UrlPermissions FindById(int upID);
	public List<UrlPermissions> FindByParam(UrlPermissions up);
	public void Update(UrlPermissions up);
	   /**
	    * 新增
	    */
	    public int insert(UrlPermissions urlPermissions);

	public void delete(int upID);
}
