package com.MyBlog.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class GenericUtils implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
	    GenericUtils.applicationContext = applicationContext;
	}

	 /**
     * 获取对象
     *
     * @param name
     * @return Object 一个以所给名字注册的bean的实例
     * @throws BeansException
     */
    public static <T> T getBean(String name) throws BeansException {
        return (T) applicationContext.getBean(name);
    }
 
    /**
     * 获取类型为requiredType的对象
     *
     * @param clz
     * @return
     * @throws BeansException
     */
    public static <T> T getBean(Class<T> clz) throws BeansException {
        @SuppressWarnings("unchecked")
        T result = (T) applicationContext.getBean(clz);
        return result;
    }

	
}
