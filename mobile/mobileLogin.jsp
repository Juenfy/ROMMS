<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/mobile/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ANROM之家 | 用户登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/mui.min.js"></script>
  </head>
  
  <body>
    <header class="mui-bar mui-bar-nav" style="background:#fff">
    	<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">用户登录</h1>
	</header>
	<div class="mui-content">
	    <form class="mui-input-group" action="mobileUserLogin" method="post" id="login_form">
	    	<h1 align="center"><span class="mui-icon mui-icon-person"></span></h1>
		    <div class="mui-input-row">
		        <label>账号</label>
		    	<input type="text" name="user.uaccount" class="mui-input-clear" placeholder="请输入账号">
		    </div>
		    <div class="mui-input-row">
		        <label>密码</label>
		        <input type="password" name="user.password" class="mui-input-password" placeholder="请输入密码">
		    </div>
		    <div class="mui-button-row">
		        <button type="submit" class="mui-btn mui-btn-primary" style="width: 100px" id="loginBtn">登录</button>
		        <button type="reset" class="mui-btn mui-btn-warning" style="width: 100px">重置</button>
		    </div>
		    <p align="center"><a href="mobileRegister.jsp">还没有账号？</a></p>
		</form>
	</div>
	<jsp:include page="module/mobileFooter.jsp"/>
	<s:if test="#request.userlogin==0">
		<script type="text/javascript">
			mui.alert("账号或密码错误！","错误提示","确定");
		</script>
	</s:if>
	<script type="text/javascript">
		$(function(){
			$("#loginBtn").click(function(){
				var flag = true;
				$("#login_form input").each(function(){
					if($(this).val() == ""){
						flag = false;
						mui.alert("请填写完整的信息！");
						return flag;
					}
				});
				return flag;
			});
		})
	</script>
  </body>
</html>
