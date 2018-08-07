package com.MyBlog.entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;



public class Flag implements Serializable,Cloneable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 主键;自增 */

    private Integer fid ;
    /** 描述 */
    private String fdescribe ;
    /** 乐观锁 */
    private Integer revision ;
    /** 文章ID */
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

    /** 主键;自增 */
    public Integer getFid(){
        return this.fid;
    }
    /** 主键;自增 */
    public void setFid(Integer fid){
        this.fid = fid;
    }
    /** 描述 */

    /** 乐观锁 */
    public Integer getRevision(){
        return this.revision;
    }
    public String getFdescribe() {
		return fdescribe;
	}
	public void setFdescribe(String fdescribe) {
		this.fdescribe = fdescribe;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}


}