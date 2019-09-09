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
  	<h4>评论区(<s:property value='#request.commentnum'/>)</h4>
	<ul class="mui-table-view">
		<s:if test="#request.commentnum==0">
	    	<li class="mui-table-view-cell mui-media">
	    		<h3>暂无评论</h3>
	    	</li>
	    </s:if>
	    <s:else>
			<s:iterator value="#request.comments" var="comment">
			  	<li class="mui-table-view-cell mui-media">
			  		<a href="javascript:;">
			  			<img class="mui-media-object mui-pull-left" src="<%=request.getContextPath() %>/images/userimg/<s:property value='#comment.user.userimg'/>"height="40" width="40" style="border-radius: 4px"/>
			  			<div class="mui-media-body">
			  				<s:property value="#comment.user.uname"/>
			  				<pre class="mui-ellipsis" style="font-size:14px;margin-top: 0;color: #8f8f94"><s:property value="#comment.comment"/></pre>
			  			</div>
			  		</a>
			  	</li>
			</s:iterator>
			<s:if test="#request.pager.totalPage>1">
			<s:set value="#request.pager" var="pager"/>
			<div class="mui-pager" id="pager">
			  <ul class="mui-pagination">
			  	<s:if test="#pager.hasFirst">
			  		<li>
			  			<a href="javascript:void(0);" url="mobileShowUserComment" page="1">首页</a>
			  		</li>
			  	</s:if>
			  	<s:else>
			  		<li class="mui-disabled">
				  		<span>首页</span>
				  	</li>
			  	</s:else>
			  	<s:if test="#pager.hasPrevious">
				  	<li>
				  		<a href="javascript:void(0);" url="mobileShowUserComment" page="<s:property value='#pager.currentPage'/>" id="prev">&laquo;</a>
				  	</li>
				</s:if>
				<s:else>
					<li class="mui-disabled">
				  		<span>&laquo;</span>
				  	</li>
				</s:else>
			  	<li class="mui-disabled">
			  		<span><s:property value="#pager.currentPage"/>/<s:property value="#pager.totalPage"/></span>
			  	</li>
			  	<s:if test="#pager.hasNext">
				  	<li>
				  		<a href="javascript:void(0);" url="mobileShowUserComment" page="<s:property value='#pager.currentPage'/>" id="next">&raquo;</a>
				  	</li>
				</s:if>
				<s:else>
					<li class="mui-disabled">
				  		<span>&raquo;</span>
				  	</li>
				</s:else>
				<s:if test="#pager.hasNext">
				  	<li>
				  		<a href="javascript:void(0);" url="mobileShowUserComment" page="<s:property value='#pager.totalPage'/>">尾页</a>
				  	</li>
				</s:if>
				<s:else>
					<li class="mui-disabled">
				  		<span>尾页</span>
				  	</li>
				</s:else>
			  </ul>
			</div>
			</s:if>
		</s:else>
	 </ul>
  </body>
</html>
