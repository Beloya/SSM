package com.MyBlog.entity;

import java.util.Date;

import org.springframework.core.io.FileSystemResource;

public class Email {

	private String host;
	private int port;
	private String tomail;
	private String Email;
	private String subject;
	private String Text;
	private Date senddate;
	private String password;
	private FileSystemResource file;
	
	public String getHost() {
		return host;
	}
	public Email setHost(String host) {
		this.host = host;
		return this;
	}
	public int getPort() {
		return port;
	}
	public Email setPort(int port) {
		this.port = port;
		return this;
	}
	public String getTomail() {
		return tomail;
	}
	public Email setTomail(String tomail) {
		this.tomail = tomail;
		return this;
	}

	public String getSubject() {
		return subject;
	}
	public Email setSubject(String subject) {
		this.subject = subject;
		return this;
	}
	public String getText() {
		return Text;
	}
	public Email setText(String text) {
		Text = text;
		return this;
	}
	public Date getSenddate() {
		return senddate;
	}
	public Email setSenddate(Date senddate) {
		this.senddate = senddate;
		return this;
	}


	public String getEmail() {
		return Email;
	}
	public Email setEmail(String email) {
		Email = email;
		return this;
	}

	public String getPassword() {
		return password;
	}
	public Email setPassword(String password) {
		this.password = password;
		return this;
	}
	public FileSystemResource getFile() {
		return file;
	}
	public Email setFile(FileSystemResource file) {
		this.file = file;
		return this;
	}
	
	
}
