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
	<link rel="stylesheet" type="text/css" href="css/windows.css">

  </head>
  
  <body>
   	<div class="ResetPasswd">
			<form action="resetPasswd" method="post">
				<div class="input-box">
					<span class="icon"><i class="fa fa-lock"></i></span>
					<input type="hidden" name="user.userid" value="<s:property value="#request.user.userid"/>">
					<input type="password" name="user.password" placeholder="请输入新密码"  required="required">
				</div>
				<div class="button-box">
					<button type="submit" class="btn btn-success">更改</button>
				</div>
			</form>
		</div>
  </body>
</html>
