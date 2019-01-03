package com.MyBlog.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

public  class MybaitsRedisCacheTransfer {
	   @Autowired
	    public  void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
	        MybaitsRedisCache.setJedisConnectionFactory(jedisConnectionFactory);
	    }

	  
		public void setMybaitsKey(String mybaitsKey) {

			 MybaitsRedisCache.setMybaitsKey(mybaitsKey);
			
		}
	public String getMybaitsKey() {
		return MybaitsRedisCache.getMybaitsKey();
	}

}
