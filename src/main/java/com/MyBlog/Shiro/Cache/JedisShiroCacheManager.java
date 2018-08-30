package com.MyBlog.Shiro.Cache;

import org.apache.shiro.cache.Cache;
import org.springframework.stereotype.Service;

import com.MyBlog.cache.RedisUtil;

@Service
public class JedisShiroCacheManager implements ShiroCacheManager{
	 private RedisUtil redisutil;
	public <K, V> Cache<K, V> getCache(String name) {
		
		   return new JedisShiroCache<K, V>(name, redisutil);
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public RedisUtil getRedisutil() {
		return redisutil;
	}

	public void setRedisutil(RedisUtil redisutil) {
		this.redisutil = redisutil;
	}

}
