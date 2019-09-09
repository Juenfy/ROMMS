<%@page import="org.apache.struts2.ServletActionContext,com.jy.util.JudgeTools"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
JudgeTools jt = new JudgeTools();
if(jt.judgeIsPhone(request))
	response.sendRedirect("mobileShowModelRom?currentPage=1");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:property value="#request.classmodel.model"/> ROM|刷机包下载</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">    
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showmodelrom.css">
  </head>
  <body>
  		<jsp:include page="head.jsp"/>
   			<div class="content container">
   				<div class="top row box-shadow">
	   				<s:set value="#request.classmodel" var="model"/>
	   				<div class="col-md-1" id="modelimg">
	   					<s:if test="#model.moimg!=null">
	   						<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#model.mfture.mfture'/>/<s:property value='#model.model'/>/<s:property value='#model.moimg'/>">
	   					</s:if>
	   					<s:else>
	   						<img src="<%=request.getContextPath() %>/images/phone/default.png">
	   					</s:else>
	   				</div>
					<div class="col-md-9" id="modelinfo">
						<h4 class="text-uppercase"><span class="text-info"><s:property value="#model.model"/></span>ROM下载</h4>						
						ROM数量：<span class="text-success"><s:property value="#request.romnum"/></span><br>
						ROM下载：<span class="text-success"><s:property value="#request.downloadSum"/></span>
					</div>
					<div class="col-md-2" id="mftureimg">
						<a href="showModelByMftureidSv.action?mfture.mftureid=<s:property value='#model.mfture.mftureid'/>">
							<s:if test="#model.mfture.mfimg!=null">
								<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#model.mfture.mfture'/>/<s:property value='#model.mfture.mfimg'/>" title="<s:property value='#model.mfture.mfture'/>">
							</s:if>
							<s:else>
								<p class="l-height40 text-center f-size20 f-color666">暂无图片</p>
							</s:else>
						</a>
						<s:if test="#session.user!=null">
							<a class="btn btn-success" id="settingMyPhone" url="settingMyPhone.action" uid="<s:property value='#session.user.userid'/>" mid="<s:property value='#model.modelid'/>">设置为我的手机</a>
						</s:if>
						<s:else>
							<a class="btn btn-warning" onclick="alert('请登录后再设置机型！');ShowUserActionText('Login')">设置为我的手机</a>
						</s:else>
					</div>
   				</div>
   				<div class="row box-shadow">
   					<div class="col-md-12 catalogs"><s:action name="showModelRomUitype" executeResult="true" namespace="/"/></div>
   					<div class="col-md-12 catalogs"><s:action name="showModelRomAndroid" executeResult="true" namespace="/"/></div>
   					<div class="col-md-12 catalogs px"><div class="col-md-1 text-right">排序：</div><div class="col-md-1"><a href="showHotestModelRom.action?model.modelid=<s:property value='#model.modelid'/>&currentPage=1">最热</a></div><div class="col-md-1"><a href="showNewestModelRom?model.modelid=<s:property value='#model.modelid'/>&currentPage=1">最新</a></div></div>
   				</div>
   				<div class="roms row  box-shadow">
	   				<s:iterator value="#request.roms" var="rom">
	   					<div class="col-md-6 rom">
	   						<div class="col-md-12 romtitle">
		   						<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
	   						</div>
	   					 	<div>
		   						<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
		   						<div class="col-md-6" style="color:#888">
		   							<br><br>
		   							适用机型：<s:property value="#rom.model.model"/><br><br>
			   						安卓版本：<s:property value="#rom.android.android"/><br><br>
			   						UI类型：<s:property value="#rom.uitype.uitype"/><br><br>
			   						发布时间：<s:property value="#rom.redate"/><br><br>
			   						ROM大小：<s:property value="#rom.romsize"/>M
		   						</div>
		   						<div class="col-md-3 rominfo">
		   							<s:if test="#rom.scoreave!=null">
		   								<p><span class="romscore"><s:property value="#rom.scoreave"/></span></p>
		   								<p><span>下载：<s:property value="#rom.download"/></span></p>
		   							</s:if>
		   							<s:else>
		   								<p><span class="null">暂无评分</span></p>
		   								<p><span>下载：<s:property value="#rom.download"/></span></p>
		   							</s:else>
		   						</div>
	   						</div>
	   					</div>
		  			</s:iterator>
		  			<jsp:include page="pager.jsp"/>
	  			</div>
   			</div>
  		<jsp:include page="foot.jsp"/>
  		<script type="text/javascript" src="js/ajax.js"></script>
  		<script type="text/javascript">
  			$(function(){
  				$(".roms>.rom").each(function(index){
  					if((index+1)%2 != 0){
  						$(this).css({
  							"border-right":"1px solid #cdcdcd"
  						})
  					}
  				})
  			})
  		</script>
  </body>
</html>
