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
  	<div class="FindResetPasswdUser">
    	<form action="findResetPasswdUser" method="post"> 	
    		<div class="input-box">
    			<span class="icon"><i class="fa fa-user"></i></span>
    			<input type="text" name="user.uname" placeholder="请输入您的用户名" required="required">
    		</div>
			<div class="input-box">
				<span class="icon"><i class="fa fa-question-circle"></i></span>
				<s:action name="showQuestion" executeResult="true" namespace="/" />
			</div>
			<div class="input-box">
			    <span class="icon"><i class="fa fa-lock"></i></span>
			    <input type="text" name="user.answer" placeholder="请输入您的答案" required="required">
			</div>
	    	<div class="button-box">
	    		<button type="submit" class="btn btn-success">确定</button>
	    	</div>
    	</form>			
  	</div>
  </body>
</html>
