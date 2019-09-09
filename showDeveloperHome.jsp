<%@page import="org.apache.struts2.ServletActionContext,com.jy.util.JudgeTools"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
JudgeTools jt = new JudgeTools();
if(jt.judgeIsPhone(request))
	response.sendRedirect("showWarning.jsp");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:property value="#request.developer.uname"/> ROM|刷机包下载</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showmodelrom.css">
  </head>
  <body>
  		<jsp:include page="head.jsp"/>
   			<div class="content container">
   				<div class="top row box-shadow">
	   				<div class="col-md-2" id="userimg">
	   					<img src="<%=request.getContextPath() %>/images/userimg/<s:property value='#request.developer.userimg'/>" class="img-thumbnail">
	   				</div>
					<div class="col-md-10" id="developerinfo">
						<h3 class="page-header"><s:property value="#request.developer.uname"/></h3>
						机型：<s:property value="#request.modelnum"/><br>
						ROM：<s:property value="#request.romnum"/><br>
						<s:property value="#request.developer.registerdate"/>加入开发者社区
					</div>
				</div>
   				<div class="roms row  box-shadow">
	   				<s:iterator value="#request.roms" var="rom">
	   					<div class="col-md-6 rom">
	   						<div class="col-md-12 romtitle">
		   						<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
	   						</div>
	   					 	<div>
		   						<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
		   						<div class="col-md-9" style="color:#888">
		   							<br><br>
		   							适用机型：<s:property value="#rom.model.model"/><br><br>
			   						安卓版本：<s:property value="#rom.android.android"/><br><br>
			   						UI类型：<s:property value="#rom.uitype.uitype"/><br><br>
			   						发布时间：<s:property value="#rom.redate"/><br><br>
			   						ROM大小：<s:property value="#rom.romsize"/>M
		   						</div>
	   						</div>
	   					</div>
		  			</s:iterator>
		  			<jsp:include page="pager.jsp"/>
	  			</div>
   			</div>
  		<jsp:include page="foot.jsp"/>
  </body>
</html>
