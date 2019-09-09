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
    
    <title><s:property value="#request.news.title"/> |资讯详情</title>
    
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
    	<s:set value="#request.news" var="news"/>
    	<div class="row tdetail box-shadow">
    		<div class="col-md-12 ttop">
    			<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/phonenews/<s:property value='#news.datedir'/>/<s:property value='#news.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
    			<div class="col-md-9">
    				<h3 class="page-header"><s:property value="#news.title"/></h3>
    				<div class="pull-left col-md-8"><span class="redate">发布日期：<s:property value="#news.redate"/> | 来源：奇兔rom市场 | 编辑：<s:property value="#news.user.uname"/></span></div>
    				<div class="pull-left col-md-4 text-right"><span class="reviewnum"><i class="fa fa-eye"></i> <s:property value="#news.reviewnum"/></span></div>
    			</div>
    		</div>
    		<div class="col-md-12">
    			<h4 class="page-header text-center">资讯内容</h4>
				<pre class="pre-enter l-height25" style="font-family: 微软雅黑"><s:property value="#news.pncontent"/>

此资讯由小编：<span class="text-info"><s:property value="#news.user.uname"/></span>编辑发布</pre>
    		</div>
    	</div>
    	<div class="row  box-shadow" id="usercomment">
			<div id="sucomment"><s:action name="showUserComment" executeResult="true" namespace="/" /></div>
			<div class="col-md-12" id="uctextare">
				<form action="userCommentNews.action" method="post">
					<div class="form-group">
						<input type="hidden" name="comment.phonenews.pnid" value="<s:property value='#news.pnid' />">
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
