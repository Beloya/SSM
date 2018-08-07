package com.MyBlog.Base;

import com.MyBlog.entity.Email;

public interface EmailUtil {
  public Object SendMail(Email email); 
  
  public Object SendAttMail(Email email);
}
   