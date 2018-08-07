package com.MyBlog.entity;

import java.io.Serializable;

public class Pager implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1812404864698392867L;
	private int page = 1;
	private int size = 7;
	private int total = 0;// 总记录数
	private int pages = 0;// 总页数
    private String rule;
    private String rule1;
    private String rule2;
	public Pager(String rule,String rule1) {
		this.rule=rule;
		this.rule1=rule1;
	}

	public Pager(int page, int size) {
		super();
		this.page = page;
		this.size = size;
	}
	public Pager(String rule, String rule1,int size) {
		super();
		this.rule=rule;
		this.rule1=rule1;
		this.size=size;
	}
public Pager() {
	
}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;

		this.pages = this.total % size == 0 ? this.total / size : this.total / size + 1;
	}

	public int getPages() {
		return pages;
	}

	public int getStartIndex() {
		return (page - 1) * size;
	}

	public int getEndIndex() {
		return size;
	}

	public int getPrePage() {
		int prePage = page - 1 < 1 ? 1 : page - 1;
		return prePage;
	}

	public int getNextPage() {
		int nextPage = page + 1 > pages ? pages : page+1;
		return nextPage;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getRule1() {
		return rule1;
	}

	public void setRule1(String rule1) {
		this.rule1 = rule1;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public String getRule2() {
		return rule2;
	}

	public void setRule2(String rule2) {
		this.rule2 = rule2;
	}




	
	
}
