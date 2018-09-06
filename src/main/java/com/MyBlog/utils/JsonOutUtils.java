package com.MyBlog.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletResponse;

import com.MyBlog.Logger.LoggerUtil;
import com.alibaba.fastjson.JSONObject;

public class JsonOutUtils {

	public static void out(ServletResponse hresponse, Map<String, String> resultMap)
			throws IOException {
		try {
			hresponse.setCharacterEncoding("UTF-8");
			PrintWriter out = hresponse.getWriter();
			out.println(JSONObject.toJSONString(resultMap).toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			LoggerUtil.error(JsonOutUtils.class, "输出JSON异常，可以忽略。");
		}
	}
}
