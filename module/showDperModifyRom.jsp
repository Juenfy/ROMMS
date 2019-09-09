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
  	<s:set value="#request.rom" var="rom"/>
    <div class="modifyrom" id="saverom">
    	<div><h3 class="page-header col-md-offset-2 text-info"><s:if test="#request.edit==1">编辑ROM</s:if><s:if test="#request.create==1">创建ROM新版本</s:if></h3></div>
    	<div class="col-md-12">
    		<s:if test="#request.edit==1">
    			<form class="form-horizontal" action="dperSaveRomEdit" method="post" enctype="multipart/form-data">
    		</s:if>
    		<s:if test="#request.create==1">
    			<form class="form-horizontal" action="dperCreateRomNewVersion" method="post" enctype="multipart/form-data">
    		</s:if>
    		<div class="form-group">
				<label class="col-md-3 control-label">手机型号：</label>
			    <div class="col-md-6">
			      	<input type="hidden" name="rom.model.modelid" value="<s:property value='#rom.model.modelid'/>">
			      	<input type="text" class="form-control" value="<s:property value='#rom.model.model'/>" disabled="disabled">
			    </div>
			    <div class="col-md-3 tips">*</div>
			  </div>
			  <div class="form-group">
			  	<label class="col-md-3 control-label">ROM版本标题：</label>
			    <div class="col-md-6">
				  <input type="hidden" name="rom.user.userid" value="<s:property value='#session.user.userid'/>" >
				  <input type="hidden" name="rom.romid" value="<s:property value='#rom.romid'/>" >
			      <input type="text" class="form-control" name="rom.title" value="<s:property value='#rom.title'/>" required="required" maxlength="50">
			    </div>
			    <div class="col-md-3 tips">*(例：品牌+型号+ROM特性)</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">UI类型：</label>
			    <div class="col-md-6">
			      	<input type="hidden" name="rom.uitype.uiid" value="<s:property value='#rom.uitype.uiid'/>" > 	
			      	<input type="text" class="form-control" value="<s:property value='#rom.uitype.uitype'/>" disabled="disabled">
			    </div>
			    <div class="col-md-3 tips">*</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">ROM版本号：</label>
			    <div class="col-md-6">
			      <s:if test="#request.edit==1">
			      	<input type="text" class="form-control" name="rom.version" value="<s:property value='#rom.version'/>" required="required" maxlength="5">
			      </s:if>
			      <s:if test="#request.create==1">
			      	<input type="text" class="form-control" name="rom.version" value="<s:property value='#rom.version'/>" required="required" disabled="disabled">
			      </s:if>
			    </div>
			    <div class="col-md-3 tips">*（例：1.0.0）</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">Android版本：</label>
			    <div class="col-md-6">
			    	<select name="rom.android.anid" class="form-control">
			    		<option value="<s:property value='#rom.android.anid'/>"/><s:property value="#rom.android.android"/>
				   		<s:iterator value="#request.androids" var="android">
				      		<option value="<s:property value='#android.anid'/>"/><s:property value="#android.android"/>
				    	</s:iterator>
			      	</select>
			    </div>
			    <div class="col-md-3 tips">*</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">ROM大小：</label>
			    <div class="col-md-6">
			      <input type="text" class="form-control" name="rom.romsize" value="<s:property value='#rom.romsize'/>" required="required" maxlength="6">
			    </div>
			    <div class="col-md-3 tips">* MB（例：324.5）</div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">ROM介绍：</label>
			    <div class="col-md-6">
			      <textarea class="form-control" rows="8" required="required" name="rom.romdesc" maxlength="1024"><s:property value='#rom.romdesc'/></textarea>
			    </div>
			    <div class="col-md-3 romdesctips">* </div>
			  </div>
			  <div class="form-group">
			    <label for="romdesc" class="col-md-3 control-label">ROM截图：</label>
			    <div class="col-md-8 romimg">
			      	<div class="coimg"><a class="cover"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.coimg'/>" id="cover"><i class="fa fa-plus"></i></a><div>封面图</div></div>
			      	<div class="col-md-2 limg"><a class="lockscreen"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img1'/>" id="lockscreen"><i class="fa fa-plus"></i></a><div>锁屏</div></div>
			      	<div class="col-md-2 img"><a class="application"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img2'/>" id="application"><i class="fa fa-plus"></i></a><div>应用程序</div></div>
			      	<div class="col-md-2 img"><a class="aboutphone"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img3'/>" id="aboutphone"><i class="fa fa-plus"></i></a><div>关于手机</div></div>
			      	<div class="col-md-2 img"><a class="others"><img src="<%=request.getContextPath() %>/images/phone/<s:property value='#rom.model.mfture.mfture'/>/<s:property value='#rom.model.model'/>/<s:property value='#rom.uitype.uitype'/>/<s:property value='#rom.datedir'/>/<s:property value='#rom.img4'/>" id="others"><i class="fa fa-plus"></i></a><div>其他特色</div></div>
			      	<input type="file" class="cover" name="coverpic" accept="image/jpeg,image/jpg,image/png">
			      	<input type="file" class="lockscreen" name="lockscreenpic" accept="image/jpeg,image/jpg,image/png">
			    	<input type="file" class="application" name="applicationpic" accept="image/jpeg,image/jpg,image/png">
			      	<input type="file" class="aboutphone" name="aboutphonepic" accept="image/jpeg,image/jpg,image/png">
			      	<input type="file" class="others" name="otherspic" accept="image/jpeg,image/jpg,image/png">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-md-offset-3 col-md-6">
			      <input type="submit" class="btn btn-success" value="保存并提交">
			    </div>
			  </div>
			</form>
    	</div>
    </div>
  </body>
</html>
