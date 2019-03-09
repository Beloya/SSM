package com.MyBlog.utils;

import java.util.Map;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringUtils implements ApplicationContextAware {
	  private static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		SpringUtils.applicationContext = arg0;
		
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}
	  @SuppressWarnings("unchecked")
	public static <T> T getBean(String beanName) {
	        if(applicationContext.containsBean(beanName)){
	            return (T) applicationContext.getBean(beanName);
	        }else{
	            return null;
	        }
	    }
	  public static <T> Map<String, T> getBeansOfType(Class<T> baseType){
	        return applicationContext.getBeansOfType(baseType);
	    }

}
