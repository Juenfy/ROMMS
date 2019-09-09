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
    
    <title>安卓ROM之家后台管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/admin/css/index.css" />
   	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
   	<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/layer/layer.js"></script>
   	<script type="text/javascript" src="<%=request.getContextPath() %>/admin/js/adminromms.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jumpwindows.js"></script>
  </head>
  
  <body>
  	<%
		//管理员在没登录的情况下重定向到登录页面
		if(session.getAttribute("admin")==null){
			response.sendRedirect("adminLogin.jsp");
		}
	 %>
    <div class="container-fluid head bg-white panel panel-default">
        <div class="row">
            <div class="col-md-3"><img src="<%=request.getContextPath() %>/images/weblogo/bluelogo.png"></div>
            <div class="col-md-5 col-md-offset-4 a-hover">
                <ul class="row list-inline text-center">
                    <li class="col-md-10 text-right"><s:property value='#session.admin.uname'/>,欢迎您！</li>
                    <li class="col-md-1"><a href="adminLogout.action" title="注销"><i class="fa fa-sign-out"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid body">
        <div class="row" id="accordion">
            <div class="col-md-2 radius left bg-white panel panel-default a-hover a-hover-bl a-pl-20 box-shadow">
            	<div class="row text-center">
            		<p><img src="<%=request.getContextPath() %>/images/admin/adminimg/<s:property value='#session.admin.userimg'/>" class="img-circle m-top20"></p>
            		<p class="f-size20"><s:property value='#session.admin.uname'/></p>
            	</div>
                <h4 class="page-header text-primary">后台管理选项</h4>
                <ul class="row list-unstyled panel-heading f-size16">
                    <li class="a-hover"><a href="#collapseOne" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-mobile"></i>&nbsp;&nbsp;手机管理<i class="fa fa-caret-down"></i></a></li>
                    <div class="panel-collapse collapse f-size15" id="collapseOne">
                        <div class="panel-body l-height35">
                            <a href="showMftureManager.action?currentPage=1" class="text-muted" id="mfturemg"><i class="fa fa-eye"></i>&nbsp;&nbsp;查看品牌</a><br>
                            <a href="showModelManager.action?currentPage=1" class="text-muted" id="modelmg"><i class="fa fa-eye"></i>&nbsp;&nbsp;查看型号</a><br>
                            <a href="showAddMfture.action" class="text-muted"><i class="fa fa-plus-square-o"></i>&nbsp;&nbsp;添加品牌</a><br>
                            <a href="showAddModel.action" class="text-muted"><i class="fa fa-plus-square-o"></i>&nbsp;&nbsp;添加型号</a>
                        </div>
                    </div>
                    <li><a href="#collapseTwo" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-android"></i> &nbsp;&nbsp;ROM管理<i class="fa fa-caret-down"></i></a></li>
                    	<div class="panel-collapse collapse" id="collapseTwo">
	                        <div class="panel-body l-height35">
	                      		<a href="showRomManager.action?currentPage=1" class="text-muted"><i class="fa fa-eye" ></i>&nbsp;&nbsp;查看ROM</a><br>
	                            <a href="showRomUpCheck.action?currentPage=1" class="text-muted"><i class="fa fa-cart-plus" ></i>&nbsp;&nbsp;上架审核</a><br>
	                            <a href="showRomDownCheck.action?currentPage=1" class="text-muted"><i class="fa fa-cart-arrow-down"></i>&nbsp;&nbsp;下架审核</a>
	                            <a href="showRomAply.action?currentPage=1" class="text-muted"><i class="fa fa-eye"></i>&nbsp;&nbsp;查看申请</a>
	                        </div>
                    	</div>
                    <li><a href="#collapseThree" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-delicious"></i> &nbsp;&nbsp;UI管理<i class="fa fa-caret-down"></i></a></li>
                    <div class="panel-collapse collapse" id="collapseThree">
                        <div class="panel-body l-height35">
                            <a href="showUitypeManager.action" class="text-muted"><i class="fa fa-eye"></i> &nbsp;&nbsp;查看UI</a><br>
                            <a href="showAddUitype.action" class="text-muted"><i class="fa fa-plus-square"></i>&nbsp;&nbsp;添加UI</a>
                        </div>
                    </div>
                    <li><a href="#collapseFour" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-bookmark"></i> &nbsp;&nbsp;教程、资讯管理<i class="fa fa-caret-down"></i></a></li>
                    <div class="panel-collapse collapse" id="collapseFour">
                        <div class="panel-body l-height35">
                            <a href="showTeach.action?currentPage=1" class="text-muted"><i class="fa fa-eye"></i>&nbsp;&nbsp;查看教程</a><br>
                            <a href="showNews.action?currentPage=1" class="text-muted"><i class="fa fa-eye"></i>&nbsp;&nbsp;查看资讯</a>
                            <a href="showReleaseTN.action>" class="text-muted"><i class="fa fa-flickr"></i>&nbsp;&nbsp;发布</a>
                        </div>
                    </div>
                    <li><a href="#collapseFive" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-users"></i> &nbsp;&nbsp;用户管理<i class="fa fa-caret-down"></i></a></li>
                    <div class="panel-collapse collapse" id="collapseFive">
                        <div class="panel-body l-height35">
                            <a href="showAllUser.action?currentPage=1" class="text-muted"><i class="fa fa-eye"></i>&nbsp;&nbsp;查看用户</a><br>
                            <a href="showAddUser.action" class="text-muted"><i class="fa fa-plus-square"></i>&nbsp;&nbsp;添加用户</a><br>
                        </div>
                    </div>
                    <li><a href="#collapseSix" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-align-justify"></i> &nbsp;&nbsp;系统管理<i class="fa fa-caret-down"></i></a></li>
                    <div class="panel-collapse collapse" id="collapseSix">
                        <div class="panel-body l-height35">
                            <a href="showAllUser.action?currentPage=1" class="text-muted"><i class="fa fa-eye"></i>&nbsp;&nbsp;修改口令</a><br>
                            <a href="adminLogout.action" class="text-muted"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;退出系统</a><br>
                        </div>
                    </div>
                </ul>
            </div>
            <div class="col-md-9 content bg-white radius panel panel-default box-shadow">
            	<!-- 手机管理模块 -->
                <s:if test="#request.showmfturemanager==1">
                	<jsp:include page="module/showMftureManager.jsp"/>
                </s:if>
                <s:if test="#request.showmodelmanager==1">
                	<jsp:include page="module/showModelManager.jsp"/>
                </s:if>
                <s:if test="#request.showaddmfture==1">
                	<jsp:include page="module/showAddMfture.jsp"/>
                </s:if>
                <s:if test="#request.showaddmodel==1">
                	<jsp:include page="module/showAddModel.jsp"/>
                </s:if>
                <!-- ROM管理模块 -->
                <s:if test="#request.showrommanager==1">
                	<jsp:include page="module/showRomManager.jsp"/>
                </s:if>
                <s:if test="#request.showromupcheck==1">
                	<jsp:include page="module/showRomUpCheck.jsp"/>
                </s:if>
                <s:if test="#request.showcheckrom==1">
                	<jsp:include page="module/showCheckRom.jsp"/>
                </s:if>
                <s:if test="#request.showromdowncheck==1">
                	<jsp:include page="module/showRomDownCheck.jsp"/>
                </s:if>
                <s:if test="#request.showromaply==1">
                	<jsp:include page="module/showRomAply.jsp"/>
                </s:if>
                <!-- UI管理模块 -->
                <s:if test="#request.showuitypemanager==1">
                	<jsp:include page="module/showUitypeManager.jsp"/>
                </s:if>
                <s:if test="#request.showadduitype==1">
                	<jsp:include page="module/showAddUitype.jsp"/>
                </s:if>
                <!-- 教程、资讯管理模块 -->
                <s:if test="#request.showreleasetn==1">
                	<jsp:include page="module/showReleaseTN.jsp"/>
                </s:if>
                <s:if test="#request.showteachnews==1">
                	<jsp:include page="module/showTeachNews.jsp"/>
                </s:if>
               	<!-- 用户管理模块 -->
               	<s:if test="#request.showalluser==1">
                	<jsp:include page="module/showAllUser.jsp"/>
                </s:if>
                <s:if test="#request.showmodifyuser==1">
                	<jsp:include page="module/showModifyUser.jsp"/>
                </s:if>
                <s:if test="#request.showadduser==1">
                	<jsp:include page="module/showAddUser.jsp"/>
                </s:if>	
            </div>
        </div>
    </div>
    <div class="container-fluid text-center foot">
    	<p><a href="https://www.weibo.com/Juenfy" >作者微博</a> | <a href="#">作者ROM作品</a></p>
    	<p>15级软件工程10班 严剑飞版权所有</p>
    	<p>Copyright &copy; 20018-2019, All Rights Reserved .</p>
    </div>
  </body>
</html>
