package com.MyBlog.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.Set;
import java.util.TimeZone;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.LongStream;
import java.util.stream.Stream;

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
import org.w3c.dom.NodeList;

import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.Dao.BlogMapper;
import com.MyBlog.Dao.MessageBoardMapper;
import com.MyBlog.Dao.UsersMapper;
import com.MyBlog.Dao.archivesMapper;
import com.MyBlog.Dao.areaMapper;
import com.MyBlog.Message.EmailUtil;
import com.MyBlog.Message.EmailUtilFactory;
import com.MyBlog.Service.SyslinkService;
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.Service.typeService;
import com.MyBlog.Service.userService;
import com.MyBlog.cache.SpringRedisCache;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Email;
import com.MyBlog.entity.JsonData;
import com.MyBlog.entity.MessageBoard;
import com.MyBlog.entity.Pager;
import com.MyBlog.entity.Role_Permissions;
import com.MyBlog.entity.Syslink;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.Archives;
import com.MyBlog.entity.Archivesvisibility;
import com.MyBlog.entity.area;
import com.MyBlog.entity.type;
import com.MyBlog.learn.BeautifulGirl;
import com.MyBlog.learn.ConcreteSubject;
import com.MyBlog.learn.GuavaBeautifulGirl;
import com.MyBlog.learn.GuavaHandSomeBoy;
import com.MyBlog.learn.GuavaMyBlog;
import com.MyBlog.learn.HandSomeBoy;
import com.MyBlog.learn.Observer;
import com.MyBlog.learn.capt1;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.google.common.eventbus.EventBus;
import com.sun.mail.util.MailSSLSocketFactory;

import afu.org.checkerframework.checker.units.qual.s;

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
final	String  station_names ="";

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
	private SyslinkService service;

	@Resource
	private archivesMapper amapper;
	//@Autowired
	//SpringRedisCache re=new SpringRedisCache();
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
	
/*
		List<Blog> blogs=bserivce.FindAll();
	for(Syslink a:syslinks) {
		//HashSet hs=new HashSet(a.getLRP());
	//Iterator<Role_Permissions> it=hs.iterator();
	System.out.println(a.getName()+"权限:");

	if(a.getPmenu()!=null){
		
	}
	/*	while(it.hasNext()) {
			System.out.println(it.next().getPermission());
		}*/
		/*System.out.println("------------------------");
	}*/
}
	//@Test
	public void test() {
		   //美女关注者
		Observer beautifulgirl=new BeautifulGirl();
		 //帅哥关注者
		Observer handsomeboy=new HandSomeBoy();
		//博客
		ConcreteSubject MyBlog=new ConcreteSubject();
		//增加一个关注者
MyBlog.resisterObserver(handsomeboy);
//增加一个关注者
MyBlog.resisterObserver(beautifulgirl);
//发一篇文章
MyBlog.publishArticle("设计模式-观察者模式");
	}
	public void MethodChange(Pager pager){
	
		pager.setPage(3);
		System.out.println(pager);
	}
@Test
	public void GuavaTest() {
	

String path=this.getClass().getClassLoader().getResource("").getPath();
/*File file=new File(path+"station.text");
//System.out.println(path);
	System.out.println(file.exists());
	try {
		FileInputStream fin=new FileInputStream(file);
		byte b[]=new byte[1024];
while(fin.read(b)!=-1) {
	System.out.println(new String(b,"utf-8"));
}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	*/
String train_date="2018-11-30";


Calendar c=  Calendar.getInstance(TimeZone.getTimeZone("GMT+8"));

c.set( Integer.parseInt(train_date.substring(0, 4)),Integer.parseInt(train_date.substring(5, 7)),Integer.parseInt(train_date.substring(8, 10)),0,0,0);
//c.setTimeZone(TimeZone.getTimeZone("GMT+8"));
System.out.println(c.getTime());


//httpRequest http_request=new httpRequest();
	/*String result=http_request.DoGet("https://kyfw.12306.cn/otn/leftTicket/query?leftTicketDTO.train_date=2018-11-28&leftTicketDTO.from_station=GZQ&leftTicketDTO.to_station=VIQ&purpose_codes=ADULT");
	JSONObject jsonObjectone = JSONObject.parseObject(result);
String data=	jsonObjectone.getString("data");
String queryResult=null;
	System.out.println(result);
	System.out.println(data);
	JSONObject Json=JSONObject.parseObject(data);
	String mapstr=Json.getString("map");
	queryResult=Json.getString("result");
	queryResult=queryResult.substring(2, queryResult.length()-2);
	String qz[]=queryResult.split(",");

	JSONObject map=JSONObject.parseObject(mapstr);
	
	Map<String,Object> addressmap=(Map<String,Object>)map;

	System.out.println("");
System.out.println(queryResult);
for(int i=0;i<qz.length;i++) {
	String qs[]=qz[i].split("\\|");
	System.out.print("从"+addressmap.get(qs[6])+"出发,前往"+addressmap.get(qs[7])+" 车次:"+qs[3]+" "
			+"出发时间:"+qs[8]+" "+"预计到达时间:"+qs[9]+" "+"预计路程时间:"+qs[10]+"软卧:"+qs[23]+" "+"硬卧:"+qs[28]+" "+"硬座:"+qs[29]+" "+"软座:"+qs[24]+" 站票:"+qs[26]);
		System.out.println("");
}

String captcha=http_request.DoGet("https://kyfw.12306.cn/passport/captcha/captcha-image64?login_site=E&module=login&rand=sjrand&1542849651313");
System.out.println(captcha);	
JSONObject jsonObjectcaptcha = JSONObject.parseObject(captcha);
String captchadata=	jsonObjectcaptcha.getString("image");
System.out.println(captchadata);
Map<String,Object> postmap=new HashMap<>();
postmap.put("username", "13729046425");
postmap.put("password", "a468501955");
postmap.put("appid", "otn");
postmap.put("answer", "35,116,125,108");
String login=http_request.doPost("https://kyfw.12306.cn/passport/web/login", postmap);
System.out.println(login);
System.out.println("空值"+Optional.ofNullable(null).orElse("--"));*/
//String result=http_request.DoGet("https://kyfw.12306.cn/otn/confirmPassenger/getPassengerDTOs");

/*for (Archives archive : archives) {
		archive.setContext(StringUtils.subStringHTML(archive.getContext(),600));
		results.add(archive);
	}*/
		/* EventBus eventBus=new EventBus();
		 eventBus.register(new GuavaHandSomeBoy());
		// eventBus.register(new GuavaBeautifulGirl());
		    eventBus.post(new GuavaMyBlog("设计")); //发布事件*/
	}
public String NumberFormat(long n) {
	long i=10;
	long m=0;
	int j=0;
	StringBuffer str=new StringBuffer("");
	StringBuffer p[]= {new StringBuffer("拾"),new StringBuffer("佰"),new StringBuffer("仟"),new StringBuffer("万"),new StringBuffer("拾万"),new StringBuffer("佰万"),new StringBuffer("仟万"),new StringBuffer("亿"),new StringBuffer("拾亿"),new StringBuffer("佰亿"),new StringBuffer("仟亿"),new StringBuffer("万亿"),new StringBuffer("兆")};
	while(n*10>i) {
		m=n%i;
		m=(m-(n%(i/10)))/(i/10);
		if(n*10>i*10)
		str.append(Change((int)m));
		else
			str.append(Change((int)m));
		i=i*10;
		j++;
	}
	
	return str.toString();
	
}
public String Change(int i) {
	String result="";
	switch (i) {
	case 0:
		result="零";
		break;
case 1:
	result="壹";
		break;
case 2:
	result="贰";
	break;
case 3:
	result="叁";
	break;
case 4:
	result="肆";
	break;
case 5:
	result="伍";
	break;
case 6:
	result="陆";
	break;
case 7:
	result="柒";
	break;
case 8:
	result="捌";
	break;
case 9:
	result="玖";
	break;
	
	default:
	  throw new NumberFormatException("系统错误");
	
	}
	
	return result;


}

public class ListNode {
	      int val;
	      ListNode next;
	      ListNode(int x) { val = x; }
	  }
public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
    ListNode l=null,l3=null;
	ListNode lt3=null,lt=null;
    int val=0,g=0;
    while(l1!=null||l2!=null||g!=0){
    l1=	 Optional.ofNullable(l1).orElse(new ListNode(0));
    l2=	 Optional.ofNullable(l2).orElse(new ListNode(0));
val=(l1.val+l2.val+g)%10;

l=new ListNode(val);
l.next=lt;
lt=l;
g=(l1.val+l2.val+g)/10;
l2=l2.next;
l1=l1.next;
    }
    while(l!=null) {
    	l3=new ListNode(l.val);
    	l3.next=lt3;
    	lt3=l3;
    	l=l.next;
    	
    }
   
    return l3;
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
/*	public void JsonTest() throws GeneralSecurityException, ParseException, JsonGenerationException, JsonMappingException, IOException {
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
	}*/

}
