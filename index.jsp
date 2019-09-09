<%@page import="org.apache.struts2.ServletActionContext,com.jy.util.JudgeTools"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
JudgeTools jt = new JudgeTools();
if(jt.judgeIsPhone(request))
	response.sendRedirect("mobile/mobileIndex.jsp");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ANROM之家</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="ROM,刷机包下载,固件下载,安卓ROM">
	<meta http-equiv="description" content="纯净,简洁,海量精品ROM免费下载">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/index.css">
  	</head>
  	<body>
	  	<jsp:include page="head.jsp"/>
	  	<jsp:include page="windows/Tips.jsp"/>
	  	<div class="content container box-shadow">
	  		<div id="myCarousel" class="carousel slide row" data-interval="3000" data-ride="carousel">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
					<li data-target="#myCarousel" data-slide-to="5"></li>
				</ol>   
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="<%=request.getContextPath() %>/images/indexlunbo/coloros.png" alt="First slide">
						<div>
							<span class="col-md-6 col-md-offset-3">
								ColorOS是由OPPO推出的基于安卓（Android）深度定制的系统，在简约的
								基础上，最大限度减少容易对人造成干扰的视觉元素的使用，让视觉减负；突出界
								面核心内容，让信息主次分明，层次清晰，在延续中做到轻量化设计；通过色彩比
								例的合理运用，ICON更加简化去突出刻画主要视觉元素,但又不失立体感，整体
								更精致更具品质感。
							</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/indexlunbo/h2os.png" alt="Second slide">
						<div>
							<span class="col-md-6 col-md-offset-3">
								H2OS是一加推出的基于安卓（Android）深度定制的系统，H2OS，从字面上理解，
								“氢”的谐音是“轻”，寓意系统轻巧，不臃肿。同时，H2O是水的分子式，也暗示纯净，
								总体来说就是有轻巧、纯净的特点，预计比较接近原生系统。
							</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/indexlunbo/miui10.png" alt="Third slide">
						<div>
							<span class="col-md-6 col-md-offset-3">
								MIUI是由小米推出的基于安卓（Android）深度定制的系统，MIUI10特意为全面屏定制了
								UI设计，从系统的界面布局、人机交互等层面做了调整，MIUI10全面推进了手势操作，通过
								一个悬浮球的设计让MIUI10可以在全面屏上实现退出应用，切换应用等操作。在进入程序多任
								务后台时，MIUI10从之前横向切换页卡换成了全新的瀑布流展示。
							</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/indexlunbo/flyme7.png" alt="Forth slide">
						<div>
							<span class="col-md-6 col-md-offset-3">
								Flyme是由魅族推出的基于安卓（Android）深度定制的系统，Flyme7沿袭了Flyme
								一贯的简洁清新的设计，整体变化不大，在细节处仍有不少改进。比如，手机管理APP界面布局
								和功能有所调整，变得更直观高效；天气APP更简洁大方。另外主题中还新增了系统键盘专属皮肤。
							</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/indexlunbo/smartisanos.png" alt="Fifth slide">
						<div>
							<span class="col-md-4 col-md-offset-4">
								SmartisanOS，罗永浩创立的锤子科技推出的基于安卓（Android）深度定制的系
								统，Smart+Artisan 组合创意词,意为智能机时代的精细工匠。
							</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/indexlunbo/funtouchos.png" alt="Sixth slide">
						<div>
							<span class="col-md-4 col-md-offset-4">
								FuntouchOS是由vivo推出的基于安卓（Android）深度定制的系统，简约.乐趣.智慧
								以用户体验、用户口碑为核心，回归体验本源，还原使用真相，做正确的体验，把体验做正确、做极致。
							</span>
						</div>
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<h4 class="page-header text-center">热门机型</h4>
			<s:action name="showHostestModel" executeResult="true" namespace="/"/>
			<div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
			<h4 class="page-header text-center">热门ROM</h4>
			<s:action name="showHostestRom" executeResult="true" namespace="/"/>
			<div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
	  	</div>
	  	<jsp:include page="foot.jsp"/>
	  	<script type="text/javascript">
			$(function(){
				//展开收起
				$('.downup a').click(function(){
					$(this).toggle();
					$(this).siblings().toggle();
					var div = $(this).parent('div').prev('div');
					if(div.is('.hmodel')){
						if($(this).is('.down')){
							div.stop().animate({height: "570px"},500);
						}
						if($(this).is('.up')){
							div.stop().animate({height: "270px"},500);
						}
					}
					if(div.is('.hrom')){ 
						if($(this).is('.down')){
							div.stop().animate({height: "900px"},500);
						}
						if($(this).is('.up')){
							div.stop().animate({height: "300px"},500);
						}
					}
				})
				//轮播图介绍
				$('.item>img').hover(function(){
					$('.carousel-indicators').hide();
					$(this).next().show()
				},function(){
					$('.carousel-indicators').show();
					$(this).next().hide();
				})
				$('.item>div').hover(function(){
					$('.carousel-indicators').hide();
					$(this).show()
					$('.item>img').unbind("hover");			
				},function(){
					$('.item>img').bind("hover");
					$('.carousel-indicators').show();
					$(this).hide()
				})
			})
		</script>
  	</body>
</html>
