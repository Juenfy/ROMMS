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
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"/>

  </head>
  
  <body>
  	<!-- 手机管理模块 -->
                    <s:if test="#request.showmfturemanager==1">
                    	<jsp:include page="module/showMftureManager.jsp"/>
                    </s:if>
                    <s:if test="#request.showmodelmanager==1">
                    	<jsp:include page="module/showModelManager.jsp"/>
                    </s:if>
                    <s:if test="#request.showaddmfture==1">
                    	<jsp:include page="module/showAddMfture.jsp"/>
                    </s:if>
                    <s:if test="#request.showaddmodel==1">
                    	<jsp:include page="module/showAddModel.jsp"/>
                    </s:if>
                    <!-- ROM管理模块 -->
                    <s:if test="#request.showrommanager==1">
                    	<jsp:include page="module/showRomManager.jsp"/>
                    </s:if>
                    <s:if test="#request.showromupcheck==1">
                    	<jsp:include page="module/showRomUpCheck.jsp"/>
                    </s:if>
                    <s:if test="#request.showcheckrom==1">
                    	<jsp:include page="module/showCheckRom.jsp"/>
                    </s:if>
                    <s:if test="#request.showromdowncheck==1">
                    	<jsp:include page="module/showRomDownCheck.jsp"/>
                    </s:if>
                    <s:if test="#request.showromaply==1">
                    	<jsp:include page="module/showRomAply.jsp"/>
                    </s:if>
                    <!-- UI管理模块 -->
                    <s:if test="#request.showuitypemanager==1">
                    	<jsp:include page="module/showUitypeManager.jsp"/>
                    </s:if>
                    <s:if test="#request.showadduitype==1">
                    	<jsp:include page="module/showAddUitype.jsp"/>
                    </s:if>
                    <!-- 教程、资讯管理模块 -->
                    <s:if test="#request.showreleasetn==1">
                    	<jsp:include page="module/showReleaseTN.jsp"/>
                    </s:if>
                    <s:if test="#request.showteachnews==1">
                    	<jsp:include page="module/showTeachNews.jsp"/>
                    </s:if>
                   	<!-- 用户管理模块 -->
                   	<s:if test="#request.showalluser==1">
                    	<jsp:include page="module/showAllUser.jsp"/>
                    </s:if>
                    <s:if test="#request.showmodifyuser==1">
                    	<jsp:include page="module/showModifyUser.jsp"/>
                    </s:if>
                    <s:if test="#request.showadduser==1">
                    	<jsp:include page="module/showAddUser.jsp"/>
                    </s:if>
  </body>
</html>
