function JsonMsgProcess(result){
    if(result.code!="0"){
   	 layer.msg(result.msg, {
   		  icon: 5,
   		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
   		}, function(){
   		
   		});   
              
    }

}