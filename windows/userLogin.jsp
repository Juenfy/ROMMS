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
  	<jsp:include page="findResetPasswdUser.jsp"></jsp:include>
  	<div class="Login">
    	<form action="userLogin" method="post">    	
   			<div class="input-box">
    			<span class="icon"><i class="fa fa-user"></i></span>
    			<input type="text" name="user.uaccount" placeholder="请输入您的账号">
    		</div>
	    	<div class="input-box">
	    		<span class="icon"><i class="fa fa-lock"></i></span>
	    		<input type="password" name="user.password" placeholder="请输入您的密码">
	    	</div>
	    	<div class="button-box">
	    		<button type="submit" class="btn btn-success" id="loginBtn">登录</button>
	    	</div>
    	</form>
    	<div class="box_bottom">
        		<a onclick="CloseText();ShowUserActionText('FindResetPasswdUser')">忘记密码?找回</a>
    	</div>
  	</div>
  	<script type="text/javascript">
  		$(function(){
  			$("#loginBtn").click(function(){
  				var flag = false;
  				$(".Login input").each(function(){
  					if($(this).val() == "")
  						flag = true;
  				});
  				if(flag){
  					alert("请填写完整信息");
  					return false;
  				}
  			})
  		})
  	</script>
  </body>
</html>
