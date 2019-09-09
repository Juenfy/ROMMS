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
    <div class="row mm uitypemm utmm">
    	<div class="col-md-10 col-md-offset-1">
    		<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;UI管理>查看UI</h4>
    		<table class="table table-bordered table-hover table-striped">
    			<thead>
	    			<tr class="info">
	    				<th class="text-center">UI图片</th>
	    				<th class="text-center">UI类型</th>
	    				<th class="text-center">UI相关信息</th>
	    				<th class="text-center">操作</th>
	    			</tr>
    			</thead>
    			<tbody>
	    			<s:iterator value="#request.uitypes" var="uitype">
	    				<tr>
	    					<td class="text-center">
	    						<s:if test="#uitype.uimg!=null">
	    							<img src="<%=request.getContextPath() %>/images/uiimg/<s:property value="#uitype.uimg"/>">
	    						</s:if>
	    						<s:else>
	    							<p class="l-height40 text-center f-size16 f-color666">暂无图片</p>
	    						</s:else>
	    						</td>
	    					<td class="text-center"><s:property value="#uitype.uitype"/></td>
	    					<s:if test="#uitype.romnum>0">
	    						<td class="text-center">
	    							<span class="text-info"><s:property value="#uitype.uitype"/></span>专区下有
	    							<span class="text-danger"><s:property value="#uitype.romnum"/>个ROM</span>
	    						</td>
	    					</s:if>
	    					<s:else>
	    						<td class="text-center">
	    							<span class="text-info"><s:property value="#uitype.uitype"/></span>专区下
	    							暂时<span class="text-warning">没有ROM</span>
	    						</td>
	    					</s:else>
	    					<s:if test="#uitype.roms.size>0">
	    						<td class="text-center">
	    							<span class="btn btn-danger disabled" title="该UI下有ROM，不能删除">删除</span>
	    						</td>
	    					</s:if>
	    					<s:else>
	    						<td class="text-center">
	    							<a href="deleteUitype.action?uitype.uitype=<s:property value='#uitype.uitype'/>&uitype.uiid=<s:property value='#uitype.uiid'/>" class="btn btn-danger">删除</a>
	    						</td>
	    					</s:else>
	    				</tr>
	    			</s:iterator>
    			</tbody>
    		</table>
    	</div>
    	<jsp:include page="../../pager.jsp"/>
    </div>
  </body>
</html>
