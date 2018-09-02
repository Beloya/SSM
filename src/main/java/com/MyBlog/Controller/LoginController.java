package com.MyBlog.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MyBlog.entity.Users;

@Controller

public class LoginController {
	  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	  
	
	  @Autowired
	    private com.MyBlog.Service.userService userService;
	  
	  @RequestMapping("/SignOut")
	  @ResponseBody
	    public Object  login(Users user,String RememberMe,HttpServletResponse response,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException{
		  Map<String, String> LoginMsg=new HashMap();
		  SavedRequest savedRequest=WebUtils.getSavedRequest(request);
		  if(null!=savedRequest){
			    System.out.println("登录之前的路径是"+savedRequest.getRequestUrl());
			    LoginMsg.put("preUrl", savedRequest.getRequestUrl());
			}
		  LoginMsg=(Map<String, String>) userService.Login(user, RememberMe);
		  
	      return LoginMsg;
	     
	    }
	  
	  @RequestMapping("/LogOut")
	  @ResponseBody
	  public Object LoginOut() {
		  ObjectMapper mapper = new ObjectMapper();
		  Map<String, String> LoginOutMsg=new HashMap();
		  Subject subject = SecurityUtils.getSubject(); 
		  subject.logout();
		  LoginOutMsg.put("code", "0");
		  LoginOutMsg.put("Msg", "成功退出");
		  return LoginOutMsg;
	  }
	  
	  @RequestMapping("QuickLogin")
	  @ResponseBody
	  public Object QuickLogin(HttpServletRequest request) {
			 ObjectMapper mapper = new ObjectMapper();
			  Map<String, String> QuickLoginMsg=new HashMap();
			  Subject subject = SecurityUtils.getSubject(); 
			  HttpSession session=request.getSession();
			  if(subject.isRemembered()&&!subject.isAuthenticated()&&session.getAttribute("user")==null){
				Object Principal=  subject.getPrincipal();
				if(Principal!=null) {
					Users Principaluser=(Users) Principal;
					String userName=Principaluser.getUserName();
					Users user=userService.FindByUserName(userName);
					 UsernamePasswordToken usernamePasswordToken = new 
				                UsernamePasswordToken(user.getUserName(),user.getPassWord());
				 usernamePasswordToken.setRememberMe(true);       	
	           subject.login(usernamePasswordToken);
					session.setAttribute("user", user);
					QuickLoginMsg.put("code", "0");
					QuickLoginMsg.put("Msg", "登录成功");
				}
				else {
					QuickLoginMsg.put("code", "1");
					QuickLoginMsg.put("Msg", "快速登录已失效");
				}
			  }else {
					QuickLoginMsg.put("code", "1");
					QuickLoginMsg.put("Msg", "快速登录已失效");
				}
	  return QuickLoginMsg;
	  }
	  
	  
	  

	  
}
