package com.MyBlog.Controller;


import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MyBlog.Socket.ChatServic;

@Controller
public class WeChatController {
	private  static ReentrantLock Wechatlock = new ReentrantLock(); 
   public static Set<String> websocktPostion=new HashSet<>();
	@RequestMapping("WeChat")
	public String WeChatShow(HttpServletRequest request,HttpServletResponse response,Model model) {

		StringBuilder Name=null;
		
		Name=new StringBuilder("御坂");
		

	synchronized(websocktPostion) {
		for(int i=1000;i<1100;i++) {
			if(!ChatServic.webSocketSet.containsKey("御坂"+i)&&!websocktPostion.contains("御坂"+i)) {
				Name.append(i);
				websocktPostion.add(Name.toString().trim());
				break;
			}
			
		}
		
		model.addAttribute("chatName", Name.toString().trim());
	}
		return "/jsp/lab/WeChat";
	}
}
