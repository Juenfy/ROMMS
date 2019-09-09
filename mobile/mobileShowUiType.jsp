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
    
    <title>ANROM之家 | UI专区</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<link rel="stylesheet" type="text/css" href="css/mobile-romms.css">
	<jsp:include page="module/mobileFooter.jsp"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/mobile-romms.js"></script>
  </head>
  
  <body>
    <jsp:include page="module/mobileHeader.jsp"/>
	<div class="mui-content">
		<div class="all-uitypes">
			<h4>UI专区</h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">
				<s:iterator value="#request.uitypes" var="uitype">
					<s:if test="#uitype.uimg!=null">	  					  					
					  	<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
							<a href="mobileShowUiTypeRom?uitype.uiid=<s:property value='#uitype.uiid'/>&currentPage=1">
								<div class="mui-media-body uitypes-box">									
								  		<img src="<%=request.getContextPath() %>/images/uiimg/<s:property value='#uitype.uimg'/>">										
								</div>
							</a>
						</li>
					</s:if>					
				</s:iterator>
			</ul>
		</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#footer>a:eq(2)").addClass("mui-active");
		})
	</script>
  </body>
</html>
