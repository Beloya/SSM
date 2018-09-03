package com.MyBlog.Shiro.Realm;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.session.HttpServletSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Constants;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.MyBlog.ServiceImpl.ShiroSession;
import com.MyBlog.ServiceImpl.UserServiceImpl;
import com.MyBlog.Shiro.CustomShiroSessionDAO;
import com.MyBlog.Shiro.Session.redisSessionService;
import com.MyBlog.Shiro.Token.ShiroToken;
import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.entity.Role_Permissions;
import com.MyBlog.entity.Users;






public class WebRealm extends AuthorizingRealm implements Realm{
	 private static final transient Logger log = LoggerFactory.getLogger(WebRealm.class);
	  public static final String SESSION_USER_KEY = "Login";  
		@Autowired
	  private UserServiceImpl userService;  
	private CustomShiroSessionDAO customshirosessionDAO;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Users user=null;
		user = (Users) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		if(user.getUserName()!=null){
		user=userService.FindByUserName(user.getUserName());
		}
	
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
	
		Users ui = userService.FindByUserName(username);  
		
		if(ui == null)  {
			 throw new UnknownAccountException();
		}
		
		if(ui.getLocked()==0){
			
			 throw new LockedAccountException();  
		}
		Subject subject = SecurityUtils.getSubject();
		
		Session session =  subject.getSession();
		
	
		 session.setAttribute(WebRealm.SESSION_USER_KEY, ui);
		  session.setAttribute("user", ui);
	        String realmName = this.getName();  

	       
	        return new SimpleAuthenticationInfo(ui, ui.getPassWord(), realmName);
	}

	   //一定要写getset方法  
    public UserServiceImpl getUserService() {  
        return userService;  
    }  
  
    public void setUserService(UserServiceImpl userService) {  
        this.userService = userService;  
    }
    /**
     * 清空当前用户权限信息
     */
    public  void clearCachedAuthorizationInfo() {
		PrincipalCollection principalCollection = SecurityUtils.getSubject().getPrincipals();
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principalCollection, getName());
		System.out.println("清除当前用户权限信息");
		super.clearCachedAuthorizationInfo(principals);
	}
    /**
	 * 指定principalCollection 清除
	 */
	public void clearCachedAuthorizationInfo(PrincipalCollection principalCollection) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principalCollection, getName());
		System.out.println("清除principalCollection");
		super.clearCachedAuthorizationInfo(principals);
	}

	public CustomShiroSessionDAO getCustomshirosessionDAO() {
		return customshirosessionDAO;
	}

	public void setCustomshirosessionDAO(CustomShiroSessionDAO customshirosessionDAO) {
		this.customshirosessionDAO = customshirosessionDAO;
	}
	

}
