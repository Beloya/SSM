package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;

public class archivesFlag implements Serializable,Cloneable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 主键 */

    private Integer id ;
    /** 文章ID */
    private Integer aid ;
    /** 标签ID */
    private Integer fid ;
    private String fdescribe ;
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
    private Flag flag;
    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 文章ID */
    public Integer getAid(){
        return this.aid;
    }
    /** 文章ID */
    public void setAid(Integer aid){
        this.aid = aid;
    }
    /** 标签ID */
    public Integer getFid(){
        return this.fid;
    }
    /** 标签ID */
    public void setFid(Integer fid){
        this.fid = fid;
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
 
	public String getFdescribe() {
		return fdescribe;
	}
	public void setFdescribe(String fdescribe) {
		this.fdescribe = fdescribe;
	}
	public Flag getFlag() {
		return flag;
	}
	public void setFlag(Flag flag) {
		this.flag = flag;
	}

    
}