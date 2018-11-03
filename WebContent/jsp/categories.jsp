<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://tuxiang-1251384861.cos.ap-guangzhou.myqcloud.com/css/main.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/SigmarOne.woff2"
	type="text/css">
<title>分类</title>
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

.comment-content  img {
	width: 64px;
	height: 64px;
}
ul{
list-style-type:circle;
    
    }
 .category-list .category-list-item  a:hover{
 text-decoration: underline;
 }   
    .category-all-page{
    line-height:2;
    padding:10px 10px 10px 10px;
    }
.post-body_detail blockquote {
	word-wrap: break-word;
	word-break: break-all;
	padding: 5px 15px 5px 15px;
}

.comment-author img {
	width: 65px;
	height: 65px;
}

.body_detail {
	word-wrap: break-word;
	word-break: break-all;
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
	

		<main id="main" class="main layui-row">
		<div class="main-inner">  
			<div class="content-wrap  layui-col-xs6 layui-col-sm10 layui-col-md6 layui-col-md-offset1 layui-col-sm-offset1 ">
				<div id="content" class="content  ">
					<div id="posts" class="post posts-expand">
						<div class="post-block page">
							<header class="post-header">
							<h1 class="post-title" itemprop="name headline">分类</h1>
							</header>
							<div class="post-body" style="height:auto;">
								<div class="category-all-page">
									<div class="category-all-title">目前共计${typecount } 个分类</div>
									<div class="category-all">
										<ul class="category-list">
										<c:forEach items="${types}" var="type">
											<li class="category-list-item " style="list-style:circle;"><a
												class="category-list-link" href="<%=request.getContextPath() %>/classify${type.tid }_1">${type.tdescribe }</a><!-- span
												class="category-list-count">7</span--></li>
												</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
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



	</div>
			<script src="js/q.js"></script>
	<script src='js/CSSPlugin.min.js'></script>
	<script src='js/EasePack.min.js'></script>
	<script src='js/TweenLite.min.js'></script>
	<script src="js/index.js"></script>
</body>
</html>