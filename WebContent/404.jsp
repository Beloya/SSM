<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>迷路了</title>
</head>
<style type="text/css">
html {
  margin: 0;
  padding: 0;
  background-color: white;
}

body,
html {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

#svgContainer {
  width: 640px;
  height: 512px;
  background-color: white;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
}
</style>
<body>

<script src="<%=request.getContextPath() %>/js/bodymovin.js"></script>
<script src="<%=request.getContextPath() %>/js/data.js"></script>
<div id="svgContainer"></div>
<a href="<%=request.getContextPath()%>/">返回首页</a>
<script src="<%=request.getContextPath() %>/js/three.min.js"></script>
<script type="text/javascript">
var svgContainer = document.getElementById('svgContainer');
var animItem = bodymovin.loadAnimation({
  wrapper: svgContainer,
  animType: 'svg',
  loop: true,
  animationData: JSON.parse(animationData)
});
</script>
</body>
</html>