<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/mobile/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ANROM之家 | ROM下载</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<link rel="stylesheet" type="text/css" href="css/mobile-romms.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/mobile-romms.js"></script>
  </head>
  
  <body>
    <jsp:include page="module/mobileHeader.jsp"/>
	<div class="mui-content">
		<div class="all-mftures">
			<h4>手机品牌</h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">
				<s:iterator value="#request.mftures" var="mfture">	  					  					
				  	<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-2">
						<a href="mobileShowRomDownloadByMfid?mfture.mftureid=<s:property value='#mfture.mftureid'/>&currentPage=1">
							<div class="mui-media-body mfture-box">
								<s:if test="#mfture.mfimg!=null">
							  		<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#mfture.mfture'/>/<s:property value='#mfture.mfimg'/>">
								</s:if>
								<s:else>
									<s:property value="#mfture.mfture"/>
								</s:else>				
							</div>
						</a>
					</li>					
				</s:iterator>
				<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-2">
					<a href="#" id="arrowDown">
						<div class="mui-media-body mfture-box">
							<i class="mui-icon mui-icon-arrowdown"></i>					
						</div>
					</a>
				</li>
				<s:iterator value="#request.othersmf" var="mfture">
					<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-2 othersmf" style="display: none">
						<a href="mobileShowRomDownloadByMfid?mfture.mftureid=<s:property value='#mfture.mftureid'/>">
							<div class="mui-media-body mfture-box">
								<s:if test="#mfture.mfimg!=null">
							  		<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#mfture.mfture'/>/<s:property value='#mfture.mfimg'/>">
								</s:if>
								<s:else>
									<s:property value="#mfture.mfture"/>
								</s:else>					
							</div>
						</a>
					</li>
				</s:iterator>
			</ul>
		</div>
		<div class="hot-models all-models">
			<h4>
				<s:if test="#request.byMfid==1">
					<s:if test="#request.models.size>0">
						<s:property value="#request.mfture.mfture"/>下的机型
					</s:if>
					<s:else>
						暂时没机型
					</s:else>
				</s:if>
				<s:else>
					所有机型
				</s:else>
			</h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">
				<s:iterator value="#request.models" var="model">	  					  					
				  	<li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-3">
						<a href="mobileShowModelRom?model.modelid=<s:property value='#model.modelid'/>&savehistory=0&currentPage=1">
							<div class="mui-media-body box model-box">
								<s:if test="#model.moimg!=null">
							  		<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#model.mfture.mfture'/>/<s:property value='#model.model'/>/<s:property value='#model.moimg'/>">
								</s:if>
								<s:else>
									<img src="<%=request.getContextPath() %>/images/phone/default.png">
								</s:else>
								<div class="info model-info">
									<p><s:property value='#model.model'/></p>
									<p>ROM：<span><s:property value='#model.romnum'/></span></p>
									<p>教程：<span><s:property value='#model.flashteachs.size'/></span></p>
								</div>					
							</div>
						</a>
					</li>					
				</s:iterator>
			</ul>
			<button class="mui-btn mui-btn-green mui-btn-block" id="moreBtn">查看更多</button>
		</div>
		<jsp:include page="module/mobilePager.jsp"/>
	</div>
	<jsp:include page="module/mobileFooter.jsp"/>
	<script type="text/javascript">
		$(function(){
			$("#footer>a:eq(1)").addClass("mui-active");
		})
	</script>
  </body>
</html>
