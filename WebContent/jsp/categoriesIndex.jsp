<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/SigmarOne.woff2"
	type="text/css">
<title>HelloWorld</title>
<style type="text/css">
.posts-collapse{
line-height:3;
}

</style>
</head>
<body>
	<div class="container sidebar-position-right page-home">
		<nav class="Top"> <%@ include file="Nav.jsp"%>
		<p id="offscreen-text" class="offscreen-text"></p>
		<p id="text" class="text"></p>
		<svg id="svg"> </svg> <input type="hidden" class="input" value=""
			id="input" /> </nav>
		<div class="site-master " itemprop="author" itemscope="" itemtype="">

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

		<main id="main" class="main layui-row">
		<div class="main-inner">
			<div class="content-wrap  layui-col-xs6 layui-col-sm10 layui-col-md6 layui-col-md-offset1 layui-col-sm-offset1">
				<div id="content" class="content">
					<div class="post-block archive post">
						<div id="posts" class="posts-collapse">
							<span class="archive-move-on"></span> <span
								class="archive-page-counter">目前共计${applicationScope.BlogInfo.archivescount }篇日志。 (゜-゜)つロ 干杯~</span>
								<c:forEach items="${types }" var="type">
								<div class="collection-title">
								<h1 class="archive-year" id="archive-${type.tdescribe}">${type.tdescribe}</h1>
							</div>
								<c:forEach items="${archives }" var="archive">
								<c:if test="${type.tid== type.tid}">
								</c:if>
							${Calendar.setTime(archive.createdTime)}
							<article class="post post-type-normal" itemscope=""
								itemtype="">
							<header class="post-header">
							<h2 class="post-title">
								<a class="post-title-link" href="<%=request.getContextPath() %>/archives/${archive.aid}_1" itemprop="url">
								<span
									itemprop="name">${archive.title}</span></a>
							</h2>
							<div class="post-meta">
								<time class="post-time" itemprop="dateCreated"
									datetime="" content="${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}">
									${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}</time>
							</div>
							</header></article>
						
								
						</c:forEach>
					</c:forEach>
				
			
						</div>
					</div>
				
				
				
	<nav class="pagination">
		
						<c:if test="${pager.page!=1 }">
						<a class="extend prev" rel="prev" href="<%=request.getContextPath() %>/classify${pager.prePage}">
						<i class="layui-icon">&#xe603;</i></a>
						</c:if>
					<c:if test="${pager.pages<=5}">
												<c:forEach var="i" begin="1" end="${pager.pages}">
													<c:set var="page" value="${page+1 }"></c:set>
													<c:if test="${page==pager.page }">
														<a class="page-number current" href="<%=request.getContextPath() %>/classify${page }">${page}</a>
													</c:if>
													<c:if test="${page!=pager.page }">
														<a class="page-numbers"
															href="<%=request.getContextPath() %>/classify${page}">${page}</a>
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
														<a class="page-number current" href="<%=request.getContextPath() %>/classify${page }">${page}</a>
															</c:if>
															<c:if test="${page!=pager.page }">
																<a class="page-numbers"
															href="<%=request.getContextPath() %>/classify${page}">${page}</a>
															</c:if>
															<c:if test="${page==5 }">
																<a class="page-numbers" href="">....</a>

																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/classify${pager.pages}">
																	${pager.pages }</a>
																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/classify${pager.pages}">尾页</a>
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
																			href="<%=request.getContextPath() %>/classify1">1</a>
																		<a class="page-numbers" href="">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																								<a class="page-number current" href="<%=request.getContextPath() %>/classify${page }">${page}</a>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/classify${page}">${page}</a>
																	</c:if>

																	<c:if test="${page==pager.page+2 }">
																		<a class="page-numbers" href="">....</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/classify${pager.pages}">${pager.pages}</a>

																	</c:if>

																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>
															<c:when test="${pager.page+2>=pager.pages}">
																<c:set var="page" value="${pager.page-2 }"></c:set>
																<c:forEach var="i" begin="${page }" end="${pager.pages}">
																	<c:if test="${page==pager.page-2 }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/classify1">首页</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/classify1">1</a>
																		<a class="page-numbers" href="">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																						<a class="page-number current" href="<%=request.getContextPath() %>/classify${page }">${page}</a>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/classify${page}">${page}</a>
																	</c:if>



																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>

														</c:choose>
													</c:when>

												</c:choose>
											</c:if>
					
						
							<c:if test="${pager.page!=pager.pages}">
						<a class="extend next" rel="next" href="<%=request.getContextPath() %>/classify${pager.nextPage}"><i
							class="layui-icon">&#xe602;</i></a>
							</c:if>
							</nav> 

				</div>
			</div>
			<div class="sidebar-toggle">
				<div class="sidebar-toggle-line-wrap">
					<span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
					<span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
					<span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
				</div>
			</div>
	
	
			<%@ include file="RightSidebar.jsp"%>
		</div>
		</main>
		<%@ include file="footer.jsp"%>
		</div>
	
			<script src="js/q.js"></script>
	<script src='js/CSSPlugin.min.js'></script>
	<script src='js/EasePack.min.js'></script>
	<script src='js/TweenLite.min.js'></script>
	<script src="js/index.js"></script>
		
		<script type="text/javascript">
		$(".layui-nav-item").removeClass("layui-this");
		$("#归档").addClass("layui-this");

		</script>
</body>
</html>