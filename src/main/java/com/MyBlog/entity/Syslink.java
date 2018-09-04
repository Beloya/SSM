package com.MyBlog.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Syslink implements Serializable,Cloneable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 5934789088035244302L;
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
    /** 主键 */
  
    private Integer menuId ;
    /** 名称 */
    private String name ;
    /** 链接 */
    private String link ;
    /** 备注 */
    private String remarks ;
    /** 排序 */
    private Integer order ;
    /** 父级 */
    private Integer pmId ;
    /** 类别;类别;0-菜单1-链接2-后台管理 */
    private Integer type ;
    private List<Syslink> pmenu=null;
    /** 状态;1审核||0正常||-1失效 */
    private Integer status ;
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
    /** 主键 */
    public Integer getMenuId(){
        return this.menuId;
    }
    /** 主键 */
    public void setMenuId(Integer menuId){
        this.menuId = menuId;
    }
    /** 名称 */
    public String getName(){
        return this.name;
    }
    /** 名称 */
    public void setName(String name){
        this.name = name;
    }
    /** 链接 */
    public String getLink(){
        return this.link;
    }
    /** 链接 */
    public void setLink(String link){
        this.link = link;
    }
    /** 备注 */
    public String getRemarks(){
        return this.remarks;
    }
    /** 备注 */
    public void setRemarks(String remarks){
        this.remarks = remarks;
    }
    /** 排序 */
    public Integer getOrder(){
        return this.order;
    }
    /** 排序 */
    public void setOrder(Integer order){
        this.order = order;
    }
    /** 父级 */
    public Integer getPmId(){
        return this.pmId;
    }
    /** 父级 */
    public void setPmId(Integer pmId){
        this.pmId = pmId;
    }
    /** 类别;类别;0-菜单1-链接2-后台管理 */
    public Integer getType(){
        return this.type;
    }
    /** 类别;类别;0-菜单1-链接2-后台管理 */
    public void setType(Integer type){
        this.type = type;
    }
	public List<Syslink> getPmenu() {
		return pmenu;
	}
	public void setPmenu(List<Syslink> pmenu) {
		this.pmenu = pmenu;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
    
}