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
    <div class="showmtc radius bg-white">
    	<div class="tt">该型号热门教程</div>
    	<ul>
    		<s:iterator value="#request.teacs" var="teach">
    			<li class="hideli a-hover a-hover-bl">
    			<a href="showTeachDetail.action?teach.ftid=<s:property value="#teach.ftid"/>&model.modelid=<s:property value="#teach.model.modelid"/>&savehistory=1"><s:property value="#teach.title"/></a>
    				<div class="row mtcfd">
	    				<div class="col-md-12">
	    					<div class="col-md-4 mtcimg"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#teach.model.mfture.mfture'/>/<s:property value='#teach.model.model'/>/flashteach/<s:property value='#teach.datedir'/>/<s:property value='#teach.coimg'/>"></div>
	    					<div class="col-md-8 mtcinfo">
	    						<s:property value="#teach.ftcontent"/>
	    					</div>
	    				</div>
    				</div>
    			</li>
    		</s:iterator>
    	</ul>
    </div>
  </body>
</html>
