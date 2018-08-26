package com.MyBlog.Shiro.Token;

import java.io.Serializable;

import org.apache.shiro.authc.UsernamePasswordToken;

public class ShiroToken  extends UsernamePasswordToken  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -191639192796505210L;

	/**
	 * 
	 */
	
	
	public ShiroToken(String username, String pswd) {
		super(username,pswd);
		this.pswd = pswd ;
	}
	
	
	/** 登录密码[字符串类型] 因为父类是char[] ] **/
	private String pswd ;

	public String getPswd() {
		return pswd;
	}


	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

}
