package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.Pager;
import com.MyBlog.entity.Archives;
import com.MyBlog.entity.archivesFlag;

public interface archivesService {
	public List<Archives> FindAll();
	public List<Archives> FindArchives(int Status,Pager pager);
	public List<Archives> FindArchives(int Status);
	public Archives FindById(int AID);
	public List<Archives> FindcategoriesList(Archives a);
	public void UpdateReadCount();
	public int Addarchives(Archives a,String Flag);
	public Archives SeeArchives(int AID);
	public void Update(Archives a);
	public void delete(int AID);
	public void Intorecovery(int AID);
}
