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
    <div class="col-md-1 text-right">安卓：</div>
    <s:iterator value="#request.androids" var="rom">
    	<div class="col-md-1"><a href="showUitypeRomByAndroid.action?uitype.uiid=<s:property value="#rom.uitype.uiid"/>&android.anid=<s:property value="#rom.android.anid"/>&currentPage=1"><s:property value="#rom.android.android"/></a></div>
    </s:iterator>
  </body>
</html>
