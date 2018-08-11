package com.MyBlog.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;



public class Users implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int U_Id;
private int RId;
private String userName;
private String UserImg;
private String passWord;
private int CreatorId;
private Date CreateDate;
private int DataLevel;
private String Email;
private int Sex;
private String salt;
private int locked;
private Roles Role;
private Role_Permissions Role_Permissions;
private List<Roles> LRole;
private List<Role_Permissions> LRP;



public Roles getRole() {
	return Role;
}
public void setRole(Roles role) {
	Role = role;
}
public Role_Permissions getRole_Permissions() {
	return Role_Permissions;
}
public void setRole_Permissions(Role_Permissions role_Permissions) {
	Role_Permissions = role_Permissions;
}
public int getLocked() {
	return locked;
}
public void setLocked(int locked) {
	this.locked = locked;
}


public int getU_Id() {
	return U_Id;
}
public void setU_Id(int u_Id) {
	U_Id = u_Id;
}

public String getUserImg() {
	return UserImg;
}
public void setUserImg(String userImg) {
	UserImg = userImg;
}
public int getRId() {
	return RId;
}
public void setRId(int rId) {
	RId = rId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
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
public int getDataLevel() {
	return DataLevel;
}
public void setDataLevel(int dataLevel) {
	DataLevel = dataLevel;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public int getSex() {
	return Sex;
}
public void setSex(int sex) {
	Sex = sex;
}
public String getSalt() {
	return salt;
}
public void setSalt(String salt) {
	this.salt = salt;
}
public List<Roles> getLRole() {
	return LRole;
}
public void setLRole(List<Roles> lRole) {
	LRole = lRole;
}
public List<Role_Permissions> getLRP() {
	return LRP;
}
public void setLRP(List<Role_Permissions> lRP) {
	LRP = lRP;
}



}
