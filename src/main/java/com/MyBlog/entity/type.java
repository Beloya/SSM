package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;

public class type implements Serializable{
	private static final long serialVersionUID = 1L;
	/** 主键;自增 */

    private Integer tid ;
    /** 描述 */
    private String tdescribe ;
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
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTdescribe() {
		return tdescribe;
	}
	public void setTdescribe(String tdescribe) {
		this.tdescribe = tdescribe;
	}
	public Integer getRevision() {
		return revision;
	}
	public void setRevision(Integer revision) {
		this.revision = revision;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public Date getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
    
}
