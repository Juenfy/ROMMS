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
    <div class="col-md-1 text-right">UI类型：</div>
    <s:iterator value="#request.uitypes" var="rom">
    	<div class="col-md-1"><a href="showModelRomByUitype.action?model.modelid=<s:property value="#rom.model.modelid"/>&uitype.uiid=<s:property value="#rom.uitype.uiid"/>&currentPage=1"><s:property value="#rom.uitype.uitype"/></a></div>
    </s:iterator>
  </body>
</html>
