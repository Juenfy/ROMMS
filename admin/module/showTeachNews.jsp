<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/admin/";
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
   	<div class="col-md-12">
   		<h4 class="page-header">
   			<i class="fa fa-home"></i>&nbsp;教程、资讯管理>
   			<s:if test="#request.teaches.size>0">查看教程</s:if><s:if test="#request.newses.size>0">查看资讯</s:if>
   		</h4>
   		<table class="table table-bordered table-hover table-striped">
   			<thead>
    			<tr class="info">
    				<th class="text-center">封面图</th>
    				<s:if test="#request.teaches.size>0">
    					<th class="text-center">手机</th>
    				</s:if>	
    				<th class="text-center">标题</th>			
    				<th class="text-center">浏览次数</th>
    				<th class="text-center">操作</th>
    			</tr>
   			</thead>
   			<tbody>
   				<s:if test="#request.teaches.size>0">
	    			<s:iterator value="#request.teaches" var="teach">
	    				<tr>
	    					<td class="text-center">
	    						<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#teach.model.mfture.mfture'/>/<s:property value='#teach.model.model'/>/flashteach/<s:property value='#teach.datedir'/>/<s:property value='#teach.coimg'/>" width="100">
	    					</td>
	    					<td class="text-center"><s:property value="#teach.model.model"/></td>
	    					<td><s:property value="#teach.title"/></td>
    						<td class="text-center"><s:property value="#teach.reviewnum"/></td>
    						<td class="text-center">
    							<p><a href="<%=request.getContextPath() %>/showTeachDetail.action?teach.ftid=<s:property value='#teach.ftid'/>&teach.reviewnum=<s:property value='#teach.reviewnum'/>&user.userid=<s:property value='#session.user.userid'/>&cmodule=teach&currentPage=1&savehistory=0" target="_blank" class="btn btn-info">查看</a></p>
    							<a href="deleteTeachNews.action?teach.ftid=<s:property value='#teach.ftid'/>&currentPage=<s:property value="#request.pager.currentPage"/>&subject=teach" class="btn btn-danger">删除</a>
    						</td>
	    				</tr>
	    			</s:iterator>
    			</s:if>
    			<s:if test="#request.newses.size>0">
    				<s:iterator value="#request.newses" var="news">
	    				<tr>
	    					<td class="text-center">
	    						<img src="<%=request.getContextPath() %>/images/phone/phonenews/<s:property value='#news.datedir'/>/<s:property value='#news.coimg'/>" width="100">
	    					</td>
	    					<td class="text-center"><s:property value="#news.title"/></td>
    						<td class="text-center"><s:property value="#news.reviewnum"/></td>
    						<td class="text-center">
    							<p><a href="<%=request.getContextPath() %>/showNewsDetail.action?news.pnid=<s:property value='#news.pnid'/>&news.reviewnum=<s:property value='#news.reviewnum'/>&user.userid=<s:property value='#session.user.userid'/>&cmodule=news&currentPage=1&savehistory=0" target="_blank" class="btn btn-info">查看</a></p>
    							<a href="deleteTeachNews.action?news.pnid=<s:property value='#news.pnid'/>&currentPage=<s:property value="#request.pager.currentPage"/>&subject=news" class="btn btn-danger">删除</a>
    						</td>
	    				</tr>
	    			</s:iterator>
    			</s:if>
   			</tbody>
   		</table>
   		<jsp:include page="../../pager.jsp"/>
   	</div>
  </body>
 </html>
