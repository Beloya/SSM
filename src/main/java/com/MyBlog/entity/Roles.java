package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Roles implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int R_Id;
private String RoleName;
private String description;
private int available;
private Date CreateDate;
private int CreatorId;
private List<Role_Permissions> LRP;



public List<Role_Permissions> getLRP() {
	return LRP;
}
public void setLRP(List<Role_Permissions> lRP) {
	LRP = lRP;
}



public int getR_Id() {
	return R_Id;
}
public void setR_Id(int r_Id) {
	R_Id = r_Id;
}
public String getRoleName() {
	return RoleName;
}
public void setRoleName(String roleName) {
	RoleName = roleName;
}

public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public int getAvailable() {
	return available;
}
public void setAvailable(int available) {
	this.available = available;
}
public Date getCreateDate() {
	return CreateDate;
}
public void setCreateDate(Date createDate) {
	CreateDate = createDate;
}
public int getCreatorId() {
	return CreatorId;
}
public void setCreatorId(int creatorId) {
	CreatorId = creatorId;
}

}
