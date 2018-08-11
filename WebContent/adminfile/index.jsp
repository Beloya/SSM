
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/skins/_all-skins.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/AdminLTE.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/ionicons.min.css" />

<title>管理系统</title>

</head>

<body class="skin-blue sidebar-mini">
	<%


%>
	<div class="wrapper" style="height: auto;">
		<%@ include file="top_nav.jsp"%>
		<%@ include file="left_nav.jsp"%>


		<section class="content-header">
		<h1>
			<font><font> 主页面 </font></font><small><font><font>beta</font></font></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i><font><font>
					</font></font></a></li>
			<li class="active"><font><font></font></font></li>
		</ol>
		</section>
		<div class="content-wrapper"
			style="height: 1500px; min-height: 1500px;">

			<section class="content " style="padding-top:2em;">



			<div class="col-md-3 col-sm-6 col-xs-12 ">
				<div class="info-box">
					<span class="info-box-icon bg-yellow"> <i
						class="ion ion-ios-people-outline" style="padding-top: 0.5em;"></i></span>

					<div class="info-box-content">

						<span class="info-box-text"><font><font class="">用户数</font></font></span>
						<span class="info-box-number"><font><font class="">${userCount}</font></font></span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-aqua"> <i class="fa fa-user-plus"
						style="padding-top: 0.5em;"></i></span>

					<div class="info-box-content">
						<span class="info-box-text">新成员</span> <span
							class="info-box-number">${newregistercount}</span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-green"> <i class="fa  fa-wrench"
						style="padding-top: 0.5em;"></i></span>

					<div class="info-box-content">
						<span class="info-box-text">Cpu使用率</span> <span
							class="info-box-number" id="CpuInfo">加载中....</span>
							<span id="mousespeed"><canvas style="display: inline-block; width: 60px; height: 16px; vertical-align: top;" width="120" height="16"></canvas></span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-red"> <i class="fa fa-book"
						style="padding-top: 0.5em;"></i></span>

					<div class="info-box-content">
						<span class="info-box-text">磁盘使用率</span> <span
							class="info-box-number" id="DiskUsage">加载中...</span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			
			<div class="col-md-6">
              <!-- USERS LIST -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">最新成员</font></font></h3>

                  <div class="box-tools pull-right">
                    <span class="label label-danger"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${newregistercount}位新成员</font></font></span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding" style="
    height: 280px;
">
                  <ul class="users-list clearfix">
                  <c:forEach items="${newuserlist}" var="newuser">
                    <li style="height:128px;width:95px;">
                      <img src="<%=request.getContextPath() %>/${newuser.userImg}" alt="用户图像">
                      <a class="users-list-name" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${newuser.userName}</font></font></a>
                      <span class="users-list-date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${newuser.strTime}</font></font></span>
                    </li>
                  </c:forEach>
                  </ul>
                  <!-- /.users-list -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer text-center">
                  <a href="javascript:void(0)" class="uppercase"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查看所有用户</font></font></a>
                </div>
                <!-- /.box-footer -->
              </div>
              <!--/.box -->
            </div>
			
<div class="col-md-3">
				<div class="box box-primary">
					<div class="box-header with-border">
						<i class="fa fa-code-fork"></i>

						<h3 class="box-title">磁盘占用</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<div id="donut-chart" style="height: 300px; padding: 0px; position: relative;">
							<canvas class="flot-base" width="446" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 446px; height: 300px;"></canvas>
							<canvas class="flot-overlay" width="446" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 446px; height: 300px;"></canvas>
							
						<span class="pieLabel" id="pieLabel0" style="position: absolute; top: 118px; left: 307px;"><div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">动漫<br>46%</div></span><span class="pieLabel" id="pieLabel1" style="position: absolute; top: 219px; left: 162px;"><div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">教育<br>23%</div></span><span class="pieLabel" id="pieLabel2" style="position: absolute; top: 73px; left: 126px;"><div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">体育<br>31%</div></span></div>
					</div>
					<!-- /.box-body-->
				</div>
			</div>
			<div class="col-md-3">
		<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">最新热门话题</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
              <c:forEach items="${Hotnote}" var="note">
                <li class="item">
                  <div class="product-img">
                    <img src="<%=request.getContextPath() %>/${note.userImg}" alt="">
                  </div>
                  <div class="product-info">
                    <a href="javascript:void(0)" class="product-title">  ${note.title}
                      <span class="label label-warning pull-right">${note.commentcount}</span></a>
                        <span class="product-description">
                        ${note.userName}
                        </span>
                  </div>
                </li>
           </c:forEach>
                <!-- /.item -->
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
              <a href="javascript:void(0)" class="uppercase">查看所有</a>
            </div>
            <!-- /.box-footer -->
          </div>
</div>





			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<i class="fa fa-bar-chart-o"></i>

						<h3 class="box-title">内存负载情况</h3>

						<div class="box-tools pull-right">
							监控
							<div class="btn-group" id="realtime" data-toggle="btn-toggle">
								<button type="button" class="btn btn-default btn-xs active"
									data-toggle="on">开</button>
								<button type="button" class="btn btn-default btn-xs"
									data-toggle="off">关</button>
							</div>
						</div>
					</div>
					<div class="box-body">
						<div id="interactive"
							style="height: 300px; padding: 0px; position: relative;">
							<canvas class="flot-base" width="700" height="300"
								style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 700px; height: 300px;"></canvas>
							<div class="flot-text"
								style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
								<div class="flot-x-axis flot-x1-axis xAxis x1Axis"
									style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 24px; text-align: center;">0</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 87px; text-align: center;">10</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 154px; text-align: center;">20</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 222px; text-align: center;">30</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 289px; text-align: center;">40</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 356px; text-align: center;">50</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 423px; text-align: center;">60</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 490px; text-align: center;">70</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 557px; text-align: center;">80</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; max-width: 63px; top: 282px; left: 625px; text-align: center;">90</div>
								</div>
								<div class="flot-y-axis flot-y1-axis yAxis y1Axis"
									style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
									<div class="flot-tick-label tickLabel"
										style="position: absolute; top: 269px; left: 15px; text-align: right;">0</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; top: 215px; left: 8px; text-align: right;">20</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; top: 161px; left: 8px; text-align: right;">40</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; top: 108px; left: 8px; text-align: right;">60</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; top: 54px; left: 8px; text-align: right;">80</div>
									<div class="flot-tick-label tickLabel"
										style="position: absolute; top: 1px; left: 1px; text-align: right;">100</div>
								</div>
							</div>
							<canvas class="flot-overlay" width="700" height="300"
								style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 700px; height: 300px;"></canvas>
						</div>
					</div>
					<!-- /.box-body-->
				</div>

			</div>








			</section>

		</div>

	</div>

	<script
		src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath() %>/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath() %>/js/app.min.js"></script>
	<!-- Sparkline -->
	<script
		src="<%=request.getContextPath() %>/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script
		src="<%=request.getContextPath() %>/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script
		src="<%=request.getContextPath() %>/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script
		src="<%=request.getContextPath() %>/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.min.js"></script>

	<script
		src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=request.getContextPath() %>/plugins/layui/layui.js"
		charset="utf-8"></script>
	<script
		src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.categories.min.js"></script>
	<script>
	var	CpuRatio=0;
    var mrefreshinterval = 5000; // update display every 500ms
    var lastmousex = -1;
    var lastmousey = -1;
    var lastmousetime;
    var mousetravel = 0;
    var mpoints = [];
    var mpoints_max = 30;
 	var precent;
 	var ThreadCount;
    var CpuInfo=document.getElementById("CpuInfo");
    var DiskUsageInfo=document.getElementById("DiskUsage");
$(function () {
	var data = [], 
	totalPoints = 100;

    function getRandomData() {

      // Do a random walk
     if (data.length > 0)
        data = data.slice(1);

      // Do a random walk
      while (data.length < totalPoints) {

   

        data.push(0);
      }
  $.ajax({
       url:'<%=request.getContextPath()%>/adminfile/getInfo.html',
       type:"POST",
		 async:true,
	     data:"",
       success: function(msg) {
       precent=(msg.data.Total_RAM-msg.data.Available_RAM)/msg.data.Total_RAM*100;
       	 data.push(precent);
      	CpuRatio=(msg.data.CpuRatio);
      	DiskUsageCount=(msg.data.DiskUsage);
      	DiskUsageInfo.innerHTML=DiskUsageCount+"%";
  CpuInfo.innerHTML=CpuRatio+"%";
  drawMouseSpeedDemo(CpuRatio);
		  }
		});
   	
 
      
      

      // Zip the generated y values with the x values
      var res = [];
      for (var i = 0; i < data.length; ++i) {
        res.push([i, data[i]]);
      }

      return res;
    }

    var interactive_plot = $.plot("#interactive", [getRandomData()], {
      grid: {
        borderColor: "#f3f3f3",
        borderWidth: 1,
        tickColor: "#f3f3f3"
      },
      series: {
        shadowSize: 0, // Drawing is faster without shadows
        color: "#3c8dbc"
      },
      lines: {
        fill: true, //Converts the line chart to area chart
        color: "#3c8dbc"
      },
      yaxis: {
        min: 0,
        max: 100,
        show: true
      },
      xaxis: {
        show: true
      }
    });

    var updateInterval = 5000; //Fetch data ever x milliseconds
    var realtime = "on"; //If == to on then fetch data every x seconds. else stop fetching
    function update() {

      interactive_plot.setData([getRandomData()]);

      // Since the axes don't change, we don't need to call plot.setupGrid()
      interactive_plot.draw();
      if (realtime === "on")
        setTimeout(update, updateInterval);
    }

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === "on") {
      update();
    }
    //REALTIME TOGGLE
    $("#realtime .btn").click(function () {
      if ($(this).data("toggle") === "on") {
        realtime = "on";
      }
      else {
        realtime = "off";
      }
      update();
    });
    /*
     * END INTERACTIVE CHART
     */

    /*
     * DONUT CHART
     * -----------
     */
<%
HashMap<String,Integer> disk=(HashMap<String,Integer>)request.getAttribute("disk");
    %>
    var donutData = [
      {label: "空闲未使用", data: <%=disk.get("diskNotuse")%>, color: "#A2B4BA"},
      {label: "已经使用", data: <%=disk.get("diskISuse")%>, color: "#0073b7"},
     
    ];
    $.plot("#donut-chart", donutData, {
      series: {
        pie: {
          show: true,
          radius: 1,
          innerRadius: 0.5,
          label: {
            show: true,
            radius: 2 / 3,
            formatter: labelFormatter,
            threshold: 0.1
          }

        }
      },
      legend: {
        show: false
      }
    });
    /*
     * END DONUT CHART
     */
   

  });

  /*
   * Custom Label formatter
   * ----------------------
   */
  function labelFormatter(label, series) {
    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
        + label
        + "<br>"
        + Math.round(series.percent) + "%</div>";
  }
  function drawMouseSpeedDemo(CpuRatio) {

	    	
	        mpoints.push(CpuRatio);
	        if (mpoints.length > mpoints_max)
	          mpoints.splice(0, 1);
	        mousetravel = 0;
	        $('#mousespeed').sparkline(mpoints, {width: mpoints.length * 2, tooltipSuffix: ' pixels per second'});   
	
	    // We could use setInterval instead, but I prefer to do it this way

	  }
</script>
</body>
</html>