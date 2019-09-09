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
    <s:iterator value="#request.roms" var="rom">	  					  					
	  	<li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-3">
			<a href="mobileShowRomDetail?user.userid=<s:property value='#session.user.userid'/>&rom.romid=<s:property value='#rom.romid'/>&model.modelid=<s:property value='#rom.model.modelid'/>&savehistory=1&cmodule=rom&currentPage=1">
				<div class="mui-media-body box rom-box">
					<h5><b><s:property value='#rom.model.model'/>_<s:property value='#rom.uitype.uitype'/></b></h5>
				  	<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>">
					<div class="info rom-info">
						<p>安卓版本：<s:property value='#rom.android.android'/></p>
						<p>UI：<s:property value='#rom.uitype.uitype'/></p>
						<p>大小：<s:property value='#rom.romsize'/>M</p>
						<p>下载：<s:property value='#rom.download'/></p>
						<p>评分：<s:if test="#rom.scoreave!=null"><s:property value='#rom.scoreave'/></s:if><s:else>暂无评分</s:else></p>
					</div>					
				</div>
			</a>
		</li>					
	</s:iterator>
  </body>
</html>
