package com.MyBlog.Message;

import java.security.GeneralSecurityException;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.MyBlog.entity.Email;
import com.sun.mail.util.MailSSLSocketFactory;

public class QQEmail implements EmailUtil{

	private String host="smtp.qq.com";
	private int port=465;
	private String tomail;
	private String email="468501955@qq.com";
	private String subject;
	private String Text;
	private Date senddate;
	private String password="bygjtnfrokbbbgdg";
	public static ArrayBlockingQueue<QQEmail> emailqueue=new ArrayBlockingQueue<QQEmail>(50);
	private FileSystemResource file;
	public QQEmail(){}

	public <T> void  JoinEmailQueue(T t,Email email) {

		this.tomail = email.getTomail();
		this.subject = email.getSubject();
		Text = email.getText();
		this.file = email.getFile();
		try {
			emailqueue.put((QQEmail) t);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	public  Object SendMail(Email email) {
		try {
	
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
		senderImpl.setHost(this.host);
		senderImpl.setPort(this.port);
		senderImpl.setDefaultEncoding("UTF-8");
		SimpleMailMessage mailMessage = new SimpleMailMessage(); 
		mailMessage.setTo(email.getTomail());  //收信人邮箱
		mailMessage.setFrom(this.email); //发送人邮箱
		mailMessage.setSubject(email.getSubject());  //邮件主题
		mailMessage.setText(email.getText());  //邮件内容
		mailMessage.setSentDate(new Date());
		senderImpl.setUsername(this.email); //发送人服务器用户名
		senderImpl.setPassword(this.password); //此处为授权码，而非邮箱密码
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

	public synchronized Object SendAttMail(Email email) {
		try {
			
			JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
			senderImpl.setHost(this.host);
			senderImpl.setPort(this.port);
			senderImpl.setDefaultEncoding("UTF-8");
			 MimeMessage message = senderImpl.createMimeMessage();
		        MimeMessageHelper helper = new MimeMessageHelper(message, true);
		        MailSSLSocketFactory sf = new MailSSLSocketFactory();
				Properties prop = new Properties();
		        sf.setTrustAllHosts(true);
		        senderImpl.setJavaMailProperties(prop);
			helper.setTo(email.getTomail());  //收信人邮箱
			helper.setFrom(this.email); //发送人邮箱
			helper.setSubject(email.getSubject());  //邮件主题
			helper.setText(email.getText());  //邮件内容
			helper.setSentDate(new Date());
			senderImpl.setUsername(this.email); //发送人服务器用户名
			senderImpl.setPassword(this.password); //此处为授权码，而非邮箱密码
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
	public synchronized Object SendAttMail() {
		try {
			
			JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
			senderImpl.setHost(this.host);
			senderImpl.setPort(this.port);
			senderImpl.setDefaultEncoding("UTF-8");
			 MimeMessage message = senderImpl.createMimeMessage();
		        MimeMessageHelper helper = new MimeMessageHelper(message, true);
		        MailSSLSocketFactory sf = new MailSSLSocketFactory();
				Properties prop = new Properties();
		        sf.setTrustAllHosts(true);
		        senderImpl.setJavaMailProperties(prop);
			helper.setTo(this.tomail);  //收信人邮箱
			helper.setFrom(this.email); //发送人邮箱
			helper.setSubject(this.subject);  //邮件主题
			helper.setText(this.Text);  //邮件内容
			helper.setSentDate(new Date());
			senderImpl.setUsername(this.email); //发送人服务器用户名
			senderImpl.setPassword(this.password); //此处为授权码，而非邮箱密码
			if(this.file!=null&&this.file.exists()) 
			helper.addInline("附件",this.file);
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	public static BlockingQueue<QQEmail> getEmailqueue() {
		return emailqueue;
	}







}
