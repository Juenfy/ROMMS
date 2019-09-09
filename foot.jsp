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
    <div class="container-fluid foot bg-white text-center" style="border-top: 1px solid #ddd">
    	<br>
    	<p><a href="http://www.weibo.com/Juenfy" target="_blank">作者微博</a> | <a href="http://rom.7to.cn/dev/105595" target="_blank">作者ROM作品</a></p>
    	<p>软件工程专业应届毕业生 严剑飞</p>
    	<p>Copyright &copy; 20018-2019, All Rights Reserved .</p>
    </div>
  </body>
</html>
