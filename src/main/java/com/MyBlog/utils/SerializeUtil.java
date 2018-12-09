package com.MyBlog.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.MyBlog.Logger.LoggerUtil;

import io.protostuff.LinkedBuffer;
import io.protostuff.ProtobufIOUtil;
import io.protostuff.ProtostuffIOUtil;
import io.protostuff.Schema;
import io.protostuff.runtime.RuntimeSchema;
public class SerializeUtil {
	 static final Class<?> CLAZZ = SerializeUtil.class;
	 public static byte[] serialize(Object object) {
	
	        ObjectOutputStream oos = null;
	        ByteArrayOutputStream baos = null;
	        try {
	            // 序列化
	            baos = new ByteArrayOutputStream();
	            oos = new ObjectOutputStream(baos);
	            oos.writeObject(object);
	            byte[] bytes = baos.toByteArray();
	            return bytes;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	 
	    public static Object unserialize(byte[] bytes) {
	        ByteArrayInputStream bais = null;
	        try {
	            // 反序列化
	            bais = new ByteArrayInputStream(bytes);
	            ObjectInputStream ois = new ObjectInputStream(bais);
	            return ois.readObject();
	        } catch (Exception e) {
	 
	        }
	        return null;
	    }
	    public static <T> T deserialize(byte[] in, Class<T>...requiredType) {
	        Object rv = null;
	        ByteArrayInputStream bis = null;
	        ObjectInputStream is = null;
	        try {
	            if (in != null) {
	                bis = new ByteArrayInputStream(in);
	                is = new ObjectInputStream(bis);
	                rv = is.readObject();
	            }
	        } catch (Exception e) {
	        	 LoggerUtil.fmtError(CLAZZ,e, "serialize error %s", in);
	        } finally {
	            close(is);
	            close(bis);
	        }
	        return (T) rv;
	    }

	    private static void close(Closeable closeable) {
	        if (closeable != null)
	            try {
	                closeable.close();
	            } catch (IOException e) {
	            	 LoggerUtil.fmtError(CLAZZ, "close stream error");
	            }
	    }
	    public static <T> byte[]  ProtostuffSerializer(Object o){
	    	  Schema schema = RuntimeSchema.getSchema(o.getClass());
	    	  byte[] b=null;
	    	  b=ProtobufIOUtil.toByteArray(o, schema, LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
	    	  System.out.println("序列化结果:"+b);
	          return b;
	    }
	    public static <T> T Protostuffdeserializer(byte[] bytes, Class<T> clazz) {
	    	 
	        T obj = null;
	        try {
	            obj = clazz.newInstance();
	            Schema schema = RuntimeSchema.getSchema(obj.getClass());
	            ProtostuffIOUtil.mergeFrom(bytes, obj, schema);
	        } catch (InstantiationException e) {
	            e.printStackTrace();
	        } catch (IllegalAccessException e) {
	            e.printStackTrace();
	        }
	 
	        return obj;
	    }

}
