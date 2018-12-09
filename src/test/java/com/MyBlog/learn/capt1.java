package com.MyBlog.learn;

public class capt1 {
public int revese(int x) {
	int result=0,tail=0;
	while(x!=0) {
		tail=x%10;
	     x=(x-tail)/10; 
	     System.out.println(((result+tail)*10));
		if(((result+tail)*10)<Integer.MIN_VALUE||Integer.MAX_VALUE<((result+tail)*10))
			return 0;
			result=((result+tail)*10);

	}
return result/10;
}
}
