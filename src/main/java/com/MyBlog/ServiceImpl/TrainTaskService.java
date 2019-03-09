package com.MyBlog.ServiceImpl;

import org.springframework.stereotype.Service;
import com.MyBlog.HttpRequest.trainRequest;
import com.MyBlog.Service.TrainService;


@Service("trainTask")
public class TrainTaskService extends TrainService{

	@Override
	public trainRequest getUserSession() {
		return trainrequest;
	}
	
}
