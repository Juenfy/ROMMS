<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/mobile/";
String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:property value='#request.rom.title'/> | 详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<link rel="stylesheet" type="text/css" href="css/mobile-romms.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/mobile-romms.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ajax.js"></script>
  </head>
  
  <body>
    <jsp:include page="module/mobileHeader.jsp"/>
	<div class="mui-content">
		<div class="model-roms rom-detail">
			<s:action name="mobileShowRomscore" executeResult="true" namespace="/mobile"/>
			<s:set value="#request.rom" var="rom"/>
			<s:set value="#request.romscore" var="romscore"/>
			<h4><a href="mobileShowRomDownload?currentPage=1">ROM</a> > <a href="mobileShowModelRom?model.modelid=<s:property value='#rom.model.modelid'/>&savehistory=0&currentPage=1"><s:property value='#rom.model.model'/></a> > <span>详情</span></h4>
			<ul class="mui-table-view mui-grid-view mui-grid-9">	  					  					
			  	<li class="mui-table-view-cell mui-media mui-col-xs-12">
					<a href="javascript:void(0);" style="padding: 0 !important">
						<div class="mui-media-body box rom-box model-rom-box">
						  	<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>" style="padding-bottom: 20px">
							<div class="info rom-info model-rom-info rd-info">
								<div class="rd-title"><span><s:property value='#rom.title'/></span></div>
								<button class="mui-btn mui-btn-primary" style="margin-left: 5px" id="downloadBtn">下载ROM</button>
								<button class="mui-btn" id="bugRepBtn">BUG反馈</button>
							</div>					
						</div>
					</a>
				</li>
				<li class="mui-table-view-cell mui-media mui-col-xs-12">
					<a href="javascript:void(0);">
						<div class="mui-media-body box rom-box model-rom-box">
							<div class="info rom-info model-rom-info rd-info">
								<p>安卓版本：<s:property value='#rom.android.android'/></p>
								<p>作者：<s:property value='#rom.user.uname'/></p>
								<p>UI类型：<s:property value='#rom.uitype.uitype'/></p>
								<p>发布时间：<s:property value='#request.redate'/></p>
								<p>适用机型：<s:property value='#rom.model.model'/></p>
								<p><s:if test="#rom.scoreave!=null"><span><s:property value='#rom.scoreave'/></span>/10.0分</s:if><s:else>暂无评分</s:else></p>
							</div>					
						</div>
					</a>
				</li>
				<div class="mui-row rd-imgs">
					<li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="javascript:void(0);"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img1'/>"/></a></li>
					<li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="javascript:void(0);"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img2'/>"/></a></li>
					<li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="javascript:void(0);"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img3'/>"/></a></li>
					<li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="javascript:void(0);"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img4'/>"/></a></li>
				</div>
				<li class="mui-table-view-cell mui-media mui-col-xs-12">
					<h4 align="left" style="background: none;border: none">ROM介绍</h4>
				</li>
				<li class="mui-table-view-cell mui-media mui-col-xs-12">
					<pre align="left" style="line-height: 14px;margin: 0;padding-top: 5px"><s:property value="#rom.romdesc"/></pre>
				</li>
			</ul>
		</div>
		<div class="rd-comment-textarea">
			  <div id="sucomment"><s:action name="mobileShowUserComment" executeResult="true" namespace="/mobile" /></div>
			  <form class="mui-input-group" action="mobileUserCommentRom" method="post">
			    <input type="hidden" name="comment.rom.romid" value="<s:property value='#rom.romid' />">
				<input type="hidden" name="comment.user.userid" value="<s:property value='#session.user.userid' />">			    
				<textarea name="comment.comment" maxlength="150" placeholder="说点什么？" style="border: 1px solid skyblue;border-radius: 4px"></textarea>
			    <div class="mui-button-row">
			        <s:if test="#session.user!=null">
						<button type="submit" class="mui-btn mui-btn-primary">发表评论</button>
					</s:if>
					<s:else>
						<button type="button" class="mui-btn mui-btn-warning" onclick="loginTips()">发表评论</button>
					</s:else>
			    </div>
			</form>
		</div>		
	</div>
	<jsp:include page="module/mobileFooter.jsp"/>
	<info url="<%=url%>downloadNumAdd" romid="<s:property value='#rom.romid'/>" 
			duserid="<s:property value='#session.user.userid'/>" 
				userid="<s:property value='#rom.user.userid'/>" 
					dnum="<s:property value='#rom.download'/>"
						dstatus="<s:property value='#romscore.dstatus'/>"
							download="<s:property value='#request.download'/>"
								repurl="<%=url%>userReport"/>
	<script type="text/javascript">
		$(function(){
			//模拟下载ajax
			$("#downloadBtn").click(function(e){
				var info = $("info").eq(0);
				var url = info.attr("url");
				var romid = info.attr("romid");
				var duserid = info.attr("duserid");
				var userid = info.attr("userid");
				var dnum = info.attr("dnum");
				var data = {
							"rom.romid": romid,
							"user.userid": duserid,
							"rom.user.userid": userid,
							"rom.download": dnum
						};
				if(duserid == null || duserid == ""){
					loginTips();
				}
				else{
					ajax(url, data, function(msg){mui.alert("模拟下载成功",function(e){location.reload()})})
				}
			})
			//BUG反馈Ajax
			$("#bugRepBtn").click(function(){
				var info = $("info").eq(0);
				var url = info.attr("repurl");
				var duserid = info.attr("duserid");
				var romid = info.attr("romid");
				var dstatus = info.attr("dstatus") || 0;
				var download = info.attr("download") || 1;
				if(duserid == null || duserid == ""){
					loginTips();
				}else{
					if(dstatus == 1){
						var btnArray = ['取消', '反馈'];
						mui.prompt("客官请理性反馈喔！","反馈信息","BUG反馈",btnArray,function(e){
							if(e.index == 1 && e.value.trim().length != 0){
								var data = {
									"report.rom.romid": romid,
									"report.user.userid": duserid,
									"report.repcontent": e.value
								};
								ajax(url, data, function(msg) {
									mui.alert("反馈成功，请耐心等待开发者修复！","反馈结果","确定");
								});
							}
							else;	
						})

					}
				}				
				if(download == 0)
					mui.alert("客官，请下载使用过后再反馈喔!");
			})
		})
	</script>
  </body>
</html>
