package com.MyBlog.learn;

/**
 * 订阅者抽象接口
 * @author Beloya
 *
 */
public interface Observer {
	 /**
     * 观察小伙伴的抽象
     * @param blogName
     * @param articleName
     */
    void update(String blogName,String articleName);
}
