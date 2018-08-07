package com.MyBlog.Dao;

import java.util.List;

import com.MyBlog.entity.Flag;

public interface FlagMapper {
public List<Flag> FindAll();
public void AddFlag(Flag flag);
public void Update(Flag flag);
public void delete(int fid);
}
