package com.MyBlog.Controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {

	 @RequestMapping("/upload")
	 @ResponseBody
     public Object upload(HttpServletRequest request, String description,
            MultipartFile file,HttpServletResponse response) throws Exception {
		  Map<String, String> Msg=new HashMap();
     SimpleDateFormat dateFormat=new SimpleDateFormat("yyMMdd_HHmmss_");
     String time=  dateFormat.format(new Date());
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getServletContext().getRealPath("/userTempImg/");
            //上传文件名
 
            String filename =time+file.getOriginalFilename();
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
          
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            Msg.put("errno", "0");
            Msg.put("data", "userTempImg/"+filename);
           // msg="{\"code\":0,\"msg\":\"userTempImg/"+filename+ "\",\"data\":{\"src\":\"userTempImg/"+filename+"\",\"title\":\""+filename+"\"}}";

        } else {
        	Msg.put("errno", "1");
        }
       
    
		  return Msg;
}
}
