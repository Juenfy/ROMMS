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
    		<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;手机管理>查看型号</h4>
    		<table class="table table-bordered table-hover table-striped">
    			<thead>
	    			<tr class="info">
	    				<th class="text-center">手机图片</th>
	    				<th class="text-center">手机型号</th>
	    				<th class="text-center">手机相关信息</th>
	    				<th class="text-center">操作</th>
	    			</tr>
    			</thead>
    			<tbody>
	    			<s:iterator value="#request.models" var="model">
	    				<tr>
	    					<s:if test="#model.moimg!=null">
	    						<td class="text-center"><img src="<%=request.getContextPath() %>/images/phone/<s:property value="#model.mfture.mfture"/>/<s:property value="#model.model"/>/<s:property value="#model.moimg"/>"></td>
	    					</s:if>
	    					<s:else>
	    						<td class="text-center"><img src="<%=request.getContextPath() %>/images/phone/default.png"></td>
	    					</s:else>
	    					<td class="text-center"><s:property value="#model.model"/></td>
	    					<s:if test="#model.romnum>0">
	 							<td class="text-center">
	 								<span class="text-info"><s:property value="#model.model"/></span>下有
	 								<span class="text-danger"><s:property value="#model.romnum"/>个ROM</span>
	 							</td>   					
	    					</s:if>
	    					<s:else>
	    						<td class="text-center">
	    							<span class="text-info"><s:property value="#model.model"/></span>下暂时
	    							<span class="text-warning">没有ROM</span>
	    						</td>
	    					</s:else>
	    					<s:if test="#model.roms.size>0 || #model.flashteachs.size>0">
	    						<td class="text-center">
	    							<span class="btn btn-danger disabled" title="该型号下有ROM或者教程，不能删除">删除</span>
	    						</td>
	    					</s:if>
	    					<s:else>
	    						<td class="text-center">
	    							<a href="deleteModel.action?model.modelid=<s:property value='#model.modelid'/>&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-danger">删除</a>
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
