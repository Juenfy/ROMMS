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
	<script type="text/javascript">
		$(function(){
			$('#mftures img').each(function(){
				$(this).hide();
				$(this).children('a').text('魅族');
			})
		})
	</script>
  </head>
  
  <body>
    <div class="col-md-1 text-right" id="mfture">品牌：</div>
    <s:iterator value="#request.mftures" var="rom">
    	<s:if test="#rom.model.mfture.mfimg!=null">
    		<div class="col-md-1"><a href="showUitypeRomByMfture.action?uitype.uiid=<s:property value="#rom.uitype.uiid"/>&mfture.mftureid=<s:property value="#rom.model.mfture.mftureid"/>&currentPage=1" class="img"><img src="<%=request.getContextPath() %>/images/phone/<s:property value="#rom.model.mfture.mfture"/>/<s:property value="#rom.model.mfture.mfimg"/>" ></a></div>
    	</s:if>
    	<s:else>
    		<div class="col-md-1 text-center"><a href="showUitypeRomByMfture.action?uitype.uiid=<s:property value="#rom.uitype.uiid"/>&mfture.mftureid=<s:property value="#rom.model.mfture.mftureid"/>&currentPage=1"><s:property value="#rom.model.mfture.mfture"/></a></div>
    	</s:else>
    </s:iterator>
  </body>
</html>
