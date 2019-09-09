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
    
    <title>UI专区</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/icon/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/showuitype.css">
  </head>
  <body>
  	<jsp:include page="head.jsp"/>
   		<div class="content container">
			<div id="myCarousel" class="carousel slide imglunbo" data-interval="2000" data-ride="carousel">
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
						<img src="<%=request.getContextPath() %>/images/uilunbo/miui10.png" alt="First slide">
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/uilunbo/flyme7.png" alt="Second slide">
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/uilunbo/flyme6.png" alt="Third slide">
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/uilunbo/emui.png" alt="Fourth slide">
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/uilunbo/coloros.png" alt="Fifth slide">
					</div>
					<div class="item">
						<img src="<%=request.getContextPath() %>/images/uilunbo/funtouchos.png" alt="Sixth slide">
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
			<div class="ui">
				<div class="miui10 video">
					<a onclick="ShowVideoText('miui10_video')">					
						<div class="video_play"></div>
					</a>
				</div>
				<div class="flyme7 video">
					<a onclick="ShowVideoText('flyme7_video')">							
						<div class="video_play" ></div>
					</a>
				</div>
				<div class="funtouchos4 video">
					<a onclick="ShowVideoText('funtouchos4_video')">					
						<div class="video_play"></div>
					</a>
				</div>
				<div class="coloros5 video">
					<a onclick="ShowVideoText('coloros5_video')">							
						<div class="video_play"></div>
					</a>
				</div>
			</div>
			<!-- 隐藏的视频div层 -->
			<div class="miui10_video" style="display: none;height: 450px;width: 800px;">
  				<video src="uivideo/miui10.mp4" height="450" width="800" controls="controls"></video>
		  	</div>
		  	<div class="flyme7_video" style="display: none;height: 334px;width: 800px;">
		  		<video src="uivideo/flyme7.mp4" height="334" width="800" controls="controls"></video>
		  	</div>
		  	<div class="funtouchos4_video" style="display: none;height: 450px;width: 800px;">
		  		<video src="uivideo/funtouchos4.mp4" height="450" width="800" controls="controls"></video>
		  	</div>
			<div id="uitt">
				<div id="dzyh">定制优化</div>
			</div>
			<div class="row">
				<s:iterator value="#request.uitypes" var="uitype">
					<s:if test="#uitype.uimg!=null">
	   					<div class="col-md-3 uiimg">
	   						<a href="showUiTypeRom?uitype.uiid=<s:property value='#uitype.uiid'/>&currentPage=1" class="thumbnail"><img title="<s:property value='#uitype.uitype'/>" src="<%=request.getContextPath() %>/images/uiimg/<s:property value='#uitype.uimg'/>" class="radius"></a>
	   					</div>
   					</s:if>
   				</s:iterator>
			</div>
		</div>
  	<jsp:include page="foot.jsp"/>
  </body>
  </html>
