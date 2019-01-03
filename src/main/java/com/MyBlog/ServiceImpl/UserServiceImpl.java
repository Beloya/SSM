package com.MyBlog.ServiceImpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.MyBlog.Dao.UsersMapper;
import com.MyBlog.Service.userService;
import com.MyBlog.entity.Users;
import com.MyBlog.utils.StringUtils;
import com.github.pagehelper.util.StringUtil;

@Service
public class UserServiceImpl implements userService{
	@Resource
	private UsersMapper uMapper;
	public Users createUser(Users user) {
	    //加密密码
	  //  passwordHelper.encryptPassword(user);
	    return user;
	}
	public void changePassword(Long userId, String newPassword) {
	    
	}
	
	public Users FindByUserName(String UserName) {
		// TODO Auto-generated method stub
		return uMapper.FindByUserName(UserName);
	}
	
	public List<Users> FindAll() {
		// TODO Auto-generated method stub
		return uMapper.FindAll();
	}
	
	public Object Login(Users user, String RememberMe) {
		 Map<String, String> LoginMsg=null;
		  Subject subject = null;
		  String passWordmd5=null;
		    UsernamePasswordToken usernamePasswordToken=null;
	        try {
	        	  LoginMsg=new HashMap<String, String>();
	   	     subject = SecurityUtils.getSubject();   
     
	   	   	 passWordmd5 = new Md5Hash(user.getPassWord()).toString();//加密
	   	      usernamePasswordToken = new     UsernamePasswordToken(user.getUserName(),passWordmd5);
	        	if(RememberMe.equals("on")) {
	        	usernamePasswordToken.setRememberMe(true);
	        	}
	            subject.login(usernamePasswordToken);
	            LoginMsg.put("code","0");
	            LoginMsg.put("msg","登陆成功");
	       
	        } 
	        catch(UnknownAccountException e){
	        	 LoginMsg.put("code","1");
		            LoginMsg.put("msg","账号或密码错误");
	        }
	        catch(IncorrectCredentialsException e){
	
	        	 LoginMsg.put("code","1");
		            LoginMsg.put("msg","账号或密码错误");
	        }
	        catch(LockedAccountException e){
	
	        	 LoginMsg.put("code","1");
		            LoginMsg.put("msg","账号被锁定");
	        }
	        catch (Exception e) {
	         
	            e.printStackTrace();
	            LoginMsg.put("code","1");
	            LoginMsg.put("msg","系统错误");
	
	        }
	      return LoginMsg;
	}
	
	public Object CreateUser(Users user) {
		  Map<String, String> Msg=null;
		try {
			if(StringUtils.isIllegalCharacter(user.getUserName())) {
				 Msg.put("code","500");
		         Msg.put("msg","用户名含有非法字符");
		         return Msg;
			}
		
		   Msg=new HashMap<String, String>();
			TimeZone tz = TimeZone.getTimeZone("GMT+8");
			TimeZone.setDefault(tz);
		 String passWordmd5 = new Md5Hash(user.getPassWord()).toString();
		 user.setRId(4);
		 user.setCreatorId(0);
		 user.setUserImg("/images/MyT.jpg");
		 user.setLocked(1);
		 user.setSex(3);
		 user.setCreateDate(new Date());
		 user.setDataLevel(0);
		 user.setSalt(passWordmd5);
		 user.setPassWord(passWordmd5);
		 uMapper.CreateUser(user);
		 Msg.put("code","0");
         Msg.put("msg","注册成功");
         Subject subject = SecurityUtils.getSubject();   
         UsernamePasswordToken usernamePasswordToken = new      		
	                UsernamePasswordToken(user.getUserName(),passWordmd5);
         subject.login(usernamePasswordToken);
         
         Login(user, "off");
		} catch (Exception e) {
			e.printStackTrace();
			Msg.put("code","1");
			Msg.put("msg","系统错误");
		}
		 return Msg;
	}

}
