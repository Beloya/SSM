package com.MyBlog.Message;

import org.springframework.beans.factory.annotation.Autowired;

public class QQEmailUtilFactory implements EmailUtilFactory{

	public EmailUtil CreateEmail() {
		return new QQEmail();
	}


}
