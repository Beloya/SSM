<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<aside id="sidebar"
							class="sidebar sidebar-right layui-col-xs2 layui-col-sm2 layui-col-md3 layui-col-lg2 layui-col-md-offset1" style="position:initial;">
						<div class="sidebar-inner affix-top"> 
							<section
								class="site-overview-wrap sidebar-panel sidebar-panel-active">
							<div class="site-overview">
								<div class="site-author motion-element" itemprop="author"
									itemscope="" itemtype="http://schema.org/Person">
									<img class="site-author-image" itemprop="image"
										src="<%=request.getContextPath()%>${applicationScope.BlogInfo.users.userImg}" alt="" style="height: 240px;">
									<p class="site-author-name" itemprop="name">
										<span style="opacity: .2">网红</span>${applicationScope.BlogInfo.createdBy}
									</p>
									<p class="site-description motion-element"
										itemprop="description">你能抓到我么？</p>
								</div>
								<div class="links-of-author motion-element">
									<!--  span class="links-of-author-item"><a
										href="https://github.com/Beloya" target="_blank"
										title="GitHub" data-balloon="GitHub" data-balloon-pos="up"><i
											class="fa fa-fw fa-github"></i></a> </span-->
									
											<span class="links-of-author-item">
										<a href="http://wpa.qq.com/msgrd?v=3&uin=468501955&site=qq&menu=yes"
										target="_blank" title="QQ " data-balloon="QQ "
										data-balloon-pos="up"><i class="fa layui-icon " style="font-size: 30px;">&#xe676;</i>  </a> </span>
										<!-- span
										class="links-of-author-item"><a
										href="https://t.me/awesomeDIYgod" target="_blank"
										title="Telegram Channel" data-balloon="Telegram Channel"
										data-balloon-pos="up"><i class="fa fa-fw fa-telegram"></i></a>
									</span-->
									<!--span class="links-of-author-item"><a
										href="https://www.pixiv.net/member.php?id=15288095"
										target="_blank" title="pixiv" data-balloon="pixiv"
										data-balloon-pos="up"><i class="fa fa-fw"><svg
													version="1.1" xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" viewBox="0 0 32 32">
												<path fill="#727272" style="fill:#727272"
													d="M21.922 9.411c-1.389-1.44-3.133-2.029-5.096-2.035-0.924-0.003-1.831 0.144-2.722 0.389-0.905 0.249-1.771 0.589-2.562 1.103-0.105 0.068-0.147 0.146-0.147 0.272-0.001 0.929-0.010 1.857-0.013 2.786-0.003 0.852-0.001 1.704-0.001 2.556-0 1.776 0.002 3.552-0.003 5.328-0 0.166 0.049 0.262 0.207 0.331 0.559 0.241 1.133 0.433 1.724 0.574 0.963 0.23 1.94 0.34 2.929 0.386 1.055 0.049 2.088-0.040 3.088-0.387 1.916-0.665 3.296-1.913 4.045-3.812 0.484-1.227 0.544-2.502 0.34-3.794-0.223-1.412-0.793-2.665-1.789-3.698z"></path>
												<path fill="#727272" style="fill:#727272"
													d="M16 0.546c-8.535 0-15.454 6.919-15.454 15.454s6.919 15.454 15.454 15.454 15.454-6.919 15.454-15.454-6.919-15.454-15.454-15.454zM26.223 17.125c-0.593 1.487-1.584 2.651-2.897 3.547-1.367 0.933-2.889 1.455-4.52 1.679-2.074 0.285-4.097 0.007-6.097-0.541-0.39-0.107-0.774-0.234-1.157-0.365-0.148-0.051-0.169-0.038-0.169 0.121-0.002 1.049 0 2.099-0.002 3.148-0 0.118 0.041 0.183 0.159 0.219 0.226 0.068 0.446 0.156 0.637 0.3 0.112 0.084 0.193 0.186 0.182 0.34-0.013 0.18-0.114 0.28-0.295 0.28-0.621 0.001-1.242 0-1.863 0-0.607 0-1.213-0.003-1.82 0.003-0.148 0.001-0.251-0.040-0.307-0.183s-0.024-0.264 0.080-0.37c0.178-0.182 0.412-0.263 0.644-0.344 0.238-0.083 0.244-0.029 0.244-0.339-0.001-4.742-0.001-9.484-0.002-14.225-0-0.074 0.038-0.179-0.034-0.213s-0.13 0.062-0.188 0.108c-0.706 0.564-1.359 1.181-1.877 1.928-0.016 0.024-0.032 0.048-0.050 0.071-0.184 0.241-0.307 0.488-0.18 0.808 0.061 0.153 0.053 0.331 0.009 0.499-0.029 0.11-0.076 0.207-0.17 0.277-0.157 0.116-0.265 0.099-0.368-0.065-0.401-0.635-0.8-1.271-1.204-1.904-0.066-0.104-0.062-0.176 0.022-0.265 0.555-0.584 1.158-1.115 1.789-1.614 1.598-1.263 3.341-2.273 5.26-2.966 1.251-0.452 2.539-0.741 3.866-0.854 1.55-0.131 3.078-0.024 4.574 0.415 1.587 0.466 2.987 1.255 4.124 2.472 1.135 1.216 1.818 2.652 2.036 4.301 0.17 1.277 0.053 2.526-0.427 3.731z"></path></svg></i></a>
													</span-->
								</div>
						
								<nav class="site-state motion-element">
								<div class="site-state-item site-state-posts">
									<a href="<%=request.getContextPath() %>/"><span class="site-state-item-count">${applicationScope.BlogInfo.archivescount }</span>
										<span class="site-state-item-name">日志</span></a>
									
								</div>
								<div class="site-state-item site-state-categories">
									<a href="<%=request.getContextPath() %>/categories"><span
										class="site-state-item-count">${applicationScope.BlogInfo.typecount }</span> <span
										class="site-state-item-name">分类</span></a>
								</div> 
								</nav>
						
							</div>
							</section>
						</div>
		
						</aside>
</body>
</html>