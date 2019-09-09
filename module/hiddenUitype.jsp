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
	<link rel="stylesheet" type="text/css" href="css/hiddenmodule.css">

  </head>
  
  <body>
  	<div class="container-fluid hiduitype">
	    <div class="row">
			<s:iterator value="#request.uitypes" var="uitype">
				<s:if test="#uitype.uimg!=null">
		   			<div class="col-md-2" id="hiduiimg">
		   				<a href="showUiTypeRom.action?uitype.uiid=<s:property value='#uitype.uiid'/>&currentPage=1" class="thumbnail"><img title="<s:property value='#uitype.uitype'/> " src="<%=request.getContextPath() %>/images/uiimg/<s:property value='#uitype.uimg'/>" /></a>
		   			</div>
	   			</s:if>
	   		</s:iterator>
		</div>
	</div>
  </body>
</html>
