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
  	<div class="row">
  	<div><h3 class="page-header text-center">修改密码</h3></div>
   	<form action="modifyPassword" method="post" class="form-horizontal">
   		<div class="form-group">
    		<label class="col-md-3 control-label">原密码:</label>
    		<div class="col-md-6">
    			<input class="form-control" type="password" name="oldpassword" placeholder="请输入原密码" required maxlength="32">
    		</div>
    		<span></span>
   		</div>
   		<div class="form-group">
    		<label class="col-md-3 control-label" >新密码:</label>
    		<div class="col-md-6">
    			<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid'/>">
    			<input class="form-control" type="password" name="user.password" placeholder="请输入新密码" required maxlength="32">
    		</div>
    		<span></span>
   		</div>
   		<div class="form-group">
    		<label class="col-md-3 control-label">确认密码:</label>
    		<div class="col-md-6">
    			<input class="form-control" type="password" name="repassword" placeholder="请再次输入密码" required maxlength="32">
    		</div>
    		<span></span>
   		</div>
   		<div class="form-group">
    		<div class="col-md-2 col-md-offset-5">
    			<input type="submit" class="btn btn-success" value="确定修改">
    		</div>
   		</div>
   	</form>
  	</div>
  	<div><h3 class="page-header text-center">修改安全问题</h3></div>
   	<form action="findModifyQuestionUser" method="post" class="form-horizontal">
   		<div class="form-group">
    		<label class="col-md-3 control-label">选择原问题:</label>
    		<div class="col-md-6">
    			<s:action name="showQuestion" executeResult="true" namespace="/" />
    		</div>
   		</div>
   		<div class="form-group">
    		<label class="col-md-3 control-label" >问题答案:</label>
    		<div class="col-md-6">
    			<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid'/>">
    			<input class="form-control" type=text name="user.answer" placeholder="请输入问题答案" required maxlength="30">
    		</div>
    		<span></span>
   		</div>
   		<div class="form-group">
    		<div class="col-md-2 col-md-offset-5">
    			<input type="submit" class="btn btn-success" value="确定修改">
    		</div>
   		</div>
   	</form>
   	</div>
  </body>
</html>
