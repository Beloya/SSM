package com.MyBlog.ServiceImpl;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Service.TrainService;
import com.MyBlog.entity.Users;


/**
 * 
 * @author Beloya
 *
 */

@Service("TrainBuy")
public class TrainBuyService extends TrainService {
	/**
	 * 获取当前用户
	 */
	@Override
	public trainRequest getUserSession() {
		String username = null;
		trainRequest trainRequest = null;
		Users Principaluser = null;
		Subject subject = SecurityUtils.getSubject();
		Object Principal = subject.getPrincipal();
		if (Principal != null) {
			Principaluser = (Users) Principal;
			username = Principaluser.getUserName();
			trainRequest = (trainRequest) requestInit(trainRequest, username);

		}

		return trainRequest;
	}
}
