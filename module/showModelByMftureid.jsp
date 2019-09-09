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
	<div class="box-shadow row">
	    <s:iterator value="#request.models" var="model">	  					  					
		  	<div class="col-md-3" id="model">
		  		<a href="showModelRom.action?model.modelid=<s:property value='#model.modelid'/>&user.userid=<s:property value='#session.user.userid'/>&histype=1&currentPage=1" class="col-md-12">
			  		<s:if test="#model.moimg!=null">
				  		<div class="col-md-4" id="img"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#model.mfture.mfture'/>/<s:property value='#model.model'/>/<s:property value='#model.moimg'/>"></div>
					</s:if>
					<s:else>
						<div class="col-md-4" id="img"><img src="<%=request.getContextPath() %>/images/phone/default.png"></div>
					</s:else>
					<div class="col-md-8">
						<div class="name"><s:property value="#model.model"/></div>
						<div class="info">
							<div>ROM：<font style="color:#60bf00"><s:property value="#model.romnum"/></font></div>
							<div>教程：<font style="color:#60bf00"><s:property value="#model.flashteachs.size"/></font></div>
						</div>
			  		</div>
	  			</a>	
	  		</div>					
		</s:iterator>
		<jsp:include page="../pager.jsp"/>
	</div>
  </body>
</html>
