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
import com.MyBlog.entity.Archives;
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
			LoggerUtil.INFO(getClass(), "更新阅读数：+"+a.getReadcount());
		}
	}

	public void Intorecovery(int AID) {
		Archives a= amapper.FindById(AID);
		a.setStatus(-1);
		amapper.Update(a);
		
	}


	public void Update(Archives a) {
		// TODO Auto-generated method stub
		amapper.Update(a);
	}


	public List<Archives> FindArchives(int Status,Pager pager) {
		List<Archives> archives=null,results=null;
		results=new ArrayList<Archives>();
		PageHelper.startPage(pager.getPage(), pager.getSize());
		archives=amapper.FindByStatus(Status);
		long archivescount= ((Page) archives).getTotal();
		PageHelper.startPage(pager.getPage(), pager.getSize());
		pager.setTotal((int)archivescount);
		for (Archives archive : archives) {
			archive.setContext(StringUtils.subStringHTML(archive.getContext(),600));
			results.add(archive);
		}
		return archives;
	}
	public List<Archives> FindArchives(int Status) {
		List<Archives> archives=null;
		
		
		archives=amapper.FindByStatus(Status);

		archives=new ArrayList<Archives>();
		for (Archives archive : archives) {
			archive.setContext(StringUtils.subStringHTML(archive.getContext(),500));
		
		}
		return archives;
	}

	public List<Archives> FindcategoriesList(Archives a) {
		
		return amapper.FindByParam(a);
	}

}
