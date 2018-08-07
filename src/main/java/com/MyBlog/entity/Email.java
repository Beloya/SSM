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
	public void setHost(String host) {
		this.host = host;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getTomail() {
		return tomail;
	}
	public void setTomail(String tomail) {
		this.tomail = tomail;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}


	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public FileSystemResource getFile() {
		return file;
	}
	public void setFile(FileSystemResource file) {
		this.file = file;
	}
	
	
}
