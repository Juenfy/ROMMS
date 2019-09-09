<%@page import="org.apache.struts2.ServletActionContext,com.jy.util.JudgeTools"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
JudgeTools jt = new JudgeTools();
if(jt.judgeIsPhone(request))
	response.sendRedirect("mobileShowRomDownload?currentPage=1");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>手机 安卓ROM|刷机包下载</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showmfturemodel.css">
  	</head>
  	<body>
  		<jsp:include page="head.jsp"/>
  			<div class="content container">
  				<s:if test="#request.hismodels.size>0">
	  				<div class="row alert alert-danger">
	  						<div class="col-md-12">
		  						<a href="#" class="close" data-dismiss="alert">
		        					&times;
		    					</a>
		    					你最近浏览的手机：
	  						</div>		
	  					<s:iterator value="#request.hismodels" var="hismodel">
					    	<div class="col-md-3" id="model">
					    		<a href="showModelRom.action?model.modelid=<s:property value='#hismodel.model.modelid'/>&savehistory=0&currentPage=1" class="col-md-12">
							  		<s:if test="#hismodel.model.moimg!=null">
				  						<div class="col-md-4" id="img"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#hismodel.model.mfture.mfture'/>/<s:property value='#hismodel.model.model'/>/<s:property value='#hismodel.model.moimg'/>"></div>
									</s:if>
									<s:else>
										<div class="col-md-4" id="img"><img src="<%=request.getContextPath() %>/images/phone/default.png"></div>
									</s:else>
									<div class="col-md-8">
										<div class="name"><s:property value="#hismodel.model.model"/></div>
										<div class="info">
											<div>ROM：<font style="color:#60bf00"><s:property value="#hismodel.model.roms.size"/></font></div>
											<div>教程：<font style="color:#60bf00">0</font></div>
										</div>
							  		</div>
				  				</a>
					    	</div>
				    	</s:iterator>
	  				</div>
  				</s:if>
  				<s:if test="#request.showMftureModel==1">
  					<s:action name="showMfture" executeResult="true" namespace="/"/>
  					<s:action name="showModel" executeResult="true" namespace="/"/>
  				</s:if>
  				<s:if test="#request.showModelByMftureid==1">
  					<s:action name="showMfture" executeResult="true" namespace="/"/>
  					<s:action name="showModelByMftureid" executeResult="true" namespace="/"/>
  				</s:if>
  			</div>
  		<jsp:include page="foot.jsp"/>
  	</body>
</html>
