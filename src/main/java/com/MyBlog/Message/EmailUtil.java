package com.MyBlog.Message;

import com.MyBlog.entity.Email;

public interface EmailUtil {
  public Object SendMail(Email email); 
	public <T> void  JoinEmailQueue(Email email);
  public Object SendAttMail(Email email);
}
   