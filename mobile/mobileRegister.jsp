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
    
    <title>ANROM之家 | 用户注册</title>
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
  	<jsp:include page="../windows/Tips.jsp"/>
    <header class="mui-bar mui-bar-nav" style="background:#fff">
    	<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">用户注册</h1>
	</header>
	<div class="mui-content">
	    <form class="mui-input-group" action="mobileUserRegister" method="post" id="reg_form">
	    	<h1 align="center"><span class="mui-icon mui-icon-person"></span></h1>
		    <div class="mui-input-row">
		        <label>账号</label>
		    	<input type="text" name="user.uaccount" class="mui-input-clear" placeholder="请输入账号">
		    </div>
		    <div class="mui-input-row">
		        <label>密码</label>
		        <input type="password" name="user.password" class="mui-input-password" id="passwd" placeholder="请输入密码">
		    </div>
		    <div class="mui-input-row">
		        <label>确认密码</label>
		        <input type="password" name="repassword" class="mui-input-password" id="repasswd" placeholder="再次输入密码">
		    </div>
		    <div class="mui-input-row">
		        <label>安全问题</label>
		        <s:action name="mobileShowQuestion" executeResult="true" namespace="/mobile"/>
		    </div>
		    <div class="mui-input-row">
		        <label>问题答案</label>
		    	<input type="text" name="user.answer" class="mui-input-clear" placeholder="请输入问题答案">
		    </div>
		    <div class="mui-input-row" style="text-align: center;line-height: 40px">
		        <input type="radio" name="user.ptype" value="user" checked="checked">&nbsp;&nbsp;普通用户&nbsp;&nbsp;&nbsp;&nbsp;
		        <input type="radio" name="user.ptype" value="developer">&nbsp;&nbsp;开发者
		    </div>
		    <div class="mui-button-row">
		        <button type="submit" class="mui-btn mui-btn-primary" style="width: 100px" id="regBtn">注册</button>
		        <button type="reset" class="mui-btn mui-btn-warning" style="width: 100px">重置</button>
		    </div>
		    <p align="center"><a href="mobileLogin.jsp">已经有账号？</a></p>
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
			$("#regBtn").click(function(){
				var flag = true;
				$("#reg_form input").each(function(){
					if($(this).val() == ""){
						flag = false;
						mui.alert("请填写完整的信息！");
						return flag;
					}
				});
				if(flag)
					if($("#passwd").val() != $("#repasswd").val()){
						flag = false;
						mui.alert("两次输入密码不一致！");
						return flag;
					}
				return flag;
			});
		})
	</script>
  </body>
</html>
