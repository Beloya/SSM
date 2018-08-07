package com.MyBlog.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.MyBlog.entity.Users;

@Controller
public class UserOperaController {

	  @Autowired
	    private com.MyBlog.Service.userService userService;
	  
	@RequestMapping("SignIn")
	@ResponseBody
	public Object NewSignIn(Users users,HttpServletRequest request,HttpServletResponse response){
		Map<String, String> Msg=new HashMap();
		Msg=(Map<String, String>) userService.CreateUser(users);
		return Msg;
	}
}
