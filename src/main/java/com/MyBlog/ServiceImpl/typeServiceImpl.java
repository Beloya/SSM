package com.MyBlog.ServiceImpl;


import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.MyBlog.Dao.typeMapper;
import com.MyBlog.Service.typeService;
import com.MyBlog.entity.type;

@Component
public class typeServiceImpl implements typeService{

	@Resource
	private typeMapper tymapper;
	
	public List<type> FindAll() {
		// TODO Auto-generated method stub
		return tymapper.FindAll();
	}



	public void Update(type type) {
		// TODO Auto-generated method stub
		tymapper.Update(type);	
	
	}

	public void delete(int tid) {
		// TODO Auto-generated method stub
		tymapper.delete(tid);
	}



	public void AddType(type type) {
		// TODO Auto-generated method stub
		tymapper.AddType(type);
	}



	public List<type> FindById(type type) {
		
		return tymapper.FindParam(type);
	}

}
