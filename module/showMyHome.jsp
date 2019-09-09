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
  	<div class="col-md-12"><h4 class="text-center">我的手机</h4></div>
  	<div class="myphones col-md-12 text-center">
  		<s:if test="#request.myphones.size!=0">
	   		<s:iterator value="#request.myphones" var="myphone">
	   			<a href="showMyHome.action?user.userid=<s:property value='#session.user.userid'/>&model.modelid=<s:property value='#myphone.model.modelid'/>" class="btn btn-default"><s:property value="#myphone.model.model"/></a>
	   		</s:iterator>
   		</s:if>
   		<s:else>
   			<div class="col-md-8 col-md-offset-2">您还没有设置我的机型，请前往机型专区设置</div>
   		</s:else>
  	</div>
  	<div class="col-md-12"><h4 class="text-center">热门ROM</h4></div>
	<div class="roms col-md-12">
		<s:iterator value="#request.roms" var="rom">
			<div class="col-md-6 rom">
				<div class="col-md-12 romtitle">
					<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
				</div>
			 	<div>
					<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
					<div class="col-md-9" style="color:#888">
							开发者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>"><s:property value="#rom.user.uname"/></a><br><br>
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
