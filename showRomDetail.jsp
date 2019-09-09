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
    
    <title><s:property value="#request.rom.model.model"/> <s:property value="#request.rom.uitype.uitype"/> |ROM详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showromdetail.css">
  </head>
  <body>
  	<jsp:include page="head.jsp"/>
  	<s:action name="showModelRomCharts" executeResult="true" namespace="/"/>
    	<div class="content container">
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
			<div class="row box-shadow" id="romtop">
				<div class="col-md-2" id="coimg">
					<img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>">
				</div>
				<div class="col-md-10" id="rominfo">
					<div class="col-md-6" id="rf">
						<div class="rf_rt"><s:property value="#rom.title"/></div>
						<div class="rf_bt">作者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>&currentPage=1"><s:property value="#rom.user.uname"/></a></div>
						<div class="rf_bt">适用机型：<s:property value="#rom.model.model"/></div>
						<div class="rf_bt">ROM大小：<s:property value="#rom.romsize"/>M</div>
						<div class="rf_bt">Android版本：<s:property value="#rom.android.android"/></div>
						<div class="rf_bt">发布日期：<s:property value="#request.redate"/></div>
						<s:if test="#session.user!=null">					
							<div class="rf_btn">
								<a class="btn btn-radius btn-success" href="downloadNumAdd.action?user.userid=<s:property value="#session.user.userid"/>&rom.user.userid=<s:property value='#rom.user.userid'/>&rom.romid=<s:property value="#rom.romid"/>&rom.download=<s:property value="#rom.download"/>">下载ROM</a>
							</div>
						</s:if>
						<s:else>
							<div class="rf_btn">
								<a class="btn btn-radius btn-warning" onclick="alert('请登录后再下载!');ShowUserActionText('Login')">下载ROM</a>
							</div>
						</s:else>
					</div>
					<div class="col-md-4 col-md-offset-2" id="showromscore">
						<s:action name="showRomscore" executeResult="true" namespace="/"/>
					</div>
					<s:set value="#request.romscore" var="romscore"/>
					<div class="col-md-2 text-center" id="romreport">
						<s:if test="#session.user!=null">
							<s:if test="#romscore.dstatus==1">
								<button class="btn btn-radius btn-success" type="submit" onclick="ShowReportText()">BUG反馈</button>
							</s:if>
						</s:if>
						<s:else>
							<button class="btn btn-radius btn-warning" onclick="alert('请登录后再反馈！');ShowUserActionText('Login')">BUG反馈</button>
						</s:else>
						<s:if test="#request.download==0">
							<button class="btn btn-radius btn-warning" onclick="alert('请下载使用后再反馈！')">BUG反馈</button>
						</s:if>
					</div>
					<div class="col-md-10 col-md-offset-1 hideme" id="bugreport">
						<form>
							<div class="form-group m-top20">
								<input type="hidden" name="report.rom.romid" value="<s:property value='#rom.romid' />" id="repromid">
								<input type="hidden" name="report.user.userid" value="<s:property value='#session.user.userid' />" id="repuserid">
								<textarea rows="5" maxlength="150" name="report.repcontent" class="form-control" id="repcontent" placeholder="请输入反馈的BUG"></textarea>						
							</div>
							<div class="form-group text-center">
								<input type="button" class="btn btn-radius btn-success" value="反馈" id="bugRepBtn">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row  box-shadow" id="romdesc">
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

此<a href="showModelRom.action?user.userid=<s:property value='#session.user.userid'/>&mfture.mftureid=<s:property value='#rom.model.mfture.mftureid'/>&model.modelid=<s:property value='#rom.model.modelid'/>&savehistory=0&currentPage=1"><s:property value="#rom.model.model"/></a>刷机包由ROM开发者：<a href="showDeveloperHome.action?user.userid=<s:property value='#rom.user.userid'/>&currentPage=1"><s:property value="#rom.user.uname"/></a>制作</pre>
				</div>
			</div>
			<div class="row  box-shadow" id="userscore">
				<div id="uscore">用户评分</div>
				<form action="userRomscore.action" method="post">
					<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid'/>">
					<input type="hidden" name="rom.user.userid" value="<s:property value='#rom.user.userid'/>">
					<input type="hidden" name="rom.romid" value="<s:property value='#rom.romid'/>">
					<input type="hidden" name="romscore.romscore" value="" required="required">
					<div class="col-md-6 col-md-offset-3">
						<ul class="list-inline l-height40 text-center">
							<li class="star"><span class="fa fa-star"></span></li>
            				<li class="star"><span class="fa fa-star"></span></li>
            				<li class="star"><span class="fa fa-star"></span></li>
            				<li class="star"><span class="fa fa-star"></span></li>
            				<li class="star"><span class="fa fa-star"></span></li>
						</ul>
						<div class="col-md-4 col-md-offset-4 text-center height40"><span class="score"></span></div>
					</div>
					<s:if test="#session.user!=null">
						<s:if test="#romscore.dstatus==1">
							<s:if test="#romscore.romscore==null">
								<div class="col-md-2 col-md-offset-5 text-center m-bottom20"><input class="btn btn-success" type="submit" value="评分"></div>
							</s:if>
						</s:if>		
					</s:if>
				</form>
				<s:if test="#session.user==null">
					<div class="col-md-2 col-md-offset-5 text-center m-bottom20"><input class="btn btn-warning" onclick="alert('请登录后再评分！');ShowUserActionText('Login')" value="评分"></div>
				</s:if>
				<s:if test="#request.download==0">
					<div class="col-md-2 col-md-offset-5 text-center m-bottom20"><input class="btn btn-warning" onclick="alert('请下载使用后再评分！')" value="评分"></div>
				</s:if>
				<s:if test="#romscore.romscore!=null">
					<div class="col-md-2 col-md-offset-5 text-center m-bottom20"><input class="btn btn-warning" onclick="alert('每个用户只能对每个ROM评一次分！')" value="评分"></div>
				</s:if>
			</div>
			<div class="row  box-shadow" id="usercomment">
				<div id="sucomment"><s:action name="showUserComment" executeResult="true" namespace="/" /></div>
				<div class="col-md-12" id="uctextare">
					<form action="userCommentRom.action" method="post">
						<div class="form-group">
							<input type="hidden" name="comment.rom.romid" value="<s:property value='#rom.romid' />">
							<input type="hidden" name="comment.user.userid" value="<s:property value='#session.user.userid' />">
							<textarea rows="5" maxlength="150" name="comment.comment" class="form-control"></textarea>
							<s:if test="#session.user!=null">
								<button type="submit" class="btn btn-success" id="commentBtn">评论</button>			
							</s:if>
						</div>
					</form>
					<s:elseif test="#session.user==null">
						<button class="btn btn-warning" onclick="alert('请登录后再评论!');ShowUserActionText('Login')">评论</button>
					</s:elseif>	
				</div>
			</div>
		</div>
  	<jsp:include page="foot.jsp"/>
  	<script type="text/javascript" src="js/showromdetail.js"></script>
  	<script type="text/javascript" src="js/ajax.js"></script>
  	<script type="text/javascript">
		if(${param.score} == 0)
			alert("开发者不能给自己开发的ROM评分！");
	</script>
  </body>
</html>
