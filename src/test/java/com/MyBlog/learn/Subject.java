package com.MyBlog.learn;



/**
 * 抽象主题接口
 * @author Beloya
 *
 */
public interface Subject {

	//注册方法，新增关注的小伙伴
	 void resisterObserver(Observer o);
	//注销方法，取消关注的小伙伴
	    void removeObserver(Observer o);
	    //声明抽象通知小伙伴方法
	    void notifyObserver(String blogName,String articleName);
}
