package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;

public class Role_Permissions implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int RP_Id;
private int RId;
private String permission;
private int CreatorId;
private Date CreateDate;
private int available;


public int getRP_Id() {
	return RP_Id;
}
public void setRP_Id(int rP_Id) {
	RP_Id = rP_Id;
}
public int getRId() {
	return RId;
}
public void setRId(int rId) {
	RId = rId;
}
public String getPermission() {
	return permission;
}
public void setPermission(String permission) {
	this.permission = permission;
}
public int getCreatorId() {
	return CreatorId;
}
public void setCreatorId(int creatorId) {
	CreatorId = creatorId;
}
public Date getCreateDate() {
	return CreateDate;
}
public void setCreateDate(Date createDate) {
	CreateDate = createDate;
}
public int getAvailable() {
	return available;
}
public void setAvailable(int available) {
	this.available = available;
}

}
