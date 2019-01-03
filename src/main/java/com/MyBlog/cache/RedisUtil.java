package com.MyBlog.cache;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Shiro.Session.JedisShiroSessionRepository;
import com.MyBlog.utils.SerializeUtil;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.Transaction;

public class RedisUtil {

	
	    // 计数器的过期时间默认2天
	    private  int countExpireTime = 1*24*3600; 
	 //   private  Logger logger = Logger.getLogger(RedisUtil.class);
		private int expire;
	    public static  JedisConnection connection = null;
	    public static JedisConnectionFactory jedisConnectionFactory;

	
	    // 从连接池获取redis连接
	    public  Jedis getJedis(){
	        Jedis jedis = null;
	        connection = null;
	        try{
	        	
	        	  connection = (JedisConnection) jedisConnectionFactory.getConnection();
		          jedis=connection.getJedis();
		        
		         
	        } catch(Exception e){
	        	MyLogger.error(this.getClass(),"获取自定义连接池异常",e);
	        	recycleJedis(jedis);
	        }
	        
	        return jedis;
	    }
	    //获取连接后选择数据库
	    public  Jedis getJedis(int DB_INDEX){
	        Jedis jedis = null;
	        connection = null;
	        try{
	        	
	        	  connection = (JedisConnection) jedisConnectionFactory.getConnection();
		          jedis=connection.getJedis();
		          jedis.select(DB_INDEX);
		        
		         
	        } catch(Exception e){
	        	MyLogger.error(this.getClass(),"获取选择缓存库连接异常",e);
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
	            	MyLogger.error(this.getClass(),"关闭连接异常",e);
	            
	            	//jedis.close();
	            	
	            }
	        }        
	    }
	    /**
	     * 添加sorted set
	     *
	     * @param key
	     * @param value
	     * @param score
	     */
	    public void zadd(String key, String value, double score) {
	        Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        jedis.zadd(key, score, value);
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			} 
	    }
	    /**
	     * 返回指定位置的集合元素,0为第一个元素，-1为最后一个元素
	     * @param key
	     * @param start
	     * @param end
	     * @return
	     */
	    public Set<String> zrange(String key, int start, int end) {
	        Jedis jedis =null;
	        try {
	        	jedis= getJedis();
	        Set<String> set = jedis.zrange(key, start, end);
	        return set;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	     return null;
	    }

	    /**
	     * 获取给定区间的元素，原始按照权重由高到低排序
	     * @param key
	     * @param start
	     * @param end
	     * @return
	     */
	    public Set<String> zrevrange(String key, int start, int end) {
	        Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        Set<String> set = jedis.zrevrange(key, start, end);
	        
	        return set;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	        return null;
	    }
	    
	    /**
	     * 添加对应关系，命令用于同时将多个 field-value (字段-值)对设置到哈希表中。此命令会覆盖哈希表中已存在的字段。
	     *
	     * @param key
	     * @param map 对应关系
	     * @return 状态，成功返回OK
	     */
	    public String hmset( byte [] key, Map< byte[],  byte[]> hash) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        String s = jedis.hmset(key, hash);
	    
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	        return null;
	    }
	    /**
	     * 删除对应关系
	     *
	     * @param key
	     * @param map 对应关系
	     * @return 状态，成功返回OK
	     */
	    public long hdel(byte [] key, byte [] fields) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        long s = jedis.hdel(key, fields);
	    
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	//System.out.println("RedisDel:key="+SerializeUtil.deserialize(key)+" value="+SerializeUtil.deserialize(fields));
	        	recycleJedis(jedis);
			}
	        return 0;
	    }
	    
	    /**
	     * 添加对应关系，如果字段已经存在于哈希表中，旧值将被覆盖。
	     *
	     * @param key
	     * @param map 对应关系
	     * @return 状态，成功返回OK
	     */
	    public long hset(byte []key, byte []field,byte []value,Integer expire) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        	// System.out.println("RedisSet:key="+SerializeUtil.deserialize(key)+" field="+SerializeUtil.deserialize(field)+" value="+SerializeUtil.deserialize(value));
	        Long s = jedis.hset(key, field, value);
	       if(expire!=null) {
	    	   jedis.expire(key, expire);
	       }
	       else {
	    	   jedis.expire(key, this.expire);
	    	   
	       }
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	
	        	recycleJedis(jedis);
			}
	        return 0;
	    }
	    
	    /**
	     * 返回哈希表中，一个或多个给定字段的值。
	     *
	     * @param key
	     * @param map 对应关系
	     * @return 状态，成功返回OK
	     */
	    public List<byte[]> hmget (byte [] key,byte [] fields) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        List<byte[]> s = jedis.hmget(key, fields);
	    
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	        return null;
	    }
	    public byte[] hget (byte [] key,byte [] field) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        byte[] s = jedis.hget(key, field);
	    //	System.out.println("RedisGet:key="+SerializeUtil.deserialize(key)+" value="+SerializeUtil.deserialize(field)+" value="+SerializeUtil.deserialize(s));
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        
	        	recycleJedis(jedis);
			}
	        return null;
	    }
	    
	    public Long HLEN(byte [] key) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        Long s = jedis.hlen(key);
	    
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	        return null;
	    }
	    
	    /**
	     * 向List头部追加记录
	     *
	     * @param key
	     * @param value
	     * @return 记录总数
	     */
	    public long rpush(String key, String value) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	        long count = jedis.rpush(key, value);
	       
	        return count;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	        return 0;
	    }
	    /**
	     * 删除
	     *
	     * @param key
	     * @return
	     */
	    public long del(int dbIndex,String key) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis(dbIndex);
	        long s = jedis.del(key);
	        MyLogger.fmtDebug(getClass(), "删除Session结果：%s" , s);
	        return s;
	        }
	        catch (Exception e) {
	        	MyLogger.error(getClass(), "", e);
			}
	        finally {
	        	recycleJedis(jedis);
			}
	        return 0;
	    }
	    public byte[] get(int dbIndex,byte[] key) {
	        byte[] value = null;
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis(dbIndex);
	       
	            value = jedis.get(key);
	      //   	System.out.println("GET key:"+SerializeUtil.unserialize(key)+" value:"+SerializeUtil.unserialize(value));
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return value;
	    }
	    /**
	     * get value from redis
	     * @param key
	     * @return
	     */
	    public String get(String key) {
	        String value=null;
	        Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	            value = jedis.get(key);
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return value;
	    }
	 
	    /**
	     * set 
	     * @param key
	     * @param value
	     * @return
	     */
	    public byte[] set(int dbIndex,byte[] key, byte[] value, int expireTime) {
	    	   Jedis jedis = null;
		        try {
		        	jedis=getJedis(dbIndex);
	            jedis.set(key, value);
	      //  	System.out.println("SET key:"+SerializeUtil.unserialize(key)+" value:"+SerializeUtil.unserialize(value));
	            if (expire != 0) {
	                jedis.expire(key, expire);
	            }
	            else{
	            	  jedis.expire(key, this.expire);
	            }
	        } finally {
	        	recycleJedis(jedis);
	        }
		       
	        return value;
	    }
	    /**
	     * set 
	     * @param key
	     * @param value
	     * @return
	     */
	    public String set(String key,String value) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	            jedis.set(key, value);
	            if (this.expire == 0) {
	                jedis.expire(key, this.expire);
	            }
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return value;
	    }
	 
	    /**
	     * set 
	     * @param key
	     * @param value
	     * @param expire
	     * @return
	     */
	    public byte[] set(byte[] key, byte[] value, int expire) {
	    	Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	            jedis.set(key, value);
	            if (expire != 0) {
	                jedis.expire(key, expire);
	            }
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return value;
	    }
	    /**
	     * set 
	     * @param key
	     * @param value
	     * @param expire
	     * @return
	     */
	    public String set(String key,String value, int expire) {
	    	  Jedis jedis = null;
		        try {
		        	jedis=getJedis();
	            jedis.set(key, value);
	            if (expire != 0) {
	                jedis.expire(key, expire);
	            }
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return value;
	    }
	    /**
	     * flush
	     */
	    public void flushDB() {
	    	 Jedis jedis = null;
		        try {
		        	jedis=getJedis();
	            jedis.flushDB();
	        } finally {
	         	recycleJedis(jedis);
	        }
	    }
	 
	    /**
	     * size
	     */
	    public Long dbSize() {
	        Long dbSize = 0L;
	        Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	            dbSize = jedis.dbSize();
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return dbSize;
	    }
	 
	    /**
	     * keys
	     * @param regex
	     * @return
	     */
	    public Set<byte[]> keys(String pattern) {
	        Set<byte[]> keys = null;
	        Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	            keys = jedis.keys(pattern.getBytes());
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return keys;
	    }
	    public Set<byte[]> keys(byte[] key) {
	        Set<byte[]> keys = null;
	        Jedis jedis = null;
	        try {
	        	jedis=getJedis();
	            keys = jedis.keys(key);
	        } finally {
	        	recycleJedis(jedis);
	        }
	        return keys;
	    }
	    public void del(int dbIndex, byte[] key) {
	    	 Jedis jedis = null;
		        try {
		        	jedis=getJedis(dbIndex);
		        	 Long result = jedis.expire(key, 0);
	            MyLogger.fmtDebug(getClass(), "删除Session结果：%s" , result);
	            System.out.println("删除Session结果："+result);
	        } finally {
	        	recycleJedis(jedis);
	        }
	    }
	    public  void setex(int dbIndex,byte[] key, byte[] value, int expire) {
			Jedis jedis = null;
	  
			try {
				jedis=getJedis();
		System.out.println("SET "+"key:"+SerializeUtil.unserialize(key)+" value:"+SerializeUtil.unserialize(value));
				jedis.setex(key, expire, value);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	recycleJedis(jedis);
	        }
			
		} 

		public Collection<Session> AllSession(int dbIndex, String redisShiroSession) throws Exception {
			Jedis jedis = null;
	    
	        Set<Session> sessions = new HashSet<Session>();
			try {
	            jedis = getJedis(dbIndex);           
	            Set<byte[]> byteKeys = keys(SerializeUtil.serialize((JedisShiroSessionRepository.REDIS_SHIRO_ALL)));  
	            if (byteKeys != null && byteKeys.size() > 0) {  
	                for (byte[] bs : byteKeys) {  
	                	//String bsstr=bs.toString();
   	
	                	List<byte[]> byt = null;
	                	byt=jedis.hvals(bs);  
	                	Session session=null;
	                	if(byt!=null)
	                	session=SerializeUtil.deserialize(byt.get(0), Session.class);
	                     if(session instanceof Session){
	                    	 sessions.add(session);  
	                     }
	                }  
	            }  
	        } catch (Exception e) {
	            throw e;
	        } finally {
	            recycleJedis(jedis);
	        }
	        return sessions;
		}
	    
	    
	    public int getExpire() {
			return expire;
		}
		public void setExpire(int expire) {
			this.expire = expire;
		}
		public synchronized  void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
	    	RedisUtil.jedisConnectionFactory= jedisConnectionFactory;   	
	    }
}
