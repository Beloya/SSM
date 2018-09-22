<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-site-verification" content="boEI4kBPt4qGUiDtsabiffW1zJ0KZewWQQFb9fWvWK4" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/SigmarOne.woff2"
	type="text/css">
	<style type="text/css">
	#canvas {
/*   position: absolute;
  top: 0; right: 0; left: 0;
  margin: auto; */
  
	margin: auto;
	margin-bottom: 1em;
	max-width: 100%;
	height: auto;
/* 	background:#000; */
}

.comment-content  img{
width: 64px;
height:64px;
}
.post-body_detail blockquote{
word-wrap:break-word; 
word-break:break-all; 
padding:5px 15px 5px 15px;
}
.comment-author img{
width:65px;
height:65px;
}
.body_detail{
word-wrap:break-word; 
word-break:break-all; 
}

</style>
</head>
<body>
	<div class="container sidebar-position-right page-home">
		<nav class="Top">
		 <%@ include file="Nav.jsp"%>
		<p id="offscreen-text" class="offscreen-text"></p>
		<p id="text" class="text"></p>
		<svg id="svg"> </svg> <input type="hidden" class="input" value=""
			id="input" /> </nav>


		<div class="site-master " itemprop="author" itemscope=""
			itemtype="">

			<img class="site-master-avatar" itemprop="image"
				src="<%=request.getContextPath()%>${applicationScope.BlogInfo.users.userImg}"
				alt="">
			<h2 class="site-master-description" itemprop="description">
				<span style="color: #3369e8">如果</span> <span style="color: #d50f25">结果</span>
				<span style="color: #eeb211">不如你所愿,</span> <span
					style="color: #3369e8">就在</span> <span style="color: #009925">尘埃落定前</span>
				<span style="color: #d50f25">奋力一搏.</span>
			</h2>
		</div>

		<div id="main" class="main">
		
		
   
			<div id="bg-over">
			 <span class="stand"></span>
    <div class="cat">
     <div class="body"></div>
     <div class="head">
       <div class="ear"></div>
     <div class="ear"></div>
     </div>
     <div class="face">
      <div class="nose"></div>
     <div class="whisker-container">
       <div class="whisker"></div>
       <div class="whisker"></div>
     </div>
     <div class="whisker-container">
       <div class="whisker"></div>
       <div class="whisker"></div>
     </div>
     </div>
     <div class="tail-container">
      <div class="tail">
        <div class="tail">
          <div class="tail">
            <div class="tail">
              <div class="tail">
                <div class="tail">
                  <div class="tail"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
   </div>
			</div>
			<div class="main-inner">
				<div class="content-wrap">

					<div id="content" class="content layui-row">
						<section id="posts"
							class="posts-expand layui-col-xs6 layui-col-sm10 layui-col-md6 layui-col-md-offset1 layui-col-sm-offset1">
						
					<c:forEach items="${archives }" var="archives">
					<!-- fmt:formatDate var="CURCreatedTime" value="${archives.createdTime}" pattern="yyyy-MM-dd" scope="request"/-->
					${Calendar.setTime(archives.createdTime)}

					<!--fmt:formatDate var="CURCreatedTimedd" value="${archives.createdTime}" pattern="dd" scope="request"/-->
					<c:if test="${archives.archivesvisibility.vdescribe=='公开' }">
						<article class="post post-type-normal" itemscope=""
							>
						<div class="post-date">
							<div class="post-month">${Calendar.get(Calendar_MONTH)+1}月  
</div>
							<div class="post-day">${Calendar.get(Calendar_DAY_OF_MONTH)}</div>
						</div>
						<div class="post-block">
							<link itemprop="mainEntityOfPage"
								/>
							<span hidden="" itemprop="author" itemscope=""
								itemtype="">
						
							</span> <span hidden="" itemprop="publisher" itemscope="" >
							</span>
							<header class="post-header">
							<h1 class="post-title" itemprop="name headline">
								<a class="post-title-link" href="<%=request.getContextPath() %>/archives/${archives.aid}_1" itemprop="url">${archives.title}</a>
							</h1>
							<div class="post-meta">
								<span class="post-time"> <span class="post-meta-item-icon"> <i class="fa fa-calendar-o"></i>
								</span><span class="post-meta-item-text">发表于</span> <time title="创建于"
										itemprop="dateCreated datePublished"
										datetime="${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}">${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}</time>
								</span><span class="post-wordcount"><span
									class="post-meta-divider">•</span> <span
									class="post-meta-item-icon"><i class="fa fa-file-word-o"></i>
								</span><span class="post-meta-item-text" >字数统计</span> <span title="字数统计" id="ARcount_${archives.aid}"></span>
								</span><span id="/polymer/" class="leancloud_visitors"
									data-flag-title="Polymer 初体验"><span
									class="post-meta-divider">•</span> <span
									class="post-meta-item-icon"><i class="fa fa-eye"></i> </span><span
									class="post-meta-item-text">阅读次数</span> <span
									class="leancloud-visitors-count">${archives.readcount}</span></span>
							</div>
						
							 <span class="layui-bg-blue post-type">${archives.etype.tdescribe}</span>
							
						<div class="push-line"></div>
							</header>
							<div class="post-body" id="ARbody_${archives.aid}" itemprop="articleBody">
						${archives.context} 
							
							</div>
							<footer class="post-footer">	<div class="post-button text-center">
									<a class="btn" href="<%=request.getContextPath() %>/archives/${archives.aid}_1" rel="contents">阅读全文 »</a>
								</div></footer>

						</div>
  <script type="text/javascript"> $("#ARcount_${archives.aid}").text($("#ARbody_${archives.aid}").text().length)</script>
						</article> 
						</c:if>
						
						<c:if test="${archives.archivesvisibility.vdescribe=='私有'&&sessionScope.user.userName==applicationScope.BlogInfo.createdBy }">
						
						
						<article class="post post-type-normal" itemscope=""
							>
						<div class="post-date">
							<div class="post-month">${Calendar.get(Calendar_MONTH)+1}</div>
							<div class="post-day">${Calendar.get(Calendar_DAY_OF_MONTH)}</div>
						</div>
						<div class="post-block">
							<link itemprop="mainEntityOfPage"
								/>
							<span hidden="" itemprop="author" itemscope=""
								itemtype="">
						
							</span> <span hidden="" itemprop="publisher" itemscope="" >
							</span>
							<header class="post-header">
							<h1 class="post-title" itemprop="name headline">
								<a class="post-title-link" href="<%=request.getContextPath() %>/archives/${archives.aid}_1" itemprop="url">${archives.title}</a>
							</h1>
							<div class="post-meta">
								<span class="post-time"> <span class="post-meta-item-icon"> <i class="fa fa-calendar-o"></i>
								</span><span class="post-meta-item-text">发表于</span> <time title="创建于"
										itemprop="dateCreated datePublished"
										datetime="2018-05-30T23:45:43+00:00">${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}</time>
								</span><span class="post-wordcount"><span
									class="post-meta-divider">•</span> <span
									class="post-meta-item-icon"><i class="fa fa-file-word-o"></i>
								</span><span class="post-meta-item-text" >字数统计</span> <span title="字数统计" id="ARcount_${archives.aid}"></span>
								</span><span id="" class="leancloud_visitors"
									data-flag-title=""><span
									class="post-meta-divider">•</span> <span
									class="post-meta-item-icon"><i class="fa fa-eye"></i> </span><span
									class="post-meta-item-text">阅读次数</span> <span
									class="leancloud-visitors-count">${archives.readcount}</span></span>
							</div>
							</header>
							<div class="post-body" id="ARbody_${archives.aid}" itemprop="articleBody">
						${archives.context}
							
							</div>
							<footer class="post-footer">	<div class="post-button text-center">
									<a class="btn" href="<%=request.getContextPath() %>/archives/${archives.aid}_1" rel="contents">阅读全文 »</a>
								</div></footer>

						</div>
  <script type="text/javascript"> $("#ARcount_${archives.aid}").text($("#ARbody_${archives.aid}").text().length)</script>
						</article> 
					
						</c:if>
						</c:forEach> 
						<nav class="pagination">
		
						<c:if test="${pager.page!=1 }">
						<a class="extend prev" rel="prev" href="/${pager.prePage}">
						<i class="layui-icon">&#xe603;</i></a>
						</c:if>
					<c:if test="${pager.pages<=5}">
												<c:forEach var="i" begin="1" end="${pager.pages}">
													<c:set var="page" value="${page+1 }"></c:set>
													<c:if test="${page==pager.page }">
														<a class="page-number current" href="/${page }">${page}</a>
													</c:if>
													<c:if test="${page!=pager.page }">
														<a class="page-numbers"
															href="<%=request.getContextPath() %>/${page}">${page}</a>
													</c:if>
												</c:forEach>
											</c:if>
							<c:if test="${pager.pages>5 }">
												<c:set var="page" value="0"></c:set>
												<c:choose>

													<c:when test="${pager.page<=3}">
														<c:forEach var="i" begin="1" end="3">
															<c:set var="page" value="${page+1 }"></c:set>
															<c:if test="${page==pager.page }">
														<a class="page-number current" href="/${page }">${page}</a>
															</c:if>
															<c:if test="${page!=pager.page }">
																<a class="page-numbers"
															href="<%=request.getContextPath() %>/${page}">${page}</a>
															</c:if>
															<c:if test="${page==5 }">
																<a class="page-numbers" href="">....</a>

																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/${pager.pages}">
																	${pager.pages }</a>
																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/${pager.pages}">尾页</a>
															</c:if>
														</c:forEach>

													</c:when>

													<c:when test="${pager.page>=3}">
														<c:choose>
															<c:when test="${pager.page+2<pager.pages}">
																<c:set var="page" value="${pager.page-2 }"></c:set>
																<c:forEach var="i" begin="${page }"
																	end="${pager.page+2}">

																	<c:if test="${page==pager.page-2 }">

																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/1">1</a>
																		<a class="page-numbers" href="">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																								<a class="page-number current" href="/${page }">${page}</a>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/${page}">${page}</a>
																	</c:if>

																	<c:if test="${page==pager.page+2 }">
																		<a class="page-numbers" href="">....</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/${pager.pages}">${pager.pages}</a>

																	</c:if>

																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>
															<c:when test="${pager.page+2>=pager.pages}">
																<c:set var="page" value="${pager.page-2 }"></c:set>
																<c:forEach var="i" begin="${page }" end="${pager.pages}">
																	<c:if test="${page==pager.page-2 }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/1">首页</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/1">1</a>
																		<a class="page-numbers" href="">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																						<a class="page-number current" href="/${page }">${page}</a>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/${page}">${page}</a>
																	</c:if>



																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>

														</c:choose>
													</c:when>

												</c:choose>
											</c:if>
					
						
							<c:if test="${pager.page!=pager.pages}">
						<a class="extend next" rel="next" href="/${pager.nextPage}"><i
							class="layui-icon">&#xe602;</i></a>
							</c:if>
							</nav> 
							
							<c:if test="${empty  archives}">
				
						</c:if>	
						</section>

					<%@ include file="RightSidebar.jsp"%>


					</div>

				</div>

			</div>
		</div>


  

		<%@ include file="footer.jsp"%>

	</div>
		<script src="js/q.js"></script>
	<script src='js/CSSPlugin.min.js'></script>
	<script src='js/EasePack.min.js'></script>
	<script src='js/TweenLite.min.js'></script>
	<script src="js/index.js"></script>

	<script type="text/javascript">
	/*
	var 
	M=document.getElementById('main');
	Q.reg('home',function(){
		//document.getElementById('main').innerHTML='Hallo World';
	}).reg([
	        ['NewArchives',function(){
	        	 $.ajax({ 
	        	    	url: "<%=request.getContextPath()%>/Newarchives.html", 
	        	    	type:'GET',
	        	    	 success: function(result){
	        	    		 M.innerHTML=result;
	        	    		 }
	        	    	 }
	        	 );
	         //   M.innerHTML='我是卜卜口';
	          }],
	          ['friend',function(){
	            M.innerHTML='我的朋友们都在这~';
	          }],
	          ['void']//这里什么都没有
	        ]).reg('void2');//这里也什么都没有

	        Q.reg(['猫娘1','猫娘2','猫娘3'],function(){
	          M.innerHTML='喵喵喵';
	        });
	Q.init({
		index:'home'
	});
*/
$(".layui-nav-item").removeClass("layui-this");
$("#首页").addClass("layui-this");
		
		 
	</script>
</body>
</html>