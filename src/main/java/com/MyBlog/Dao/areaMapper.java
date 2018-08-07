package com.MyBlog.Dao;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;

import com.MyBlog.entity.area;


public interface areaMapper {
public List<area> findsf();
public List<area> findcity(int codeid);
public area findByid(int codeid);
public area findBycityName(String cityName);
public void Add(area area);
public void del(int codeid);
public void Update(area area);
}
