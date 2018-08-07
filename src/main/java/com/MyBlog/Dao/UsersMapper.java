package com.MyBlog.Dao;

import java.util.List;



import com.MyBlog.entity.Users;

public interface UsersMapper {
public Users FindByUserName(String UserName);
public List<Users> FindAll();
public void  CreateUser(Users user);
public void delete(int Id);
}
