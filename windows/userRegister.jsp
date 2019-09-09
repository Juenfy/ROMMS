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
   	<div class="Register">
		<form action="userRegister" method="post">
			<div class="input-box">
			    <span class="icon "><i class="fa fa-user"></i></span>
			    <input type="text" name="user.uaccount" placeholder="请输入您的账号" maxlength="12">
			</div>
			<div class="input-box">
			    <span class="icon"><i class="fa fa-lock"></i></span>
			    <input type="password" name="user.password" placeholder="请输入您的密码" maxlength="16">
			</div>
			<div class="input-box">
			    <span class="icon"><i class="fa fa-lock"></i></span>
			    <input type="password" name="repassword" placeholder="请确认您的密码" maxlength="16">
			</div>
			<div class="input-box">
				<span class="icon"><i class="fa fa-question-circle"></i></span>
				<s:action name="showQuestion" executeResult="true" namespace="/" />
			</div>
			<div class="input-box">
			    <span class="icon"><i class="fa fa-commenting"></i></span>
			    <input type="text" name="user.answer" placeholder="请输入您的答案" maxlength="30">
			</div>
			<div class="radio-box">
			    <input type="radio" name="user.ptype" value="user" checked="checked">普通用户
			    <input type="radio" name="user.ptype" value="developer">开发者
			</div>
			<div class="button-box">
				<button type="submit" class="btn btn-success" id="regBtn">注册</button>
			</div>
		</form>
		<div class="box_bottom">
			<a onclick="CloseText();ShowUserActionText('Login')">已经有账号?登录</a>
		</div>
	 </div>
	 <script type="text/javascript">
	 	 $(function(){
			$("#regBtn").click(function(){
				var arr = [];
				$(".Register input").each(function(){
					arr.push($(this).val());
				})
				var index;
				for(index in arr){
					if(arr[index] == ""){
						alert("请填写完整信息");
						return false;
					}
				}
				if(arr[1] != arr[2]){
					alert("两次密码输入不一致");
					return false;	
				}
			})
	 	})
	 </script>
  </body>
</html>
