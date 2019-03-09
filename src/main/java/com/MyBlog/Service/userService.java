package com.MyBlog.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.MyBlog.entity.Users;
@Service
public interface userService {
	public Users FindByUserName(String UserName);
	public Object Login(Users user,String RememberMe);
	public Object  CreateUser(Users user);
	public List<Users> FindAll();
}
