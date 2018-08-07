package com.MyBlog.utils;

import com.MyBlog.Base.EmailUtil;
import com.MyBlog.Base.EmailUtilFactory;

public class QQEmailUtilFactory implements EmailUtilFactory{

	public EmailUtil CreateEmail() {
		return new QQEmail();
	}


}
