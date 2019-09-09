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
	<div class="model_choose">
    	<form action="showModelRom" method="post" class="form-horizontal">
    		<div class="form-group">
    			<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid'/>">
	    		<input type="hidden" name="savehistory" value="0">
	    		<input type="hidden" name="mfture.mftureid" value="<s:property value='#model.mfture.mftureid'/>">
	    		<input type="hidden" name="currentPage" value="1">
		    	<select id="mftureSelect" class="form-control">
					<s:iterator value="#request.mftures" var="mfture">
						<option value="<s:property value='#mfture.mftureid'/>"><s:property value="#mfture.mfture"/></option>
					</s:iterator>
					<option selected>选择品牌</option>
				</select>
				<br/>
				<select name="model.modelid" id="modelSelect" class="form-control">
					
				</select>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-success" value="进入机型专区" id="subBtn">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#modelSelect").html("<option value=''></option>");
			$("#subBtn").click(function(){
				var val = $("#modelSelect option").val();
				if(val == ""){
					alert("还没选择手机呢！");
					return false;
				}
			})
		})
	</script>
</body>
</html>
