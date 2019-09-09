<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:iterator value="#request.models" var="model">
	<option value="<s:property value="#model.modelid"/>"><s:property value="#model.model"/></option>
</s:iterator>
<s:if test="#request.models.size == 0">
	<option value="">暂时没手机</option>
</s:if>
