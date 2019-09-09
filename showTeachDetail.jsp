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
    
    <title><s:property value="#request.teach.title"/> |教程详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showteachnewsdetail.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showromdetail.css">
  </head>
  
  <body>
    <jsp:include page="head.jsp"/>
    <div class="content container">
    	<s:set value="#request.teach" var="teach"/>
    	<div class="row tdetail box-shadow">
    		<div class="col-md-12 ttop">
    			<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#teach.model.mfture.mfture'/>/<s:property value='#teach.model.model'/>/flashteach/<s:property value='#teach.datedir'/>/<s:property value='#teach.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
    			<div class="col-md-9">
    				<h3 class="page-header"><s:property value="#teach.title"/></h3>
    				<div class="pull-left col-md-8"><span class="redate">发布日期：<s:property value="#teach.redate"/> | 来源：奇兔rom市场 | 编辑：<s:property value="#teach.user.uname"/></span></div>
    				<div class="pull-left col-md-4 text-right"><span class="reviewnum"><i class="fa fa-eye"></i> <s:property value="#teach.reviewnum"/></span></div>
    			</div>
    		</div>
    		<div class="col-md-12">
    			<h4 class="page-header text-center">教程内容</h4>
				<pre class="pre-enter l-height25" style="font-family: 微软雅黑"><s:property value="#teach.ftcontent"/>

此<a href="showModelRom.action?user.userid=<s:property value='#session.user.userid'/>&mfture.mftureid=<s:property value='#teach.model.mfture.mftureid'/>&model.modelid=<s:property value='#teach.model.modelid'/>&savehistory=0&currentPage=1"><s:property value="#teach.model.model"/></a>教程由小编：<span class="text-info"><s:property value="#teach.user.uname"/></span>编辑发布</pre>
    		</div>
    	</div>
    	<div class="row  box-shadow" id="usercomment">
			<div id="sucomment"><s:action name="showUserComment" executeResult="true" namespace="/" /></div>
			<div class="col-md-12" id="uctextare">
				<form action="userCommentTeach.action" method="post">
					<div class="form-group">
						<input type="hidden" name="comment.flashteach.ftid" value="<s:property value='#teach.ftid' />">
						<input type="hidden" name="comment.user.userid" value="<s:property value='#session.user.userid' />">
						<textarea rows="5" maxlength="150" name="comment.comment" class="form-control"></textarea>
						<s:if test="#session.user!=null">
							<button type="submit" class="btn btn-success" id="commentBtn">评论</button>			
						</s:if>
					</div>
				</form>
				<s:elseif test="#session.user==null">
					<button class="btn btn-warning" onclick="alert('请登录后再评论!');ShowUserActionText('Login')">评论</button>
				</s:elseif>	
			</div>
		</div>
    </div>
    <jsp:include page="foot.jsp"/>
    <script type="text/javascript" src="js/showromdetail.js"></script>
    <script type="text/javascript" src="js/ajax.js"></script>
  </body>
</html>
