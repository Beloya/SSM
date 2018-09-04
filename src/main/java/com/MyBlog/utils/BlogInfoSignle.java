package com.MyBlog.utils;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Syslink;

public enum  BlogInfoSignle {
blogInfoSignle;
private   Blog blog=null;
private  Syslink syslink=null;
private  List<Syslink> menulink=null;
private  List<Syslink> communionlink=null;
private  HashMap<String,Syslink> foundlink=null;
private  boolean inited=false;
private BlogInfoSignle(){

}
public void init(Blog blog,List<Syslink> syslinks) {
	this.blog=blog;
	menulink=new ArrayList<>();
	foundlink=new HashMap<>();
	communionlink=new ArrayList<>();
	for (Syslink syslink : syslinks) {
		switch (syslink.getType()) {
		case 0:
			menulink.add(syslink);
			break;
		case 1:
			foundlink.put(syslink.getName(), syslink);
			break;
		case 3:
			communionlink.add(syslink);
			break;
		}
	}
	this.inited=true;
}
public Blog getblog(){

	return blog;
}
public Blog getBlog() {
	return blog;
}
public void setBlog(Blog blog) {
	this.blog = blog;
}
public  Syslink getSyslink() {
	return syslink;
}
public  void setSyslink(Syslink syslink) {
	this.syslink = syslink;
}



public  List<Syslink> getMenulink() {
	return menulink;
}
public  void setMenulink(List<Syslink> menulink) {
	this.menulink = menulink;
}
public  List<Syslink> getCommunionlink() {
	return communionlink;
}
public  void setCommunionlink(List<Syslink> communionlink) {
	this.communionlink = communionlink;
}
public  HashMap<String,Syslink> getFoundlink() {
	return foundlink;
}
public  void setFoundlink(HashMap<String,Syslink> foundlink) {
	this.foundlink = foundlink;
}
public  boolean isInited() {

	return inited;
}
public  void setInited(boolean inited) {
	this.inited = inited;
}


}
