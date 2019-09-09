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
	<script type="text/javascript"></script>
  </head>
  
  <body>
    <div class="col-md-12 bg-white">
    	<div class="col-md-2 managerop a-hover a-hover-bl">
    		<ul class="list-unstyled l-height40 radius">
    			<li><a href="showRomManagerCenterSv.action?currentPage=1">管理中心</a></li>
    			<li><a href="showRomListSv.action?currentPage=1">ROM列表</a></li>
    			<li><a href="showBugReportSv.action?user.userid=<s:property value='#session.user.userid'/>&currentPage=1">用户反馈</a></li>
    			<li><a href="showCommentManagerSv.action?user.userid=<s:property value='#session.user.userid'/>&currentPage=1">评论管理</a></li>
    		</ul>
    	</div>
    	<div class="col-md-10 managermdoules">
    		<!-- ROM管理中心模块 -->
    		<s:if test="#request.showrmcenter==1">
    			<s:action name="showRomManagerCenter" executeResult="true" namespace="/"/>
    		</s:if>
    		<!-- ROM列表模块 -->
	   		<s:if test="#request.showrl==1">
    			<s:action name="showRomList" executeResult="true" namespace="/"/>
    		</s:if>
    		<!-- 用户反馈模块 -->
	   		<s:if test="#request.showbr==1">
    			<s:action name="showBugReport" executeResult="true" namespace="/"/>
    		</s:if>
    		<!-- 评论管理模块 -->
    		<s:if test="#request.showuc==1">
    			<s:action name="showCommentManager" executeResult="true" namespace="/"/>
    		</s:if>
    		<!-- 编辑rom或创建rom新版本 -->
    		<s:if test="#request.modifyrom==1">
    			<s:action name="showDperModifyRom" executeResult="true" namespace="/"/>
    		</s:if>
    	</div>
    </div>
  </body>
</html>
