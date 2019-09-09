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
    <div class="col-md-12 roms">
    	<div class="row" id="histt">ROM历史浏览</div>
	   	<s:iterator value="#request.hisroms" var="hisrom">
	   		<div class="col-md-6 rom">
	   			<div class="col-md-12 romtitle">
		   			<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#hisrom.rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><s:property value="#hisrom.rom.title"/></a>
	   			</div>
	   			<div>
		   			<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#hisrom.rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#hisrom.rom.model.mfture.mfture'/>/<s:property value='#hisrom.rom.model.model'/>/<s:property value='#hisrom.rom.uitype.uitype'/>/<s:property value='#hisrom.rom.datedir'/>/<s:property value='#hisrom.rom.coimg'/>"></a></div>
		   				<div class="col-md-9" style="color: #888">
		   					开发者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>"><s:property value="#hisrom.rom.user.uname"/></a><br><br>
		   					适用机型：<s:property value="#hisrom.rom.model.model"/><br><br>
			   				安卓版本：<s:property value="#hisrom.rom.android.android"/><br><br>
			   				UI类型：<s:property value="#hisrom.rom.uitype.uitype"/><br><br>
			   				发布时间：<s:property value="#hisrom.rom.redate"/><br><br>
			   				ROM大小：<s:property value="#hisrom.rom.romsize"/>M
		   				</div>
	   				</div>
	   			</div>
		  </s:iterator>
	  </div>
  </body>
</html>
