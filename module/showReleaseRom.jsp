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
  </head> 
  <body>
    <div class="row saverom" id="saverom">
    	<div><h3 class="page-header col-md-offset-2"><b>发布ROM</b></h3></div>
    	<div class="col-md-10 col-md-offset-1">
    		<form class="form-horizontal" action="releaseRom" method="post" enctype="multipart/form-data">
    			<div class="form-group">
					<label class="col-md-2 control-label">手机型号：</label>
				    <div class="col-md-6">
				    	<select name="rom.model.modelid" class="form-control">
				    		<option>请选择手机型号</option>
					   		<s:iterator value="#request.models" var="model">
					      		<option value="<s:property value='#model.modelid'/>"/><s:property value="#model.model"/>
					    	</s:iterator>
				      	</select>
				    </div>
				    <div class="col-md-4 tips">*</div>
			  </div>
			  <div class="form-group">
			  	<label class="col-md-2 control-label">ROM版本标题：</label>
			    <div class="col-md-6">
				  <input type="hidden" name="rom.user.userid" value="<s:property value='#session.user.userid'/>" >  	
			      <input type="text" class="form-control" name="rom.title" required="required" maxlength="50">
			    </div>
			    <div class="col-md-4 tips">* (例：品牌+机型+ROM版本特性)</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">UI类型：</label>
			    <div class="col-md-6">
			      	<s:action name="showUiTypeSelect" executeResult="true" namespace="/"/>
			    </div>
			    <div class="col-md-4 tips">*</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">ROM版本号：</label>
			    <div class="col-md-6">
			      <input type="text" class="form-control" name="rom.version" required="required" maxlength="5">
			    </div>
			    <div class="col-md-4 tips">* 在前端显示，便于用户识别（例：1.0.0）</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">Android版本：</label>
			    <div class="col-md-6">
			    	<select name="rom.android.anid" class="form-control">
			    		<option>请选择安卓版本</option>
				   		<s:iterator value="#request.androids" var="android">
				      		<option value="<s:property value='#android.anid'/>"/><s:property value="#android.android"/>
				    	</s:iterator>
			      	</select>
			    </div>
			    <div class="col-md-4 tips">*</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">ROM大小：</label>
			    <div class="col-md-6">
			      <input type="text" class="form-control" name="rom.romsize" required="required" maxlength="6">
			    </div>
			    <div class="col-md-4 tips">* MB（例：324.5）</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">ROM介绍：</label>
			    <div class="col-md-6">
			      <textarea class="form-control" rows="8" required="required" name="rom.romdesc" maxlength="1024"></textarea>
			    </div>
			    <div class="col-md-4 romdesctips">* </div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">ROM截图：</label>
			    <div class="col-md-8 romimg">
			      	<div class="coimg"><a class="cover"><img src="<%=request.getContextPath() %>/images/phone/touming.png" id="cover"><i class="fa fa-plus"></i></a><div>封面图</div></div>
			      	<div class="col-md-2 limg"><a class="lockscreen"><img src="<%=request.getContextPath() %>/images/phone/touming.png" id="lockscreen"><i class="fa fa-plus"></i></a><div>锁屏</div></div>
			      	<div class="col-md-2 img"><a class="application"><img src="<%=request.getContextPath() %>/images/phone/touming.png" id="application"><i class="fa fa-plus"></i></a><div>应用程序</div></div>
			      	<div class="col-md-2 img"><a class="aboutphone"><img src="<%=request.getContextPath() %>/images/phone/touming.png" id="aboutphone"><i class="fa fa-plus"></i></a><div>关于手机</div></div>
			      	<div class="col-md-2 img"><a class="others"><img src="<%=request.getContextPath() %>/images/phone/touming.png" id="others"><i class="fa fa-plus"></i></a><div>其他特色</div></div>
			      	<input type="file" class="cover" name="coverpic" accept="image/jpeg,image/jpg,image/png" required="required">
			      	<input type="file" class="lockscreen" name="lockscreenpic" accept="image/jpeg,image/jpg,image/png" required="required">
			    	<input type="file" class="application" name="applicationpic" accept="image/jpeg,image/jpg,image/png" required="required">
			      	<input type="file" class="aboutphone" name="aboutphonepic" accept="image/jpeg,image/jpg,image/png" required="required">
			      	<input type="file" class="others" name="otherspic" accept="image/jpeg,image/jpg,image/png" required="required">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-md-offset-2 col-md-6">
			      <input type="submit" class="btn btn-success" value="保存并提交">
			    </div>
			  </div>
			</form>
    	</div>
    </div>
  </body>
</html>
