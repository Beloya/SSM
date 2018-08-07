package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.archives;
import com.MyBlog.entity.archivesFlag;

public interface archivesService {
	public List<archives> FindAll();
	public List<archives> FindArchives(int Status);
	public archives FindById(int AID);
	public List<archives> FindcategoriesList(archives a);
	public int Addarchives(archives a,String Flag);
	public archives SeeArchives(int AID);
	public void Update(archives a);
	public void delete(int AID);
	public void Intorecovery(int AID);
}
