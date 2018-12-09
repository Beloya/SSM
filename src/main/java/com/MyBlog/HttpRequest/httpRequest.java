package com.MyBlog.HttpRequest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.CookiePolicy;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.MyBlog.entity.trainData;
import com.MyBlog.utils.SSLClientCustom;

public  class httpRequest {
    CloseableHttpClient httpClient = null;
    CloseableHttpResponse response = null;
    private Map<String,String> headers=null;
    protected boolean useMyHeader=false;
    CookieStore cookieStore = new BasicCookieStore();
    private BasicClientCookie cookie=null;
	protected HttpClientBuilder httpClientBuilder=null;


public  String DoGet(String url) {

    String result = "";
    try {
    	   HttpGet httpGet = new HttpGet(url);
    	 // httpGet.setHeader("Authorization", "Bearer da3efcbf-0845-4fe3-8aba-ee040be542c0");
    	   RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(35000).setConnectionRequestTimeout(35000)// 请求超时时间
                   .setSocketTimeout(60000)// 数据读取超时时间
                   .build();
    	   httpGet.setConfig(requestConfig);
    	   response = httpClient.execute(httpGet);
    	   HttpEntity entity = response.getEntity();
    	   result = EntityUtils.toString(entity);
    }
    catch (Exception e) {
    	 e.printStackTrace();
	}
  
    return result;
}
public void close() {
	  // 关闭资源
    if (null != response) {
        try {
            response.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    if (null != httpClient) {
        try {
            httpClient.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
public  String doPost(String url, Map<String, Object> paramMap) {

    String result = "";
    // 创建httpPost远程连接实例
    HttpPost httpPost = new HttpPost(url);
    // 配置请求参数实例
    RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(35000)// 设置连接主机服务超时时间
            .setConnectionRequestTimeout(35000)// 设置连接请求超时时间
            .setSocketTimeout(60000)// 设置读取数据连接超时时间
            .build();
    // 为httpPost实例设置配置
    httpPost.setConfig(requestConfig);
    // 设置请求头
    if(headers.isEmpty()||!useMyHeader) {
    httpPost.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"); // 设置请求头消息User-Agent
    httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    httpPost.setHeader("X-Requested-With", "XMLHttpRequest"); 
    }
    else {
    	Set<Entry<String, String>> entrySet =headers.entrySet();
    	  Iterator<Entry<String, String>> iterator = entrySet.iterator();
    	   while (iterator.hasNext()) {
               Entry<String, String> mapEntry = iterator.next();
               httpPost.setHeader(mapEntry.getKey(), mapEntry.getValue());
           }
    }
    
    //System.out.println("Cookies:"+cookieStore);
    // 封装post请求参数
    if (null != paramMap && paramMap.size() > 0) {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        // 通过map集成entrySet方法获取entity
        Set<Entry<String, Object>> entrySet = paramMap.entrySet();
        // 循环遍历，获取迭代器
        Iterator<Entry<String, Object>> iterator = entrySet.iterator();
        while (iterator.hasNext()) {
            Entry<String, Object> mapEntry = iterator.next();
            nvps.add(new BasicNameValuePair(mapEntry.getKey(), mapEntry.getValue().toString()));
        }

        // 为httpPost设置封装好的请求参数
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
    try {
        // httpClient对象执行post请求,并返回响应参数对象
    	response = httpClient.execute(httpPost);
        // 从响应对象中获取响应内容
        HttpEntity entity = response.getEntity();
        result = EntityUtils.toString(entity);
    } catch (ClientProtocolException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    } 
    return result;
}

public httpRequest useMyHeader(boolean h) {
	useMyHeader=h;
	return this;
}


public BasicClientCookie getCookie() {
	return cookie;
}
public httpRequest setCookie(BasicClientCookie cookie) {
	this.cookie = cookie;
	return this;
}
public Map<String, String> getHeaders() {
	return headers;
}
public void setHeaders(Map<String, String> headers) {
	this.headers = headers;
}
public void putHeaders(String key, String val) {
	headers.put(key, val);
}
public httpRequest useSSL()  {
	try {
		httpClientBuilder=SSLClientCustom.getHttpClinet(httpClientBuilder);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return this;
}
public static httpRequest create() {
	return new httpRequest();
}
public httpRequest Builder() {
httpClient=httpClientBuilder.build();
	return this;
}
public httpRequest custom() {
	HttpClientBuilder.create();
	return this;
}
}
