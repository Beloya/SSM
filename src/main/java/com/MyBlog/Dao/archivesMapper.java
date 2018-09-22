package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.Archives;

public interface archivesMapper {

	public List<Archives> FindByStatus(int Status);
	public List<Archives> FindAll();
	public Archives FindById(int AID);
	public List<Archives> FindByParam(Archives a);
	public void readCountUp(Archives a);
	public void Update(Archives a);
	public int Addarchives(Archives a);
	public void delete(int AID);
}
