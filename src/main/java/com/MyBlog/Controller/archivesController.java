package com.MyBlog.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.Core.FormToken;
import com.MyBlog.Service.ArchivesvisibilityService;
import com.MyBlog.Service.FlagService;
import com.MyBlog.Service.archivesFlagService;
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.archivescommitService;
import com.MyBlog.Service.blogService;
import com.MyBlog.Service.typeService;
import com.MyBlog.entity.Archivescommit;
import com.MyBlog.entity.Archivesvisibility;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Flag;
import com.MyBlog.entity.Pager;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.archives;
import com.MyBlog.entity.archivesFlag;
import com.MyBlog.entity.type;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class archivesController {

	
	@Autowired
	private archivesService aservice; 
	@Autowired
	private FlagService flagService;
	@Autowired
	private ArchivesvisibilityService avService;

	@Autowired
	private archivescommitService acservice;
	@Autowired
	private typeService tyservice;
	
	@RequestMapping("Createarchives")
	@ResponseBody
	public Object Createarchives(int type,String Flag,String title,String context,Integer VID,String formToken,HttpServletRequest request,HttpServletResponse response){
archives archives=new archives();
Map<String, String> Msg=new HashMap<String, String>();
	 Subject subject = SecurityUtils.getSubject(); 
	 Object Principal=  subject.getPrincipal();
	 if(!subject.isAuthenticated()){
		 Msg.put("code","1");
		 Msg.put("msg","请先登录");
	 }
	 Users user=(Users) Principal;
	
	 int AID=-1;
		String SessionformToken=null; 
		
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
	 archives.setTitle(title);
	 archives.setContext(context);
	 archives.setType(type);
	 archives.setVid(VID);
	archives.setCreatedBy(user.getUserName());
	archives.setCreatedTime(new Date());
	archives.setStatus(0);
		try {
	AID=aservice.Addarchives(archives,Flag);
		Msg.put("code", "0");
		Msg.put("AID", AID+"");
	} catch (UnauthorizedException e) {
		Msg.put("code", "-1");
		Msg.put("Msg", "权限不足");
	}
  catch (UnauthenticatedException e) {
	  Msg.put("code", "-1");
		Msg.put("Msg", "请先登录");
}
		return Msg;
	}
	
	@RequestMapping("Updatearchives")
	@ResponseBody
	public Object Updatearchives(Integer AID,Integer readcount,int type,String Flag,String title,String context,Integer VID,String formToken,HttpServletRequest request,HttpServletResponse response) {
		archives archives=new archives();

			 Subject subject = SecurityUtils.getSubject(); 
			 Object Principal=  subject.getPrincipal();
			 Users user=(Users) Principal;
			  Map<String, String> Msg=new HashMap<String, String>();
				String SessionformToken=null; 
				
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
		archives.setAid(AID);
		 archives.setTitle(title);
		 archives.setContext(context);
		 archives.setType(type);
		 archives.setVid(VID);
		 archives.setReadcount(readcount);
		archives.setUpdatedBy(user.getUserName());
		TimeZone tz = TimeZone.getTimeZone("GMT+8");
		TimeZone.setDefault(tz);
		archives.setUpdatedTime(new Date());
		archives.setStatus(0);
		try {
			aservice.Update(archives);
				Msg.put("code", "0");
				Msg.put("AID", AID+"");
			} catch (UnauthorizedException e) {
				Msg.put("code", "-1");
				Msg.put("Msg", "权限不足");
			}
		  catch (UnauthenticatedException e) {
			  Msg.put("code", "-1");
				Msg.put("Msg", "请先登录");
		}
				return Msg;
	}
	
	@RequestMapping("Newarchives")
	public String Writerarchives(HttpServletRequest request,HttpServletResponse response,Model model){
		
		  List<Flag> flags=flagService.FindAll();
		  List<type> types=tyservice.FindAll();
		List<Archivesvisibility> archivesvisibilities=avService.FindAll(); 
	String formToken=UUID.randomUUID().toString();
		
		request.getSession().setAttribute("formToken", formToken);
		model.addAttribute("types", types);
		model.addAttribute("formToken", formToken);
		  model.addAttribute("archivesvisibilities", archivesvisibilities);
		  model.addAttribute("flags", flags);
		return "/jsp/edit";
	}
	@RequestMapping("/archives")
	public String archives(Integer AID,Integer page,HttpServletRequest request,HttpServletResponse response,Model model){
		
		archives archives=aservice.SeeArchives(AID);
		Pager pager=new Pager();
		if(page!=null)
			pager.setPage(page);
		List<Flag> flags=new ArrayList<Flag>();
		PageHelper.startPage(pager.getPage(),8);
		pager.setSize(8);
		List<Archivescommit> archivescommits=acservice.FindByAIdChild(AID);
		long commitCount=((Page) archivescommits).getTotal();
		if(archives==null)
			return "redirect:"+"/jsp/404";
	flags=archives.getFlags();
	
		pager.setTotal((int)commitCount);
		String formToken=UUID.randomUUID().toString();		
		request.getSession().setAttribute("formToken", formToken);
		model.addAttribute("formToken", formToken);
	
		model.addAttribute("archivescommits", archivescommits);
		model.addAttribute("archives", archives);
		model.addAttribute("flags", flags);
		model.addAttribute("commitCount", commitCount);
		model.addAttribute("pager", pager);
		return "/jsp/detail";
	}
	
	@RequestMapping("deletearchives")
	@ResponseBody
	public Object deletearchives(int AID,HttpServletRequest request,HttpServletResponse response) {
		
		Map<String, String> Msg=new HashMap<String, String>();
		aservice.Intorecovery(AID);
		 Msg.put("code","0");
		 Msg.put("msg","200");
		return Msg;
	}
	@RequestMapping("editarchives")
	public String editarchives(int AID,HttpServletRequest request,HttpServletResponse response,Model model) {
		archives archives=aservice.SeeArchives(AID);
		  List<Flag> flags=flagService.FindAll();
		  List<type> types=tyservice.FindAll();
			List<Archivesvisibility> archivesvisibilities=avService.FindAll(); 
		String formToken=UUID.randomUUID().toString();
			
			request.getSession().setAttribute("formToken", formToken);
			request.getSession().setMaxInactiveInterval(-1000);
			model.addAttribute("formToken", formToken);
			model.addAttribute("types", types);
			  model.addAttribute("archivesvisibilities", archivesvisibilities);
			  model.addAttribute("flags", flags);
		model.addAttribute("archives", archives);
		return "/jsp/edit";
	}
	
	@RequestMapping("/CreatearchivesCommit")
	@ResponseBody
	public Object  NewarchivesCommit(Archivescommit archivescommit,String formToken,HttpServletRequest request,HttpServletResponse response){
		 Map<String, String> Msg=new HashMap<String, String>();
		 TimeZone tz = TimeZone.getTimeZone("GMT+8");
			TimeZone.setDefault(tz);
		 Subject subject = SecurityUtils.getSubject(); 
		 Object Principal=  subject.getPrincipal();
		String SessionformToken=null; 
		archivescommit.setContext(archivescommit.getContext().replace("<script", "<js"));
		archivescommit.setContext(archivescommit.getContext().replace("</script", "</js"));
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
		 if(archivescommit.getName()==null&&Principal!=null){
			 Users user=(Users) Principal;
		 archivescommit.setCreatedBy(user.getUserName());
		 archivescommit.setCreatedTime(new Date());
		 archivescommit.setType(0);
		 archivescommit.setStatus(0);
		 if(archivescommit.getContext()!=null||!archivescommit.getContext().equals("")){
		 acservice.Archivescommit(archivescommit);
		 
		 Msg.put("code","0");
		 Msg.put("msg","200");
		 }
		 if(archivescommit.getContext()==null||archivescommit.getContext().equals("")){
			 Msg.put("code","1");
			 Msg.put("msg","内容不能为空");
		 
		 }
		 }	 
		if(archivescommit.getName()!=null&&!archivescommit.getName().equals("")){
		archivescommit.setCreatedBy("游客");
		archivescommit.setCreatedTime(new Date());
		archivescommit.setStatus(0);
		archivescommit.setName(archivescommit.getName().replace("<", "《"));
		archivescommit.setName(archivescommit.getName().replace(">", "》"));
			 acservice.Archivescommit(archivescommit);
			 Msg.put("code","0");
			 Msg.put("msg","200"); 
		 }
		else if(Principal==null){
			 Msg.put("code","1");
			 Msg.put("msg","请填写昵称或登录"); 
		}
		 
		 
		 
		 return Msg;
	}
	@RequestMapping("delCommit")
	@ResponseBody
	public Object delCommit(int CID,HttpServletRequest request,HttpServletResponse response){
		 Map<String, String> Msg=new HashMap<String, String>();
		
		 Archivescommit archivescommit=acservice.FindByCId(CID);
		 Subject subject = SecurityUtils.getSubject(); 
		 Object Principal=  subject.getPrincipal();
		 Users user=(Users) Principal;
		 if(user.getUserName().equals(archivescommit.getCreatedBy())||subject.hasRole("管理员")||subject.hasRole("博主")){
		 acservice.delete(CID);
		 Msg.put("code","0");
		 Msg.put("msg","200");}
		 else{
		
			 Msg.put("code","1");
			 Msg.put("msg","权限不足");
		 }
		 return Msg;
	}
	
	@RequestMapping("NewFlag")
	@ResponseBody
	public Object CreateFlag(Flag flag,HttpServletRequest request,HttpServletResponse response) {
		 Map<String, String> Msg=new HashMap<String, String>();
		 Subject subject = SecurityUtils.getSubject(); 
		 Object Principal=  subject.getPrincipal();
		 Users user=(Users) Principal;
		 flag.setCreatedBy(user.getUserName());
		 flag.setCreatedTime(new Date());
		 flag.setStatus(0);
		 flagService.AddFlag(flag);
		 Msg.put("code","0");
		 Msg.put("fid",flag.getFid()+"");
		return Msg;
		
	}
	@RequestMapping("NewType")
	@ResponseBody
	public Object CreateType(type type,HttpServletRequest request,HttpServletResponse response) {
		 Map<String, String> Msg=new HashMap<String, String>();
		 Subject subject = SecurityUtils.getSubject(); 
		 Object Principal=  subject.getPrincipal();
		 Users user=(Users) Principal;
		 type.setCreatedBy(user.getUserName());
		 type.setCreatedTime(new Date());
		 type.setStatus(0);
		 tyservice.AddType(type);
		 Msg.put("code","0");
		 Msg.put("tid",type.getTid()+"");
		return Msg;
		
	}
}
