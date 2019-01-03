package com.MyBlog.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Table(name="url_permissions")
public class UrlPermissions implements Serializable,Cloneable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -8724449087567551500L;
	/** 主键 */
    @Id
    @GeneratedValue
    private Integer upid ;
    /** 地址 */
    private String url ;
    /** 所需资源 */
    private String check ;
    /** 资源类型;0角色1配置2验证 */
    private Integer type ;
    public static int roleType=0;
    public static int configType=1;
    public static int normalType=2;
    /** 排序字段 */
    private String orderColumn;
    /** 排序类型 */
    private String orderType;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建人 */
    private Integer createdBy ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新人 */
    private Integer updatedBy ;
    /** 更新时间 */
    private Date updatedTime ;
    /** 数据状态;-1删除0正常1审核 */
    private Integer datalevel ;
    
    /** 主键 */
    public Integer getUpid(){
        return this.upid;
    }
    /** 主键 */
    public void setUpid(Integer upid){
        this.upid = upid;
    }
    /** 地址 */
    public String getUrl(){
        return this.url;
    }
    /** 地址 */
    public void setUrl(String url){
        this.url = url;
    }
    /** 所需资源 */
    public String getCheck(){
        return this.check;
    }
    /** 所需资源 */
    public void setCheck(String check){
        this.check = check;
    }
    /** 资源类型;0角色1配置 */
    public Integer getType(){
        return this.type;
    }
    /** 资源类型;0角色1配置 */
    public void setType(Integer type){
        this.type = type;
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
    public Integer getCreatedBy(){
        return this.createdBy;
    }
    /** 创建人 */
    public void setCreatedBy(Integer createdBy){
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
    public Integer getUpdatedBy(){
        return this.updatedBy;
    }
    /** 更新人 */
    public void setUpdatedBy(Integer updatedBy){
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
	public Integer getDatalevel() {
		return datalevel;
	}
	public void setDatalevel(Integer datalevel) {
		this.datalevel = datalevel;
	}
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
    
}