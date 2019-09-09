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
  </head>
  
  <body>
    <div class="col-md-12" id="mycomment">
    	<s:if test="#request.comments.size!=0">
	    	<s:iterator value="#request.comments" var="comment">
	    		<div>
	    			<s:property value="#comment.user.uname"/>: <s:property value="#comment.comment"/><br>
	    			<s:if test="#comment.rom!=null">
	    				回复的ROM主题：<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#comment.rom.romid"/>&savehistory=0&currentPage=1"><s:property value="#comment.rom.title"/></a> > <s:property value="#comment.rom.model.model"/>
	    			</s:if>
	    			<s:if test="#comment.flashteach!=null">
	    				回复的教程主题：<a href="showTeachDetail.action?teach.ftid=<s:property value='#comment.flashteach.ftid'/>&teach.reviewnum=<s:property value='#comment.flashteach.reviewnum'/>&cmodule=teach&currentPage=1"><s:property value="#comment.flashteach.title"/></a>
	    			</s:if>
	    			<s:if test="#comment.phonenews!=null">
	    				回复的资讯主题：<a href="showNewsDetail.action?news.pnid=<s:property value='#comment.phonenews.pnid'/>&news.reviewnum=<s:property value='#comment.phonenews.reviewnum'/>&cmodule=news&currentPage=1"><s:property value="#comment.phonenews.title"/></a>
	    			</s:if>
	    		</div>
	    	</s:iterator>
	    	<jsp:include page="../pager.jsp"/>
    	</s:if>
    	<s:else>
    		<div>您还没有过任何评论！！</div>
    	</s:else>
    </div>
  </body>
</html>
