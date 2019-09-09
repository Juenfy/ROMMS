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
	<link rel="stylesheet" type="text/css" href="css/showmodelrom.css">
  </head>
  
  <body>
    <div class="roms row hrom">
		<s:iterator value="#request.roms" var="rom">
			<div class="col-md-6 rom"> 
				<div class="col-md-12 romtitle">
					<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
				</div>
			 	<div>
					<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
					<div class="col-md-9" style="color:#888">
						开发者：<s:property value="#rom.user.uname"/><br><br>
						适用机型：<s:property value="#rom.model.model"/><br><br>
						安卓版本：<s:property value="#rom.android.android"/><br><br>
						UI类型：<s:property value="#rom.uitype.uitype"/><br><br>
						发布时间：<s:property value="#rom.redate"/><br><br>
						ROM大小：<s:property value="#rom.romsize"/>M
					</div>
				</div>
			</div>
		</s:iterator>
	</div>
  </body>
</html>
