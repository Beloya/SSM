package com.MyBlog.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.MyBlog.Logger.LoggerUtil;
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
}
