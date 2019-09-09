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
    
    <title>ROM排行榜</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showromcharts.css">
  </head>
  <body>
 	<jsp:include page="head.jsp"/>
  		<div class="content container">
  			<s:iterator value="#request.roms" var="rom">
				<div class="row box-shadow">
					<div class="col-md-5" id="coimg">
						<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>">
						<div class="col-md-12" id="model"><s:property value="#rom.model.model"/></div>
					</div>
					<div class="col-md-6" id="rominfo">
						<div class="rc_android">Android<s:property value="#rom.android.android"/></div>
						<div class="rc_tt">标题：<s:property value="#rom.title"/></div>
						<div class="rc_tt">开发者：<s:property value="#rom.user.uname"/></div>
						<div class="rc_tt">UI类型：<s:property value="#rom.uitype.uitype"/></div>
						<div class="rc_tt">ROM版本：<s:property value="#rom.version"/>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="ShowRomDescText(<s:property value='#rom.romid'/>)">查看更新日志</a></div>
						<div class="rc_tt">发布时间：<s:property value="#rom.redate"/></div>
						<div class="rc_tt">ROM大小：<s:property value="#rom.romsize"/>M</div>
						<div class="rc_btn"><a class="btn btn-success" href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1">ROM详情</a></div>
						<div class="romdesc<s:property value='#rom.romid'/>" style="display: none;width: 400px;padding:20px"><pre class="pre-enter l-height25" style="margin-top: -20px;border: none;background: none;font-family: 微软雅黑"><s:property value='#rom.romdesc'/></pre></div>					
					</div>
				</div>
			</s:iterator>
			<div class="row bg-white" style="margin-top: -10px;margin-bottom: 10px">
				<jsp:include page="pager.jsp"/>
			</div>			
  		</div>
 	<jsp:include page="foot.jsp"/>
  </body>
</html>