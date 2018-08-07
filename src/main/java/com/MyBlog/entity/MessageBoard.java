package com.MyBlog.entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;



public class MessageBoard implements Serializable,Cloneable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 主键 */
    @Id
    @GeneratedValue
    private Integer mbid ;
    /** 内容 */
    private String context ;
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
    private Integer mbpid;
    private String name;
    private Users users;
    private List<MessageBoard> childmblist;
    /** 主键 */
    public Integer getMbid(){
        return this.mbid;
    }
    /** 主键 */
    public void setMbid(Integer mbid){
        this.mbid = mbid;
    }
    /** 内容 */
    public String getContext(){
        return this.context;
    }
    /** 内容 */
    public void setContext(String context){
        this.context = context;
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
	public Integer getMbpid() {
		return mbpid;
	}
	public void setMbpid(Integer mbpid) {
		this.mbpid = mbpid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public List<MessageBoard> getChildmblist() {
		return childmblist;
	}
	public void setChildmblist(List<MessageBoard> childmblist) {
		this.childmblist = childmblist;
	}
    
    
}