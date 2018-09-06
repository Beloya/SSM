package com.MyBlog.learn;

public class GuavaMyBlog {
private String articleName;
private static final String blogName = "Beloya";
public String getArticleName() {
	return articleName;
}

public GuavaMyBlog(String articleName) {
	super();
	this.articleName = articleName;

}
public String getBlogName() {
	return blogName;
}
}
