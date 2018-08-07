package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;


public class Blog implements Serializable,Cloneable{
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 主键 */
 
    private Integer id ;
    /** 博客名 */
    private String blogname ;
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
    /** 标题 */
    private String title ;
    private Users users;
private String messagesay;
private String headerskin;
private Integer archivescount;
private Integer typecount;
    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 博客名 */
    public String getBlogname(){
        return this.blogname;
    }
    /** 博客名 */
    public void setBlogname(String blogname){
        this.blogname = blogname;
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
    /** 标题 */
    public String getTitle(){
        return this.title;
    }
    /** 标题 */
    public void setTitle(String title){
        this.title = title;
    }
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getMessagesay() {
		return messagesay;
	}
	public void setMessagesay(String messagesay) {
		this.messagesay = messagesay;
	}
	public String getHeaderskin() {
		return headerskin;
	}
	public void setHeaderskin(String headerskin) {
		this.headerskin = headerskin;
	}
	public Integer getArchivescount() {
		return archivescount;
	}
	public void setArchivescount(Integer archivescount) {
		this.archivescount = archivescount;
	}
	public Integer getTypecount() {
		return typecount;
	}
	public void setTypecount(Integer typecount) {
		this.typecount = typecount;
	}

    
}
