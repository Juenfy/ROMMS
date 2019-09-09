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
    <div class="row rommm rcheck">
    	<div class="col-md-10 col-md-offset-1">
    		<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;ROM管理>ROM下架审核</h4>
    		<table class="table table-bordered table-hover table-striped">
    			<thead>
    				<tr class="info">
    					<th class="text-center">封面</th>
    					<th class="text-center">作者</th>
    					<th class="text-center">标题</th>
    					<th class="text-center">适用机型</th>
    					<th class="text-center">UI类型</th>
    					<th class="text-center">安卓</th>
    					<th class="text-center">下架原因</th>
    					<th class="text-center">操作</th>
    				</tr>
    			</thead>
    			<tbody>
    				<s:if test="#request.roms.size>0">
	    				<s:iterator value="#request.roms" var="rom">
		    				<tr>
		    					<td class="text-center"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></td>
		    					<td class="text-center"><s:property value="#rom.user.uname"/></td>
		    					<td class="text-center"><s:property value="#rom.title"/></td>
		    					<td class="text-center"><s:property value="#rom.model.model"/></td>
		    					<td class="text-center"><s:property value="#rom.uitype.uitype"/></td>
		    					<td class="text-center"><s:property value="#rom.android.android"/></td>
		    					<td class="text-center"><s:property value="#rom.downreason"/></td>
		    					<td class="text-center">
		    						<a href="romCheckResult.action?rom.romid=<s:property value='#rom.romid'/>&checkresult=downpass" class="btn btn-success">下架审核通过</a><br>
		    						<a href="javascript:;" class="btn btn-danger m-top20" onclick="ShowDownReaSonText(<s:property value='#rom.romid'/>)">下架审核不通过</a>
		    					</td>
		    				</tr>
		    				<div class="downreason<s:property value='#rom.romid'/> col-md-10 col-md-offset-1 hideme">
								<form action="romCheckResult">
									<div class="form-group m-top20">
										<input type="hidden" name="checkresult" value="downnotpass">
										<input type="hidden" name="rom.romid" value="<s:property value='#rom.romid' />">
										<textarea rows="5" maxlength="128" name="rom.downfailreason" class="form-control" placeholder="请输入下架审核不通过的原因" required="required"></textarea>						
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-radius btn-success" value="提交">
									</div>
								</form>
							</div>
	    				</s:iterator>
    				</s:if>
    				<s:else>
    					<tr>
    						<td class="text-center" colspan="8"><h3>暂无开发者申请下架ROM</h3></td>
    					</tr>
    				</s:else>
    			</tbody>
    		</table>
    	</div>
    	<s:if test="#request.roms.size>0">
    		<jsp:include page="../../pager.jsp"/>
    	</s:if>
    </div>
  </body>
</html>
