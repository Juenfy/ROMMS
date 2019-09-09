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
    <div class="col-md-12 text-center l-height40" style="padding-top: 20px">
		<s:set value="#request.pager" var="pager"/>
		<s:if test="#pager.hasFirst">
			<a class="btn btn-success" href="<s:property value='#request.actionName'/>?currentPage=1">首页</a>
		</s:if>
		<s:if test="#pager.hasPrevious">
			<a class="btn btn-success" href="<s:property value='#request.actionName'/>?currentPage=<s:property value='#pager.currentPage-1'/>">上一页</a>
		</s:if>
		<s:if test="#pager.hasNext">
			<a class="btn btn-success" href="<s:property value='#request.actionName'/>?currentPage=<s:property value='#pager.currentPage+1'/>">下一页</a>
		</s:if>
		<s:if test="#pager.hasNext">
			<a class="btn btn-success" href="<s:property value='#request.actionName'/>?currentPage=<s:property value='#pager.totalPage'/>">尾页</a>
		</s:if>
		<br>
		<s:if test="#pager.totalPage>1">
			当前第<s:property value="#pager.currentPage"/>页，总共有<s:property value="#pager.totalPage"/>页
		</s:if>
	</div>
  </body>
</html>
