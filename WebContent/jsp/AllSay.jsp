<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>树洞</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/S.css">
<link rel="stylesheet" href="https://tuxiang-1251384861.cos.ap-guangzhou.myqcloud.com/css/main.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/SigmarOne.woff2"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/OwO.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">

<style type="text/css">
body .footer {
	position: inherit;
}

.comment-content  img {
	width: 64px;
	height: 64px;
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

					<div id="content" class="content">
						<div class="layui-container"
							style="position: relative; padding-bottom: 380px;">
							<div class="layui-row ">


								<div class="layui-col-md12">



									<div class="block">
										<div class="block-header" ata-animation="on">
											<h3 class="block-title">留言板</h3>
										</div>

										<div class="block-body">


											<div class="typo data-animation
data">


												${applicationScope.BlogInfo.messagesay}</div>

										</div>
									</div>



								
								</div>

							<div class="layui-row" >
							
					<div class="--comments" id="comments" >
				<div class="block comment-block divtest animated animation-delay-5" style="padding:15px 15px 15px 15px;" data-animation="on">
							<div id="respond" class="comment-respond">
								<h3 id="reply-title" class="divtest animated animation-delay-5" data-animation="on">
									畅所欲言 <small><a rel="nofollow"
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
										value="">

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
									class="divtest sdiv on" data-animation="on"> 活抓 ${pager.total }留言</a>
								<div class="commentshow">
									<ol class="commentlist"> 
							<div id="layer-photos-demo" class="layer-photos-demo">
										<c:forEach items="${mblist}" var="list">
												
												<li class="comment even thread-even depth-1"
													id="li-comment-${list.mbid }"
													itemprop="reviews" itemscope=""
													itemtype="http://schema.org/Review"><article
														id="comment-${list.mbid }"
														class="comment-${list.mbid }"> <header
														class="comment-meta comment-author vcard"> 
														<img alt="" 
													<c:if test="${!empty list.users.userImg}">	src="<%=request.getContextPath() %>${list.users.userImg }"</c:if>
													<c:if test="${empty list.users.userImg}">	src="<%=request.getContextPath() %>/images/1.jpg"</c:if>
														class="avatar avatar-44 photo" height="44" width="44">
													<div class="comments-authore-title">
														<div class="comments-name" itemprop="author">
															<a href="<%=request.getContextPath() %>/user/detail.html?userName=${list.users.userName}" rel="external nofollow" class="url external">
															<c:if test="${!empty list.users.userName}">${list.users.userName }</c:if>
																<c:if test="${empty list.users.userName}">${list.name}(观光团)</c:if>
															</a>
														</div>
														<div class="comments-class">天然呆</div>
													<shiro:user>    
														<c:if test="${applicationScope.BlogInfo.createdBy==sessionScope.user.userName||list.users.userName==sessionScope.user.userName }">
														<div class="comments-ua" onclick="commitdel(${list.mbid});" style="float: right;color:#FFB800;cursor:pointer;">删除</div>
												</c:if>
												</shiro:user>
													</div>
													<a
														href="">
														<time datetime="" itemprop="datePublished">
																	${Calendar.setTime(list.createdTime )}
${Calendar.get(Calendar_Year)}年${Calendar.get(Calendar_MONTH)+1}月${Calendar.get(Calendar_DAY_OF_MONTH)}&nbsp;${Calendar.get(Calendar_HOUR_OF_DAY)}:${Calendar.get(Calendar_MINUTE)}
													</time>
													</a> </header> <section class="comment-content comment">
														
													<div itemprop="reviewBody">
														<p>${list.context }</p>
														
														<c:forEach items="${list.childmblist }" var="childcommits">
														<blockquote style=" padding:10px 10px 10px 10px; border-bottom: inset;">
														<a style="color:#97dffd;cursor:pointer; padding:10px 10px 10px 10px;" onclick="return addComment.moveForm( &quot;comment-${list.mbid }&quot;, &quot;${list.mbid }&quot;, &quot;respond&quot;, &quot;2&quot;,&quot;${list.users.userName }&quot;,&quot;${list.users.userName }&quot;)" rel="external nofollow" class="url external">
												
													<c:if test="${empty childcommits.createdBy}">${childcommits.name}(观光团)：</c:if>		
																<c:if test="${!empty childcommits.createdBy}">${childcommits.createdBy}：</c:if>			
															</a><p style="width:90%;">${childcommits.context}</p>
															<c:if test="${createuser.userName==sessionScope.user.userName||childcommits.users.userName==sessionScope.user.userName }">
														<div class="" onclick="commitdel(${childcommits.mbid});" style="float: right;color:#FFB800;cursor:pointer;margin-top:-15px;">删除</div>
												</c:if>
															</blockquote>
															</c:forEach>
													
					
													</div>
												
													<div class="comment-reply">
														<a rel="nofollow" class="comment-reply-link"
															href="#comment-${list.mbid }"
							  								onclick="return addComment.moveForm( &quot;comment-${list.mbid }&quot;, &quot;${list.mbid }&quot;, &quot;respond&quot;, &quot;2&quot;,&quot;${list.users.userName }&quot;,&quot;${list.users.userName }&quot;)"
															aria-label="">回复</a>
													</div>

													</section> </article>
								


										</c:forEach>
</div>




									</ol>
									<!-- .commentlist -->
									<ol class="page-navigator">
										<div id="comments-nav" data-fuck="${archives.aid }">
											<c:if test="${pager.page!=1 }">
												<a class="prev page-numbers"
													href="<%=request.getContextPath() %>/hall/${pager.prePage}#comments">上一页</a>
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
															href="<%=request.getContextPath() %>/hall/${page}#comments">${page}</a>
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
																	href="<%=request.getContextPath() %>/hall/${page}#comments">${page}</a>
															</c:if>
															<c:if test="${page==5 }">
																<a class="page-numbers" href="#comments">....</a>

																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/hall/${pager.pages}#comments">
																	${pager.pages }</a>
																<a class="page-numbers"
																	href="<%=request.getContextPath() %>/hall/${pager.pages}#comments">尾页</a>
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
																			href="<%=request.getContextPath() %>/hall/1#comments">1</a>
																		<a class="page-numbers" href="#comments">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																		<span class="page-numbers current">${page}</span>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/hall/${page}#comments">${page}</a>
																	</c:if>

																	<c:if test="${page==pager.page+2 }">
																		<a class="page-numbers" href="#comments">....</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/hall/${pager.pages}#comments">${pager.pages}</a>

																	</c:if>

																	<c:set var="page" value="${page+1 }"></c:set>
																</c:forEach>
															</c:when>
															<c:when test="${pager.page+2>=pager.pages}">
																<c:set var="page" value="${pager.page-2 }"></c:set>
																<c:forEach var="i" begin="${page }" end="${pager.pages}">
																	<c:if test="${page==pager.page-2 }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/hall/1#comments">首页</a>
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/hall/1#comments">1</a>
																		<a class="page-numbers" href="#comments">....</a>
																	</c:if>

																	<c:if test="${page==pager.page }">
																		<span class="page-numbers current">${page}</span>
																	</c:if>

																	<c:if test="${page!=pager.page }">
																		<a class="page-numbers"
																			href="<%=request.getContextPath() %>/hall/${page}#comments">${page}</a>
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
													href="<%=request.getContextPath() %>/hall/${pager.nextPage}#comments">下一页</a>
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
					</div>
				</div>
			</div>
		</div>

	<%@ include file="footer.jsp"%>
	<script src='<%=request.getContextPath()%>/js/CSSPlugin.min.js'></script>
	<script src='<%=request.getContextPath()%>/js/EasePack.min.js'></script>
	<script src='<%=request.getContextPath()%>/js/TweenLite.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/index.js"></script>

<script src="<%=request.getContextPath()%>/js/isScroll.js"></script>
	<script src="<%=request.getContextPath()%>/js/OwO.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/activate-power-mode.js"
		charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/comment-reply.min.js"
		charset="utf-8"></script>
	<script type="text/javascript">
	$(".layui-nav-item").removeClass("layui-this");
	$("#留言板").addClass("layui-this");

				$(document).ready(function() {
					var OwO_demo = new OwO({ 
						logo: 'OwO表情',
						container: document.getElementsByClassName('OwO')[0],
						target: document.getElementsByClassName('text-block')[0],
						api: '<%=request.getContextPath()%>/OwO.json',
						position: 'open',
						width: '100%',
						maxHeight: '250px'
					});
				});
				
				layui.use(['form', 'layedit', 'laydate'], function(){
					  var form = layui.form,
					  layer = layui.layer;
				
					  layer.photos({
						  photos: '#layer-photos-demo'
						  ,anim: 3 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
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
					  
					  form.on('submit(commentformBtn)', function(data){
						  $("#submit").val("<i class='layui-icon layui-anim layui-anim-rotate layui-anim-loop'>&#xe63d;</i>");
							$("#submit").addClass("layui-btn-disabled");
						  $.ajax({ 
						    	url: "<%=request.getContextPath()%>/CreateaSay", 
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
				  $(document).ready(function(){
					  isScroll.init('.divtest');
						$(".comment-reply-link").click(function () {
							
						});
						});
					POWERMODE.colorful = true; // ture 为启用礼花特效 
					POWERMODE.shake = false; // false 为禁用震动特效
					document.body.addEventListener('input', POWERMODE);

				 

				</script>

</body>
</html>