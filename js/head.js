$(function(){
	var inTime = 200;
	var outTime = 50;
	//搜索框显示隐藏事件
	var search = $('.search');
	$(window).mousemove(function(e){
		if($(document).scrollTop()<300){
			if(e.pageY>100)
				search.slideUp(outTime);
		}
		//获取鼠标悬停二级菜单div的高度
		var umheight = $(".usermenu").height();
		var nmheight = $(".nullmenu").height();
		if(e.pageY>nmheight+80)
			$('.nullmenu').slideUp(outTime);
		if(e.pageY>umheight+80)
			$('.usermenu').slideUp(outTime);
	});
	$(window).on("scroll resize",function(){
		$('.nullmenu').slideUp(outTime);
		$('.usermenu').slideUp(outTime);
		var stop = $(document).scrollTop();	
		if(stop > 300){
			search.slideDown(inTime);
		}else{
			search.slideUp(outTime);
		}
		if(stop>500){
			$('.uptop').fadeIn(inTime);
		}else{
			$('.uptop').stop().fadeOut(outTime);
		}
	});
	$('.head').mousemove(function(e){
		if(e.pageY<5){
			search.slideDown(inTime);
		}
	});
	//返回顶部点击事件
	$('#backtop').on('click',function(){
		$('html,body').animate({scrollTop: "0px"},300);
	});
	
	//鼠标移至下载显示所有型号或UI
	$('#displaymodel').mousemove(function(){
		$('.hiduitype').slideUp(0);
		$('.hidmodel').slideDown(inTime);
	});
	$('#displayuitype').mousemove(function(){
		$('.hidmodel').slideUp(0);
		$('.hiduitype').slideDown(inTime);
		
	});
	$(document).mousemove(function(e){
		if(e.pageY>335){
			$('.hidmodel').slideUp(outTime);
			$('.hiduitype').slideUp(outTime);
		}
	});
	//用户下拉菜单
	//用户没登录
	$('#shownullmenu').on('mousemove',function(){
		$('.nullmenu').slideDown(inTime);
	});
	//用户已登录
	$('#showusermenu').on('mousemove',function(){
		$('.usermenu').slideDown(inTime);
	});
	//机型模块显示
	$('.showmc i').on('mousemove',function(){
		$(this).stop().animate({fontSize: "25px"},10);
		$(this).css({color: "#2f91ff"});
		$(this).on('click',function(){
			$(this).hide(0);
			$('.model_choose').show(inTime);
			$('.hiddenmc i').show(0);
		})
	});
	$('.hiddenmc i').on('mousemove',function(){
		$(this).css({color: "#2f91ff"});
		$(this).on('click',function(){
			$(this).hide(0);
			$('.model_choose').hide(outTime);
			$('.showmc i').show(0);
			
		})
	});
	$('.showmc i').on('mouseout',function(){
		$(this).css({color: "#9b9b9b"});
		$(this).stop().animate({fontSize: "20px"},0);
	});
	$('.hiddenmc i').on('mouseout',function(){
		$(this).css({color: "#9b9b9b"});
	});
	
	$("#mftureSelect").change(function(e){
		var mftureid = $(this).val();
		$.ajax({
			type: "get",
			url: "showModelSelectMenu.action",
			data: {
				"mfture.mftureid": mftureid
			},
			success: function(msg){
				$("#modelSelect").html(msg);
			},
			error: function(err){
				alert(err)
			}
		})
	})
})