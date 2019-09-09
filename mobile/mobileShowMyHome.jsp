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
    
    <title>ANROM之家 | <s:property value="#session.user.uname"/>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="../fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<link rel="stylesheet" type="text/css" href="css/mobile-romms.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/mobile-romms.js"></script>
  </head>
  
  <body class="my_home_body">
  	<header class="my_header">
  		<img src="<%=request.getContextPath() %>/images/userimg/<s:property value='#session.user.userimg'/>">
  		<div class="user_info">
  			<span style="font-size: 16px"><s:property value="#session.user.uname"/></span><br/>
  			<span>
  				<s:if test="#session.user.sign==null">
					这个家伙很懒，什么都没留下! <i class="mui-icon-compose"></i>			
				</s:if>
				<s:else>
					<s:property value="#session.user.sign"/> <i class="mui-icon mui-icon-compose"></i>
				</s:else>
  			</span>
  			<p>账号：<s:property value="#session.user.uaccount"/></p>
  			<p>性别：
  				<s:if test="#session.user.sex!==null">
  					<s:property value="#session.user.sex"/>
  				</s:if>
  				<s:else>
  					保密
  				</s:else>
  			</p>
  			<p>类型：
  				<s:if test='#session.user.ptype=="developer"'>
					开发者
				</s:if>
				<s:else>
					普通用户
				</s:else>
  			</p>
  		</div>
  	</header>
  	<div class="mui-content">
  	
  	</div>
	<jsp:include page="module/mobileFooter.jsp"/>
  </body>
</html>
