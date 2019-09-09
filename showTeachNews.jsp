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
    
    <title>安卓ROM<s:if test="#request.teaches.size>0">教程</s:if><s:if test="#request.newses.size>0">资讯</s:if></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.teachnews,.teachnews>.col-md-12{padding: 10px}
		h4>a{color: #000}
		h4>a:hover{text-decoration: underline;color: #00a0e9}
	</style>
  </head>
  
  <body>
    <jsp:include page="head.jsp"/>
    <div class="container content">
    	<div class="row teachnews box-shadow">
    		<s:if test="#request.teaches.size>0">
    			<s:iterator value="#request.teaches" var="teach">
	    			<div class="col-md-12">
	    				<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#teach.model.mfture.mfture'/>/<s:property value='#teach.model.model'/>/flashteach/<s:property value='#teach.datedir'/>/<s:property value='#teach.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
	    				<div class="col-md-7">
	    					<h4><small class="text-info">[<s:property value="#teach.model.model"/>教程]</small><a href="showTeachDetail.action?teach.ftid=<s:property value='#teach.ftid'/>&teach.reviewnum=<s:property value='#teach.reviewnum'/>&user.userid=<s:property value='#session.user.userid'/>&cmodule=teach&currentPage=1&savehistory=1"><s:property value="#teach.title"/></a></h4>
	    					<div class="l-height25 text-left"><s:property value="#teach.ftcontent"/></div>
	    					<span class="text-muted l-height30">发布日期：<s:property value="#teach.redate"/></span>
	    					<span class="text-muted l-height30 col-md-offset-5"><i class="fa fa-eye"></i> <s:property value="#teach.reviewnum"/></span>
	    				</div>
	    			</div>
	    		</s:iterator>
	    		<jsp:include page="pager.jsp"/>
    		</s:if>
    		<s:if test="#request.newses.size>0">
	    		<s:iterator value="#request.newses" var="news">
	    			<div class="col-md-12">
	    				<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/phonenews/<s:property value='#news.datedir'/>/<s:property value='#news.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
	    				<div class="col-md-7">
	    					<h4><small class="text-info">[安卓ROM资讯]</small><a href="showNewsDetail.action?news.pnid=<s:property value='#news.pnid'/>&news.reviewnum=<s:property value='#news.reviewnum'/>&user.userid=<s:property value='#session.user.userid'/>&cmodule=news&currentPage=1&savehistory=1"><s:property value="#news.title"/></a></h4>
	    					<div class="l-height25 text-left"><s:property value="#news.pncontent"/></div>
	    					<span class="text-muted l-height30">发布日期：<s:property value="#news.redate"/></span>
	    					<span class="text-muted l-height30 col-md-offset-5"><i class="fa fa-eye"></i> <s:property value="#news.reviewnum"/></span>
	    				</div>
	    			</div>
	    		</s:iterator>
	    		<jsp:include page="pager.jsp"/>
    		</s:if>
    	</div>
    </div>
    <jsp:include page="foot.jsp"/>
  </body>
</html>
