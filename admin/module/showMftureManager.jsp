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
    <div class="row phonemm mfmm">
    	<div class="col-md-10 col-md-offset-1">
    		<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;手机管理>查看品牌</h4>
    		<table class="table table-bordered table-hover table-striped">
    			<thead>
	    			<tr class="info">
	    				<th class="text-center">品牌图片</th>
	    				<th class="text-center">品牌名称</th>
	    				<th class="text-center">品牌相关信息</th>
	    				<th class="text-center">操作</th>
	    			</tr>
    			</thead>
    			<tbody>
	    			<s:iterator value="#request.mftures" var="mfture">
	    				<tr>
	    					<td class="text-center">
	    						<s:if test="#mfture.mfimg!=null">
	    							<img src="<%=request.getContextPath() %>/images/phone/<s:property value="#mfture.mfture"/>/<s:property value="#mfture.mfimg"/>">
	    						</s:if>
	    						<s:else>
	    							<p class="l-height40 text-center f-size16 f-color666">暂无图片</p>
	    						</s:else>
	    					</td>
	    					<td class="text-center"><s:property value="#mfture.mfture"/></td>
	    					<s:if test="#mfture.models.size>0">
	    						<td class="text-center">
	    							<span class="text-info"><s:property value="#mfture.mfture"/></span>品牌下有
	    							<span class="text-danger"><s:property value="#mfture.models.size"/>款手机</span>
	    						</td>
	    					</s:if>
	    					<s:else>
	    						<td class="text-center">
	    							<span class="text-info"><s:property value="#mfture.mfture"/></span>品牌下
	    							暂时<span class="text-warning">没有手机</span>
	    						</td>
	    					</s:else>
	    					<td class="text-center">
	    						<s:if test="#mfture.models.size>0">
	    							<span class="btn btn-danger disabled" title="该品牌下有手机，不能删除">删除</span>
	    						</s:if>
	    						<s:else>
	    							<a href="deleteMfture.action?mfture.mftureid=<s:property value='#mfture.mftureid'/>&mfture.mfture=<s:property value='#mfture.mfture'/>&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-danger">删除</a>
	    						</s:else>
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
