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
    <style type="text/css">
    	.mui-pager ul>li>a{border-radius: none !important;}
    </style>
  </head>
  <body>
  	<s:set value="#request.pager" var="pager"/>
  	<!-- 总页数大于1才显示分页 -->
  	<s:if test="#pager.totalPage > 1">
	    <div class="mui-pager">
		  <ul class="mui-pagination">
		  	<s:if test="#pager.hasFirst">
		  		<li>
		  			<a href="<s:property value='#request.actionName'/>?currentPage=1">首页</a>
		  		</li>
		  	</s:if>
		  	<s:else>
		  		<li class="mui-disabled">
			  		<span>首页</span>
			  	</li>
		  	</s:else>
		  	<s:if test="#pager.hasPrevious">
			  	<li>
			  		<a href="<s:property value='#request.actionName'/>?currentPage=<s:property value='#pager.currentPage-1'/>">&laquo;</a>
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
			  		<a href="<s:property value='#request.actionName'/>?currentPage=<s:property value='#pager.currentPage+1'/>">&raquo;</a>
			  	</li>
			</s:if>
			<s:else>
				<li class="mui-disabled">
			  		<span>&raquo;</span>
			  	</li>
			</s:else>
			<s:if test="#pager.hasNext">
			  	<li>
			  		<a href="<s:property value='#request.actionName'/>?currentPage=<s:property value='#pager.totalPage'/>">尾页</a>
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
	<script type="text/javascript">
		$(function(){
			$(".mui-pager a").each(function(index){
				var str = $(this).attr("href");
				str = str.replace("showMftureModelSv", "mobileShowRomDownload");
				str = str.replace("showModelByMftureidSv","mobileShowRomDownloadByMfid");
				str = str.replace("show","mobileShow");
				$(this).attr("href",str);				
			});
		})
	</script>
  </body>
</html>
