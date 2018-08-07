package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.MessageBoard;


public interface MessageBoardMapper {
	public List<MessageBoard> FindAll();
	public MessageBoard FindBymbId(int mbid);
	public List<MessageBoard> FindByChild();
	public void Update(MessageBoard mb);
	public int commitcount();
	public int AddMessageBoard(MessageBoard mb);
	public void delete(int mbid);
}
