package com.MyBlog.Shiro.Cache;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.Destroyable;
import org.springframework.stereotype.Service;


@Service
public class CustomShiroCacheManager implements CacheManager, Destroyable {
	private ShiroCacheManager shiroCacheManager;
	public void destroy() throws Exception {
	
		shiroCacheManager.destroy();
	}

	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		
		 return shiroCacheManager.getCache(name);
	}

	public ShiroCacheManager getShiroCacheManager() {
		return shiroCacheManager;
	}

	public void setShiroCacheManager(ShiroCacheManager shiroCacheManager) {
		this.shiroCacheManager = shiroCacheManager;
	}

}
