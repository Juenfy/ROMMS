<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
  	<select name="rom.uitype.uiid" class="form-control">
  		<s:iterator value="#request.uitypes" var="uitype">
     		<option value="<s:property value='#uitype.uiid'/>"/><s:property value="#uitype.uitype"/>
   		</s:iterator>
	</select>
  </body>
</html>
