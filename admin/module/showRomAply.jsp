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
    <div class="col-md-10 col-md-offset-1">
    	<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;ROM管理>查看申请</h4>
    	<s:if test="#request.adapts.size>0">
		    <table class="table table-hover" role="table">
		      <thead>
			  </thead>
			  <tbody>
			  	<s:iterator value="#request.adapts" var="adapt">
				  	<tr>
				    	<td class="f-size60 text-muted text-center"><i class="fa fa-commenting-o "></i></td>
				    	<td><p><span class="text-muted">网友</span><span class="text-info"><s:property value="#adapt.user.uname"/></span>申请给<span class="text-info"><s:property value="#adapt.model.model"/></span>适配ROM</p>
				    		<p><span class="text-muted">申请备注</span>"<s:property value="#adapt.remark"/>"</p>
				    		<p><span class="text-muted">您可以</span> <a href="deleteRomAply.action?adapt.adaptid=<s:property value='#adapt.adaptid'/>">删除</a></p>
				    	</td>
				  	</tr>
			  	</s:iterator>
			  </tbody>
			</table>
			<jsp:include page="../../pager.jsp"/>
		</s:if>
		<s:else>
			<h1 class="text-center text-muted">暂时没有用户申请适配</h1>
		</s:else>
	</div>
  </body>
</html>
