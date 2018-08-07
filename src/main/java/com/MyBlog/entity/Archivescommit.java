package com.MyBlog.entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;



public class Archivescommit implements Serializable,Cloneable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 主键;自增 */
  
    private String cid ;
    /** 内容;评论内容 */
    private String context ;
    /** 父主键;父评论 */
    private Integer pid ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建人 */
    private String createdBy ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新人 */
    private String updatedBy ;
    /** 更新时间 */
    private Date updatedTime ;
    /** 状态;1审核||0正常||-1失效 */
    private Integer status ;
    /** 文章ID */
    private Integer aid ;
    /** 主键;自增 */
    private Integer type ;
    /** 游客名 */
    private String name ;
    private Users users;
    private List<Archivescommit> childArchivescommit;
    
    public String getCid(){
        return this.cid;
    }
    /** 主键;自增 */
    public void setCid(String cid){
        this.cid = cid;
    }
    /** 内容;评论内容 */
    public String getContext(){
        return this.context;
    }
    /** 内容;评论内容 */
    public void setContext(String context){
        this.context = context;
    }
    /** 父主键;父评论 */
    public Integer getPid(){
        return this.pid;
    }
    /** 父主键;父评论 */
    public void setPid(Integer pid){
        this.pid = pid;
    }
    /** 乐观锁 */
    public Integer getRevision(){
        return this.revision;
    }
    /** 乐观锁 */
    public void setRevision(Integer revision){
        this.revision = revision;
    }
    /** 创建人 */
    public String getCreatedBy(){
        return this.createdBy;
    }
    /** 创建人 */
    public void setCreatedBy(String createdBy){
        this.createdBy = createdBy;
    }
    /** 创建时间 */
    public Date getCreatedTime(){
        return this.createdTime;
    }
    /** 创建时间 */
    public void setCreatedTime(Date createdTime){
        this.createdTime = createdTime;
    }
    /** 更新人 */
    public String getUpdatedBy(){
        return this.updatedBy;
    }
    /** 更新人 */
    public void setUpdatedBy(String updatedBy){
        this.updatedBy = updatedBy;
    }
    /** 更新时间 */
    public Date getUpdatedTime(){
        return this.updatedTime;
    }
    /** 更新时间 */
    public void setUpdatedTime(Date updatedTime){
        this.updatedTime = updatedTime;
    }
    /** 状态;1审核||0正常||-1失效 */
    public Integer getStatus(){
        return this.status;
    }
    /** 状态;1审核||0正常||-1失效 */
    public void setStatus(Integer status){
        this.status = status;
    }
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Archivescommit> getChildArchivescommit() {
		return childArchivescommit;
	}
	public void setChildArchivescommit(List<Archivescommit> childArchivescommit) {
		this.childArchivescommit = childArchivescommit;
	}

    
}
