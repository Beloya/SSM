package com.MyBlog.Service;

import java.util.List;

import com.MyBlog.entity.Flag;

public interface FlagService {

		public List<Flag> FindAll();
		public void AddFlag(Flag flag);
		public void Update(Flag flag);
		public void delete(int fid);
}
