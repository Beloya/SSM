package com.MyBlog.learn;

import java.util.ArrayList;
import java.util.List;


public class ConcreteSubject implements Subject {
	/** 我的当前关注列表 */
    List<Observer> Observers = new ArrayList<Observer>();
    /** 我的博客名 ：求关注 */
    private static final String blogName = "Beloya";
	public void resisterObserver(Observer o) {
	
		 Observers.add(o);
	}

	public void removeObserver(Observer o) {
		 Observers.remove(o);
		
	}

	public void notifyObserver(String blogName,String articleName) {
	    for (Observer o:Observers) {
	    	o.update(blogName, articleName);
        }
		
	}
	/**
     * 这里是发布文章，触发通知事件
     */
    public void publishArticle(String articleName){
    	notifyObserver(blogName,articleName);
    }


}
