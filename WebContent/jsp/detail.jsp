<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">           
<title>${archives.title}</title>
<link rel="stylesheet" href="https://tuxiang-1251384861.cos.ap-guangzhou.myqcloud.com/css/main.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/SigmarOne.woff2"
	type="text/css">
	<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/OwO.min.css" /> 
<style type="text/css">
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
		<nav class="Top"> <%@ include file="Nav.jsp"%>
		<p id="offscreen-text" class="offscreen-text"></p>
		<p id="text" class="text" style="top:1%;"></p>
		<svg id="svg"> </svg> <input type="hidden" class="input" value=""
			id="input" /> </nav>
			
		<div id="main" class="main">
			<div class="main-inner">
				<div class="content-wrap">
					<div id="content" class="content layui-row">
						<div id="posts"
							class="posts-expand  layui-col-xs6 layui-col-sm10 layui-col-md6 layui-col-md-offset1 layui-col-sm-offset1">
							<article class="post post-type-normal" itemscope=""
								itemtype="http://schema.org/Article">
							<div class="post-date">
								<div class="post-month">${Calendar.get(Calendar_MONTH)+1}月</div>
								<div class="post-day">${Calendar.get(Calendar_DAY_OF_MONTH)}</div>
							</div>
							<div class="post-block">
							
								<header class="post-header">
								<h1 class="post-title" itemprop="name headline">${archives.title}</h1>
								<div class="post-meta">
								<c:if test="${empty archives.updatedTime}">
									${Calendar.setTime(archives.createdTime)}
									<span class="post-time"><span
										class="post-meta-item-icon"><i class="fa fa-calendar-o"></i>
									</span>
									<span class="post-meta-item-text">发表于</span> <time title="创建于"
											itemprop="dateCreated datePublished"
											datetime="${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}">
${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}&nbsp;${Calendar.get(Calendar_HOUR_OF_DAY)}:${Calendar.get(Calendar_MINUTE)}</time> </span>
									</c:if>
										<c:if test="${!empty archives.updatedTime}">
											${Calendar.setTime(archives.updatedTime)}
									<span class="post-time"><span
										class="post-meta-item-icon"><i class="fa fa-calendar-o"></i>
									</span>
									<span class="post-meta-item-text">更新于</span> <time title="创建于"
											itemprop="dateCreated datePublished"
											datetime="${archives.updatedTime}"  >
${Calendar.get(Calendar_Year)}-${Calendar.get(Calendar_MONTH)+1}-${Calendar.get(Calendar_DAY_OF_MONTH)}&nbsp;${Calendar.get(Calendar_HOUR_OF_DAY)}:${Calendar.get(Calendar_MINUTE)}</time> </span>
									</c:if>
									
									<span
										class="post-wordcount"><span class="post-meta-divider">•</span>
										<span class="post-meta-item-icon"><i
											class="fa fa-file-word-o"></i> </span><span
										class="post-meta-item-text">字数统计</span> <span id="ReadCount" title="字数统计">0</span>
									</span><span id="/polymer/" class="leancloud_visitors"
										data-flag-title="${archives.title}"><span class="post-meta-divider">•</span> <span
										class="post-meta-item-icon"><i class="fa fa-eye"></i> </span><span
										class="post-meta-item-text">阅读次数</span> <span
										class="leancloud-visitors-count">${archives.readcount}</span></span>
									
								</div>
								 <span class="layui-bg-blue post-type">${archives.etype.tdescribe}</span>
				                 <shiro:hasAnyRoles name="博主,管理员">
								<button class="layui-btn layui-btn-xs layui-btn-normal" onclick="arEdit(${archives.aid});"><i class="layui-icon">&#xe642;</i>   编辑</button>
									<button class="layui-btn layui-btn-xs layui-btn-danger" onclick="arDel(${archives.aid});"><i class="layui-icon ">&#xe640;</i>   删除</button>
									</shiro:hasAnyRoles>
								</header>
								
								<div class="post-body_detail" itemprop="articleBody" style="word-wrap:break-word; 
word-break:break-all;">
								<div id="layer-photos" class="layer-photos">
								${archives.context}
								</div>
								</div>
 <script type="text/javascript"> $("#ReadCount").text($(".post-body_detail").text().length)</script>

		




								<!-- div class="post-share share-component social-share">
									分享到：<a class="social-share-icon icon-weibo"
										href="http://service.weibo.com/share/share.php?url=https%3A%2F%2Fdiygod.me%2Fpolymer%2F&amp;title=Polymer%20%E5%88%9D%E4%BD%93%E9%AA%8C%20%7C%20Hi%2C%20DIYgod&amp;pic=https%3A%2F%2Fdiygod.me%2Fimages%2FDIYgod.jpg&amp;appkey="
										target="_blank"></a><a class="social-share-icon icon-qq"
										href="http://connect.qq.com/widget/shareqq/index.html?url=https%3A%2F%2Fdiygod.me%2Fpolymer%2F&amp;title=Polymer%20%E5%88%9D%E4%BD%93%E9%AA%8C%20%7C%20Hi%2C%20DIYgod&amp;source=Hi%2C%20DIYgod&amp;desc=%E4%BA%BA%E6%B0%94%E7%BD%91%E7%BA%A2%20%7C%20%E5%89%8D%E7%AB%AF%E8%90%8C%E6%96%B0%20%7C%20%E6%9C%89%E7%8C%AB%20%7C%20%E5%BC%80%E6%BA%90&amp;pics=https%3A%2F%2Fdiygod.me%2Fimages%2FDIYgod.jpg"
										target="_blank"></a><a class="social-share-icon icon-wechat"
										href="javascript:;" tabindex="-1"><div
											class="wechat-qrcode">
											<h4>微信扫一扫</h4>
											<div class="qrcode">
												<img
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEf0lEQVR4Xu2d4U7kMAyEy/s/NCekk6Bpla/f2lm6y9xfJ7YzY4+TArqPbds+t+f++4BwNh/rb1w/xiP7UrS+glsAqglZACme9UeAk53yKdlDyLEgQ8hQUrZj375D6IC2JUmjq/7sfuoAa7fxx/U7fM4kK4TsIesuqBAyIGA7IIQ0X4tHdy9PSHXI2gqrxptKwgXBrxJGIab+r8yQKkAhZE9RCKGSbZ4xFC6EEEIhxF0rSTKt5tOMsf4oP3WpuMMMoRlDB7YAhpDFkhBCQJMtQOmQH4C+omStJrzqn+4Qt79l2Q6pArZ6fwhpnlFVwkLIXyOEGCc7SRJdQ+keT/HJTvmRnfyT/fY/D7HvDjow2QlwspN/soeQASECnOwEONlDyKsRQoxW7dVbzG/vr55/uv8OvwZEknA3ewh5sWttibB0yA1/Ua7E6ILNJFH0brG/xmTjLTjyt0ub/NJk/ju3ANn13YS2YhJCWLJaASdnIeSGhHR/qiB/9G2K9tM75NlFaPMtv0NsF1GCIWRCyZVrbwiZ9xwVoMIvhJDAsb2dkO5rIF1D7QHIH+VPkKoKXvAngLv4Z8lYAAgQO4RpPQFIhNMMIwKtf/IXQuDbGAEYQiSAFjDqOFIAIpDs5Q4hSSNASJJIUsg/AUD+7X4iTJ33kRkSQtw1OITIEreSRe5LBZsO2baXI4Qqwh6IZoBq8Y0BpXh0PrJTvoTP4bdOaCjZhGg9AUQHtEOZ4lG+ZKd8Q8iAYAiBkiKAqOLevkPsrcAC1g0gxSeJIIkm//Y8JHmHGRJC9pCFEKn5BFg6hHqy+VvUnyPEamT3kCZ+iRDKv1uiWzvyy5kFlIaiBYQIqPojArvtdJ5pQYSQ40u/2kEhBBDo7gAirJ0QOgBJiJU08tcNAMWzgNJ6heeZZCkHCz7uUfzqEA0hVEJwLU6HFB9qkazCy/8RySJJsZJgr922Y6rrqcGreDz9WxZpfgj5QXk65Fj/VCCkALR/2lEh5A0IWVohJ4JtNZo0f7Wd8p1K+CMdEkLmlIaQ1SUv/YcQCdjq5WVCVidI/le/E6zE0jWdHr52/85faTMhfdEeQoZ3yEXcli0LISFkV1y2IJZLFr0su1vDDr3u/Krx7X7CD79lkYOq3R4ohFQRh/0hZA9QOmQoGJohVTvVNxLSfRXuPhBJGHUgAWTPT+ejeId3SKvDk+jkn+x0q7EPPwIohAwIESDpECopsFMHkD0dAkOP+CENpw4gAmg/dRDlX7WXzt/x8xCr4QRoCAENtxVXqpAHLgVEYLXi7f7S+dMhFm5e/3aEdHckQUgAkiSTf9XBd+yQEHKzGRJCQsgOASoIe0t8O8nqBoBmRnc8mkH64yJVjAr4wN+TdAMUQorfqkLIL386sd+26NpJ/shO/tWMOFEILVk2IUqQJIPi2Y4hwK0kL83vyjuEEiB7NyAhhBAHewiZAxTJKs5Iqs9SB59JFgWs2u0Mqa6nfKmDab+dmdP1IaT/f9ixBKNk2Yqw66sVT7eikmRceLjSeUOIfHhWJWYpIf8A1j+gPwWY/38AAAAASUVORK5CYII=">
											</div>
											<div class="help">
												<p>微信扫一扫，右上角分享</p>
											</div>
										</div></a><a class="social-share-icon icon-qzone"
										href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=https%3A%2F%2Fdiygod.me%2Fpolymer%2F&amp;title=Polymer%20%E5%88%9D%E4%BD%93%E9%AA%8C%20%7C%20Hi%2C%20DIYgod&amp;desc=%E4%BA%BA%E6%B0%94%E7%BD%91%E7%BA%A2%20%7C%20%E5%89%8D%E7%AB%AF%E8%90%8C%E6%96%B0%20%7C%20%E6%9C%89%E7%8C%AB%20%7C%20%E5%BC%80%E6%BA%90&amp;summary=%E4%BA%BA%E6%B0%94%E7%BD%91%E7%BA%A2%20%7C%20%E5%89%8D%E7%AB%AF%E8%90%8C%E6%96%B0%20%7C%20%E6%9C%89%E7%8C%AB%20%7C%20%E5%BC%80%E6%BA%90&amp;site=Hi%2C%20DIYgod"
										target="_blank"></a><a class="social-share-icon icon-twitter"
										href="https://twitter.com/intent/tweet?text=Polymer%20%E5%88%9D%E4%BD%93%E9%AA%8C%20%7C%20Hi%2C%20DIYgod&amp;url=https%3A%2F%2Fdiygod.me%2Fpolymer%2F&amp;via=https%3A%2F%2Fdiygod.me"
										target="_blank"></a>
								</div-->
 <c:forEach items="${archives.archivesflags}" var="archivesFlags">

<span class="layui-badge layui-bg-gray" style="margin-top:20px;">#${archivesFlags.fdescribe}</span> 
</c:forEach>
								<div>
									<div
										style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center">
										<div></div>
<button id="rewardButton" disable="enable"
onclick="var qr=document.getElementById(&quot;QR&quot;);&quot;none&quot;===qr.style.display?qr.style.display=&quot;block&quot;:qr.style.display=&quot;none&quot;">
											<span>赞赏</span>
										</button>
										<div id="QR" style="display: none">


											<div id="wechat" style="display: inline-block">
												<img id="wechat_qr" src="<%=request.getContextPath() %>/images/MyWeChatPay.jpg"
													alt="微信扫一扫，向我赞赏" data-action="zoom">
												<p>微信扫一扫，向我赞赏</p>
											</div>



											<div id="alipay" style="display: inline-block">
												<img id="alipay_qr" src="<%=request.getContextPath() %>/images/MyAliPay.jpg"
													alt="支付宝扫一扫，向我赞赏" data-action="zoom">
												<p>支付宝扫一扫，向我赞赏</p>
											</div>
										</div>
									</div>

								</div>




								<footer class="post-footer"> <!--  div class="post-nav">
									<div class="post-nav-next post-nav-item">

										<a href="/goodnight/" rel="next" title="技术宅也要谈恋爱之早安晚安自动化">
											<i class="fa fa-chevron-left"></i> 技术宅也要谈恋爱之早安晚安自动化
										</a>

									</div>

									<span class="post-nav-divider"></span>

									<div class="post-nav-prev post-nav-item"></div>
								</div--> </footer>
							</div>



							</article>



							<div class="post-spread"></div>
						</div>

						<aside id="sidebar"
							class="sidebar   layui-hide-xs layui-col-sm2 layui-col-md2 layui-col-lg2 layui-col-md-offset1 layui-col-sm-offset1"
							style="position:initial;">

						<div class="sidebar-inner affix-top">



<div class="layui-tab">

							<ul class="sidebar-nav motion-element layui-tab-title">
								
								<li class="sidebar-nav-overview"
									data-target="site-overview-wrap">站点概览</li>
									<li class="sidebar-nav-toc  layui-this"
									data-target="post-toc-wrap">文章目录</li>
							</ul>

<div class="layui-tab-content">
							<section class="site-overview-wrap sidebar-panel layui-tab-item">
							<div class="site-overview">
								<div class="site-author motion-element" itemprop="author"
									itemscope="" itemtype="http://schema.org/Person">

									<img class="site-author-image" itemprop="image"
										src="<%=request.getContextPath() %>${applicationScope.BlogInfo.users.userImg}" alt="${applicationScope.BlogInfo.users.userName}">

									<p class="site-author-name" itemprop="name">
										<span style="opacity: .2">网红</span>${applicationScope.BlogInfo.users.userName}
									</p>
									<p class="site-description motion-element"
										itemprop="description">你能抓到我么？</p>
								</div>

							<div class="links-of-author motion-element">
									<!--span class="links-of-author-item"><a
										href="https://github.com/Beloya" target="_blank"
										title="GitHub" data-balloon="GitHub" data-balloon-pos="up"><i
											class="fa fa-fw fa-github"></i></a> </span-->
									
											<span class="links-of-author-item">
										<a href="http://wpa.qq.com/msgrd?v=3&uin=468501955&site=qq&menu=yes	"
										target="_blank" title="QQ " data-balloon="QQ "
										data-balloon-pos="up"><i class="fa layui-icon " style="font-size: 30px;">&#xe676;</i>  </a> </span>
										<!-- span
										class="links-of-author-item"><a
										href="https://t.me/awesomeDIYgod" target="_blank"
										title="Telegram Channel" data-balloon="Telegram Channel"
										data-balloon-pos="up"><i class="fa fa-fw fa-telegram"></i></a>
									</span--><!-- span class="links-of-author-item"><a
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

									<a href="<%=request.getContextPath() %>/index"> <span class="site-state-item-count">${applicationScope.BlogInfo.archivescount }</span>
										<span class="site-state-item-name">日志</span>
									</a>
								</div>





								<div class="site-state-item site-state-categories">
									<a href="<%=request.getContextPath() %>/categories"> <span
										class="site-state-item-count">${applicationScope.BlogInfo.typecount }</span> <span
										class="site-state-item-name">分类</span>
									</a>
								</div>



								</nav>









							</div>
							</section>



							<section
								class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active layui-tab-item layui-show">
							<div class="post-toc">






								<div class="post-toc-content">
									<ol class="nav">
								
								
									</ol>
								</div>


							</div>
							</section>
</div>



<br/>
						</div>
						</aside>

					</div>





<div class="layui-row" style="padding-bottom:160px;">
					<div class="comments layui-col-xs6 layui-col-sm10 layui-col-md6 layui-col-md-offset1 layui-col-sm-offset1" id="comments">
				<div class="block comment-block ">
							<div id="respond" class="comment-respond">
								<h3 id="reply-title" class="comment-reply-title">
									发表评论 <small><a rel="nofollow"
										id="cancel-comment-reply-link" href="/2954#respond"
										style="display: none;">取消回复</a></small>
								</h3>
								<form class="layui-form" action="" id="commentform"
									class="comment-form layui-form layui-form-pane">
									<shiro:guest>
										<input type="text" class="layui-input" required lay-verify="nameval" name="name" value="" placeholder="昵称"/>
										</shiro:guest>
									<div class="content-field">
										<textarea class="text-block" required lay-verify="content"
											id="comment-content" name="context" cols="45" rows="8"
											aria-required="true" placeholder="还不快点说点什么="></textarea>
										<div class="OwO">
											<div class="OwO-logo">
												<span>OωO表情</span>
											</div>
										
												</div>
											</div>
									

									<input type="hidden" id="leonax-magic" name="aid"
										value="${archives.aid}">

									<script>
            $(function() {
                $("#comment-content").on("keyup", function() {
                    $("#leonax-magic").val("${archives.aid}");
                });
                $('body').on('click touch', function () {
                    $("#leonax-magic").val("${archives.aid}");
                });
            });
        </script>
									<p class="form-submit">
										<button name="submit" type="submit" id="submit" class="submit layui-btn  layui-btn-normal"
											lay-submit="" lay-filter="commentformBtn">发送</button>
<input type="hidden" name="type"
											value="0" id="comment_post_ID"> <input type="hidden"
											name="pid" id="comment_parent" value=""> <input
											type="hidden" name="lastName" id="comment_Name" value="0">
											<input type="hidden" name="formToken" value="${formToken}" />

									</p>
								</form>
							</div>
							<!-- #respond -->

							<div id="comments">
								<a href=""
									class="活捉 ${commitCount }条"> </a> ${commitCount }评论
								<div class="commentshow">
									<ol class="commentlist">
								
										<c:forEach items="${archivescommits}" var="archivescommits">
										
												<li class="comment even thread-even depth-1"
													id="li-comment-${archivescommits.cid }"
													itemprop="reviews" itemscope=""
													itemtype="http://schema.org/Review"><article
														id="comment-${archivescommits.cid }"
														class="comment-${archivescommits.cid }"> <header
														class="comment-meta comment-author vcard"> 
														<img alt="" 
													<c:if test="${!empty archivescommits.users.userImg}">	src="<%=request.getContextPath() %>${archivescommits.users.userImg }"</c:if>
													<c:if test="${empty archivescommits.users.userImg}">	src="<%=request.getContextPath() %>/images/1.jpg"</c:if>
														class="avatar avatar-44 photo" height="44" width="44">
													<div class="comments-authore-title">
														<div class="comments-name" itemprop="author">
															<a href="<%=request.getContextPath() %>/user/detail?userName=${archivescommits.users.userName}" rel="external nofollow" class="url external">
															<c:if test="${!empty archivescommits.users.userName}">${archivescommits.users.userName }</c:if>
																<c:if test="${empty archivescommits.users.userName}">${archivescommits.name}(观光团)</c:if>
															</a>
														</div>
														<div class="comments-class">天然呆</div>
													<shiro:user>    
														<c:if test="${applicationScope.BlogInfo.createdBy==sessionScope.user.userName||archivescommits.users.userName==sessionScope.user.userName }">
														
														<div class="comments-ua" onclick="commitdel(${archivescommits.cid});" style="float: right;color:#FFB800;cursor:pointer;">删除</div>
												
												</c:if>
												</shiro:user>
													</div>
													<a
														href="">
														<time datetime="" itemprop="datePublished">
														${Calendar.setTime(archivescommits.createdTime)}
${Calendar.get(Calendar_Year)}年${Calendar.get(Calendar_MONTH)+1}月${Calendar.get(Calendar_DAY_OF_MONTH)}日&nbsp;${Calendar.get(Calendar_HOUR_OF_DAY)}:${Calendar.get(Calendar_MINUTE)}
													</time>
													</a> </header> <section class="comment-content comment">
													<div itemprop="reviewBody">
														<p>${archivescommits.context }</p>
														
														<c:forEach items="${archivescommits.childArchivescommit }" var="childcommits">
														<blockquote style=" padding:10px 10px 10px 10px; border-bottom: inset;">
														<a style="color:#97dffd;cursor:pointer; padding:10px 10px 10px 10px;" onclick="return addComment.moveForm( &quot;comment-${archivescommits.cid }&quot;, &quot;${archivescommits.cid }&quot;, &quot;respond&quot;, &quot;2&quot;,&quot;${archivescommits.users.userName }&quot;,&quot;${archivescommits.users.userName }&quot;)" rel="external nofollow" class="url external">
												
													<c:if test="${empty childcommits.createdBy}">${childcommits.name}(观光团)：</c:if>		
																<c:if test="${!empty childcommits.createdBy}">${childcommits.createdBy}：</c:if>			
												
															
															</a><p style="width:90%;">${childcommits.context}</p>
															<shiro:user>  
															<c:if test="${createuser.userName==sessionScope.user.userName||childcommits.users.userName==sessionScope.user.userName }">	
														<div class="" onclick="commitdel(${childcommits.cid});" style="float: right;color:#FFB800;cursor:pointer;margin-top:-15px;">删除</div>			
												</c:if>
												</shiro:user>
															</blockquote>
															</c:forEach>
													
					
													</div>
													<div class="comment-reply">
														<a rel="nofollow" class="comment-reply-link"
															href="#comment-${archivescommits.cid }"
							  								onclick="return addComment.moveForm( &quot;comment-${archivescommits.cid }&quot;, &quot;${archivescommits.cid }&quot;, &quot;respond&quot;, &quot;2&quot;,&quot;${archivescommits.users.userName }&quot;,&quot;${archivescommits.users.userName }&quot;)"
															aria-label="">回复</a>
													</div>

													</section> </article>
								


										</c:forEach>





									</ol>
									<!-- .commentlist -->
									<ol class="page-navigator">
										<div id="comments-nav" data-fuck="${archives.aid }">
											<c:if test="${pager.page!=1 }">
												<a class="prev page-numbers"
													href="<%=request.getContextPath() %>/archives/${archives.aid }_${pager.prePage}#comments">上一页</a>
											</c:if>
											<c:set var="page" value="0"></c:set>
											<c:if test="${pager.pages<7}">

												<c:forEach var="i" begin="1" end="${pager.pages}">

													<c:set var="page" value="${page+1 }"></c:set>
													<c:if test="${page==pager.page }">
														<span class="page-numbers current">${page}</span>
													</c:if>
													<c:if test="${page!=pager.page }">
														<a class="page-numbers"
															href="<%=request.getContextPath() %>/archives/${archives.aid }_${page}#comments">${page}</a>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${pager.pages>=7 }">
												<c:set var="page" value="0"></c:set>
												<c:choose>

													<c:when test="${pager.page<5}">
														<c:forEach var="i" begin="1" end="5">
															<c:set var="page" value="${page+1 }"></c:set>
															<c:if test="${page==pager.page }">
																<span class="page-numbers current">${page}</span>
															</c:if>
															<c:if test="${page!=pager.page }">
																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/archives/${archives.aid }_${page}#comments">${page}</a>
															</c:if>
															<c:if test="${page==5 }">
																<a class="page-numbers" href="#comments">....</a>

																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/archives/${archives.aid }_${pager.pages}#comments">
																	${pager.pages }</a>
																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/archives/${archives.aid }_${pager.pages}#comments">尾页</a>
															</c:if>
														</c:forEach>

													</c:when>

													<c:when test="${pager.page>=5}">
														<c:choose>
															<c:when test="${pager.page+2<pager.pages}">
																<c:set var="page" value="${pager.page-2 }"></c:set>
																<c:forEach var="i" begin="${page }"
																	end="${pager.page+2}">

																	<c:if test="${page==pager.page-2 }">

																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/archives/${archives.aid }_1#comments">1</a>
																		<a class="page-numbers" href="#comments">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																		<span class="page-numbers current">${page}</span>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/archives/${archives.aid }_${page}#comments">${page}</a>
																	</c:if>

																	<c:if test="${page==pager.page+2 }">
																		<a class="page-numbers" href="#comments">....</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/archives/${archives.aid }_${pager.pages}#comments">${pager.pages}</a>

																	</c:if>

																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>
															<c:when test="${pager.page+2>=pager.pages}">
																<c:set var="page" value="${pager.page-2 }"></c:set>
																<c:forEach var="i" begin="${page }" end="${pager.pages}">
																	<c:if test="${page==pager.page-2 }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/archives/${archives.aid }_1#comments">首页</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/archives/${archives.aid }_1#comments">1</a>
																		<a class="page-numbers" href="#comments">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																		<span class="page-numbers current">${page}</span>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/archives/${archives.aid }_${page}#comments">${page}</a>
																	</c:if>



																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>

														</c:choose>
													</c:when>

												</c:choose>
											</c:if>
											<c:if test="${pager.page!=pager.pages  }">
												<a class="prev page-numbers"
													href="<%=request.getContextPath() %>/archives/${archives.aid }_${pager.nextPage}#comments">下一页</a>
											</c:if>
										</div>
									</ol>
								</div>
							</div>
							</div>
							</div>
							<!-- #comments .comments-area -->
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




	
		<%@ include file="footer.jsp"%>
	</div>
<div class="sidebar"></div>
	<link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
	<script src='<%=request.getContextPath() %>/js/CSSPlugin.min.js'></script>
	<script src='<%=request.getContextPath() %>/js/EasePack.min.js'></script>
	<script src='<%=request.getContextPath() %>/js/TweenLite.min.js'></script>
	<script src="<%=request.getContextPath() %>/js/index.js"></script>

		
	<script src="<%=request.getContextPath() %>/js/OwO.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/activate-power-mode.js"
			charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/js/comment-reply.min.js"
			charset="utf-8"></script>
	<script type="text/javascript">
	hljs.initHighlightingOnLoad();
	window.onload=function(){
	var navc=0;
	   $(".post-body_detail :header").each(function(){
		   $(this).attr("id",""+this.innerText);
	        
	            navc++;
 $(".post-toc-content .nav").append("<li class='nav-item nav-level-2'><a class='nav-link' href='#"+this.innerText+"'><span class='nav-number'>"+navc+".</span> <span class='nav-text'>"+this.innerText+"</span></a></li>");
	 
	        });
	}
	function commitdel(CID) {
		layer.confirm('确定删除？', {icon: 2, title:'提示'}, function(index){

			var index = layer.load(2, {time: 10*1000});
			  
		
		  $.ajax({ 
		    	url: "<%=request.getContextPath()%>/delCommit", 
		    	type:'POST',
		    	data:"CID="+CID,
                   success: function(result){
       if(result.code!="0"){
      	 layer.msg(result.msg, {
      		  icon: 5,
      		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
      		}, function(){
      		  layer.close(index);
      		});   
                  
       }
       if(result.code=="0"){
    window.location.reload();
    
}  }});});
	}
	function arEdit(aid){
	
 window.location.href="<%=request.getContextPath()%>/editarchives?AID="+aid;
	}
	function arDel(aid){
		layer.confirm('确定删除？', {icon: 2, title:'提示'}, function(index){
			var index = layer.load(2, {time: 10*1000});
		  $.ajax({ 
		    	url: "<%=request.getContextPath()%>/deletearchives", 
		    	type:'POST',
		    	data:"AID="+aid,
                   success: function(result){
       if(result.code=="1"){
      	 layer.msg(result.msg, {
      		  icon: 5,
      		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
      		}, function(){
      		  layer.close(index);
      		});   
                  
       }
       if(result.code=="0"){
    window.location.href="<%=request.getContextPath()%>/";
    
}  }});});
	}
	  $(document).ready(function(){
			$(".comment-reply-link").click(function () {
		
				layui.use(['form', 'layedit', 'laydate'], function(){
					  var form = layui.form,
					  layer = layui.layer;
					  layer.photos({
						  photos: '#layer-photos'
						  ,anim:0 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
						}); 
				
					  
					  form.verify({
						  content: function(value, item){ //value：表单的值、item：表单的DOM对象
						  /*  if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
						      return '内容不能有特殊字符';
						    }
						    if(/(^\_)|(\__)|(\_+$)/.test(value)){
						      return '内容首尾不能出现下划线\'_\'';
						    }*/
							  if(value==null||value=="")
								  {
								  return '内容不能为空';
								  }
						  }
						
						}); 
					  
					  form.verify({
						  nameval:function(value){ //value：表单的值、item：表单的DOM对象
					
							   if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
							      return '昵称不能有特殊字符';
							    }
							    if(/(^\_)|(\__)|(\_+$)/.test(value)){
							      return '昵称首尾不能出现下划线\'_\'';
							    }
							  }
					  });
					 
						  form.on('submit(commentformBtn)', function(data){
							  $("#submit").val("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
								$("#submit").addClass("layui-btn-disabled");
							  $.ajax({ 
							    	url: "<%=request.getContextPath()%>/CreatearchivesCommit", 
							    	type:'POST',
							    	data:data.field,
					                     success: function(result){
					         if(result.code!="0"){
					        	 layer.msg(result.msg, {
					        		  icon: 5,
					        		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					        		}, function(){
					        		  //do something
					        		});   
					                    
					                    		$("#submit").html("<i class='layui-icon'>&#xe609;</i>发送");
					                    		$("#submit").removeClass("layui-btn-disabled");
					         }
					         if(result.code=="0"){
					        	 
					      window.location.reload();
					}
							      }});
							
							    return false;
							  });
				
					
				});
			});
		  });
	layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form,
		  layer = layui.layer;
		  layer.photos({
			  photos: '#layer-photos'
			  ,anim:0 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
			}); 
	
	 form.verify({
			  content: function(value, item){ //value：表单的值、item：表单的DOM对象
				  if(value==null||value=="")
				  {
				  return '内容不能为空';
				  }
			
			  }
			});   
	  form.verify({
		  nameval:function(value){ //value：表单的值、item：表单的DOM对象
				
			   if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
			      return '昵称不能有特殊字符';
			    }
			    if(/(^\_)|(\__)|(\_+$)/.test(value)){
			      return '昵称首尾不能出现下划线\'_\'';
			    }
			  }
	  });
			  form.on('submit(commentformBtn)', function(data){
				  $("#submit").html("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
					$("#submit").addClass("layui-btn-disabled");
				  $.ajax({ 
				    	url: "<%=request.getContextPath()%>/CreatearchivesCommit", 
				    	type:'POST',
				    	data:data.field,
		                     success: function(result){
		         if(result.code!="0"){
		        	 layer.msg(result.msg, {
		        		  icon: 5,
		        		  time: 2000 //2秒关闭（如果不配置，默认是3秒）
		        		}, function(){
		        		  //do something
		        		}); 
		                    
		                    		$("#submit").html("<i class='layui-icon'>&#xe609;</i>发送");
		                    		$("#submit").removeClass("layui-btn-disabled");
		         }
		         if(result.code=="0"){
		      window.location.reload();
		}
				      }});
				
				    return false;
				  });
	
		
	});

	$(document).ready(function() {
		var OwO_demo = new OwO({ 
			logo: 'OwO表情',
			container: document.getElementsByClassName('OwO')[0],
			target: document.getElementsByClassName('text-block')[0],
			api: '<%=request.getContextPath() %>/OwO.json',
			position: 'open',
			width: '100%',
			maxHeight: '250px'
		});
	});
	//comment-content

	POWERMODE.colorful = true; // ture 为启用礼花特效 
	POWERMODE.shake = false; // false 为禁用震动特效
	document.body.addEventListener('input', POWERMODE);
	/*(function(){
		  var oDiv=document.getElementById("sidebar");
		  var H=0,iE6;
		  var Y=oDiv;
		  while(Y){H+=Y.offsetTop;Y=Y.offsetParent};
		  iE6=window.ActiveXObject&&!window.XMLHttpRequest;
		  if(!iE6){
		    window.onscroll=function() 
		    {
		      var s=document.body.scrollTop||document.documentElement.scrollTop;
	oDiv.style.top=(s-H)+"px";
		   
		    };
		  }
		})();
*/

	</script>
</body>
</html>