<%@page import="org.apache.struts2.ServletActionContext"%>
<%@ page language="java" import="java.util.*,com.jy.util.JudgeTools" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/header.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/head.js"></script>
		<script type="text/javascript" src="layer/layer.js"></script>
		<script type="text/javascript" src="js/jumpwindows.js"></script>
		<script type="text/javascript">
			function settingContentWidth(width, windowWd, dom, mLeft){
				//由于bootstrap里的container对不同分辨率的电脑分为三种情况去设置container最大宽度
				//第一种情况是分辨率大于等于768小于992，div最大宽度为750
				if(windowWd >= 768 && windowWd < 992){
					if(width < 750){
						dom.css({width: 750,marginLeft: mLeft});
					}
				}
				//第二种情况是分辨率大于等于992小于1200，div最大宽度为970
				else if(windowWd >= 992 && windowWd < 1200){
					if(width < 970){
						dom.css({width: 970,marginLeft: mLeft});
					}
				}
				//第三种情况是分辨率大于等于1200，div最大宽度为1170
				else if(windowWd >= 1200){
					if(width < 1200){
						dom.css({width: 1170,marginLeft: mLeft});
					}
				}
				//最后一种情况是小于768的，bootstrap里没考虑到，所以我自行添加了，跟第一种情况一样处理把
				else{
					if(width < 750){
						dom.css({width: 750,marginLeft: mLeft});
					}
				}
			}
			function settingOthersWidth(width, windowWd, dom){
				if(width < windowWd){
					dom.css({width: windowWd});
				}else{
					dom.css({width: ""});
				}
			}
			$(function(){
				//解决bootstrap窗口化布局混乱问题
				//原理：通过监听浏览器窗口变大变小、自动载入事件对部分暴露在body里的宽度比较大的div进行宽度定死
				
				//获取屏幕宽度
				var mLeft=174.6;
				var windowWd = window.screen.width;
				$(window).on('resize',function(){
					//获取浏览器此时此刻的宽度
					var width = $(window).width();
					//对头部div、脚部div、隐藏搜索div层、隐藏手机div层和隐藏ui类型div层的宽度进行定死
					settingOthersWidth(width, windowWd, $('.head,.search,.hidmodel,.hiduitype,.foot'));
					//由于内容div并不是铺满屏幕，所以需要调用专属方法
					settingContentWidth(width, windowWd, $('.content'),mLeft);
				})
				$(window).on('load',function(){
					var width = $(window).width();
					if(width+20 < windowWd){
						settingOthersWidth(width, windowWd, $('.head,.search,.hidmodel,.hiduitype,.foot'));
						settingContentWidth(width, windowWd, $('.content'),mLeft);
					}else{
						//当浏览器最大化时获取内容div的marginLeft值
						mLeft = $('.content').css('marginLeft');
					}
				})
			})
		</script>
  	</head>
 	<body>
 		<jsp:include page="windows/resetPasswd.jsp"/>
 		<jsp:include page="windows/resetQuestion.jsp"/>
 		<jsp:include page="windows/userLogin.jsp"/>
 		<jsp:include page="windows/userRegister.jsp"/>
 		<!-- 背景动画 -->
 		<s:action name="modelChooseModule" executeResult="true" namespace="/"/>
		<s:action name="hiddenModel" executeResult="true" namespace="/"/>
		<s:action name="hiddenUiType" executeResult="true" namespace="/"/>		
 		<div class="head container-fluid">
	 		<div class="row search">
		  		<div class="col-md-2" id="slogo"><img src="<%=request.getContextPath() %>/images/weblogo/bluelogo.png"></div>
			  	<form class="bs-example bs-example-form" action="showSeachResult" method="post">
			  		<div class="input-group col-md-8">		
			  			<select name="svalue">
			  				<option value="roms">ROM</option>
			  				<option value="teaches">教程</option>
			  				<option value="newses">资讯</option>
			  			</select>
			  			<input type="hidden" name="currentPage" value="1">
				  		<input type="text" name="scontent" class="form-control" placeholder="标题关键字" autocomplete="off">
				  		<button><i class="fa fa-search"></i></button>
			  		</div>
			  	</form>
	  		</div>
	    	<div class="row" id="nav">
	    		<div class="col-md-2" id="nlogo"><img src="<%=request.getContextPath() %>/images/weblogo/bluelogo.png" id="logoimg"></div>
	    		<div class="col-md-8">
	    			<ul>
					     <li class="col-md-2"><a class="col-md-12" href="index.jsp">首页</a></li>
					     <li class="col-md-2" id="displaymodel"><a class="col-md-12" href="showMftureModelSv.action?currentPage=1&user.userid=<s:property value='#session.user.userid'/>">下载</a></li>
					     <li class="col-md-2" id="displayuitype"><a class="col-md-12" href="showUiType.action">UI专区</a></li>
					     <li class="col-md-2"><a class="row" href="showFlashTeach.action">教程</a></li>
					   	 <li class="col-md-2"><a class="col-md-12" href="showPhoneNews.action?currentPage=1">资讯</a></li>
					   	 <li class="col-md-2"><a class="col-md-12" href="showRomCharts.action?currentPage=1">排行榜</a></li>
			     	</ul>
	    		</div>
	    		<!-- 显示机型选择区域箭号 -->
	    		<div class="showmc"><i class="fa 	fa fa-mobile-phone"></i></div>
	    		<div class="hiddenmc"><i class="fa fa-chevron-right"></i></div>
			   	<div class="col-md-2" id="userlogin">
			   		<s:if test="#session.user == null">
			   			<ul>
			   				<li class="col-md-6 col-md-offset-6"><a id="shownullmenu"><i class="glyphicon glyphicon-user"></i></a></li>
			   			</ul>
			   		</s:if>
		   			<s:else>
		   				<ul>
		   					<li class="col-md-6 col-md-offset-6"><a href="showMyHome.action?user.userid=<s:property value='#session.user.userid'/>&user.uname=<s:property value='#session.user.uname'/>&model.modelid=" id="showusermenu"><img title="<s:property value='#session.user.uname'/>" src="<%=request.getContextPath() %>/images/userimg/<s:property value='#session.user.userimg'/>"></a></li>
		   				</ul> 			
		   			</s:else>
			   	</div>
			   	<div class="nullmenu">
			   		<ul>
			   			<li><a onclick="ShowUserActionText('Login')">立即登录</a></li>
			   			<li><a onclick="ShowUserActionText('Register')">立即注册</a></li>
			   		</ul>		
			   	</div>
			   	<div class="usermenu">
			   		<ul>
			   			<li><a href="showMyHome.action?user.userid=<s:property value='#session.user.userid'/>&model.modelid="><i class="fa fa-home"></i> 我的主页</a></li>
			   			<li><a href="showMyComment.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-commenting"></i> 我的评论</a></li>
			   			<li><a href="showHistory.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-history"></i> 历史浏览</a></li>
			   			<li><a href="showSystemAdvice.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-history"></i> 系统推荐</a></li>
			   			<li><a href="showSecuritySetting.action"><i class="fa fa-lock"></i> 安全设置</a></li>
			   			<li><a href="showDataPerfection.action?user.userid=<s:property value='#session.user.userid'/>"><i class="fa fa-pencil-square-o"></i> 资料完善</a></li>
			   			<s:if test='#session.user.ptype=="developer"'>
			   				<li><a href="showReleaseRom.action"><i class="fa fa-sign-out"></i> 发布ROM</a></li>
			   				<li><a href="showRomManagerCenterSv.action?user.userid=<s:property value='#session.user.userid'/>&currentPage=1"><i class="fa fa-sign-out"></i> 管理ROM</a></li>
			   			</s:if>
			   			<li><a href="userLogout.action"><i class="fa fa-sign-out"></i> 注销用户</a></li>
			   		</ul>		
			   	</div>	
			</div>
		</div>
		<a href="javascript:;" id="backtop"><div class="uptop"><i class="fa fa-arrow-up"></i></div></a>
 	</body>
</html>
