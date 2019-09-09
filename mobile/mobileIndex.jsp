<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/mobile/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ANROM之家 | 首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="ROM,刷机包下载,固件下载,安卓ROM">
	<meta http-equiv="description" content="纯净,简洁,海量精品ROM免费下载">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<link rel="stylesheet" type="text/css" href="css/mobile-romms.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/mobile-romms.js"></script>
  </head>
  
  <body>
  	<jsp:include page="module/mobileHeader.jsp"/>
	<div class="mui-content">
		<!-- 轮播图 -->
		<div id="slider" class="mui-slider" >
		  <div class="mui-slider-group mui-slider-loop">
			<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
			<div class="mui-slider-item mui-slider-item-duplicate">
			  <a href="#">
				<img src="<%=request.getContextPath() %>/images/indexlunbo/miui10.png"/>
			  </a>
			</div>
			<!-- 第一张 -->
			<div class="mui-slider-item">
			  <a href="#">
				<img src="<%=request.getContextPath() %>/images/indexlunbo/flyme7.png"/>
			  </a>
			</div>
			<!-- 第二张 -->
			<div class="mui-slider-item">
			  <a href="#">
				<img src="<%=request.getContextPath() %>/images/indexlunbo/funtouchos.png"/>
			  </a>
			</div>
			<!-- 第三张 -->
			<div class="mui-slider-item">
			  <a href="#">
				<img src="<%=request.getContextPath() %>/images/indexlunbo/h2os.png"/>
			  </a>
			</div>
			<!-- 第四张 -->
			<div class="mui-slider-item">
			  <a href="#">
				<img src="<%=request.getContextPath() %>/images/indexlunbo/miui10.png"/>
			  </a>
			</div>
			<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
			<div class="mui-slider-item mui-slider-item-duplicate">
			  <a href="#">
				<img src="<%=request.getContextPath() %>/images/indexlunbo/flyme7.png"/>
			  </a>
			</div>
		  </div>
		  <div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<div class="mui-indicator"></div>
			<div class="mui-indicator"></div>
			<div class="mui-indicator"></div>
		  </div>
		</div>
		<div class="hot-models">
			<h4>热门机型</h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">
				<s:action name="mobileShowHostestModel" executeResult="true" namespace="/mobile"/>
			</ul>
			<button class="mui-btn mui-btn-green mui-btn-block" id="moreBtn">查看更多</button>
		</div>
		<div class="hot-roms">
			<h4>热门ROM</h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">
				<s:action name="mobileShowHostestRom" executeResult="true" namespace="/mobile"/>
			</ul>
		</div>
	</div>
	<jsp:include page="module/mobileFooter.jsp"/>
	<script type="text/javascript">
		$(function(){
			$("#footer>a:eq(0)").addClass("mui-active");
		})
	</script>
  </body>
</html>
