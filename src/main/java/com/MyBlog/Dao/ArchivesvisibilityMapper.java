package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.Archivesvisibility;


public interface ArchivesvisibilityMapper {
	public List<Archivesvisibility> FindAll();
	public void Addarchivesvisibilit(Archivesvisibility archivesvisibility);
	public void Update(Archivesvisibility archivesvisibility);
	public void delete(int ID);
}
