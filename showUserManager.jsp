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
    
    <title><s:property value="#session.user.uname"/> |用户管理页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/showusermanager.css">
	<link rel="stylesheet" type="text/css" href="css/showmfturemodel.css">
	<link rel="stylesheet" type="text/css" href="css/showmodelrom.css">
	<link rel="stylesheet" type="text/css" href="css/windows.css">
  </head>
  <body>
  	<%
  		if(session.getAttribute("user") == null)
  			response.sendRedirect("index.jsp");
  	 %>
  	<jsp:include page="head.jsp"/>
  	<script type="text/javascript">
		function errortips(i,mesg){
			if(i==0){
				alert(mesg);
			}
		}
	</script>
  		<div class="content container">
  			<div class="row box-shadow">
  				<div class="umbgimg">
  					<div class="test"><div class="userimg"><img title="点击修改头像 " onclick="ShowUserActionText('ModifyUserimg')" src="<%=request.getContextPath() %>/images/userimg/<s:property value='#session.user.userimg'/>"></div></div>
  					<img src="<%=request.getContextPath() %>/images/background/umbgimg.png">
  				</div>
  				<div class="Modify ModifyUserimg">
  					<form action="updateUserimg" method="post" enctype="multipart/form-data">
						<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid'/>">
						<input type="hidden" name="user.uname" value="<s:property value='#session.user.uname'/>">
			    		<div class="userimg">
			    			<img src="<%=request.getContextPath() %>/images/userimg/<s:property value='#session.user.userimg'/>" id="modifyuserimg" class="img-circle">
			    		</div>
			    		<input type="file" name="uploadFile" style="display: none" id="fileupload" accept="image/*" required="required">
						<div class="button-box">
						    <button type="submit" class="btn btn-success">确定</button>
						</div>
					</form>
  				</div>
  				<div class="col-md-12">
  					<div class="col-md-4" id="userinfo">
  						<div class="uname">
  							<s:property value="#session.user.uname"/> <a href="javascript:void(0);" onclick="ShowUserActionText('ModifyUname')"><i class="fa fa-pencil-square-o"></i></a>
  							<s:if test='#session.user.sex=="男"'>
  								<i class="fa fa-mars" style="color: #007bf7"></i>
  							</s:if>
  							<s:elseif test='#session.user.sex=="女"'>
  								<i class="fa fa-venus" style="color: #e421a5"></i>						
  							</s:elseif>
  							<s:elseif test="#session.user.sex==null">
  								<i class="fa fa-venus-mars"></i>
  							</s:elseif>
  						</div>
  						<!-- 更新用户名 -->
  						<div class="Modify ModifyUname">
  							<form action="updateUname" method="post">
  								<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid'/>">
					   			<div class="input-box">
					    			<span class="icon"><i class="fa fa-user"></i></span>
					    			<input type="text" name="user.uname" placeholder="请输入您要修改的用户名" required="required" maxlength="10">
					    		</div>
						    	<div class="button-box">
						    		<button type="submit" class="btn btn-success">修改</button>
						    	</div>
					    	</form>
  						</div>
  						<!-- 若用户名存在，给出提示 -->
  						<script type="text/javascript">
  							errortips(${param.updateuname},"用户名已存在!");
  						</script>
  						<div class="info-box">个性签名：
  							<s:if test="#session.user.sign==null">
  								这个家伙很懒，什么都没留下! 				
  							</s:if>
  							<s:else>
  								<s:property value="#session.user.sign"/> 
  							</s:else>
  							<a href="javascript:;" onclick="ShowReportText()"><i class="fa fa-pencil-square-o"></i></a>
  						</div>
  						<!-- 更新个性签名 -->
  						<div class="col-md-10 col-md-offset-1 hideme" id="bugreport">
							<form action="updateSign" method="post" class="form-horizontal" role="form">
								<div class="form-group m-top20">
									<input type="hidden" name="user.userid" value="<s:property value='#session.user.userid' />">
									<textarea rows="5" maxlength="128" name="rom.upfailreason" class="form-control" placeholder="请输入您的个性签名"></textarea>						
								</div>
								<div class="form-group text-center">
									<input type="submit" class="btn btn-radius btn-success" value="修改">
								</div>
							</form>
						</div>
  						<div class="info-box">
  							<s:if test='#session.user.ptype=="developer"'>
								用户类型：开发者
							</s:if>
							<s:else>
								用户类型：普通用户
							</s:else>
  						</div>
  						<div class="info-box">注册时间：<s:property value="#session.user.registerdate"/></div>
  					</div>
  				</div>
  				<div class="col-md-12" id="opnav">
	  				<div class="col-md-12">
		    			<ul>
						     <li class="col-md-2"><a class="col-md-12" href="showMyHome.action?user.userid=<s:property value='#session.user.userid'/>&model.modelid="><i class="fa fa-home"></i> 我的主页</a></li>
						     <li class="col-md-2"><a class="col-md-12" href="showMyComment.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-commenting"></i> 我的评论</a></li>
						     <li class="col-md-2"><a class="col-md-12" href="showHistory.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-history"></i> 历史浏览</a></li>
						     <li class="col-md-2"><a class="col-md-12" href="showSystemAdvice.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-stack-overflow"></i>&nbsp;系统推荐</a></li>
						     <li class="col-md-2"><a class="col-md-12" href="showSecuritySetting.action"><i class="fa fa-lock"></i>&nbsp;安全设置</a></li>
						     <li class="col-md-2"><a class="col-md-12" href="showDataPerfection.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-pencil-square-o"></i> 资料完善</a></li>
						     <s:if test='#session.user.ptype=="developer"'>
						     	<script type="text/javascript">
						     		$("#opnav").addClass("depnav");
						     	</script>
						     	<li><a class="col-md-12" href="showReleaseRom.action"><i class="fa fa-history"></i> 发布ROM</a></li>
								<li><a class="col-md-12" href="showRomManagerCenterSv.action?user.userid=<s:property value='#session.user.userid'/>&currentPage=1"><i class="fa fa-stack-overflow"></i> 管理ROM</a></li>
						     </s:if>
					     </ul>
			    	</div>
		  		</div>
  			</div>
  			<div class="row box-shadow" id="opcontent">
  				<!-- 我的主页模块 -->
  				<s:if test="#request.showmyhome==1">
  					<jsp:include page="module/showMyHome.jsp"/>
  				</s:if>
  				<!-- 我的评论模块 -->
  				<s:if test="#request.showmycomment==1">
  					<jsp:include page="module/showMyComment.jsp"/>
  				</s:if>
  				<!-- 历史浏览模块 -->
  				<s:if test="#request.showhistory==1">
	  				<jsp:include page="module/showHistory.jsp"/>
  				</s:if>
  				<s:if test="#request.nohistory==1">
  					<jsp:include page="module/showNoModelUitypeHistory.jsp"/>
  				</s:if>
  				<!-- 系统推荐模块 -->
  				<s:if test="#request.showsystemadvice==1">
	  				<jsp:include page="module/showSystemAdvice.jsp"/>
  				</s:if>
  				<!-- 安全设置模块 -->
  				<!-- 原密码错误提示 -->
  				<script type="text/javascript">
  					errortips(${param.resetpasswd},"原密码输入错误!")
  				</script>
  				<!-- 安全问题或答案错误提示 -->
  				<script type="text/javascript">
  					errortips(${param.findmodifyquestionuser}, "问题或答案错误！");
  				</script>
  				<!-- 安全问题或答案验证通过 -->
  				<script type="text/javascript">
  					if(${param.findmodifyquestionuser}==1)
  						ShowUserActionText('ResetQuestion');
  				</script>
  				<!-- 安全问题设置成功提示 -->
  				<script type="text/javascript">
  					if(${param.resetquestion}==1)
  						alert('安全问题设置成功');
  				</script>
  				<s:if test="#request.showsecuritysetting==1">
  					<jsp:include page="module/showSecuritySetting.jsp"/>
  				</s:if>
  				<!-- 完善资料模块 -->
  				<s:if test="#request.showdataperfection==1">
  					<jsp:include page="module/showDataPerfection.jsp"/>
  				</s:if>
  				<!-- 发布ROM模块 -->
  				<s:if test="#request.showreleaserom==1">
  					<jsp:include page="module/showReleaseRom.jsp"/>
  				</s:if>
  				<!-- 管理ROM模块 -->
  				<s:if test="#request.showdperrommanager==1">
  					<s:action name="showDperRomManager" executeResult="true" namespace="/"/>
  				</s:if>
  			</div>
  		</div>
  	<jsp:include page="foot.jsp"/>
  	<script type="text/javascript" src="js/showusermanager.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			var active=null;
  			$("#opnav a").click(function(){
  				active = $(this);
  			})
  			$(window).on("load",function(){
  				active.addClass("active");
  				console.log(active.html());
  			})
  		})
  	</script>
 </body>
</html>
