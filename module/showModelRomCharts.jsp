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
    <div class="showmrc radius bg-white">
    	<div class="tt">该型号热门ROM</div>
    	<ul>
    		<s:iterator value="#request.roms" var="rom">
    			<li class="hideli a-hover a-hover-bl">
    			<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
    				<div class="row mrcfd">
	    				<div class="col-md-12">
	    					<div class="col-md-4 mrcimg"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></div>
	    					<div class="col-md-8 mrcinfo text-left">
	    						<p>作者：<s:property value="#rom.user.uname"/></p>
	    						<p>ROM大小：<s:property value="#rom.romsize"/>M</p>
	    						<p>Android版本：<s:property value="#rom.android.android"/></p>
	    					</div>
	    				</div>
    				</div>
    			</li>
    		</s:iterator>
    	</ul>
    </div>
  </body>
</html>
