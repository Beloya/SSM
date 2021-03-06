package com.MyBlog.Controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MyBlog.Service.archivesService;

import com.MyBlog.Service.typeService;

import com.MyBlog.entity.Pager;

import com.MyBlog.entity.Archives;
import com.MyBlog.entity.type;

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
		long start,end=0;
		start=System.currentTimeMillis();
		
		Pager pager=null;
		pager=new Pager();
			pager.setPage(Optional.ofNullable(page).orElse(1));
		pager.setSize(5);
	 List<Archives> archives=aservice.IndexShow(0,pager);
	 
end=System.currentTimeMillis();
System.out.println("耗费时间:"+(end-start));
		model.addAttribute("archives", archives);
		model.addAttribute("pager", pager);
		return "/jsp/index";
	}
	
	@RequestMapping("/categories")
	public String categories(HttpServletRequest request,Model model){
		Pager pager=new Pager();
		pager.setPage(1);
		pager.setSize(2);
	PageHelper.startPage(1, 10);
	List<type> types=tservice.FindAll();
	long typecount= ((Page) types).getTotal();
		model.addAttribute("archivescount", pager.getTotal());
		model.addAttribute("types", types);
		model.addAttribute("typecount", typecount);
		return "/jsp/categories";
	}

	
	@RequestMapping("/categoriesIndex")
	public String categoriesIndex(Integer TID,Integer page,HttpServletRequest request,Model model){
		Pager pager=new Pager();
		Archives a=new Archives();
		type ty=new type();
		a.setStatus(0);	
		a.setType(Optional.ofNullable(TID).orElse(null));
		ty.setTid(Optional.ofNullable(TID).orElse(null));	
		pager.setPage(Optional.ofNullable(page).orElse(1));
		pager.setSize(12);	
		PageHelper.startPage(pager.getPage(), pager.getSize());
	 List<Archives> archives=aservice.FindcategoriesList(a);
	long archivescount= ((Page) archives).getTotal();
	PageHelper.startPage(pager.getPage(), pager.getSize());
	List<type> types=tservice.FindById(ty);
	pager.setTotal((int)archivescount);
		model.addAttribute("archivescount", archivescount);
		model.addAttribute("archives", archives);
		model.addAttribute("types", types);
		model.addAttribute("pager", pager);
		
		return "/jsp/categoriesIndex";
	}
	
	@RequestMapping("/FilterIndex")
	public String FilterIndex(Integer page,HttpServletRequest request,Model model){
		Pager pager=null;
		Set<Integer> years=null;
		Calendar c = Calendar.getInstance();
		pager=new Pager();
			pager.setPage(Optional.ofNullable(page).orElse(1));
		pager.setSize(12);
		 List<Archives> archives=aservice.IndexShow(0,pager);
	long archivescount= pager.getTotal();
	PageHelper.startPage(pager.getPage(), pager.getSize());
	List<type> types=tservice.FindAll();
	long typecount= ((Page) types).getTotal();
	pager.setTotal((int)archivescount);
	years=archives.stream().map(a->{c.setTime(a.getCreatedTime());  return c.get(Calendar.YEAR);}).collect(Collectors.toSet());
			model.addAttribute("archivescount", archivescount);
		model.addAttribute("archives", archives);
		model.addAttribute("typecount", typecount);
		model.addAttribute("pager", pager);
		model.addAttribute("years", years);
		return "/jsp/FilterIndex";
	}
}
