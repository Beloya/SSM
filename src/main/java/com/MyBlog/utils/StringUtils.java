package com.MyBlog.utils;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.MyBlog.Logger.LoggerUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import sun.misc.BASE64Decoder;

public class StringUtils extends org.apache.commons.lang.StringUtils{
	//登录页面
		static  String LOGIN_URL ;
		//踢出登录提示
		 static String KICKED_OUT ;
		//没有权限提醒
		 static String UNAUTHORIZED ;
	
	/**
	 * 一次性判断多个或单个对象为空。
	 * @param objects
	 * @author zhou-baicheng
	 * @return 只要有一个元素为Blank，则返回true
	 */
	static JSONObject jsonObject=new JSONObject();
	public static boolean isBlank(Object...objects){
		Boolean result = false ;
		for (Object object : objects) {
			if(null == object || "".equals(object.toString().trim()) 
					|| "null".equals(object.toString().trim())){
				result = true ; 
				break ; 
			}
		}
		return result ; 
	}
	
	public static String getRandom(int length) {
		String val = "";
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			// 输出字母还是数字
			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			// 字符串
			if ("char".equalsIgnoreCase(charOrNum)) {
				// 取得大写字母还是小写字母
				int choice = random.nextInt(2) % 2 == 0 ? 65 : 97;
				val += (char) (choice + random.nextInt(26));
			} else if ("num".equalsIgnoreCase(charOrNum)) { // 数字
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val.toLowerCase();
	}
	/**
	 * 判断字符是否含有非法字符
	 * @param str 字符内容
	 * @return if has IllegalCharacter is true
	 */
	
	
	public static boolean isIllegalCharacter(String str) {
		String[] SqlStr2 = {"*","'","-",";","or","+","//","/","%","#","=","?","<",">","{","}","\\"};//特殊字符
		   for (int i = 0; i < SqlStr2.length; i++) {
		         if (str.indexOf(SqlStr2[i]) >= 0) {
		            return true;
		         }
		     }
		   return false;
	}
	/**
	 * 一次性判断多个或单个对象不为空。
	 * @param objects
     * @author zhou-baicheng
	 * @return 只要有一个元素不为Blank，则返回true
	 */
	public static boolean isNotBlank(Object...objects){
		return !isBlank(objects);
	}
	public static boolean isBlank(String...objects){
		Object[] object = objects ;
		return isBlank(object);
	}
	public static boolean isNotBlank(String...objects){
		Object[] object = objects ;
		return !isBlank(object);
	}
	public static boolean isBlank(String str){
		Object object = str ;
		return isBlank(object);
	}
	public static boolean isNotBlank(String str){
		Object object = str ;
		return !isBlank(object);
	}
	/**
	 * 判断一个字符串在数组中存在几个
	 * @param baseStr
	 * @param strings
	 * @return
	 */
	public static int indexOf(String baseStr,String[] strings){
		
		if(null == baseStr || baseStr.length() == 0 || null == strings)
			return 0;
		
		int i = 0;
		for (String string : strings) {
			boolean result = baseStr.equals(string);
			i = result ? ++i : i;
		}
		return i ;
	}
	/**
	 * 判断一个字符串是否为JSONObject,是返回JSONObject,不是返回null
	 * @param args
	 * @return
	 */
	public static JSONObject isJSONObject(String args) {
		JSONObject result = null ;
		if(isBlank(args)){
			return result ;
		}
		try {
			return jsonObject.parseObject(args.trim());
		} catch (Exception e) {
			return result ;
		}
	}
	/**
	 * 判断一个字符串是否为JSONArray,是返回JSONArray,不是返回null
	 * @param args
	 * @return
	 */
	public static JSONArray isJSONArray(Object args) {
		JSONArray result = new JSONArray();
		if(isBlank(args)){
			return null ;
		}
		if(args instanceof  JSONArray){
			
			JSONArray arr = (JSONArray)args;
			for (Object json : arr) {
				if(json != null && json instanceof JSONObject){
					result.add(json);
					continue;
				}else{
					result.add(json);
				}
			}
			return result;
		}else{
			return null ;
		}
		
	}
	public static String trimToEmpty(Object str){
	  return (isBlank(str) ? "" : str.toString().trim());
	}
	
	/**
	 * 将 Strig  进行 BASE64 编码
	 * @param str [要编码的字符串]
	 * @param bf  [true|false,true:去掉结尾补充的'=',false:不做处理]
	 * @return
	 */
    public static String getBASE64(String str,boolean...bf) { 
       if (StringUtils.isBlank(str)) return null; 
       String base64 = new sun.misc.BASE64Encoder().encode(str.getBytes()) ;
       //去掉 '='
       if(isBlank(bf) && bf[0]){
    	   base64 = base64.replaceAll("=", "");
       }
       return base64;
    }

    /** 将 BASE64 编码的字符串 s 进行解码**/
    public static String getStrByBASE64(String s) { 
       if (isBlank(s)) return ""; 
       BASE64Decoder decoder = new BASE64Decoder(); 
       try { 
          byte[] b = decoder.decodeBuffer(s); 
          return new String(b); 
       } catch (Exception e) { 
          return ""; 
       }
    }
    /**
     * 把Map转换成get请求参数类型,如 {"name"=20,"age"=30} 转换后变成 name=20&age=30
     * @param map
     * @return
     */
    public static String mapToGet(Map<? extends Object,? extends Object> map){
    	String result = "" ;
    	if(map == null || map.size() ==0){
    		return result ;
    	}
    	Set<? extends Object> keys = map.keySet();
    	for (Object key : keys ) {
    		result += ((String)key + "=" + (String)map.get(key) + "&");
		}
    	
    	return isBlank(result) ? result : result.substring(0,result.length() - 1);
    }
    /**
     * 把一串参数字符串,转换成Map 如"?a=3&b=4" 转换为Map{a=3,b=4}
     * @param args
     * @return
     */
    public static Map<String, ? extends Object> getToMap(String args){
    	if(isBlank(args)){
    		return null ;
    	}
    	args = args.trim();
    	//如果是?开头,把?去掉
    	if(args.startsWith("?")){
    		args = args.substring(1,args.length());
    	}
    	String[] argsArray = args.split("&");
    	
    	Map<String,Object> result = new HashMap<String,Object>();
    	for (String ag : argsArray) {
			if(!isBlank(ag) && ag.indexOf("=")>0){
				
				String[] keyValue = ag.split("=");
				//如果value或者key值里包含 "="号,以第一个"="号为主 ,如  name=0=3  转换后,{"name":"0=3"}, 如果不满足需求,请勿修改,自行解决.
					
				String key = keyValue[0];
				String value = "" ;
				for (int i = 1; i < keyValue.length; i++) {
					value += keyValue[i]  + "=";
				}
				value = value.length() > 0 ? value.substring(0,value.length()-1) : value ;
				result.put(key,value);
				
			}
		}
    	
    	return result ;
    }
    
    /**
	 * 转换成Unicode
	 * @param str
	 * @return
	 */
    public static String toUnicode(String str) {
        String as[] = new String[str.length()];
        String s1 = "";
        for (int i = 0; i < str.length(); i++) {
        	int v = str.charAt(i);
        	if(v >=19968 && v <= 171941){
	            as[i] = Integer.toHexString(str.charAt(i) & 0xffff);
	            s1 = s1 + "\\u" + as[i];
        	}else{
        		 s1 = s1 + str.charAt(i);
        	}
        }
        return s1;
     }
    /**
     * 合并数据
     * @param v
     * @return
     */
    public static String merge(Object...v){
    	StringBuffer sb = new StringBuffer();
    	for (int i = 0; i < v.length; i++) {
    		sb.append(v[i]);
		}
    	return sb.toString() ; 
    }
    /**
     * 字符串转urlcode
     * @param value
     * @return
     */
    public static String strToUrlcode(String value){
    	try {
			value = java.net.URLEncoder.encode(value,"utf-8");
			return value ;
		} catch (UnsupportedEncodingException e) {
			LoggerUtil.error(StringUtils.class, "字符串转换为URLCode失败,value:" + value,e);
			e.printStackTrace();
			return null;
		}    
    }
    /**
     * urlcode转字符串
     * @param value
     * @return
     */
    public static String urlcodeToStr(String value){
    	try {
			value = java.net.URLDecoder.decode(value,"utf-8");
			return value ;
		} catch (UnsupportedEncodingException e) {
			LoggerUtil.error(StringUtils.class, "URLCode转换为字符串失败;value:" + value,e);
			e.printStackTrace();
			return null;
		}  
    }
    /**
     * 判断字符串是否包含汉字
     * @param txt
     * @return
     */
    public static Boolean containsCN(String txt){
    	if(isBlank(txt)){
    		return false;
    	}
    	for (int i = 0; i < txt.length(); i++) { 

    		String bb = txt.substring(i, i + 1); 

    		boolean cc = java.util.regex.Pattern.matches("[\u4E00-\u9FA5]", bb);
    		if(cc)
    		return cc ;
    	}
		return false;
    }
    /**
     * 去掉HTML代码
     * @param news
     * @return
     */
    public static String removeHtml(String news) {
      String s = news.replaceAll("amp;", "").replaceAll("<","<").replaceAll(">", ">");
      
      Pattern pattern = Pattern.compile("<(span)?\\sstyle.*?style>|(span)?\\sstyle=.*?>", Pattern.DOTALL);
      Matcher matcher = pattern.matcher(s);
      String str = matcher.replaceAll("");
      
      Pattern pattern2 = Pattern.compile("(<[^>]+>)",Pattern.DOTALL);
      Matcher matcher2 = pattern2.matcher(str);
      String strhttp = matcher2.replaceAll(" ");
      
      
      String regEx = "(((http|https|ftp)(\\s)*((\\:)|：))(\\s)*(//|//)(\\s)*)?"
         + "([\\sa-zA-Z0-9(\\.|．)(\\s)*\\-]+((\\:)|(:)[\\sa-zA-Z0-9(\\.|．)&%\\$\\-]+)*@(\\s)*)?"
         + "("
         + "(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])"
         + "(\\.|．)(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)"
         + "(\\.|．)(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)"
         + "(\\.|．)(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])"
         + "|([\\sa-zA-Z0-9\\-]+(\\.|．)(\\s)*)*[\\sa-zA-Z0-9\\-]+(\\.|．)(\\s)*[\\sa-zA-Z]*"
         + ")"
         + "((\\s)*(\\:)|(：)(\\s)*[0-9]+)?"
         + "(/(\\s)*[^/][\\sa-zA-Z0-9\\.\\,\\?\\'\\\\/\\+&%\\$\\=~_\\-@]*)*";
      Pattern p1 = Pattern.compile(regEx,Pattern.DOTALL);
      Matcher matchhttp = p1.matcher(strhttp);
      String strnew = matchhttp.replaceAll("").replaceAll("(if[\\s]*\\(|else|elseif[\\s]*\\().*?;", " ");
      
      
      Pattern patterncomma = Pattern.compile("(&[^;]+;)",Pattern.DOTALL);
      Matcher matchercomma = patterncomma.matcher(strnew);
      String strout = matchercomma.replaceAll(" ");
      String answer = strout.replaceAll("[\\pP‘’“”]", " ")
        .replaceAll("\r", " ").replaceAll("\n", " ")
        .replaceAll("\\s", " ").replaceAll("　", "");

      
      return answer;
    }
    /** 
     * 按子节长度截取字符串(支持截取带HTML代码样式的字符串)<br> 
     * 如：<span>中国人发在线</span> 当截取2个字节得到的结果是：<span>中国 
     *  
     * @param param 
     *            将要截取的含html代码的字符串参数 
     * @param length 
     *            截取的字节长度 
     * @return 返回截取后的字符串 
  
     * @date 2010-7-15 
     */  
    public static String subStringHTML(String param, int length) {  
        StringBuffer result = new StringBuffer();  
        int n = 0;  
        char temp;  
        boolean isCode = false; // 是不是HTML代码  
        boolean isHTML = false; // 是不是HTML特殊字符,如   
        for(int i = 0; i < param.length(); i++) {  
            temp = param.charAt(i);  
            if(temp == '<') {  
                isCode = true;  
            }else if(temp == '&') {  
                isHTML = true;  
            }else if(temp == '>' && isCode) {  
                n = n - 1;  
                isCode = false;  
            }else if(temp == ';' && isHTML) {  
                isHTML = false;  
            }  
            if(!isCode && !isHTML) {  
                n = n + 1;  
                // UNICODE码字符占两个字节  
                if((temp + "").getBytes().length > 1) {  
                    n = n + 1;  
                }  
            }  
            result.append(temp);  
            if(n >= length) {  
                break;  
            }  
        }  
        return fix(result.toString());  
    }  
    /** 
     * 补全HTML代码<br> 
     * 如：<span>中国 ---> <span>中国</span> 
     *  
     * @param str 
     * @return 
 
     * @date 2010-7-15 
     */  
    private static String fix(String str) {  
        StringBuffer fixed = new StringBuffer(); // 存放修复后的字符串  
        TagsList[] unclosedTags = getUnclosedTags(str);  
        // 生成新字符串  
        for(int i = unclosedTags[0].size() - 1; i > -1; i--) {  
            fixed.append("<" + unclosedTags[0].get(i) + ">");  
        }  
        fixed.append(str);  
        for(int i = unclosedTags[1].size() - 1; i > -1; i--) {  
            String s = null;  
            if((s = unclosedTags[1].get(i)) != null) {  
                fixed.append("</" + s + ">");  
            }  
        }  
        return fixed.toString();  
    }  
    private static TagsList[] getUnclosedTags(String str) {  
        StringBuffer temp = new StringBuffer(); // 存放标签  
        TagsList[] unclosedTags = new TagsList[2];  
        unclosedTags[0] = new TagsList(); // 前不闭合，如有</div>而前面没有<div>  
        unclosedTags[1] = new TagsList(); // 后不闭合，如有<div>而后面没有</div>  
        boolean flag = false; // 记录双引号"或单引号'  
        char currentJump = ' '; // 记录需要跳过''还是""  
        char current = ' ', last = ' '; // 当前 & 上一个  
        // 开始判断  
        for(int i = 0; i < str.length();) {  
            current = str.charAt(i++); // 读取一个字符  
            if(current == '"' || current == '\'') {  
                flag = flag ? false : true; // 若为引号，flag翻转  
                currentJump = current;  
            }  
            if(!flag) {  
                if(current == '<') { // 开始提取标签  
                    current = str.charAt(i++);  
                    if(current == '/') { // 标签的闭合部分，如</div>  
                        current = str.charAt(i++);  
                        // 读取标签  
                        while(i < str.length() && current != '>') {  
                            temp.append(current);  
                            current = str.charAt(i++);  
                        }  
                        // 从tags_bottom移除一个闭合的标签  
                        if(!unclosedTags[1].remove(temp.toString())) { // 若移除失败，说明前面没有需要闭合的标签  
                            unclosedTags[0].add(temp.toString()); // 此标签需要前闭合  
                        }  
                        temp.delete(0, temp.length()); // 清空temp  
                    }else { // 标签的前部分，如<div>  
                        last = current;  
                        //&& current != ' ' 
                        while(i < str.length() && current != ' ' && current != '>') {  
                            temp.append(current);  
                            last = current;  
                            current = str.charAt(i++);  
                        }  
                        // 已经读取到标签，跳过其他内容，如<div id=test>跳过id=test  
                        while(i < str.length() && current != '>') {  
                            last = current;  
                            current = str.charAt(i++);  
                            if(current == '"' || current == '\'') { // 判断引号  
                                flag = flag ? false : true;  
                                currentJump = current;  
                                if(flag) { // 若引号不闭合，跳过到下一个引号之间的内容  
                                    while(i < str.length() && str.charAt(i++) != currentJump)  
                                        ;  
                                    current = str.charAt(i++);  
                                    flag = false;  
                                }  
                            }  
                        }  
                        if(last != '/' && current == '>') // 判断这种类型：<TagName />  
                            unclosedTags[1].add(temp.toString());  
                        temp.delete(0, temp.length());  
                    }  
                }  
            }else {  
                while(i < str.length() && str.charAt(i++) != currentJump)  
                    ; // 跳过引号之间的部分  
                flag = false;  
            }  
        }  
        return unclosedTags;  
    }  
    /**
	 * 把数组的空数据去掉
	 * @param array
	 * @return
	 */
	public static List<String> array2Empty(String[] array){
		List<String> list = new ArrayList<String>();
		for (String string : array) {
			if(StringUtils.isNotBlank(string)){
				list.add(string);
			}
		}
		return list;
	}
	
	/**
	 * 把数组转换成set
	 * @param array
	 * @return
	 */
	public static Set<?> array2Set(Object[] array) {
		Set<Object> set = new TreeSet<Object>();
		for (Object id : array) {
			if(null != id){
				set.add(id);
			}
		}
		return set;
	}
	/**
	 * serializable toString
	 * @param serializable
	 * @return
	 */
	public static String toString(Serializable serializable) {
		if(null == serializable){
			return null;
		}
		try {
			return (String)serializable;
		} catch (Exception e) {
			return serializable.toString();
		}
	}

	public static String getLOGIN_URL() {
		return LOGIN_URL;
	}

	public  void setLOGIN_URL(String lOGIN_URL) {
		LOGIN_URL = lOGIN_URL;
	}

	public static String getKICKED_OUT() {
		return KICKED_OUT;
	}

	public  void setKICKED_OUT(String kICKED_OUT) {
		KICKED_OUT = kICKED_OUT;
	}

	public static String getUNAUTHORIZED() {
		return UNAUTHORIZED;
	}

	public  void setUNAUTHORIZED(String uNAUTHORIZED) {
		UNAUTHORIZED = uNAUTHORIZED;
	}
   
}
