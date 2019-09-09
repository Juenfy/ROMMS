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
    
    <title><s:property value="#request.model.model"/>适配申请</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showmodelrom.css">

  </head>
  
  <body>
    <jsp:include page="head.jsp"/>
    <div class="container content">
    	<s:set value="#request.model" var="model"/>
    	<div class="row romadapt box-shadow">
    		<div><h4 class="page-header text-center text-uppercase">抱歉，目前还没有开发者给<s:property value="#model.model"/>适配ROM</h4></div>
    		<div class="text-center">
    			<s:if test="#session.user!=null">
    				<a class="btn btn-success" onclick="ShowReportText()">申请适配</a>
    			</s:if>
    			<s:else>
    				<a class="btn btn-warning" onclick="alert('请登录后再申请！');ShowUserActionText('Login')">申请适配</a>
    			</s:else>
    		</div>
    	</div>
    	<div class="col-md-10 col-md-offset-1 hideme" id="bugreport">
			<form action="romAdaptApply" method="post" class="form-horizontal" role="form">
				<div class="form-group m-top20">
					<input type="hidden" name="adapt.user.userid" value="<s:property value='#session.user.userid'/>">
					<input type="hidden" name="adapt.model.modelid" value="<s:property value='#model.modelid'/>">
					<textarea rows="5" maxlength="128" name="adapt.remark" class="form-control" placeholder="备注需要适配的系统等"></textarea>						
				</div>
				<div class="form-group text-center">
					<input type="submit" class="btn btn-radius btn-success" value="提交">
				</div>
			</form>
		</div>
	   	<div class="roms row  box-shadow">
	   		
	   		<div><h3 class="page-header text-center text-uppercase"><s:if test="#request.roms.size!=0"><s:property value="#model.mfture.mfture"/>下的其他热门ROM</s:if><s:else>抱歉，<s:property value="#model.mfture.mfture"/>下暂时没有ROM</s:else></h3></div>
 			<s:iterator value="#request.roms" var="rom">
 				<div class="col-md-6 rom">
 					<div class="col-md-12 romtitle">
  						<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
 					</div>
 				<div>
  				<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
  				<div class="col-md-9" style="color:#666">
  					开发者：<s:property value="#rom.user.uname"/><br><br>
  					适用机型：<s:property value="#rom.model.model"/><br><br>
   					安卓版本：<s:property value="#rom.android.android"/><br><br>
   					UI类型：<s:property value="#rom.uitype.uitype"/><br><br>
   					发布时间：<s:property value="#rom.redate"/><br><br>
   					ROM大小：<s:property value="#rom.romsize"/>M
  				</div>
 				</div>
 				</div>
 			</s:iterator>
		</div>
    </div>
    <jsp:include page="foot.jsp"/>
  </body>
</html>
