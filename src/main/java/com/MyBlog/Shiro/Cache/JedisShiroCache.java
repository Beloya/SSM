package com.MyBlog.Shiro.Cache;

import java.util.Collection;
import java.util.Set;


import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.cache.RedisUtil;
import com.MyBlog.utils.SerializeUtil;
@SuppressWarnings("unchecked")
public class JedisShiroCache <K, V> implements Cache<K, V> {
	/**
	 * 为了不和其他的缓存混淆，采用追加前缀方式以作区分
	 */
    private   String REDIS_SHIRO_CACHE ="shiro_cache";
	private   int DB_INDEX;
	private int expire=90;

    private RedisUtil redisutil;
    
    private String name;
    static final Class<JedisShiroCache> SELF = JedisShiroCache.class;
    
    public JedisShiroCache(String name, RedisUtil redisutil) {
        this.name = name;
        this.redisutil = redisutil;
    }

    public JedisShiroCache() {
   super();
    }
	public void clear() throws CacheException {
		// TODO Auto-generated method stub
		
	}

	public V get(K key) throws CacheException {
		 byte[] byteKey = SerializeUtil.serialize(key);
	        byte[] byteValue = new byte[0];
	        try {
	        
	        	byteValue=redisutil.hget(SerializeUtil.serialize(REDIS_SHIRO_CACHE), byteKey);
		//System.out.println("JedisShiroGetCache:"+byteValue);
	        }
	        catch (Exception e) {
	        	MyLogger.error(SELF, e.getMessage());
			}
		return (V) SerializeUtil.deserialize(byteValue);
	}

	public Set<K> keys() {
		// TODO Auto-generated method stub
		return null;
	}

	public V put(K key, V value) throws CacheException {
		 V previos = get(key);
try {
	//System.out.println("JedisShiroSetCache:"+value);
	redisutil.hset(SerializeUtil.serialize(REDIS_SHIRO_CACHE),SerializeUtil.serialize(key), SerializeUtil.serialize(value),expire);
	
}catch (Exception e) {
	MyLogger.error(SELF, e.getMessage());
}
		return previos;
	}

	public V remove(K key) throws CacheException {
		 V previos = get(key);
		 try {
			 redisutil.hdel(SerializeUtil.serialize(REDIS_SHIRO_CACHE), SerializeUtil.serialize(key));
		} catch (Exception e) {
			MyLogger.error(SELF, e.getMessage());
		}
		return previos;
	}

	public int size() {
		  if (keys() == null)
	            return 0;
	        return keys().size();
	}

	public Collection<V> values() {
		// TODO Auto-generated method stub
		return null;
	}



	public String getREDIS_SHIRO_CACHE() {
		return REDIS_SHIRO_CACHE;
	}


	public void setREDIS_SHIRO_CACHE(String rEDIS_SHIRO_CACHE) {
		REDIS_SHIRO_CACHE = rEDIS_SHIRO_CACHE;
	}


	public int getDB_INDEX() {
		return DB_INDEX;
	}


	public void setDB_INDEX(int dB_INDEX) {
		DB_INDEX = dB_INDEX;
	}


	public RedisUtil getRedisutil() {
		return redisutil;
	}

	public void setRedisutil(RedisUtil redisutil) {
		this.redisutil = redisutil;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	   private String buildCacheKey(Object key) {
	        return REDIS_SHIRO_CACHE + getName() + ":" + key;
	    }

	public int getExpire() {
		return expire;
	}

	public void setExpire(int expire) {
		this.expire = expire;
	}
	   
}
