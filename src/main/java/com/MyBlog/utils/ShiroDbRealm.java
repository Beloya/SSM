package com.MyBlog.utils;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.MyBlog.ServiceImpl.UserServiceImpl;
import com.MyBlog.Session.redisSessionService;
import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.entity.Role_Permissions;
import com.MyBlog.entity.Users;



public class ShiroDbRealm extends AuthorizingRealm {
	 private static final transient Logger log = LoggerFactory.getLogger(ShiroDbRealm.class);
	  public static final String SESSION_USER_KEY = "Login";  
	@Autowired
	  private UserServiceImpl userService;  

	@Autowired
	SpringRedisCache sre;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		String username = (String)principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		Users user=userService.FindByUserName(username);
		HashSet<Role_Permissions> RolePs=new HashSet<Role_Permissions>(user.getLRP());

		Set<String> RpR=new HashSet<String>();
		Set<String> RpP=new HashSet<String>();
	
		RpR.add(user.getRole().getRoleName());
		for(Role_Permissions Rp:RolePs) {
		RpP.add(Rp.getPermission());
		
		}
	
		authorizationInfo.setRoles(RpR);
		
		authorizationInfo.setStringPermissions(RpP);
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		String username = (String) token.getPrincipal();
		Users userLogin = tokenToUser((UsernamePasswordToken) token);  
		Users ui = userService.FindByUserName(userLogin.getUserName());  
		if(ui == null)  {
			 throw new UnknownAccountException();
		}
		if(!ui.getPassWord().equals(userLogin.getPassWord())){
		
			  throw new IncorrectCredentialsException();
		}
		
		if(ui.getLocked()==0){
			
			 throw new LockedAccountException();  
		}
		Subject subject= SecurityUtils.getSubject();
		
		  Session session = subject.getSession(); 
		// session.setAttribute(ShiroDbRealm.SESSION_USER_KEY, ui);
		  session.setAttribute("user", ui);
	        String realmName = this.getName();  
	        Object principal = token.getPrincipal();  
	        session.setTimeout(43200000);
	   
	        return new SimpleAuthenticationInfo(principal, userLogin.getPassWord(), realmName);
	}
	  private Users tokenToUser(UsernamePasswordToken authcToken) {  
	        Users user = new Users();  
	        user.setUserName(authcToken.getUsername());  
	        user.setPassWord(String.valueOf(authcToken.getPassword()));  
	        return user;  
	    }  
	   //一定要写getset方法  
    public UserServiceImpl getUserService() {  
        return userService;  
    }  
  
    public void setUserService(UserServiceImpl userService) {  
        this.userService = userService;  
    }  
}
