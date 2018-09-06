package com.MyBlog.ServiceImpl;

import java.util.List;

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
import com.MyBlog.Service.archivesService;
import com.MyBlog.Service.blogService;
import com.MyBlog.entity.Blog;
import com.MyBlog.entity.archives;
import com.MyBlog.entity.archivesFlag;

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
		amapper.readCountUp(a);
		return a;
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


	public List<archives> FindArchives(int Status) {
		// TODO Auto-generated method stub
		return amapper.FindByStatus(Status);
	}


	public List<archives> FindcategoriesList(archives a) {
		
		return amapper.FindByParam(a);
	}

}
