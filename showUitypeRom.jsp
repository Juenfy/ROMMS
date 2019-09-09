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
    
    <title><s:property value='#request.classuitype.uitype'/>专区 ROM|刷机包下载</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/showuityperom.css">
  </head>
  <body> 	
  	<jsp:include page="head.jsp"/>
   		<div class="content container">
  			<div class="top row box-shadow">
  				<s:set value="#request.classuitype" var="uitype"/>
  				<div class="col-md-2" id="uiimg"><img src="<%=request.getContextPath() %>/images/uiimg/<s:property value='#uitype.uimg'/>" class="img-thumbnail"></div>
				<div class="col-md-4" id="uitypeinfo">
					<h4 class="text-uppercase"><span class="text-info"><s:property value="#uitype.uitype"/></span>专区ROM下载</h4>
					ROM数量：<s:property value="#request.romnum"/><br>
					ROM下载：<s:property value="#request.downloadSum"/>
				</div>
  				</div>
  				<div class="row box-shadow">
  					<div class="col-md-12 catalogs mftures"><s:action name="showUitypeRomMfture" executeResult="true" namespace="/"/></div>
  					<div class="col-md-12 catalogs"><s:action name="showUitypeRomAndroid" executeResult="true" namespace="/"/></div>
  					<div class="col-md-12 catalogs px"><div class="col-md-1 text-right">排序：</div><div class="col-md-1"><a href="showHotestUitypeRom.action?uitype.uiid=<s:property value='#uitype.uiid'/>&currentPage=1">最热</a></div><div class="col-md-1"><a href="showNewestUitypeRom?uitype.uiid=<s:property value='#uitype.uiid'/>&currentPage=1">最新</a></div></div>
  				</div>
  				<div class="roms row box-shadow">
  					<s:if test="#request.roms.size>0">
		   				<s:iterator value="#request.roms" var="rom">
		   					<div class="col-md-6 rom">
		   						<div class="col-md-12 romtitle">
			   						<a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><s:property value="#rom.title"/></a>
		   						</div>
		   						<div>
			   						<div class="col-md-3 coimg"><a href="showRomDetail.action?user.userid=<s:property value="#session.user.userid"/>&rom.romid=<s:property value="#rom.romid"/>&model.modelid=<s:property value="#rom.model.modelid"/>&savehistory=1&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>"></a></div>
			   						<div class="col-md-6">
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
		  			</s:if>	  			
		  			<s:else>
		  				<h3 class="text-center t-color666"><s:property value="#request.classuitype.uitype"/>下暂时没有ROM</h3>
		  			</s:else>
	  			<jsp:include page="pager.jsp"/>
  			</div>
   		</div>
  	<jsp:include page="foot.jsp"/>
  	<script type="text/javascript">
		$(function(){
			$(".roms>.rom").each(function(index){
			console.log(index);
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
