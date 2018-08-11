package com.MyBlog.utils;

import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TimeZone;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.apache.shiro.util.ThreadContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.MyBlog.Base.EmailUtil;
import com.MyBlog.Base.EmailUtilFactory;

import com.MyBlog.Dao.BlogMapper;
import com.MyBlog.Dao.MessageBoardMapper;
import com.MyBlog.Dao.UsersMapper;
import com.MyBlog.Dao.areaMapper;
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.Service.typeService;
import com.MyBlog.Service.userService;
import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Email;
import com.MyBlog.entity.JsonData;
import com.MyBlog.entity.MessageBoard;
import com.MyBlog.entity.Role_Permissions;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.archives;
import com.MyBlog.entity.area;
import com.MyBlog.entity.type;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.sun.mail.util.MailSSLSocketFactory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:Spring-Mybaits.xml"})  
public class TestMyBatis {
	
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
//	private ApplicationContext ac = null;
	
	//private IUserService userService = null;

//	@Before
//	public void before() {
//		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//		userService = (IUserService) ac.getBean("userService");
//	}
	
	@Resource
	areaMapper amapper;
	@Autowired
	private archivesService aservice;
	@Resource 
	private UsersMapper uMapper;
	@Resource
	private BlogMapper bMapper;
	@Autowired
	private userService userivce;
	@Autowired
	private blogService bserivce;
	@Resource
	private MessageBoardMapper mbmapper;
	@Autowired
	private typeService tservice;
	@Autowired
	SpringRedisCache re=new SpringRedisCache();
	//@Test
	public void test1() {

		//User user = userService.getUserById(1);
		// System.out.println(user.getUserName());
		// logger.info("值："+user.getUserName());
		//logger.info(JSON.toJSONString("Hello"));
		//System.out.println("Hello");
		//PageHelper.offsetPage(1, 3);
		Users user=new Users();
		user.setRId(1);
		user.setUserName("测试1");
		user.setPassWord("468501955");
		user.setSex(0);
		user.setCreateDate(new Date());
		user.setDataLevel(0);
		//uMapper.CreateUser(user);
	List<Users> areas=userivce.FindAll();
		//List<Blog> blogs=bserivce.FindAll();
	for(Users a:areas) {
		//HashSet hs=new HashSet(a.getLRP());
	//Iterator<Role_Permissions> it=hs.iterator();
	System.out.println(a.getUserName()+"权限:");
	/*	while(it.hasNext()) {
			System.out.println(it.next().getPermission());
		}*/
		System.out.println("------------------------");
	}
}
	@Test
	public void MbTest() throws GeneralSecurityException, ParseException {
		//re.hset("Hello", "world", "1");
	
		//System.out.println(re.sget("shrio_session"));

	}
//	@Test
	public void test2() {
		String resource = "Spring-Shrio.xml";  
        ClassPathXmlApplicationContext appCtx = new ClassPathXmlApplicationContext(resource);  
        org.apache.shiro.mgt.SecurityManager securityManager =   
            (org.apache.shiro.mgt.SecurityManager)appCtx.getBean("securityManager");  
        SecurityUtils.setSecurityManager(securityManager);  
		 Subject subject = SecurityUtils.getSubject();  
		 String str = "468501955";
		 String md5 = new Md5Hash(str).toString();
			TimeZone tz = TimeZone.getTimeZone("GMT+8");
			TimeZone.setDefault(tz);
		System.out.println("结果："+new Date());
		//System.out.println("解码结果："+str2);
		    System.out.println("Success");
		   // Assert.assertEquals(true, subject.isAuthenticated()); //断言用户已经登录  
		  
		    //6、退出  
		    subject.logout();  
		  
	}
	
//	@Test
	public void JsonTest() throws GeneralSecurityException, ParseException, JsonGenerationException, JsonMappingException, IOException {
		  ObjectMapper mapper = new ObjectMapper();
		  List<HashMap<String,Object>> datas=new ArrayList<HashMap<String, Object>>();
		  HashMap<String,Object>  data=new HashMap<String, Object>();
		  List<List> data1= new ArrayList<List>();
		  data.put("str", "Hello");
		  data.put("str1", "World");
		  datas.add(data);
		  datas.add(data);
		  JsonData jd=new JsonData();
		  jd.setCode(0);
		  jd.setData(datas);
		  jd.setMsg("nice");
		  String Text=mapper.writeValueAsString(jd);
		  System.out.println(Text);
	}
	
}
