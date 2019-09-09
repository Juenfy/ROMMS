<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
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
    <div class="row add-box adduser">
    	<form action="addUser" method="post" role="form" class="form-horizontal">
    		<div class="form-group">
   				<div class="col-md-6 col-md-offset-3"><h4 class="page-header"><i class="fa fa-home"></i>&nbsp;用户管理>添加用户</h4></div>
   			</div>
    		<div class="form-group">
   				<label class="col-md-3 control-label">账号：</label>
   				<div class="col-md-6">
    				<input type="text" class="form-control" name="user.uaccount" maxlength="12">
   				</div>
   				<span></span>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">密码：</label>
   				<div class="col-md-6">
    				<input type="password" class="form-control" name="user.password" maxlength="16">
   				</div>
   				<span></span>
   			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">确认密码：</label>
   				<div class="col-md-6">
    				<input type="password" class="form-control" name="user.repasswd" maxlength="16">
   				</div>
   				<span></span>
   			</div>
    		<div class="form-group">
   				<label class="col-md-3 control-label">安全问题：</label>
   				<div class="col-md-6">
    				<s:action name="showQuestion" executeResult="true" namespace="/" />
    			</div>
			</div>
   			<div class="form-group">
   				<label class="col-md-3 control-label">答案：</label>
   				<div class="col-md-6">
    				<input type="text" class="form-control" name="user.answer" maxlength="30">
   				</div>
   				<span></span>
   			</div>
    		<div class="form-group">
   				<div class="col-md-2 col-md-offset-5">
		    		<input type="radio"  name="user.ptype" value="user" checked="checked">普通用户
		    		<input type="radio" name="user.ptype" value="developer">开发者
				</div>
   				<span></span>
   			</div>
    		<div class="form-group">
   				<div class="col-md-4 col-md-offset-4">
   					<button type="submit" class="btn btn-success" id="addBtn">添加</button>
   				</div>
   			</div>
    	</form>
    </div>
    <script type="text/javascript">
	 	 $(function(){
			$("#addBtn").click(function(){
				var arr = [];
				$(".adduser input").each(function(){
					arr.push($(this).val());
				})
				var index;
				for(index in arr){
					if(arr[index] == ""){
						alert("请填写完整信息");
						return false;
					}
				}
				if(arr[1] != arr[2]){
					alert("两次密码输入不一致");
					return false;	
				}
			})
	 	})
	 </script>
  </body>
</html>
