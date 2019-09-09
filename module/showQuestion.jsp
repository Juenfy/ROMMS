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
  		<select name="question.qtid" class="form-control">
			<s:iterator value="#request.questions" var="question">
				<option value="<s:property value="#question.qtid"/>"/><s:property value="#question.question"/>
			</s:iterator>
		</select>
  </body>
</html>
