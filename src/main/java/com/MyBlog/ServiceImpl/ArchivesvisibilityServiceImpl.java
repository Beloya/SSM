package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.ArchivesvisibilityMapper;
import com.MyBlog.Service.ArchivesvisibilityService;
import com.MyBlog.entity.Archivesvisibility;

@Component
public class ArchivesvisibilityServiceImpl implements ArchivesvisibilityService{

	@Resource
	private ArchivesvisibilityMapper avmapper;
	
	public List<Archivesvisibility> FindAll() {
		// TODO Auto-generated method stub
		return avmapper.FindAll();
	}

	
	public void Addarchivesvisibilit(Archivesvisibility archivesvisibility) {
		// TODO Auto-generated method stub
		avmapper.Addarchivesvisibilit(archivesvisibility);
	}

	
	public void Update(Archivesvisibility archivesvisibility) {
		// TODO Auto-generated method stub
		avmapper.Update(archivesvisibility);
	}

	
	public void delete(int ID) {
		// TODO Auto-generated method stub
		avmapper.delete(ID);
	}

}
