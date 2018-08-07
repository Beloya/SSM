package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.Archivescommit;
import com.MyBlog.entity.Message;

public interface MessageMapper {
	public List<Message> FindAll();
	public Archivescommit FindByCId(int CID);
	public List<Message> FindByAIdChild(int AID);
	public void Update(Message m);
	public int commitcount(int AID);
	public int AddArchivescommit(Message m);
	public void delete(int cID);
}