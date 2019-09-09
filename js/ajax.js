$(function(){
	//设置我的手机ajax
	$("#settingMyPhone").click(function(){
		var url = $(this).attr("url");
		var uid = $(this).attr("uid");
		var mid = $(this).attr("mid");
		$.ajax({
			type: "GET",
			url: url,
			data: {
				"myphone.user.userid":uid,
				"myphone.model.modelid":mid
			},
			success: function(data){
				alert("设置成功！系统会在您的主页推荐其热门ROM");
			},
			error: function(error){
				alert(error);
			}
		});
	});
	//翻页查看评论ajax
	$("#sucomment").delegate("#pager a","click",function(){
		var url = $(this).attr("url");
		var page = $(this).attr("page");
		//上一页页码减一
		if($(this).is("#prev"))
			page--;
		//下一页页码加一
		if($(this).is("#next"))
			page++;
		var sucomment = $("#sucomment");
		$.ajax({
			type:"GET",
			url:url,
			data: {
				"currentPage":page
			},
			success:function(data){
				sucomment.html(data);
			},
			error:function(error){
				sucomment.html(error);
			}
		});
	});
	//Bug反馈ajax
	$("#bugRepBtn").click(function(){
		var url = "userReport.action";
		var repuserid = $("#repuserid").val();
		var repromid = $("#repromid").val();
		var repcontent = $("#repcontent").val();
		$.ajax({
			type:"GET",
			url:url,
			data: {
				"report.user.userid":repuserid,
				"report.rom.romid":repromid,
				"report.repcontent":repcontent
			},
			success:function(){
				CloseText();
				alert("BUG反馈成功！请耐心等待开发者修复BUG!");
			},
			error:function(){
				CloseText();
				alert("反馈失败!");
			}
		});
	})
})