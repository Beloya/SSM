package com.MyBlog.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.MyBlog.entity.Archivescommit;
@Service
public interface archivescommitService {
	public List<Archivescommit> FindAll();
	public List<Archivescommit> FindByAId(int AID);
	public List<Archivescommit> FindByAIdChild(int AID);
	public Archivescommit FindByCId(int CID);
	public int commitcount(int AID);
	public void Update(Archivescommit a);
	public int Archivescommit(Archivescommit a);
	public void delete(int cID);
}
