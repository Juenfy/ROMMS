//初始化mui组件
mui.init();
//封装登陆提示方法
var loginTips = function(){
	mui.confirm('客官，还没登录呢，现在登录吗？', '温馨提示', ['先不要', '立刻马上'], function(e) {
        if (e.index == 1) {
            window.location.href='mobileLogin.jsp';
        }
    })
}
//封装常用ajax方法
var ajax = function (url,data,success){
	$.ajax({
		type: "get",
		url:url,
		data:data,
		success:success,
		error:function(err){
			console(err);
		}
	})
}
$(function(){
	//初始化mui组件
	mui.init();
	//图片轮播
	var gallery = mui('.mui-slider');
	gallery.slider({
		interval:3000
	});
	var footerHeight = $(".footer").outerHeight();
	$(".mui-content").css({
		"margin-bottom":footerHeight
	});
	//########################################
	/*首页*/
	//查看更多
	var listNum = 0;
	var lastNum = $(".hot-models>ul>li:last-child").index();
	var outerHeight = 0;
	$(".hot-models>ul>li").each(function(index){
		if(index = 5){
			listNum = (index+1);
			outerHeight = $(this).outerHeight();
		}
	});
	outerHeight = outerHeight*(listNum/2);
	if(lastNum>6){
		$(".hot-models ul").css({
			"height":outerHeight,
			"overflow":"hidden"
		});
	}else{
		$("#moreBtn").hide();
	}
	$("#moreBtn").click(function(){
		$(".hot-models ul").css({
			"height":"auto",
			"overflow":"auto"
		});
		$(this).hide();
	});
	//########################################
	
	/*ROM下载*/
	//展开其他品牌
	$(".all-mftures #arrowDown").click(function(){
		$(".othersmf").toggle();
		//阻止冒泡事件
		return false;
	})
	
	/*机型ROM*/
	$(".model-rom-info").each(function(){
		var tSpan = $(this).children("span");
		var title = tSpan.text();
		if(title.length > 18){
			title = title.substr(0,18)+"...";
			tSpan.text(title);
		}
	})
	//########################################
	
	/*ROM详情*/
	//########################################
	
});