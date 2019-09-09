<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<style type="text/css">
		h4>a{color: #000}
		h4>a:hover{text-decoration: underline;color: #00a0e9}
	</style>
  </head>
  
  <body>
  	<s:if test="#request.hismodels.size>0">
  		<div class="col-md-12 hismodel">
  			<div class="row"><div class="col-md-2 histt">手机历史浏览</div></div>
	  		<s:iterator value="#request.hismodels" var="hismodel">
		    	<div class="col-md-3" id="model">
		    		<a href="showModelRom.action?model.modelid=<s:property value='#hismodel.model.modelid'/>&savehistory=0&currentPage=1" class="col-md-12">
				  		<s:if test="#hismodel.model.moimg!=null">
	  						<div class="col-md-4" id="img"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#hismodel.model.mfture.mfture'/>/<s:property value='#hismodel.model.model'/>/<s:property value='#hismodel.model.moimg'/>"></div>
						</s:if>
						<s:else>
							<div class="col-md-4" id="img"><img src="<%=request.getContextPath() %>/images/phone/default.png"></div>
						</s:else>
						<div class="col-md-8">
							<div class="name"><s:property value="#hismodel.model.model"/></div>
							<div class="info">
								<div>ROM：<font style="color:#60bf00"><s:property value="#hismodel.model.romnum"/></font></div>
								<div>教程：<font style="color:#60bf00"><s:property value="#model.flashteachs.size"/></font></div>
							</div>
				  		</div>
	  				</a>
		    	</div>
		    </s:iterator>	    	
	    </div>
	    <div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
  	</s:if>
  	<s:else>
  		<div class="col-md-12 text-center">
  			<h3>暂无手机浏览记录</h3>
  		</div>
  	</s:else>
  	<s:if test="#request.hisroms.size>0">
  		<div class="col-md-12 roms hisroms">
	  		<div class="row"><div class="col-md-2 histt">ROM历史浏览</div></div>
	  		<s:iterator value="#request.hisroms" var="hisrom">
		   		<div class="col-md-6 rom">
		   			<div class="col-md-12 romtitle">
			   			<a href="showRomDetail.action?rom.romid=<s:property value="#hisrom.rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><s:property value="#hisrom.rom.title"/></a>
		   			</div>
		   			<div>
		   			<div class="col-md-3 coimg"><a href="showRomDetail.action?rom.romid=<s:property value="#hisrom.rom.romid"/>&savehistory=0&cmodule=rom&currentPage=1"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#hisrom.rom.model.mfture.mfture'/>/<s:property value='#hisrom.rom.model.model'/>/<s:property value='#hisrom.rom.uitype.uitype'/>/<s:property value='#hisrom.rom.datedir'/>/<s:property value='#hisrom.rom.coimg'/>"></a></div>
		   				<div class="col-md-9" style="color: #888">
		   					开发者：<a href="showDeveloperHome.action?user.userid=<s:property value='#hisrom.rom.user.userid'/>&currentPage=1"><s:property value="#hisrom.rom.user.uname"/></a><br><br>
		   					适用机型：<s:property value="#hisrom.rom.model.model"/><br><br>
			   				安卓版本：<s:property value="#hisrom.rom.android.android"/><br><br>
			   				UI类型：<s:property value="#hisrom.rom.uitype.uitype"/><br><br>
			   				发布时间：<s:property value="#hisrom.rom.redate"/><br><br>
			   				ROM大小：<s:property value="#hisrom.rom.romsize"/>M
		   				</div>
	   				</div>
		   		</div>
			</s:iterator>
  		</div>
  		<div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
  	</s:if>
  	<s:else>
  		<div class="col-md-12 text-center">
  			<h3>暂无ROM浏览记录</h3>
  		</div>
  	</s:else>
 	<s:if test="#request.histeaches.size>0">
 		<div class="col-md-12 histeach">
 			<div class="row"><div class="col-md-2 histt">教程历史浏览</div></div>
	 		<s:iterator value="#request.histeaches" var="histeach">
	  			<div class="col-md-12 m-top20">
	  				<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#histeach.flashteach.model.mfture.mfture'/>/<s:property value='#histeach.flashteach.model.model'/>/flashteach/<s:property value='#histeach.flashteach.datedir'/>/<s:property value='#histeach.flashteach.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
	  				<div class="col-md-7">
	  					<h4><small class="text-info">[<s:property value="#histeach.flashteach.model.model"/>教程]</small><a href="showTeachDetail.action?teach.ftid=<s:property value='#histeach.flashteach.ftid'/>&teach.reviewnum=<s:property value='#histeach.flashteach.reviewnum'/>&cmodule=teach&currentPage=1&savehistory=0"><s:property value="#histeach.flashteach.title"/></a></h4>
	  					<div class="l-height25 text-left"><s:property value="#histeach.flashteach.ftcontent"/></div>
	  					<span class="text-muted l-height30">发布日期：<s:property value="#histeach.flashteach.redate"/></span>
	  					<span class="text-muted l-height30 col-md-offset-5"><i class="fa fa-eye"></i> <s:property value="#histeach.flashteach.reviewnum"/></span>
	  				</div>
	  			</div>
	  		</s:iterator>
	  	</div>
	  	<div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
	 </s:if>
	 <s:else>
  		<div class="col-md-12 text-center">
  			<h3>暂无教程浏览记录</h3>
  		</div>
  	</s:else>
	 <s:if test="#request.hisnewses.size>0">
	 	<div class="col-md-12 hisnews">
	 		<div class="row"><div class="col-md-2 histt">资讯历史浏览</div></div>
	  		<s:iterator value="#request.hisnewses" var="hisnews">
	  			<div class="col-md-12 m-top20">
	  				<div class="col-md-3"><img src="<%=request.getContextPath() %>/images/phone/phonenews/<s:property value='#hisnews.phonenews.datedir'/>/<s:property value='#hisnews.phonenews.coimg'/>" class="img-thumbnail" width="300" height="200"></div>
	  				<div class="col-md-7">
	  					<h4><small class="text-info">[安卓ROM资讯]</small><a href="showNewsDetail.action?news.pnid=<s:property value='#hisnews.phonenews.pnid'/>&news.reviewnum=<s:property value='#hisnews.phonenews.reviewnum'/>&cmodule=news&currentPage=1&savhistory=0"><s:property value="#hisnews.phonenews.title"/></a></h4>
	  					<div class="l-height25 text-left"><s:property value="#hisnews.phonenews.pncontent"/></div>
	  					<span class="text-muted l-height30">发布日期：<s:property value="#hisnews.phonenews.redate"/></span>
	  					<span class="text-muted l-height30 col-md-offset-5"><i class="fa fa-eye"></i> <s:property value="#hisnews.phonenews.reviewnum"/></span>
	  				</div>
	  			</div>
	  		</s:iterator>
 		</div>
 		<div class="col-md-2 col-md-offset-9 text-right downup l-height40"><a class="down">展开</a><a class="up hideme">收起</a></div>
 	</s:if>
 	<s:else>
  		<div class="col-md-12 text-center">
  			<h3>暂无资讯浏览记录</h3>
  		</div>
  	</s:else>
  </body>
</html>
