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
  	<div id="ucomment">评论区(<s:property value='#request.commentnum'/>)</div>	
    <s:if test="#request.commentnum==0">
    	<div class="col-md-12 color666" id="nocomment">
    		暂无评论
    	</div>
    </s:if>
    <s:else>
    	<s:iterator value="#request.comments" var="comment">
    		<div class="col-md-12" id="comment">
    			<div class="col-md-1" id="uimg"><img src="<%=request.getContextPath() %>/images/userimg/<s:property value='#comment.user.userimg'/>" class="img-circle"/></div>
    			<div class="col-md-11" id="cc">
    				<div style="font-size: 13px;color: #555;"><s:property value="#comment.user.uname"/></div>   				
    				<div style="font-size:12px;margin-top: -13px">
    					<span class="text-muted"><s:property value="#comment.commentdate"/><s:if test="#comment.rom!=null">&nbsp;&nbsp;&nbsp;&nbsp;ROM版本：<s:property value="#comment.rom.version"/></s:if></span>
    				</div>
    				<div><span><s:property value="#comment.comment"/></span></div>
    			</div>
    			
    		</div>
    	</s:iterator>
    	<div class="col-md-12" id="pager">
    		<s:set value="#request.pager" var="pager"/>
				<s:if test="#pager.hasFirst">
					<a class="btn btn-success" href="javascript:;" url="showUserComment.action" page="1">首页</a>
				</s:if>
    			<s:if test="#pager.hasPrevious">
					<a class="btn btn-success" href="javascript:;" url="showUserComment.action" page="<s:property value='#pager.currentPage'/>" id="prev">上一页</a>
				</s:if>
				<s:if test="#pager.hasNext">
					<a class="btn btn-success" href="javascript:;" url="showUserComment.action" page="<s:property value='#pager.currentPage'/>" id="next">下一页</a>
				</s:if>
				<s:if test="#pager.hasNext">
					<a class="btn btn-success" href="javascript:;" url="showUserComment.action" page="<s:property value='#pager.totalPage'/>">尾页</a>
				</s:if>
    		<br>
    		<s:if test="#pager.totalPage>1">
    			当前第<s:property value="#pager.currentPage"/>页，总共有<s:property value="#pager.totalPage"/>页
    		</s:if>
    	</div>
    </s:else>
  </body>
</html>
