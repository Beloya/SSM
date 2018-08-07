package com.MyBlog.entity;

import java.io.Serializable;

public class area implements Serializable{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int codeid;
private int parentid;
private String cityName;
public int getCodeid() {
	return codeid;
}
public void setCodeid(int codeid) {
	this.codeid = codeid;
}
public int getParentid() {
	return parentid;
}
public void setParentid(int parentid) {
	this.parentid = parentid;
}
public String getCityName() {
	return cityName;
}
public void setCityName(String cityName) {
	this.cityName = cityName;
}

}
