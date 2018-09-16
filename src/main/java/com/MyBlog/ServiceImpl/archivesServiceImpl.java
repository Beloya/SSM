package com.MyBlog.ServiceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.MyBlog.Core.BlogInfoSignle;
import com.MyBlog.Dao.archivesFlagMapper;
import com.MyBlog.Dao.archivesMapper;
import com.MyBlog.Logger.LoggerUtil;
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Pager;
import com.MyBlog.entity.archives;
import com.MyBlog.entity.archivesFlag;
import com.MyBlog.utils.StringUtils;
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
	public List<archives> FindAll() {	
		return amapper.FindAll();
	}

	
	public archives FindById(int AID) {	
	return amapper.FindById(AID);
	}

	
	public int Addarchives(archives a,String Flag) {
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
		Blog blog= blogService.FindByUserName("Beloya");
		BlogInfoSignle.blogInfoSignle.setBlog(blog);
		 request.getServletContext().setAttribute("BlogInfo", blog);
			} catch (UnauthorizedException e) {
				throw new UnauthorizedException();
			
			}
		  catch (UnauthenticatedException e) {
			  throw new UnauthenticatedException();
			  
		}
		  
		return AID;
	}

	
	public void delete(int AID) {
		// TODO Auto-generated method stub
		amapper.delete(AID);
	}

	
	public archives SeeArchives(int AID) {
		archives a=amapper.FindById(AID);
		BlogInfoSignle.blogInfoSignle.incrementReadCount(a);
	
		return a;
	}
	public void UpdateReadCount() {
		archives a=null;
		a=new archives();
		ConcurrentHashMap<Integer, Integer> readcountmap=BlogInfoSignle.blogInfoSignle.getReadcountmap();
		for (java.util.Map.Entry<Integer, Integer> e: readcountmap.entrySet()) {
			a.setAid(e.getKey());
			a.setReadcount(e.getValue());
			amapper.readCountUp(a);
			BlogInfoSignle.blogInfoSignle.getReadcountmap().remove(e.getKey());
			LoggerUtil.INFO(getClass(), "更新阅读数：+"+a.getReadcount());
		}
	}

	public void Intorecovery(int AID) {
		archives a= amapper.FindById(AID);
		a.setStatus(-1);
		amapper.Update(a);
		
	}


	public void Update(archives a) {
		// TODO Auto-generated method stub
		amapper.Update(a);
	}


	public List<archives> FindArchives(int Status,Pager pager) {
		List<archives> archives=null,results=null;
		results=new ArrayList<archives>();
		PageHelper.startPage(pager.getPage(), pager.getSize());
		archives=amapper.FindByStatus(Status);
		long archivescount= ((Page) archives).getTotal();
		PageHelper.startPage(pager.getPage(), pager.getSize());
		pager.setTotal((int)archivescount);
		for (archives archive : archives) {
			archive.setContext(StringUtils.subStringHTML(archive.getContext(),600));
			results.add(archive);
		}
		return archives;
	}
	public List<archives> FindArchives(int Status) {
		List<archives> archives=null;
		
		
		archives=amapper.FindByStatus(Status);

		archives=new ArrayList<archives>();
		for (archives archive : archives) {
			archive.setContext(StringUtils.subStringHTML(archive.getContext(),500));
		
		}
		return archives;
	}

	public List<archives> FindcategoriesList(archives a) {
		
		return amapper.FindByParam(a);
	}

}
