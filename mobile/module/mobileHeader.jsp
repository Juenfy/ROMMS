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
  </head>
  <body>
  	<header class="mui-bar mui-bar-nav" style="background:#fff">
    	<s:if test="#session.user==null">
    		<a href="#sheet" id="openSheet" class="mui-icon mui-icon-bars mui-icon-left-nav mui-pull-left"></a>
    	</s:if>
    	<s:else>
    		<a href="#sheet" id="openSheet" class="mui-pull-left">
    			<img src="<%=request.getContextPath() %>/images/userimg/<s:property value='#session.user.userimg'/>" height="34" width="34" style="border-radius: 50%;margin-top: 5px;">
    		</a>
    	</s:else>
		<h1 class="mui-title"><img src="<%=request.getContextPath() %>/images/weblogo/bluelogo.png" height="40px"/></h1>
	</header>
	<div id="sheet" class="mui-popover mui-popover-bottom mui-popover-action ">
		<!-- 可选择菜单 -->
		<ul class="mui-table-view">
		  <s:if test="#session.user == null">
			  <li class="mui-table-view-cell">
				<a href="mobileLogin.jsp">用户登录</a>
			  </li>
			  <li class="mui-table-view-cell">
				<a href="mobileRegister.jsp">用户注册</a>
			  </li>
		  </s:if>
		  <s:else>
		  	<li class="mui-table-view-cell">
				<a href="mobileShowMyHome?user.userid=<s:property value='#session.user.userid'/>&model.modelid=">我的主页</a>
		  	</li>
		  	<li class="mui-table-view-cell">
				<a href="#">系统推荐</a>
		  	</li>
		  	<li class="mui-table-view-cell">
				<a href="#">安全设置</a>
		  	</li>
		  	<li class="mui-table-view-cell">
				<a href="#">资料完善</a>
		  	</li>
		  	<!-- <li class="mui-table-view-cell">
				<a href="mobile/mobileLogin.jsp">发布ROM</a>
		  	</li>
		  	<li class="mui-table-view-cell">
				<a href="#">管理ROM</a>
		  	</li> -->
		  	<li class="mui-table-view-cell">
				<a href="mobileUserLogout">注销用户</a>
		  	</li>
		  </s:else>
		</ul>
		<!-- 取消菜单 -->
		<ul class="mui-table-view">
		  <li class="mui-table-view-cell">
			<a href="#sheet"><b>取消</b></a>
		  </li>
		</ul>
	</div>
  </body>
</html>
