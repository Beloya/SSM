package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.FlagMapper;
import com.MyBlog.Service.FlagService;
import com.MyBlog.entity.Flag;

@Component
public class FlagServiceImpl implements FlagService{

	@Resource
	private FlagMapper fmapper;
	
	
	public List<Flag> FindAll() {
		// TODO Auto-generated method stub
		return fmapper.FindAll();
	}

	
	public void AddFlag(Flag flag) {
		// TODO Auto-generated method stub
		fmapper.AddFlag(flag);
	}

	
	public void Update(Flag flag) {
		// TODO Auto-generated method stub
		fmapper.Update(flag);
	}

	
	public void delete(int fid) {
		// TODO Auto-generated method stub
		fmapper.delete(fid);
	}

}
