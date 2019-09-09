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
  	<div class="sdprmm">
  		<!-- 管理中心模块 -->
  		<s:if test="#request.srmcroms.size>0">
  			<h4 class="page-header">您的新ROM状态</h4>
	 		<table class="table table-hover" role="table">
		      <thead>
			  </thead>
			  <tbody>
			  	<s:iterator value="#request.srmcroms" var="rom">
				  	<tr>
				    	<td><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>" class="coimg"></td>
				    	<td class="l-height25">
				    		<h4><s:property value="#rom.title"/></h4>
				    		审核状态：
				    		<b>
					    		<s:if test="#rom.status==1">
					    			<span class="text-success">
					    				已上架
				    					<s:if test="#rom.downreason!=null">
				    						<span class="text-warning">（下架审核中...）</span>
				    						&nbsp;<a href="cancelRomCheck.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value='#rom.user.userid'/>&canceltype=down&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-default">取消审核</a>				    						
				    					</s:if>
				    					<s:elseif test="#rom.downfailreason!=null">
				    						<span class="text-danger" title="<s:property value='#rom.downfailreason'/>">（下架审核失败/查看原因）</span>
				    					</s:elseif>
					    			</span>
					    		</s:if>
					    		<s:elseif test="#rom.status==0">
					    			<span class="text-warning">上架审核中...</span>
					    		</s:elseif>
					    		<s:elseif test="#rom.status==-1">
					    			<span class="t-color666">已下架</span>
					    		</s:elseif>
					    		<s:elseif test="#rom.status==-2">
					    			<span>未上架</span>
					    		</s:elseif>
					    		<s:else>
					    			<span class="text-danger" title="<s:property value='#rom.upfailreason'/>">未通过/查看原因</span> 
					    		</s:else>
				    		</b>
				    	</td>
				    	<td>
				    		<s:if test="#rom.status==1">
				    			<s:if test="#rom.downreason==null">
				    				<a class="btn btn-default" onclick="ShowDownReaSonText(<s:property value='#rom.romid'/>)">申请下架</a><br>
				    			</s:if>
				    			<div class="downreason<s:property value='#rom.romid'/> col-md-10 col-md-offset-1 hideme">
				    				<form action="dperAplyRomDown" method="post" class="form-horizontal" role="form">
				    					<div class="form-group m-top20">
				    						<input type="hidden" name="currentPage" value="<s:property value='#request.pager.currentPage'/>">
				    						<input type="hidden" name="rom.romid" value="<s:property value='#rom.romid'/>">
				    						<textarea rows="5" maxlength="128" class="form-control" name="rom.downreason" placeholder="请输入下架原因" required="required"></textarea>
				    					</div>
				    					<div class="form-group text-center">
				    						<input type="submit" class="btn btn-success" value="提交">
				    					</div>
				    				</form>
				    			</div>
				    			<a href="showDperModifyRomSv.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value='#rom.user.userid'/>&mtype=create" class="btn btn-default">创建新版本</a><br>
				    			<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=0&cmodule=rom&currentPage=1" class="btn btn-default">浏览</a><br>
				    		</s:if>
				    		<s:elseif test="#rom.status==0">
				    			<a href="cancelRomCheck.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value="#rom.user.userid"/>&canceltype=up&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-default">取消审核</a><br>
				    		</s:elseif>
				    		<s:else>
				    			<a href="showDperModifyRomSv.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value='#rom.user.userid'/>&mtype=edit" class="btn btn-default">编辑/发布</a><br>
				    			<a href="dperDeleteRom.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value="#rom.user.userid"/>&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-default">删除</a>
				    		</s:else>
				    	</td>
				  	</tr>
			  	</s:iterator>
			  </tbody>
			</table>
			<jsp:include page="../pager.jsp"/>
 		</s:if>
 		
 		<!-- ROM管理模块 -->
 		<s:if test="#request.srlroms.size>0">
 			<h4 class="page-header">ROM列表<small>(<s:property value="#request.romnum"/>)</small></h4>
  			<a href="showReleaseRom.action" class="btn btn-primary pull-right m-bottom10">发布新ROM</a>
	 		<table class="table table-hover table-bordered" role="table">
		      <thead>
				  <tr class="info">
				    <th>机型图</th>
				    <th>ROM名称/机型</th>
				    <th>安卓版本</th>
				    <th>UI类型</th>
				    <th>最新版本状态</th>
				    <th>操作</th>
				  </tr>
			  </thead>
			  <tbody>
			  	<s:iterator value="#request.srlroms" var="rom">
				  	<tr>
				    	<td>
				    		<s:if test="#rom.model.moimg!=null">
				    			<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.model.moimg'/>" class="moimg">
				    		</s:if>
				    		<s:else>
				    			<img src="<%=request.getContextPath() %>/images/phone/default.png" class="moimg">
				    		</s:else>				    		
				    	</td>
				    	<td><p><s:property value="#rom.title"/></p><p class="text-muted"><s:property value="#rom.model.model"/></p></td>
				    	<td><p class="text-muted"><s:property value="#rom.android.android"/></p></td>
				    	<td><p class="text-muted"><s:property value="#rom.uitype.uitype"/></p></td>
				    	<td class="l-height25">
				    		<b>
					    		<s:if test="#rom.status==1">
					    			<span class="text-success">
					    				已上架
				    					<s:if test="#rom.downreason!=null">
				    						<span class="text-warning">（下架审核中...）</span>
				    						&nbsp;<a href="cancelRomCheck.action?rom.romid=<s:property value='#rom.romid'/>&canceltype=down&currentPage=<s:property value='#request.pager.currentPage'/>" class="btn btn-default">取消审核</a>
				    					</s:if>
				    					<s:elseif test="#rom.downfailreason!=null">
				    						<span class="text-danger" title="<s:property value='#rom.downfailreason'/>">（下架审核失败/查看原因）</span>
				    					</s:elseif>
					    			</span>
					    		</s:if>
					    		<s:elseif test="#rom.status==0">
					    			<span class="text-warning">上架审核中...</span>
					    		</s:elseif>
					    		<s:elseif test="#rom.status==-1">
					    			<span class="t-color666">已下架</span>
					    		</s:elseif>
					    		<s:elseif test="#rom.status==-2">
					    			<span>未上架</span>
					    		</s:elseif>
					    		<s:else>
					    			<span class="text-danger" title="<s:property value='#rom.upfailreason'/>">未通过/查看原因</span>
					    		</s:else>
				    		</b>
				    	</td>
				    	<td>
				    		<s:if test="#rom.status==1">
					    			<a href="showDperModifyRomSv.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value='#rom.user.userid'/>&mtype=create" class="btn btn-default">创建新版本</a><br>
					    			<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=0&cmodule=rom&currentPage=1" class="btn btn-default">查看ROM</a>
				    		</s:if>
				    		<s:else>
				    			<a href="showDperModifyRomSv.action?rom.romid=<s:property value='#rom.romid'/>&user.userid=<s:property value='#rom.user.userid'/>&mtype=create" class="btn btn-default">创建新版本</a><br>
				    		</s:else>
				    	</td>
				  	</tr>
			  	</s:iterator>
			  </tbody>
			</table>
			<jsp:include page="../pager.jsp"/>
 		</s:if>
 		
 		<!-- 用户反馈模块 -->
 		<s:if test="#request.reports.size>0">
 			<h4 class="page-header">沙雕网友的BUG反馈</h4>
 			<table class="table table-hover" role="table">
		      <thead>
			  </thead>
			  <tbody>
			  	<s:iterator value="#request.reports" var="report">
				  	<tr>
				    	<td class="f-size60 text-muted text-center"><i class="fa fa-bug"></i></td>
				    	<td>
				    		<p><span class="text-muted">您的ROM</span>"<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#report.rom.romid"/>&model.modelid=<s:property value="#report.rom.model.modelid"/>&savehistory=0&cmodule=rom&currentPage=1"><s:property value="#report.rom.title"/></a>"</p>
				    		<p><span class="text-muted">反馈问题</span>"<s:property value="#report.repcontent"/>"</p>
				    	</td>
				  	</tr>
			  	</s:iterator>
			  </tbody>
			</table>
			<jsp:include page="../pager.jsp"/>
 		</s:if>
  		<s:if test="#request.comments.size>0">
	  		<h4 class="page-header">网友的评论</h4>
		    <table class="table table-hover" role="table">
		      <thead>
			  </thead>
			  <tbody>
			  	<s:iterator value="#request.comments" var="comment">
				  	<tr>
				    	<td class="f-size60 text-muted text-center"><i class="fa fa-commenting-o "></i></td>
				    	<td><p><span class="text-muted">您的ROM</span>"<s:property value="#comment.rom.title"/>"</p>
				    		<p><span class="text-muted">网友评论</span>"<s:property value="#comment.comment"/>"</p>
				    		<p><span class="text-muted">您可以</span> <a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#comment.rom.romid"/>&model.modelid=<s:property value="#comment.rom.model.modelid"/>&savehistory=0&cmodule=rom&currentPage=1">立即查看</a></p>
				    	</td>
				  	</tr>
			  	</s:iterator>
			  </tbody>
			</table>
			<jsp:include page="../pager.jsp"/>
		</s:if>
	</div>
  </body>
</html>
