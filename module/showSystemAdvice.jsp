<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
	<style type="text/css">
		b{color: #2f91ff}
	</style>
  </head>
  
  <body>
  	<s:set value="#request.model" var="model"/>
  	<s:set value="#request.uitype" var="uitype"/>
  	<p class="text-center m-top20">系统检测到您最近浏览最多次数的手机是<b><s:property value="#model.model"/></b>，共浏览了<b style="color: red"><s:property value="#request.mTimes"/></b>次，浏览最多次数的UI是<b><s:property value="#uitype.uitype"/></b>，共浏览了<b style="color: red"><s:property value="#request.uTimes"/></b>次。所以系统给您推荐<b><s:property value="#model.model"/></b>的<b><s:property value="#uitype.uitype"/></b>的ROM</p>
    <s:if test="#request.roms.size>0">
  		<div class="col-md-12 roms hisroms">
	  		<div class="row"><div class="col-md-2 histt">ROM推荐</div></div>
	  		<s:iterator value="#request.roms" var="rom">
		   		<div class="col-md-6 rom">
		   			<div class="col-md-12 romtitle">
			   			<a href="showRomDetail.action?rom.romid=<s:property value="#rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
		   			</div>
		   			<div>
		   			<div class="col-md-3 coimg"><a href="showRomDetail.action?rom.romid=<s:property value="#rom.romid"/>&savehistory=1&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
		   				<div class="col-md-9" style="color: #888">
		   					开发者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>&currentPage=1"><s:property value="#rom.user.uname"/></a><br><br>
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
  		<div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
  	</s:if>
  	<s:else>
  		<div class="col-md-12 text-center">
  			<h3>抱歉，<a href="showModelRom.action?user.userid=<s:property value='#session.user.userid'/>&model.modelid=<s:property value='#model.modelid'/>&savehistory=1&currentPage=1"><b><s:property value="#model.model"/></b></a>下没有<a href="showUiTypeRom?uitype.uiid=<s:property value='#uitype.uiid'/>&currentPage=1"><b><s:property value="#uitype.uitype"/></b></a>的ROM</h3>
  		</div>
  	</s:else>
  </body>
</html>
