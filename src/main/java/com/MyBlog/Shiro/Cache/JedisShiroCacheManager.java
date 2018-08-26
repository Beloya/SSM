package com.MyBlog.Shiro.Cache;

import org.apache.shiro.cache.Cache;

import com.MyBlog.cache.RedisUtil;


public class JedisShiroCacheManager implements ShiroCacheManager{
	 private RedisUtil redisutil;
	public <K, V> Cache<K, V> getCache(String name) {
		
		   return new JedisShiroCache<K, V>(name, getRedisutil());
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
