package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.MessageBoardMapper;
import com.MyBlog.Service.MessageBoardService;
import com.MyBlog.entity.MessageBoard;

@Component
public class MessageBoardServiceImpl implements MessageBoardService{
@Resource
private MessageBoardMapper mbMapper;
	public List<MessageBoard> FindAll() {
		// TODO Auto-generated method stub
		return mbMapper.FindAll();
	}

	public MessageBoard FindBymbId(int mbid) {
		return mbMapper.FindBymbId(mbid);
	}

	public List<MessageBoard> FindByChild() {
		// TODO Auto-generated method stub
		return mbMapper.FindByChild();
	}

	public void Update(MessageBoard mb) {
		// TODO Auto-generated method stub
		mbMapper.Update(mb);
	}

	public int commitcount() {
		// TODO Auto-generated method stub
		return mbMapper.commitcount();
	}

	public int AddMessageBoard(MessageBoard mb) {
		// TODO Auto-generated method stub
		return mbMapper.AddMessageBoard(mb);
	}

	public void delete(int mbid) {
		// TODO Auto-generated method stub
		mbMapper.delete(mbid);
	}

}
