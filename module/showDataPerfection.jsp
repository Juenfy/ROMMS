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
   	<div><h3 class="page-header text-center">资料完善</h3></div>
   	<div class="col-md-10 col-md-offset-1">
   		<s:set value="#session.user" var="user"/>
   		<form class="form-horizontal" action="userDataPerfection" method="post">
   		  <fieldset disabled id="fieldsetDisabled">
			  <div class="form-group">
			  	<label class="col-md-3 control-label">真实姓名：</label>
			    <div class="col-md-6">
				  <input type="hidden" name="user.userid" value="<s:property value='#user.userid'/>">  	
			      <input type="text" class="form-control" name="user.realname" value="<s:property value='#user.realname'/>" maxlength="6">
			    </div>
			    <span></span>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">电话号码：</label>
			    <div class="col-md-6">
			      <input type="text" class="form-control" name="user.phone" value="<s:property value='#user.phone'/>" maxlength="20">
			    </div>
			    <span></span>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">现住地址：</label>
			    <div class="col-md-6">
			      <input type="text" class="form-control" name="user.address" value="<s:property value='#user.address'/>" maxlength="50">
			    </div>
			    <span></span>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">QQ：</label>
			    <div class="col-md-6">
			      <input type="text" class="form-control" name="user.qq" value="<s:property value='#user.qq'/>" maxlength="16">
			    </div>
			    <span></span>
			  </div>
			  <div class="form-group">
			    <label class="col-md-3 control-label">性别：</label>
			    <div class="col-md-3">
			      	<input type="text" class="form-control" value="<s:property value='#user.sex'/>">
			    </div>
			    <div class="col-md-3">    	
			      <select name="user.sex" class="form-control">
			          <option value="<s:property value='#user.sex'/>" selected>请选择性别</option>
			          <option value="男">男</option>
			          <option value="女">女</option>
			      </select>
			    </div>
			  </div>
		  </fieldset>
		  <div class="form-group">
		    <div class="col-md-3 col-md-offset-3">
		      <input type="button" class="btn btn-success" id="dataModify" value="修改">
		    </div>
		    <div class="col-md-3 text-center">
		      <input type="submit" class="btn btn-danger" disabled="disabled" id="saveDataBtn" value="保存">
		    </div>
		  </div>
		</form>
   	</div>
  </body>
</html>
