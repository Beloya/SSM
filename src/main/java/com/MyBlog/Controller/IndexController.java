package com.MyBlog.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.Service.typeService;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Flag;
import com.MyBlog.entity.Pager;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.archives;
import com.MyBlog.entity.type;
import com.MyBlog.utils.BlogInfoSignle;
import com.MyBlog.utils.SpringRedisCache;
import com.github.pagehelper.ISelect;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class IndexController {


	@Autowired
	private archivesService aservice;
	@Autowired
	private typeService tservice;

	@RequestMapping("/index")
	public String IndexSee(Integer page,HttpServletRequest request,Model model){
		Pager pager=new Pager();
		pager.setPage(1);
		if(page!=null)
			pager.setPage(page);
		pager.setSize(5);
		PageHelper.startPage(pager.getPage(), pager.getSize());
		
	 List<archives> archives=aservice.FindArchives(0);
	 
	long archivescount= ((Page) archives).getTotal();
	PageHelper.startPage(pager.getPage(), pager.getSize());
	List<type> types=tservice.FindAll();
	pager.setTotal((int)archivescount);

		model.addAttribute("archives", archives);

		model.addAttribute("pager", pager);
		return "index";
	}
	
	@RequestMapping("/categories")
	public String categories(HttpServletRequest request,Model model){
		PageHelper.startPage(1, 2);
	 List<archives> archives=aservice.FindArchives(0);
	long archivescount= ((Page) archives).getTotal();
	PageHelper.startPage(1, 10);
	List<type> types=tservice.FindAll();
	long typecount= ((Page) types).getTotal();
		model.addAttribute("archivescount", archivescount);
		model.addAttribute("types", types);
		model.addAttribute("typecount", typecount);

		return "categories";
	}

	
	@RequestMapping("/categoriesIndex")
	public String categoriesIndex(Integer TID,Integer page,HttpServletRequest request,Model model){
		Pager pager=new Pager();
		archives a=new archives();
		type ty=new type();
		a.setStatus(0);
		if(TID!=null) {
		a.setType(TID);
		ty.setTid(TID);
		}
	
		pager.setPage(1);
		if(page!=null)
			pager.setPage(page);
		pager.setSize(12);
		
		PageHelper.startPage(pager.getPage(), pager.getSize());
	 List<archives> archives=aservice.FindcategoriesList(a);
	long archivescount= ((Page) archives).getTotal();
	PageHelper.startPage(pager.getPage(), pager.getSize());
	List<type> types=tservice.FindById(ty);
	pager.setTotal((int)archivescount);
		model.addAttribute("archivescount", archivescount);
		model.addAttribute("archives", archives);
		model.addAttribute("types", types);
		model.addAttribute("pager", pager);
		
		return "categoriesIndex";
	}
	
	@RequestMapping("/FilterIndex")
	public String FilterIndex(Integer page,HttpServletRequest request,Model model){
		Date date=new Date();
		Calendar c = Calendar.getInstance();
		HashSet<Integer> year=new LinkedHashSet<Integer>();
		Pager pager=new Pager();
		pager.setPage(1);
		if(page!=null)
			pager.setPage(page);
		pager.setSize(12);
		PageHelper.startPage(pager.getPage(), pager.getSize());
		
	 List<archives> archives=aservice.FindArchives(0);
	long archivescount= ((Page) archives).getTotal();
	PageHelper.startPage(pager.getPage(), pager.getSize());
	List<type> types=tservice.FindAll();
	long typecount= ((Page) types).getTotal();
	pager.setTotal((int)archivescount);
	
	for (archives a : archives) {
		date=a.getCreatedTime();
		c.setTime(date);
		year.add(c.get(Calendar.YEAR));
	}
	
		model.addAttribute("archivescount", archivescount);
		model.addAttribute("archives", archives);
		model.addAttribute("typecount", typecount);
		model.addAttribute("pager", pager);
		model.addAttribute("years", year);
		return "FilterIndex";
	}
}
