<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
  	<%
		//管理员在没登录的情况下重定向到登录页面
		if(session.getAttribute("admin")==null){
			response.sendRedirect("adminLogin.jsp");
		}
	 %>
  	<script type="text/javascript">
	  	//给出错误提示
		$(window).load(function(){
			if(${param.addmodel} == 0){
				alert('该型号已存在');
			}
		})
  	</script>
    <div class="row add-box addmodel">
   		<form action="addModel" class="form-horizontal" method="post" enctype="multipart/form-data">
   			<div class="form-group">
   				<div class="col-md-6 col-md-offset-3"><h4 class="page-header"><i class="fa fa-home"></i>&nbsp;手机管理>添加型号</h4></div>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">选择品牌：</label>
   				<div class="col-md-6">
    				<select name="model.mfture.mftureid" class="form-control">
    					<s:iterator value="#request.mftures" var="mfture">
    						<option value="<s:property value='#mfture.mftureid'/>"/><s:property value="#mfture.mfture"/>
    					</s:iterator>
    				</select>
   				</div>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">型号：</label>
   				<div class="col-md-6">
    				<input type="text" class="form-control" name="model.model" placeholder="请输入手机型号" required="required" maxlength="24">
   				</div>
   				<span></span>
   			</div>
   			<div class="col-md-2 col-md-offset-5">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center addpic addmdpic">
						<a class="row addfile"><img src="<%=request.getContextPath() %>/images/phone/touming.png" id="mdpic"><i class="fa fa-plus"></i></a>
						<input type="file" class="mdpic" name="modelpic" accept="image/jpg,image/jpeg,image/png">
					</div>
				</div>
   			</div>
   			<p class="col-md-2 col-md-offset-5 text-center">添加型号图片</p>
   			<div class="form-group">
   				<div class="col-md-4 col-md-offset-4">
   					<button type="submit" class="btn btn-success">确定</button>
   				</div>
   			</div>
   		</form>
    </div>
  </body>
</html>
