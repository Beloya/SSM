package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.MessageBoard;

public interface MessageBoardService {
	public List<MessageBoard> FindAll();
	public MessageBoard FindBymbId(int mbid);
	public List<MessageBoard> FindByChild();
	public void Update(MessageBoard mb);
	public int commitcount();
	public int AddMessageBoard(MessageBoard mb);
	public void delete(int mbid);
}
