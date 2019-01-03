package com.MyBlog.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletResponse;

import com.MyBlog.Logger.MyLogger;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class JsonUtils {

	public static void out(ServletResponse hresponse, Map<String, String> resultMap)
			throws IOException {
		try {
			hresponse.setCharacterEncoding("UTF-8");
			PrintWriter out = hresponse.getWriter();
			out.println(JSONObject.toJSONString(resultMap).toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MyLogger.error(JsonUtils.class, "输出JSON异常，可以忽略。");
		}
	}
	
	public static Object trainJsonQuery(String data) {
	    List<Map<String,String>> Multimap =new ArrayList<>(); 
	    String mapstr=null,tempdata=null,queryResult=null,nstr="--";
		JSONObject jsonObjectone = null,queryResultJson=null;
		try {
	    jsonObjectone=JSONObject.parseObject(data);
        tempdata=jsonObjectone.getString("data");
        jsonObjectone= JSONObject.parseObject(tempdata);
	    mapstr=jsonObjectone.getString("map");
	    JSONObject map=JSONObject.parseObject(mapstr);
	    queryResult=jsonObjectone.getString("result");
    	queryResult=queryResult.substring(2, queryResult.length()-2);
    	String qz[]=queryResult.split("\",\"");
    	Map<String,Object> addressmap=(Map<String,Object>)map;
    	Map<String,String> cmap=null;
    	for(int i=0;i<qz.length;i++) {
    		cmap=new HashMap<>();
    		String qs[]=qz[i].split("\\|");
    		cmap.put("secretStr",qs[0]);
    		cmap.put("train_no",qs[2]);
    		cmap.put("station_train_code",qs[3]);
    		cmap.put("start_station_telecode",qs[4]);
    		cmap.put("end_station_telecode",qs[5]);
    		cmap.put("from_station_telecode",qs[6]);
    		cmap.put("to_station_telecode",qs[7]);
    		cmap.put("start_time",qs[8]);
    		cmap.put("arrive_time",qs[9]);
    		cmap.put("lishi",qs[10]);
    		cmap.put("canWebBuy",qs[11]);
    		cmap.put("yp_info",qs[12]);
    		cmap.put("start_train_date",qs[13]);
    		cmap.put("train_seat_feature",qs[14]);
    		cmap.put("location_code",qs[15]);
    		cmap.put("from_station_no",qs[16]);
    		cmap.put("to_station_no",qs[17]);
    		cmap.put("is_support_card",qs[18]);
    		cmap.put("controlled_train_flag",qs[19]);
    		cmap.put("gg_num",qs[20].equals("")?nstr:qs[20]);
    		cmap.put("gr_num",qs[21].equals("")?nstr:qs[21]);
    		cmap.put("qt_num",qs[22].equals("")?nstr:qs[22]);
    		cmap.put("rw_num",qs[23].equals("")?nstr:qs[23]);
    		cmap.put("rz_num",qs[24].equals("")?nstr:qs[24]);
    		cmap.put("tz_num",qs[25].equals("")?nstr:qs[25]);
    		cmap.put("wz_num",qs[26].equals("")?nstr:qs[26]);
    		cmap.put("yb_num",qs[27].equals("")?nstr:qs[27]);
    		cmap.put("yw_num",qs[28].equals("")?nstr:qs[28]);
    		cmap.put("yz_num",qs[29].equals("")?nstr:qs[29]);
    		cmap.put("ze_num",qs[30].equals("")?nstr:qs[30]);
    		cmap.put("zy_num",qs[31].equals("")?nstr:qs[31]);
    		cmap.put("swz_num",qs[32].equals("")?nstr:qs[32]);
    		cmap.put("srrb_num",qs[33].equals("")?nstr:qs[33]);
    		cmap.put("yp_ex",qs[34]);
    		cmap.put("seat_types",qs[35]);
    		cmap.put("exchange_train_flag",qs[36]);
    		cmap.put("from_station_name",(String) addressmap.get(qs[6]));
    		cmap.put("to_station_name",(String) addressmap.get(qs[7]));
    		Multimap.add(cmap);
    	}
	    return Multimap;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		finally {
			Multimap =null;mapstr=null;tempdata=null;queryResult=null;nstr=null;
			jsonObjectone = null;queryResultJson=null;
		}
	}
	
	
	
}
