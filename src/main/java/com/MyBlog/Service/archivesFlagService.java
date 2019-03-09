package com.MyBlog.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.MyBlog.entity.archivesFlag;
@Service
public interface archivesFlagService {
	public List<archivesFlag> FindAll();
	public void AddarchivesFlag(archivesFlag archivesFlag);
	public void Update(archivesFlag archivesFlag);
	public void delete(int afid);
}
