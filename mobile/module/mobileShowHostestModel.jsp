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
    <s:iterator value="#request.models" var="model">	  					  					
	  	<li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-3">
			<a href="mobileShowModelRom?model.modelid=<s:property value='#model.modelid'/>&savehistory=0&currentPage=1">
				<div class="mui-media-body box model-box">
					<s:if test="#model.moimg!=null">
				  		<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#model.mfture.mfture'/>/<s:property value='#model.model'/>/<s:property value='#model.moimg'/>">
					</s:if>
					<s:else>
						<img src="<%=request.getContextPath() %>/images/phone/default.png">
					</s:else>
					<div class="info model-info">
						<p><s:property value='#model.model'/></p>
						<p>ROM：<span><s:property value='#model.romnum'/></span></p>
						<p>教程：<span><s:property value='#model.flashteachs.size'/></span></p>
					</div>					
				</div>
			</a>
		</li>					
	</s:iterator>
  </body>
</html>
