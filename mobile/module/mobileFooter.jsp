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
  </head>  
  <body>
    <nav class="mui-bar mui-bar-tab footer" id="footer">
		<a class="mui-tab-item" id="index">
			<span class="mui-icon mui-icon-home"></span>
			<span class="mui-tab-label">首页</span>
		</a>
		<a class="mui-tab-item" id="download">
			<span class="mui-icon mui-icon-download"></span>
			<span class="mui-tab-label">ROM下载</span>
		</a>
		<a class="mui-tab-item" id="uitype">
			<span class="mui-icon mui-icon-spinner-cycle mui-spin"></span>
			<span class="mui-tab-label">UI专区</span>
		</a>
		<a class="mui-tab-item" id="teach">
			<span class="mui-icon mui-icon-help"></span>
			<span class="mui-tab-label">教程</span>
		</a>
		<a class="mui-tab-item" id="news">
			<span class="mui-icon mui-icon-info"></span>
			<span class="mui-tab-label">资讯</span>
		</a>
		<a class="mui-tab-item" id="charts">
			<span class="mui-icon mui-icon-list"></span>
			<span class="mui-tab-label">排行榜</span>
		</a>
	</nav>
	<script type="text/javascript">
		function jump(id,url){
			document.getElementById(id).addEventListener('tap', function() {
			//打开关于页面
				mui.openWindow({
					url: url, //目标页面地址
					id:id //触发新打开页面的id
				});
			});
		}
		jump('index','mobileIndex.jsp');
		jump('download','mobileShowRomDownload?currentPage=1');
		jump('uitype','mobileShowUiType');
		jump('charts','mobileShowRomCharts');
	</script>
  </body>
</html>
