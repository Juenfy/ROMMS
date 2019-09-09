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
    <title>移动端Tips</title>
  </head>
  
  <body>
  	<marquee><h1 align="center" style="color: skyblue;margin-top: 100px">抱歉！移动端设备还木有适配，开发者正在努力适配中...请用PC访问</h1></marquee>
  </body>
</html>
