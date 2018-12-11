package com.MyBlog.cache;


import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.data.redis.connection.jedis.JedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.utils.SerializeUtil;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;


public class MybaitsRedisCache implements Cache{

	//   private static final Logger logger = LoggerFactory.getLogger(MybaitsRedisCache.class);
	    public static JedisConnectionFactory jedisConnectionFactory;
       private static String MybaitsKey;
       JedisConnection connection = null;
       private static double readcachecount=0;
       private static double succescache=0;
		private final String id;
	    /**
	     * The {@code ReadWriteLock}.
	     */
	    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
	    public MybaitsRedisCache(final String id) {
	        if (id == null) {
	            throw new IllegalArgumentException("Cache instances require an ID");
	        }
	        MyLogger.debug(getClass(),("MybatisRedisCache:id=" + id));
	        this.id = id;
	    }
	    // 从连接池获取redis连接
	    public  Jedis getJedis(){
	        Jedis jedis = null;
	        connection = null;
	        try{
	        	
	        	  connection = (JedisConnection) jedisConnectionFactory.getConnection();
		          jedis=connection.getJedis();
		        
		         
	        } catch(Exception e){
	       
	        	recycleJedis(jedis);
	      
	        }
	        
	        return jedis;
	    }
	    
	    // 回收redis连接
	    public  void recycleJedis(Jedis jedis){
	        if(jedis != null){
	            try{
	                jedis.close();
	               // connection.close();
	            } catch(Exception e){
	            	
	            
	            	//jedis.close();
	            	
	            }
	        }        
	    }
	    public void clear()
	    {
	  
	        Jedis jedis = null;
	        try
	        {
	        	jedis=getJedis();
	         //  connection.select(DB_Index);
	        	jedis.del(SerializeUtil.serialize(MybaitsKey));
	         //   connection.flushAll();
	        }
	        catch (JedisConnectionException e)
	        {
	            e.printStackTrace();
	        }
	        finally
	        {
	        	recycleJedis(jedis);
	        }
	    }

	    public String getId()
	    {
	        return this.id;
	    }

	    @SuppressWarnings("unchecked")
		public Object getObject(Object key)
		{
	        Object result = null;
	        Jedis jedis = null;
	        long start = 0,end=0;
	        try
	        {
	        	start=System.currentTimeMillis();
	        	jedis =getJedis();
	         //   connection.select(DB_Index);
	        	byte[] b=jedis.hget(SerializeUtil.serialize(MybaitsKey),SerializeUtil.serialize(key));
	        	if(b==null) {
	        		MyLogger.INFO(getClass(), "缓存未命中,当前命中率为:"+(succescache/++readcachecount)*100+"%");
	        		
	        		return result;
	        	}
	            result = SerializeUtil.unserialize(b);
	

	  MyLogger.INFO(getClass(), "缓存命中,当前命中率为:"+(++succescache/++readcachecount)*100+"%");
	        }
	        catch (JedisConnectionException e)
	        {
	            e.printStackTrace();
	        }
	        finally
	        {
	        	end=System.currentTimeMillis();
	        	  MyLogger.INFO(getClass(), "读取缓存耗费时间:"+(end-start));
	        	recycleJedis(jedis);
	        }
	        return result;
	    }

	    public ReadWriteLock getReadWriteLock()
	    {
	        return this.readWriteLock;
	    }

	    public int getSize()
	    {
	        int result = 0;
	        Jedis jedis = null;
	        try
	        {
	        	jedis = getJedis();
	          //  connection.select(DB_Index);
	            result = Integer.valueOf(jedis.dbSize().toString());
	        }
	        catch (JedisConnectionException e)
	        {
	            e.printStackTrace();
	        }
	        finally
	        {
	        	recycleJedis(jedis);
	        }
	        return result;
	    }

	    public void putObject(Object key, Object value)
	    {

	        Jedis jedis = null;
	        try
	        {
	        	jedis = getJedis();
	            jedis.hset(SerializeUtil.serialize(MybaitsKey),SerializeUtil.serialize(key), SerializeUtil.serialize(value));
	        }
	        catch (JedisConnectionException e)
	        {
	            e.printStackTrace();
	        }
	        finally
	        {
	        	recycleJedis(jedis);
	        }
	    }

	    public Object removeObject(Object key)
	    {

	        Object result = null;
	        Jedis jedis = null;
	        try
	        {
	        	jedis = getJedis();
	           // connection.select(DB_Index);
	            RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
	            result =jedis.hdel(SerializeUtil.serialize(MybaitsKey),serializer.serialize(key));
	        }
	        catch (JedisConnectionException e)
	        {
	            e.printStackTrace();
	        }
	        finally
	        {
	        	recycleJedis(jedis);
	        }
	        return result;
	    }

	    public synchronized static void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
	    	MybaitsRedisCache.jedisConnectionFactory= jedisConnectionFactory;
	    	
	    }

		public static String getMybaitsKey() {
			return MybaitsKey;
		}

		public static void setMybaitsKey(String mybaitsKey) {
			MybaitsKey =mybaitsKey;
		}


}
