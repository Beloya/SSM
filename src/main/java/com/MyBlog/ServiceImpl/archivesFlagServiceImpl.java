package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.archivesFlagMapper;
import com.MyBlog.Service.archivesFlagService;
import com.MyBlog.entity.archivesFlag;

@Service
public class archivesFlagServiceImpl implements archivesFlagService{

	@Resource
	private archivesFlagMapper afmapper;
	
	
	public List<archivesFlag> FindAll() {
		// TODO Auto-generated method stub
		return afmapper.FindAll();
	}

	
	public void AddarchivesFlag(archivesFlag archivesFlag) {
		// TODO Auto-generated method stub
		afmapper.AddarchivesFlag(archivesFlag);
	}

	
	public void Update(archivesFlag archivesFlag) {
		// TODO Auto-generated method stub
		afmapper.Update(archivesFlag);
	}

	
	public void delete(int afid) {
		// TODO Auto-generated method stub
		afmapper.delete(afid);
	}

}
