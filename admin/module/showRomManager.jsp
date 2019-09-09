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
    <div class="row rommm">
    	<div class="col-md-10 col-md-offset-1">
    		<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;ROM管理>管理ROM</h4>
    		<table class="table table-bordered table-hover table-striped">
    			<thead>
    				<tr class="info">
    					<th class="text-center">ROM封面</th>
    					<th class="text-center">开发者</th>
    					<th class="text-center">ROM标题</th>
    					<th class="text-center">适用机型</th>
    					<th class="text-center">UI类型</th>
    					<th class="text-center">安卓版本</th>
    					<th class="text-center">操作</th>
    				</tr>
    			</thead>
    			<tbody>
    				<s:iterator value="#request.roms" var="rom">
	    				<tr>
	    					<td class="text-center"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></td>
	    					<td class="text-center"><s:property value="#rom.user.uname"/></td>
	    					<td class="text-center"><s:property value="#rom.title"/></td>
	    					<td class="text-center"><s:property value="#rom.model.model"/></td>
	    					<td class="text-center"><s:property value="#rom.uitype.uitype"/></td>
	    					<td class="text-center"><s:property value="#rom.android.android"/></td>
	    					<td class="text-center">
	    						<p><a href="<%=request.getContextPath() %>/showRomDetail.action?rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=0&cmodule=rom&currentPage=1" class="btn btn-info" target="_blank">查看</a></p>
	    						</p><a href="adminDeleteRom.action?rom.romid=<s:property value='#rom.romid'/>" class="btn btn-danger">删除</a></p>
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
