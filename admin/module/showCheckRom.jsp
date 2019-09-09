<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showromdetail.css">
	<style type="text/css">
		#romdesc #img{margin-left: -2.5px}
		#romdesc #img>a{display: inline-block;border: 1px solid #f1f1f1}
		#rominfo .cbtn{margin-top: 220px}
	</style>
  </head>
  <body>
  	<%
		//管理员在没登录的情况下重定向到登录页面
		if(session.getAttribute("admin")==null){
			response.sendRedirect("adminLogin.jsp");
		}
	 %>
  	<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;ROM管理>ROM上架审核>查看ROM</h4>
    <div class="rcheck">
  		<s:set value="#request.rom" var="rom"/>
  		<div class="detailimg rom_img1">
			<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img1'/>">
		</div>
		<div class="detailimg rom_img2">
			<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img2'/>">
		</div>
		<div class="detailimg rom_img3">
			<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img3'/>">
		</div>
		<div class="detailimg rom_img4">
			<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img4'/>">
		</div>
		<div class="row" id="romtop">
			<div class="col-md-2" id="coimg">
				<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>">
			</div>
			<div class="col-md-10" id="rominfo">
				<div class="col-md-6" id="rf">
					<div class="rf_rt"><s:property value="#rom.title"/></div>
					<div class="rf_bt">作者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>"><s:property value="#rom.user.uname"/></a></div>
					<div class="rf_bt">适用机型：<s:property value="#rom.model.model"/></div>
					<div class="rf_bt">UI类型：<s:property value="#rom.uitype.uitype"/></div>
					<div class="rf_bt">ROM版本号：<s:property value="#rom.version"/></div>
					<div class="rf_bt">Android版本：<s:property value="#rom.android.android"/></div>
					<div class="rf_bt">ROM大小：<s:property value="#rom.romsize"/>M</div>
					<div class="rf_bt">发布日期：<s:property value="#rom.redate"/></div>
				</div>
				<div class="col-md-3 cbtn"><a href="romCheckResult.action?rom.romid=<s:property value='#rom.romid'/>&checkresult=uppass" class="btn btn-success">上架审核通过</a></div>
				<div class="col-md-3 cbtn"><a href="javascript:;" class="btn btn-danger" onclick="ShowReportText()">上架审核不通过</a></div>
			</div>
		</div>
		<div class="col-md-10 col-md-offset-1 hideme" id="bugreport">
			<form action="romCheckResult" method="post" class="form-horizontal" role="form">
				<div class="form-group m-top20">
					<input type="hidden" name="checkresult" value="upnotpass">
					<input type="hidden" name="rom.romid" value="<s:property value='#rom.romid' />">
					<textarea rows="5" maxlength="128" name="rom.upfailreason" class="form-control" placeholder="请输入上架审核不通过的原因"></textarea>						
				</div>
				<div class="form-group text-center">
					<input type="submit" class="btn btn-radius btn-success" value="提交">
				</div>
			</form>
		</div>
		<div class="row" id="romdesc">
			<div id="desctt">ROM介绍</div>
			<div>
				<div class="col-md-3" id="img">
					<a onclick="ShowImgText('.rom_img1')"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img1'/>"></a>
				</div>
				
				<div class="col-md-3" id="img">
					<a onclick="ShowImgText('.rom_img2')"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img2'/>"></a>
				</div>
				<div class="col-md-3" id="img">
					<a onclick="ShowImgText('.rom_img3')"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img3'/>"></a>
				</div>
				<div class="col-md-3" id="img">
					<a onclick="ShowImgText('.rom_img4')"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img4'/>"></a>
				</div>
			</div>
			<div class="col-md-6">
				<pre class="pre-enter l-height25" style="margin-top: -20px;border: none;background: none;font-family: 微软雅黑"><s:property value="#rom.romdesc"/>

此<a href="showModelRom.action?user.userid=<s:property value='#session.user.userid'/>&mfture.mftureid=<s:property value='#rom.model.mfture.mftureid'/>&model.modelid=<s:property value='#rom.model.modelid'/>&savehistory=0&currentPage=1"><s:property value="#rom.model.model"/></a>刷机包由ROM开发者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>"><s:property value="#rom.user.uname"/></a>制作</pre>
			</div>
		</div>
	</div>
  </body>
</html>
