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
									<span class="links-of-author-item"><a
										href="${applicationScope.FoundLink['GitHub'].link }" target="_blank"
										title="GitHub" data-balloon="GitHub" data-balloon-pos="up"><i
											class="fa  fa-github fa-fw fa-5x" style="font-size: 30px;"></i></a> </span>
									
											<span class="links-of-author-item">
										<a href="${applicationScope.FoundLink['QQ'].link }"
										target="_blank" title="QQ " data-balloon="QQ "
										data-balloon-pos="up"><i class="fa layui-icon " style="font-size: 30px;">&#xe676;</i>  </a> </span>
								
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