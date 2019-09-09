<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
  	<%
		//管理员在没登录的情况下重定向到登录页面
		if(session.getAttribute("admin")==null){
			response.sendRedirect("adminLogin.jsp");
		}
	 %>
    <div class="row add-box">
    	<s:set value="#request.user" var="user"/>
   		<form action="modifyUser" class="form-horizontal" method="post">
   			<div class="form-group">
   				<div class="col-md-6 col-md-offset-3"><h4 class="page-header"><i class="fa fa-home"></i>&nbsp;用户管理>修改用户信息</h4></div>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">账号：</label>
   				<div class="col-md-6">
    				<input type="text" class="form-control" name="user.uaccount" value="<s:property value='#user.uaccount'/>" disabled>
   				</div>
   				<span></span>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">用户名：</label>
   				<div class="col-md-6">
   					<input type="hidden" name="user.userid" value="<s:property value='#user.userid'/>">
   					<input type="hidden" name="currentPage" value="<s:property value='#request.currentPage'/>">
    				<input type="text" class="form-control" name="user.uname" value="<s:property value='#user.uname'/>" maxlength="10">
   				</div>
   				<span></span>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">用户类型：</label>
   				<div class="col-md-6">
    				<input type="text" class="form-control" name="user.ptype" value="<s:property value='#user.ptype'/>" disabled>
   				</div>
   				<span></span>
   			</div>
   			<div class="form-group">
   				<div class="col-md-4 col-md-offset-4">
   					<button type="submit" class="btn btn-success">修改</button>
   				</div>
   			</div>
   		</form>
   	</div>
  </body>
</html>
