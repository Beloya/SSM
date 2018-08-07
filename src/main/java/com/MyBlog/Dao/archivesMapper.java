package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.archives;

public interface archivesMapper {

	public List<archives> FindByStatus(int Status);
	public List<archives> FindAll();
	public archives FindById(int AID);
	public List<archives> FindByParam(archives a);
	public void readCountUp(archives a);
	public void Update(archives a);
	public int Addarchives(archives a);
	public void delete(int AID);
}
