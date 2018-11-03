package com.MyBlog.entity;

import java.util.HashMap;
import java.util.List;

public class JsonData {

	private int code;
	private String msg;
	private int errocode;
	private String erromsg;
	private List<HashMap<String,Object>> data;
	//成功返回码
	public static final int successcode=0;
	//系统错误返回码
	public static final int systemerrcode=500;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getErrocode() {
		return errocode;
	}
	public void setErrocode(int errocode) {
		this.errocode = errocode;
	}
	public String getErromsg() {
		return erromsg;
	}
	public void setErromsg(String erromsg) {
		this.erromsg = erromsg;
	}
	public List<HashMap<String, Object>> getData() {
		return data;
	}
	public void setData(List<HashMap<String, Object>> data) {
		this.data = data;
	}

	
	
}
