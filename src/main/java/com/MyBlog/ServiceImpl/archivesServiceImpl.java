package com.MyBlog.ServiceImpl;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.Dao.archivesFlagMapper;
import com.MyBlog.Dao.archivesMapper;
import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Pager;
import com.MyBlog.entity.Users;
import com.MyBlog.entity.Archives;
import com.MyBlog.entity.Archivesvisibility;
import com.MyBlog.entity.archivesFlag;
import com.MyBlog.utils.myStringUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class archivesServiceImpl implements archivesService{

	@Resource
	private archivesMapper amapper;
	@Resource
	private archivesFlagMapper afmapper;
	 @Resource
		private blogService blogService;
	public List<Archives> FindAll() {	
		return amapper.FindAll();
	}

	
	public Archives FindById(int AID) {	
	return amapper.FindById(AID);
	}

	
	public int Addarchives(Archives a,String Flag) {
		 HttpServletRequest request = null;
		archivesFlag aFlag=new archivesFlag();
		Subject subject=SecurityUtils.getSubject();
	int AID=-1;
		String[] fc=Flag.split(",");
		  try {
				subject.checkPermission("普通:文章:create");
				amapper.Addarchives(a);
				AID=a.getAid();
		if(AID!=-1){
			for(int i=0;i<fc.length;i++){
			aFlag.setAid(AID);
			aFlag.setFid(Integer.parseInt(fc[i]));
			aFlag.setCreatedBy(a.getCreatedBy());	
			aFlag.setCreatedTime(a.getCreatedTime());
		afmapper.AddarchivesFlag(aFlag);
			}
		}
		 request=((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			} catch (UnauthorizedException e) {
				throw new UnauthorizedException();
			
			}
		  catch (UnauthenticatedException e) {
			  throw new UnauthenticatedException();
			  
		}
		  
		return AID;
	}

	
	public void delete(int AID) {
	
		amapper.delete(AID);
	}

	
	public Archives SeeArchives(int AID) {
		Archives a=amapper.FindById(AID);
		BlogInfoSignle.blogInfoSignle.incrementReadCount(a);
	
		return a;
	}
	public void UpdateReadCount() {
		Archives a=null;
		a=new Archives();
		ConcurrentHashMap<Integer, Integer> readcountmap=BlogInfoSignle.blogInfoSignle.getReadcountmap();
		for (java.util.Map.Entry<Integer, Integer> e: readcountmap.entrySet()) {
			a.setAid(e.getKey());
			a.setReadcount(e.getValue());
			amapper.readCountUp(a);
			BlogInfoSignle.blogInfoSignle.getReadcountmap().remove(e.getKey());
			MyLogger.INFO(getClass(), "更新阅读数：+"+a.getReadcount());
		}
	}

	public void Intorecovery(int AID) {
		Archives a= amapper.FindById(AID);
		a.setStatus(-1);
		amapper.Update(a);
		
	}


	public void Update(Archives a) {
		amapper.Update(a);
	}


	public List<Archives> IndexShow(int Status,Pager pager) {
		List<Archives> archivelist=null;
		Archives archives=new Archives();
		Integer vid=null;
		
		Users user=(Users) SecurityUtils.getSubject().getPrincipal();
		Blog blog=BlogInfoSignle.blogInfoSignle.getBlog();
		if(user!=null) {
	 vid=user.getUserName().equals(Optional.ofNullable(blog.getCreatedBy()).orElse("notfoundblog"))?null:Archivesvisibility.pub;
		}
		archives.setStatus(Status);
		archives.setVid(vid);
		
		PageHelper.startPage(pager.getPage(), pager.getSize());
		archivelist=amapper.FindByParam(archives);
		long archivescount= ((Page) archivelist).getTotal();
		PageHelper.startPage(pager.getPage(), pager.getSize());
		pager.setTotal((int)archivescount);
		archivelist.parallelStream().peek(archive->{
	archive.setContext(myStringUtils.subStringHTML(archive.getContext(),600));
}).collect(Collectors.toList());

		return archivelist;
	}
	public List<Archives> FindArchives(int Status) {
		List<Archives> archives=null;
		
		
		archives=amapper.FindByStatus(Status);

		archives=archives.parallelStream().peek(archive->{
			archive.setContext(myStringUtils.subStringHTML(archive.getContext(),600));
		}).collect(Collectors.toList());
		return archives;
	}

	public List<Archives> FindcategoriesList(Archives a) {
		
		return amapper.FindByParam(a);
	}

}
