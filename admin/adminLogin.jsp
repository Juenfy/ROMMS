<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>安卓ROM之家后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath() %>/fontawesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath() %>/admin/css/adminLogin.css" />
    <script src="js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function(){
        	var i = ${param.adminlogin};
        	if(i==0){
        		$('.errortips').show();
                $('.errortips>span').html('用户名或密码错误');
        	}
            $('.login-box button').click(function(){
                var account = $('#account').val();
                var password = $('#password').val();
                if(account == "" || password==""){
                    if(account == ""){
                        $('#account').parent().addClass('has-error');
                    }
                    if(password == ""){
                        $('#password').parent().addClass('has-error');
                    }
                    $('.errortips').show();
                    $('.errortips>span').html('请填写完整信息');
                    $(this).addClass('has-error');
                    return false;
                }else{
                    return true;
                }
            })
            $('.errortips>a').click(function(){
                $('.errortips').hide();
                $('input').parent().removeClass('has-error has-success');
                return false;
            });
            $('.login-box input').on('input proertychange',function(){
                if($(this).val()!=""){
                    $(this).parent().removeClass('has-error');
                    $(this).parent().addClass('has-success');
                }
            })
        })
    </script>

  </head>
  
  <body>
    <div class="login-box box-shadow">
        <div class="title"></div>
        <h4 class="text-center">使用管理员账户登录后台系统</h4>
        <div class="alert alert-danger errortips col-md-10 col-md-offset-1 text-center">
            <a href="#" class="close">&times;</a>
            <span></span>
        </div>
        <div class="col-md-10 col-md-offset-1 form">
            <form action="adminLogin" class="form form-horizontal" role="form" method="post">
                <div class="form-group has-feedback">
                    <span class="form-control-feedback glyphicon glyphicon-user"></span>
                    <input type="text" name="user.uaccount" class="form-control" placeholder="请输入管理员账号" id="account" autocomplete="off">
                </div>
                <div class="form-group has-feedback">
                    <span class="form-control-feedback fa fa-key"></span>
                    <input type="password" name="user.password" class="form-control" placeholder="请输入管理员密码" id="password" autocomplete="off">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block radius">登录</button>
                </div>
            </form>
        </div>
    </div>
    <div class="container-fluid foot text-center">
    	<p><a href="https://www.weibo.com/Juenfy" >作者微博</a> | <a href="#">作者ROM作品</a></p>
    	<p>15级软件工程10班 严剑飞版权所有</p>
    	<p>Copyright &copy; 20018-2019, All Rights Reserved .</p>
    </div>
  </body>
</html>
