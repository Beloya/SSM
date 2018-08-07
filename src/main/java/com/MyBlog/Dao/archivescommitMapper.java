package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.Archivescommit;


public interface archivescommitMapper {
	public List<Archivescommit> FindAll();
	public List<Archivescommit> FindByAId(int AID);
	public Archivescommit FindByCId(int CID);
	public List<Archivescommit> FindByAIdChild(int AID);
	public void Update(Archivescommit a);
	public int commitcount(int AID);
	public int AddArchivescommit(Archivescommit a);
	public void delete(int cID);
}
