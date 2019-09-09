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
    
    <title>搜索结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showromcharts.css">
	<style type="text/css">
		.teachnews,.teachnews>.col-md-12{padding: 10px}
		h4>a{color: #000}
		h4>a:hover{text-decoration: underline;color: #00a0e9}
	</style>
  </head>
  <body>
  	<jsp:include page="head.jsp"/>
   		<div class="content container">
   			<s:if test="#request.roms.size>0">
   				<s:iterator value="#request.roms" var="rom">
					<div class="row box-shadow">
						<div class="col-md-5" id="coimg">
							<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>">
							<br>
							<div class="col-md-12" id="model"><s:property value="#rom.model.model"/></div>
						</div>
						<div class="col-md-6" id="rominfo">
							<div class="rc_android">Android<s:property value="#rom.android.android"/></div>
							<div class="rc_tt">标题：<s:property value="#rom.title"/></div>
							<div class="rc_tt">开发者：<s:property value="#rom.user.uname"/></div>
							<div class="rc_tt">UI类型：<s:property value="#rom.uitype.uitype"/></div>
							<div class="rc_tt">ROM版本：<s:property value="#rom.version"/>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="ShowRomDescText(<s:property value='#rom.romid'/>)">查看更新日志</a></div>
							<div class="rc_tt">发布时间：<s:property value="#request.redate"/></div>
							<div class="rc_tt">ROM大小：<s:property value="#rom.romsize"/>M</div>
							<div class="rc_btn"><a class="btn btn-success" href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1">ROM详情</a></div>
							<div class="romdesc<s:property value='#rom.romid'/>" style="display: none;width: 400px;padding:20px;"><s:property value='#rom.romdesc'/></div>						
						</div>
					</div>
				</s:iterator>
				<jsp:include page="pager.jsp"/>
			</s:if>
			<s:elseif test="#request.teaches.size>0">
				<div class="row teachnews box-shadow">
					<s:iterator value="#request.teaches" var="teach">
						<div class="col-md-12">
		    				<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#teach.model.mfture.mfture'/>/<s:property value='#teach.model.model'/>/flashteach/<s:property value='#teach.datedir'/>/<s:property value='#teach.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
		    				<div class="col-md-7">
		    					<h4><small class="text-info">[<s:property value="#teach.model.model"/>教程]</small><a href="showTeachDetail.action?teach.ftid=<s:property value='#teach.ftid'/>&teach.reviewnum=<s:property value='#teach.reviewnum'/>&cmodule=teach"><s:property value="#teach.title"/></a></h4>
		    					<div class="l-height25 text-left"><s:property value="#teach.ftcontent"/></div>
		    					<span class="text-muted l-height30">发布日期：<s:property value="#teach.redate"/></span>
		    					<span class="text-muted l-height30 col-md-offset-5"><i class="fa fa-eye"></i> <s:property value="#teach.reviewnum"/></span>
		    				</div>
	    				</div>
					</s:iterator>
					<jsp:include page="pager.jsp"/>
				</div>
			</s:elseif>
			<s:elseif test="#request.newses.size>0">
				<div class="row teachnews box-shadow">
					<s:iterator value="#request.newses" var="news">
	    			<div class="col-md-12">
	    				<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/phonenews/<s:property value='#news.datedir'/>/<s:property value='#news.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
	    				<div class="col-md-7">
	    					<h4><small class="text-info">[安卓ROM资讯]</small><a href="showNewsDetail.action?news.pnid=<s:property value='#news.pnid'/>&news.reviewnum=<s:property value='#news.reviewnum'/>&cmodule=news"><s:property value="#news.title"/></a></h4>
	    					<div class="l-height25 text-left"><s:property value="#news.pncontent"/></div>
	    					<span class="text-muted l-height30">发布日期：<s:property value="#news.redate"/></span>
	    					<span class="text-muted l-height30 col-md-offset-5"><i class="fa fa-eye"></i> <s:property value="#news.reviewnum"/></span>
	    				</div>
	    			</div>
	    			</s:iterator>
	    			<jsp:include page="pager.jsp"/>
				</div>
			</s:elseif>
			<s:else>
				找不到！！
			</s:else>
   		</div>
  	<jsp:include page="foot.jsp"/>
  </body>
</html>