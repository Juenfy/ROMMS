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
	<script type="text/javascript">
		$(function(){
			$('#subject').change(function(){
				var op1 = $('#subject option:selected').val();
				if(op1 == 'teach'){
					$('.modelselect').show();
					var name = "teach";
					var name2 = ".ft"
				}else if(op1 == 'news'){
					$('.modelselect').hide();
					var name = "news";
					var name2 = ".pn";
				}
				$("input[type='hidden']").attr('name',name+'.user.userid');
				$("input[type='text']").attr('name',name+'.title');
				$("input[type='file']").attr('name',name+'pic');
				$(".rtn textarea").attr('name',name+name2+'content');
			})
		})
	</script>
  </head>
  
  <body>
  	<%
		//管理员在没登录的情况下重定向到登录页面
		if(session.getAttribute("admin")==null){
			response.sendRedirect("adminLogin.jsp");
		}
	 %>
    <div class="col-md-10 col-md-offset-1 rtn">
    	<h4 class="page-header"><i class="fa fa-home"></i>&nbsp;教程、资讯管理>教程、资讯发布</h4>
    	<form action="ReleaseTN" method="post" class="form-horizontal" enctype="multipart/form-data">
    		<div class="form-group">
    			<label class="col-md-3 control-label">选择主题：</label>
    			<div class="col-md-6">
    				<select class="form-control" name="subject" id="subject">
    					<option value=""/>请选择主题
    					<option value="teach"/>教程
    					<option value="news"/>资讯
    				</select>
    			</div>
    		</div>
    		<div class="form-group">
    			<label class="col-md-3 control-label">标题：</label>
    			<div class="col-md-6">
    				<input type="hidden" name="" value="<s:property value='#session.admin.userid'/>">
    				<input type="text" name="" class="form-control" maxlength="50">
    			</div>
    		</div>
    		<div class="form-group modelselect">
				<label class="col-md-3 control-label">手机型号：</label>
			    <div class="col-md-6">
			    	<select name="teach.model.modelid" class="form-control">
			    		<option value=""/>请选择手机型号</option>
				   		<s:iterator value="#request.models" var="model">
				      		<option value="<s:property value='#model.modelid'/>"/><s:property value="#model.model"/>
				    	</s:iterator>
			      	</select>
			    </div>
		  	</div>
		  	<div class="form-group">
				<label class="col-md-3 control-label">内容：</label>
			    <div class="col-md-6">
			    	<textarea rows="8" class="form-control" name="" maxlength="1536" style="overflow-y: auto"></textarea>
			    </div>
		  	</div>
		  	<div class="form-group">
		  		<label class="col-md-3 control-label">封面：</label>
			    <div class="col-md-6">
			    	<input type="file" name="">
			    </div>
		  	</div>
		  	<div class="form-group">
			    <div class="col-md-3 col-md-offset-6">
			    	<button type="submit" class="btn btn-success text-left" style="width: 100%">发布</button>
			    </div>
		  	</div>
    	</form>
    </div>
  </body>
</html>
