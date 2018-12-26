<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息中心</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/skins/_all-skins.min.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/AdminLTE.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/global.css">
</head>
<body>
<div id="container" class="skin-blue sidebar-mini">
    <div class="fly-home fly-panel" style="background-image: url();margin-bottom: 0;">
    <img src="http://thirdqq.qlogo.cn/qqapp/101451317/60A68B1C02041D6ABB8C89A372CA0D65/100" alt="鱼先生">
    <!--<i class="iconfont icon-renzheng" title="iVusic"></i>-->
    <h1>
        鱼先生        <i class="iconfont icon-nan"></i>
            </h1>
    
    <p class="fly-home-info">
        <i class="layui-icon layui-icon-rmb" title="积分"></i><span style="color: #FF7200;">50 积分</span>
        <i class="iconfont icon-shijian"></i><span>2018-02-14 加入</span>
        <i class="iconfont icon-chengshi"></i><span>广东 - 河源 - </span>
    </p>

    <p class="fly-home-sign"></p>

    <div class="fly-sns" data-user="">
        <a href="javascript:;" class="layui-btn layui-btn-primary" onclick="layer.tips('稍后推出.', this, {tips:4})"><i class="layui-icon"></i>聊天</a>
            </div>

</div>
<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear" style="text-align: center;">
            <li class=""><a href="/index/user/index/id/66.html" data-pjax="">作品</a></li>
            <li class=""><a href="/index/user/love/id/66.html" data-pjax="">关注</a></li>
            <li class=""><a href="/index/user/people/id/66.html" data-pjax="">粉丝</a></li>
                        <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
            <li class=""><a href="/index/user/home.html" data-pjax="">用户中心</a></li>
            <li class="layui-this"><a href="/index/user/message.html" data-pjax="">消息中心</a></li>
                    </ul>
    </div>
</div>
    <div class="layui-container fly-marginTop">
        <div class="fly-panel fly-panel-user" pad20="" id="containerUserNav">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title" id="LAY_mine">
                    <li class="" lay-id="zan">点赞</li>
                    <li lay-id="comment" class="">评论</li>
                    <li lay-id="mess" class="layui-this">私信</li>
                </ul>
                <div class="layui-tab-content" style="padding: 20px 0;">
                    <div class="layui-form-pane layui-tab-item">
                                                <div class="fly-none">暂时没有点赞</div>
                                            </div>
                    <div class="layui-form-pane layui-tab-item">
                                                <div class="fly-none">暂时没有评论</div>
                                            </div>

                    <div class="layui-form-pane layui-tab-item layui-show">
                        <!--<div class="fly-none">您暂时没有最新消息</div>-->
                        <ul class="mine-msg">
                            <li data-id="123">
                                <blockquote class="layui-elem-quote">
                                    <a href="/jump?username=Absolutely" target="_blank"><cite>Absolutely</cite></a>回答了您的求解<a target="_blank" href="/jie/8153.html/page/0/#item-1489505778669"><cite>layui后台框架</cite></a>
                                </blockquote>
                                <p><span>1小时前</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
                            </li>
                            <li data-id="123">
                                <blockquote class="layui-elem-quote">
                                    系统消息：欢迎使用 layui
                                </blockquote>
                                <p><span>1小时前</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
<script
			src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>

		<script
			src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"
		charset="utf-8"></script>
<script>
layui.use('element', function(){
  var element = layui.element;
  
  //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
  var layid = location.hash.replace(/^#user=/, '');
  element.tabChange('user', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项
  
  //监听Tab切换，以改变地址hash值
  element.on('tab(user)', function(){
    location.hash = 'user='+ this.getAttribute('lay-id');
  });
});
</script>    
</body>
</html>