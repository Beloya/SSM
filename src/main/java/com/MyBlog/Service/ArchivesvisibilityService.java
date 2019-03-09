package com.MyBlog.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.MyBlog.entity.Archivesvisibility;
@Service
public interface ArchivesvisibilityService {
	public List<Archivesvisibility> FindAll();
	public void Addarchivesvisibilit(Archivesvisibility archivesvisibility);
	public void Update(Archivesvisibility archivesvisibility);
	public void delete(int ID);
}
