package com.MyBlog.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MyBlog.Service.MessageBoardService;
import com.MyBlog.entity.Archivescommit;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.MessageBoard;
import com.MyBlog.entity.Pager;
import com.MyBlog.utils.BlogInfoSignle;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class MessageBoradController {

	@Autowired
	private MessageBoardService mbservice;
	@RequestMapping("AllSay")
	public String AllSay(Integer page,HttpServletRequest request,HttpServletResponse response,Model model) {
		Pager pager=new Pager();
	   List<MessageBoard> mblist=new ArrayList<MessageBoard>();
		if(page!=null)
			pager.setPage(page);
		PageHelper.startPage(pager.getPage(), 10);
		mblist=mbservice.FindAll();
		long total= ((Page) mblist).getTotal();
		pager.setTotal((int) total);
		
String formToken=UUID.randomUUID().toString();	
		request.getSession().setAttribute("formToken", formToken);
		request.getSession().setMaxInactiveInterval(-1000);
		model.addAttribute("formToken", formToken);
		model.addAttribute("pager", pager);
		model.addAttribute("mblist", mblist);
		return "/jsp/AllSay";	
	}

	
	@RequestMapping("/CreateaSay")
	@ResponseBody
	public Object  NewSay(MessageBoard messageborad,String formToken,HttpServletRequest request,HttpServletResponse response){
		 Map<String, String> Msg=new HashMap();
		 TimeZone tz = TimeZone.getTimeZone("GMT+8");
			TimeZone.setDefault(tz);
		 Subject subject = SecurityUtils.getSubject(); 
		 Object Principal=  subject.getPrincipal();
		String SessionformToken=null; 
		messageborad.setContext(messageborad.getContext().replace("<script", "<js"));
		messageborad.setContext(messageborad.getContext().replace("</script", "</js"));
				if(request.getSession().getAttribute("formToken")!=null) {
					SessionformToken=request.getSession().getAttribute("formToken").toString();
					request.getSession().removeAttribute("formToken");
				}
				if(SessionformToken==null||formToken==null)
				{
					 Msg.put("code","403");
					 Msg.put("msg","请不要重复提交");
					 return Msg;
				}
				if(!SessionformToken.equals(formToken))
				{
					 Msg.put("code","403");
					 Msg.put("msg","请不要重复提交");
					 return Msg;
				}
		 if(messageborad.getName()==null&&Principal!=null){
			 String userName=Principal.toString();
			 messageborad.setCreatedBy(userName);
			 messageborad.setCreatedTime(new Date());
			 messageborad.setStatus(0);
		 if(messageborad.getContext()!=null||!messageborad.getContext().equals("")){
			 mbservice.AddMessageBoard(messageborad);
		 
		 Msg.put("code","0");
		 Msg.put("msg","200");
		 }
		 if(messageborad.getContext()==null||messageborad.getContext().equals("")){
			 Msg.put("code","1");
			 Msg.put("msg","内容不能为空");
		 
		 }
		 }	 
		if(messageborad.getName()!=null&&!messageborad.getName().equals("")){
			messageborad.setCreatedBy("游客");
			messageborad.setCreatedTime(new Date());
			messageborad.setStatus(0);
			messageborad.setName(messageborad.getName().replace("<", "《"));
			messageborad.setName(messageborad.getName().replace(">", "》"));
			mbservice.AddMessageBoard(messageborad);
			 Msg.put("code","0");
			 Msg.put("msg","200"); 
		 }
		else if(Principal==null){
			 Msg.put("code","1");
			 Msg.put("msg","请填写昵称或登录"); 
		}
		 
		 
		 
		 return Msg;
	}
}
