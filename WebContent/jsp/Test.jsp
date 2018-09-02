<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实验室</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/S.css">
</head>
<style>
.tariffCards {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -180px 0 0 -140px;
  user-select: none;
  transform: translate3d(0, 0, 0);
  transform-style: preserve-3d;
}
.tariffCards:after {
  position: absolute;
  bottom: -27px;
  left: 5%;
  content: "";
  width: 65%;
  height: 10px;
  border-radius: 100%;
  background-image: radial-gradient(rgba(34, 50, 84, 0.04), rgba(34, 50, 84, 0));
}
.tariffCards > div {
  position: relative;
  width: 280px;
  height: 140px;
  border-radius: 12px;
  color: white;
  transform: rotateX(45deg) rotateY(-15deg) rotate(45deg);
  transition: all 0.4s ease;
  overflow: hidden;
  cursor: pointer;
}
.tariffCards > div:after {
  position: absolute;
  top: -70px;
  left: 0;
  content: "";
  width: 200%;
  height: 200%;
  background-image: linear-gradient(60deg, rgba(255, 255, 255, 0) 20%, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0) 80%);
  transform: translateX(-100%);
}
.tariffCards > div img {
  margin-top: 15px;
  pointer-events: none;
}
.tariffCards > div h3 {
  position: absolute;
  bottom: 28px;
  left: 15px;
  font-size: 18px;
  font-weight: 800;
}
.tariffCards > div span {
  position: absolute;
  font-weight: 700;
  bottom: 15px;
  left: 15px;
  font-size: 12px;
  font-weight: 600;
  opacity: 0.8;
}
.tariffCards > div.economy {
  margin-top: 0;
  z-index: 3;
  background-color: #8063E1;
  background-image: linear-gradient(135deg, #BD7BE8, #8063E1);
  box-shadow: 20px 20px 60px rgba(34, 50, 84, 0.5), 1px 1px 0px 1px #8063E1;
}
.tariffCards > div.premiumeconomy {
  margin-top: -70px;
  z-index: 2;
  background-color: #3F58E3;
  background-image: linear-gradient(135deg, #7F94FC, #3F58E3);
  box-shadow: 20px 20px 60px rgba(34, 50, 84, 0.5), 1px 1px 0px 1px #3F58E3;
}
.tariffCards > div.business {
  margin-top: -70px;
  z-index: 1;
  background-color: #2C6FD1;
  background-image: linear-gradient(135deg, #21BBFE, #2C6FD1);
  box-shadow: 20px 20px 60px rgba(34, 50, 84, 0.5), 1px 1px 0px 1px #2C6FD1;
}
.tariffCards > div.first {
  margin-top: -70px;
  background-color: #352F64;
  background-image: linear-gradient(135deg, #415197, #352F64);
  box-shadow: 5px 5px 60px rgba(34, 50, 84, 0.1), 1px 1px 0px 1px #352F64;
}
.tariffCards > div:hover {
  transform: rotateX(30deg) rotateY(-15deg) rotate(30deg) translate(-25px, 50px);
}
.tariffCards > div:hover:after {
  transform: translateX(100%);
  transition: all 1.2s ease-in-out;
}

a {
  position: fixed;
  bottom: 20px;
  right: 20px;
  color: #0077FF;
  font-size: 14px;
  font-weight: 700;
}

</style>
<body>
<nav class="Top"> <%@ include file="Nav.jsp"%>
		<p id="offscreen-text" class="offscreen-text"></p>
		<p id="text" class="text"></p>
	 </nav>
		
<div class="tariffCards" onclick="Music();">

    <div class="economy">
    
        <img src="http://jq22.qiniudn.com/tarcs.png" alt="Economy" height="74">
       
        <h3> 3D音乐播放器  </h3>
         
        <span></span>
         
    </div>

    <div class="premiumeconomy" onclick="Music();">
        <img src="http://jq22.qiniudn.com/tarcs.png" alt="Premium Economy" height="74">
        <h3>3D音乐播放器</h3>
        <span></span>
    </div>
    <div class="business" onclick="Music();">
        <img src="http://jq22.qiniudn.com/tarcs.png" alt="Business" height="74">
        <h3>3D音乐播放器</h3>
        <span></span>
    </div>
    <div class="first" onclick="Back();">
        <img src="http://jq22.qiniudn.com/tarcs.png" alt="First" height="74">
        <h3>回到首页</h3>
        <span></span>
    </div>
</div>
<script type="text/javascript">
function Music() {
	location.href="<%=request.getContextPath()%>/TestHtml/3DMusic.htm";
}
function Back() {
	location.href="<%=request.getContextPath()%>/";
}
</script>
</body>
</html>