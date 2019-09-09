<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
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
    <div class="row phonemm mdmm">
    	<div class="col-md-10 col-md-offset-1">
    		<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;用户管理>查看用户</h4>
    		<table class="table table-bordered table-hover table-striped">
    			<thead>
	    			<tr class="info">
	    				<th class="text-center">用户名</th>
	    				<th class="text-center">用户账号</th>
	    				<th class="text-center">用户类型</th>
	    				<th class="text-center">真实姓名</th>
	    				<th class="text-center">性别</th>
	    				<th class="text-center">电话</th>
	    				<th class="text-center">住址</th>
	    				<th class="text-center">qq</th>
	    				<th class="text-center">操作</th>
	    			</tr>
    			</thead>
    			<tbody>
	    			<s:iterator value="#request.users" var="user">
	    				<tr>
	    					<td class="text-center"><s:property value="#user.uname"/></td>
	    					<td class="text-center"><s:property value="#user.uaccount"/></td>
	    					<td class="text-center"><s:property value="#user.ptype"/></td>
	    					<td class="text-center"><s:property value="#user.realname"/></td>
	    					<td class="text-center"><s:property value="#user.sex"/></td>
	    					<td class="text-center"><s:property value="#user.phone"/></td>
	    					<td class="text-center"><s:property value="#user.address"/></td>
	    					<td class="text-center"><s:property value="#user.qq"/></td>
	    					<td class="text-center">
	    						<p><a href="showModifyUser.action?user.userid=<s:property value='#user.userid'/>&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-warning">修改</a></p>
	    						<a href="deleteUser.action?user.userid=<s:property value='#user.userid'/>" class="btn btn-danger">删除</a>
	    					</td>
	    					
	    				</tr>
	    			</s:iterator>
    			</tbody>
    		</table>
    	</div>
    	<jsp:include page="../../pager.jsp"/>
    </div>
   </body>
</html>
