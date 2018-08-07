package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.archivesFlag;

public interface archivesFlagMapper {
public List<archivesFlag> FindAll();
public void AddarchivesFlag(archivesFlag archivesFlag);
public void Update(archivesFlag archivesFlag);
public void delete(int afid);
}
