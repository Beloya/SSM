package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.BlogMapper;
import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;

@Service
public class blogServiceImpl implements blogService{
	
	@Resource
	private BlogMapper blogm;

	
	public Blog FindByUserName(String UserName) {
		// TODO Auto-generated method stub
		return blogm.FindByUserName(UserName);
	}

	
	public List<Blog> FindAll() {
		// TODO Auto-generated method stub
		return blogm.FindAll();
	}

	
	public Blog FindById(int ID) {
		// TODO Auto-generated method stub
		return blogm.FindById(ID);
	}

	
	public void AddBlog(Blog a) {
		// TODO Auto-generated method stub
		blogm.AddBlog(a);
	}

	
	public void delete(int ID) {
		// TODO Auto-generated method stub
		blogm.delete(ID);
	}

}
