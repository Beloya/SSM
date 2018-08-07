package com.MyBlog.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.archivescommitMapper;
import com.MyBlog.Service.archivescommitService;
import com.MyBlog.entity.Archivescommit;
@Service
public class archivescommitServiceImpl implements archivescommitService{

	@Resource
	private archivescommitMapper acmapper;
	
	public List<com.MyBlog.entity.Archivescommit> FindAll() {
		// TODO Auto-generated method stub
		return acmapper.FindAll();
	}

	
	public List<Archivescommit> FindByAId(int AID) {
		// TODO Auto-generated method stub
		return acmapper.FindByAId(AID);
	}


	
	public void Update(com.MyBlog.entity.Archivescommit a) {
		// TODO Auto-generated method stub
		acmapper.Update(a);
	}

	
	public int Archivescommit(com.MyBlog.entity.Archivescommit a) {
		// TODO Auto-generated method stub
		return acmapper.AddArchivescommit(a);
	}

	
	public void delete(int cID) {
		// TODO Auto-generated method stub
		acmapper.delete(cID);
	}

	
	public List<com.MyBlog.entity.Archivescommit> FindByAIdChild(int AID) {
		// TODO Auto-generated method stub
		return acmapper.FindByAIdChild(AID);
	}

	
	public int commitcount(int AID) {
		// TODO Auto-generated method stub
		return acmapper.commitcount(AID);
	}

	
	public com.MyBlog.entity.Archivescommit FindByCId(int CID) {
		// TODO Auto-generated method stub
		return acmapper.FindByCId(CID);
	}

}
