<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
  </head>  
  <body>
		<s:if test="#request.userscore==0">
			<div id="noscore">暂无评分</div>
		</s:if>
		<s:else>
			<div id="romsocre"><s:property value="#request.scoreave"/></div>
		</s:else>
		<div id="num">评分：<s:property value="#request.scorenum"/> | 下载：<s:property value="#request.rom.download"/></div>				
  </body>
</html>
