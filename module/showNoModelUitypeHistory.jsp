<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
    <h3 align="center">抱歉，您还没有手机或者ROM的历史浏览记录，系统无法给您分析推荐！</h3>
  </body>
</html>
