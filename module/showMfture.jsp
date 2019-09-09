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
  <script type="text/javascript">
  	//其他品牌展开收起
  	$(function(){
  		$('#othersmf a').click(function(){
  			$(this).children('i').toggle();
  			$('.othersmf').toggle();
  		})
  	})
  </script>
  <body>
	<div class="row box-shadow">
		<s:iterator value="#request.mftures" var="mfture">	  				  			
	  		<div class="col-md-2" id="mfture"><a href="showModelByMftureidSv.action?mfture.mftureid=<s:property value='#mfture.mftureid'/>&currentPage=1" class="col-md-12"><img  src="<%=request.getContextPath() %>/images/phone/<s:property value='#mfture.mfture'/>/<s:property value='#mfture.mfimg'/>" title="<s:property value='#mfture.mfture'/>"></a></div>	  			
		</s:iterator>
		<s:if test="#request.totalSize>10">
			<div class="col-md-2" id="othersmf"><a class="text-muted">其他机型 &nbsp;<i class="fa fa-caret-down"></i><i class="fa fa-caret-up"></i></a></div>
		</s:if>
		<div class="othersmf col-md-12">
			<s:iterator value="#request.othersmf" var="mfture">
				<div class="col-md-2"><a href="showModelByMftureidSv.action?mfture.mftureid=<s:property value='#mfture.mftureid'/>&currentPage=1" class="col-md-12 text-center l-height40"><s:property value="#mfture.mfture"/></a></div>
			</s:iterator>
		</div>
	</div>
  </body>
</html>
