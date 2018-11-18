package com.MyBlog.Core;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.transaction.Synchronization;

import com.MyBlog.entity.Blog;
import com.MyBlog.entity.Syslink;
import com.MyBlog.Socket.ChatServic;
import com.MyBlog.entity.Archives;
/**
 * 
 * @author Beloya
 * 博客初始数据内容
 */

public enum  BlogInfoSignle {
	//博客静态实例
blogInfoSignle;
private   Blog blog=null;
private  Syslink syslink=null;
private  List<Syslink> menulink=null;
private  List<Syslink> communionlink=null;
private   HashMap<String,Syslink> foundlink=null;
private   ConcurrentHashMap<Integer, Integer> readcountmap=new ConcurrentHashMap<Integer, Integer>();
private   boolean inited=false;

private BlogInfoSignle(){

}
public void init(Blog blog,List<Syslink> syslinks) {
	this.blog=blog;
	menulink=new ArrayList<Syslink>();
	foundlink=new HashMap<String, Syslink>();
	communionlink=new ArrayList<Syslink>();
	for (Syslink syslink : syslinks) {
		switch (syslink.getType()) {
		case 0:
			menulink.add(syslink);
			break;
		case 3:
			communionlink.add(syslink);
			break;
			default:
				break;
		}
		foundlink.put(syslink.getName(), syslink);
	}
	this.inited=true;
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
public ConcurrentHashMap<Integer, Integer> getReadcountmap() {
	return readcountmap;
}
public void incrementReadCount(Archives a) {
	int incr=0;
	if(readcountmap.containsKey(a.getAid())){
		incr=readcountmap.get(a.getAid())+1;
		readcountmap.put(a.getAid(), incr);
	}
	else{
		readcountmap.put(a.getAid(), 1);
	}
}


}
