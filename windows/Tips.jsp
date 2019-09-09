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
  	<!-- 登录失败提示 -->
    <s:if test="#request.userlogin==0">
  		<script type="text/javascript">
  			alert("用户名或密码错误！");
  			ShowUserActionText('Login');
  		</script>
  	</s:if>
  	<!-- 注册失败提示 -->
  	<s:if test="#request.userregister==0">
  		<s:if test="#request.uaccount==0">
  			<script type="text/javascript">
  				alert("用户账号已存在！");
  			</script>
  		</s:if>
  		<s:if test="#request.uname==0">
  			<script type="text/javascript">
  				alert("用户名已存在！");
  			</script>
  		</s:if>
  		<script type="text/javascript">
  				ShowUserActionText('Register');
  		</script>
  	</s:if>
  	<!-- 查找修改密码用户失败 -->
  	<s:if test="#request.nothisuser==0">
  		<script type="text/javascript">
  			alert("用户名或问题答案错误！");
  			ShowUserActionText('FindResetPasswdUser');
  		</script>
  	</s:if>
  	<!-- 查找修改密码用户成功 -->
  	<s:if test="#request.havethisuser==1">
  		<script type="text/javascript">
  			ShowUserActionText('ResetPasswd');
  		</script>
  	</s:if>
  	<!-- 密码修改成功 -->
  	<s:if test="#request.resetpasswd==1">
  		<script type="text/javascript">
  			alert("密码修改成功！现在您可以登录了！");
  			ShowUserActionText('Login');
  		</script>
  	</s:if>
  	<script type="text/javascript">
  		if(${param.reg_success == 1}){
  			alert("注册成功，现在登录把！")
  			ShowUserActionText('Login');
  		}
  	</script>
  </body>
</html>
