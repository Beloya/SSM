package com.MyBlog.utils;

import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.MyBlog.Base.EmailUtil;
import com.MyBlog.entity.Email;
import com.sun.mail.util.MailSSLSocketFactory;

public class QQEmail implements EmailUtil{

	private String host;
	private int port;
	private String tomail;
	private String email;
	private String subject;
	private String Text;
	private Date senddate;
	private String password;
	private FileSystemResource file;

	public QQEmail(){}
	

	public void DefineEmail(Email email){
		host=email.getHost();
		port=email.getPort();
		tomail=email.getTomail();
		this.email=email.getEmail();
		subject=email.getSubject();
		Text=email.getText();
		senddate=email.getSenddate();
		password=email.getPassword();
		file=email.getFile();
		
	}

	public Object SendMail(Email email) {
		try {
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
		senderImpl.setHost(email.getHost());
		senderImpl.setPort(email.getPort());
		senderImpl.setDefaultEncoding("UTF-8");
		SimpleMailMessage mailMessage = new SimpleMailMessage(); 
		mailMessage.setTo(email.getTomail());  //收信人邮箱
		mailMessage.setFrom(email.getEmail()); //发送人邮箱
		mailMessage.setSubject(email.getSubject());  //邮件主题
		mailMessage.setText(email.getText());  //邮件内容
		mailMessage.setSentDate(email.getSenddate());
		senderImpl.setUsername(email.getEmail()); //发送人服务器用户名
		senderImpl.setPassword(email.getPassword()); //此处为授权码，而非邮箱密码
		Properties prop = new Properties();  
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		prop.put("mail.smtp.ssl.enable", "true");//ssl安全协议
		prop.put("mail.smtp.ssl.socketFactory", sf);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.timeout", "25000");  
		senderImpl.setJavaMailProperties(prop);  
		senderImpl.send(mailMessage);
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	public Object SendAttMail(Email email) {
		try {
			JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
			senderImpl.setHost(email.getHost());
			senderImpl.setPort(email.getPort());
			senderImpl.setDefaultEncoding("UTF-8");
			 MimeMessage message = senderImpl.createMimeMessage();
		        MimeMessageHelper helper = new MimeMessageHelper(message, true);
		        MailSSLSocketFactory sf = new MailSSLSocketFactory();
				Properties prop = new Properties();
		        sf.setTrustAllHosts(true);
		        senderImpl.setJavaMailProperties(prop);
			helper.setTo(email.getTomail());  //收信人邮箱
			helper.setFrom(email.getEmail()); //发送人邮箱
			helper.setSubject(email.getSubject());  //邮件主题
			helper.setText(email.getText());  //邮件内容
			helper.setSentDate(email.getSenddate());
			senderImpl.setUsername(email.getEmail()); //发送人服务器用户名
			senderImpl.setPassword(email.getPassword()); //此处为授权码，而非邮箱密码
			if(email.getFile()!=null&&email.getFile().exists()) 
			helper.addInline("附件", email.getFile());
			prop.put("mail.smtp.ssl.enable", "true");//ssl安全协议
			prop.put("mail.smtp.ssl.socketFactory", sf);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.timeout", "25000");  
			senderImpl.setJavaMailProperties(prop);  
			senderImpl.send(message);
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		catch(MessagingException e) {
			e.printStackTrace();
		}
			return null;
	}



}
