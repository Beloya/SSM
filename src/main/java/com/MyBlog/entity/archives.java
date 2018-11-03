package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Archives implements Serializable,Comparable<Archives> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	  private Integer aid ;
	    /** 标题 */
	    private String title ;
	    /** 内容 */
	    private String context ;
	    /** 类型  */
	    private Integer type ;
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
	    /** 阅读数 */
	    private Integer readcount ;
	    /** 标签;外键 */
	    private Integer flag ;
	    /** 可见性;外键 */
	    private Integer vid ;
	    private List<Flag> flags;
	    private List<archivesFlag> archivesflags;
	    private Archivesvisibility archivesvisibility;
	    private type etype;
	    /** 主键;自增 */
	    public Integer getAid(){
	        return this.aid;
	    }
	    /** 主键;自增 */
	    public void setAid(Integer aid){
	        this.aid = aid;
	    }
	    /** 标题 */
	    public String getTitle(){
	        return this.title;
	    }
	    /** 标题 */
	    public void setTitle(String title){
	        this.title = title;
	    }
	    /** 内容 */
	    public String getContext(){
	        return this.context;
	    }
	    /** 内容 */
	    public void setContext(String context){
	        this.context = context;
	    }
	    /** 类型 */
	    public Integer getType(){
	        return this.type;
	    }
	    /** 类型 */
	    public void setType(int type){
	        this.type = type;
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
	    /** 阅读数 */
	    public Integer getReadcount(){
	        return this.readcount;
	    }
	    /** 阅读数 */
	    public void setReadcount(Integer readcount){
	        this.readcount = readcount;
	    }
	    /** 标签;外键 */
	    public Integer getFlag(){
	        return this.flag;
	    }
	    /** 标签;外键 */
	    public void setFlag(Integer flag){
	        this.flag = flag;
	    }
	    /** 可见性;外键 */
	    public Integer getVid(){
	        return this.vid;
	    }
	    /** 可见性;外键 */
	    public void setVid(Integer vid){
	        this.vid = vid;
	    }
	
	

		public List<Flag> getFlags() {
			return flags;
		}
		public void setFlags(List<Flag> flags) {
			this.flags = flags;
		}
		public List<archivesFlag> getArchivesflags() {
			return archivesflags;
		}
		public void setArchivesflags(List<archivesFlag> archivesflags) {
			this.archivesflags = archivesflags;
		}
		public Archivesvisibility getArchivesvisibility() {
			return archivesvisibility;
		}
		public void setArchivesvisibility(Archivesvisibility archivesvisibility) {
			this.archivesvisibility = archivesvisibility;
		}
	
		public type getEtype() {
			return etype;
		}
		public void setEtype(type etype) {
			this.etype = etype;
		}
		@Override
		public int compareTo(Archives o) {
			// TODO Auto-generated method stub

			return this.readcount - o.readcount;
		}
	 

}
