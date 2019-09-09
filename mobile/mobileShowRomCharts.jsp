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
    
    <title>ANROM之家 | 排行榜</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
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
		<div class="model-roms">
			<h4><span>排行榜</span></h4>
			<h4>共<s:property value="#request.romnum"/>个ROM</h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">	  					  					
			  	<s:iterator value="#request.roms" var="rom">	  					  					
				  	<li class="mui-table-view-cell mui-media mui-col-xs-12">
						<a href="mobileShowRomDetail?user.userid=<s:property value='#session.user.userid'/>&rom.romid=<s:property value='#rom.romid'/>&model.modelid=<s:property value='#rom.model.modelid'/>&savehistory=1&cmodule=rom&currentPage=1"style="padding: 0">
							<div class="mui-media-body box rom-box model-rom-box">
							  	<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>" style="padding-bottom: 20px">
								<div class="info rom-info model-rom-info">
									<span><s:property value='#rom.title'/></span>
									<p>开发者：<s:property value='#rom.user.uname'/></p>
									<p>安卓版本：<s:property value='#rom.android.android'/></p>
									<p>UI类型：<s:property value='#rom.uitype.uitype'/></p>
									<p>下载：<s:property value='#rom.download'/></p>
									<p>评分：<s:if test="#rom.scoreave!=null"><span><s:property value='#rom.scoreave'/></span>/10.0分</s:if><s:else>暂无评分</s:else></p>
								</div>					
							</div>
						</a>
					</li>					
				</s:iterator>
			</ul>
		</div>
		<jsp:include page="module/mobilePager.jsp"/>
	</div>
	<jsp:include page="module/mobileFooter.jsp"/>
  </body>
</html>
