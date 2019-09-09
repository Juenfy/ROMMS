 $(function(){
	 //表单实时可输入字符个数提示
	 $("input[type='text'],input[type='password']").on("input propertychange",function(){
		var maxlen = $(this).attr("maxlength");
		var len = $(this).val().length;
		if(len <maxlen ){
			$(this).parent("div").next("span").html("您还可以输入<span class='text-info'>"+(maxlen-len)+"</span>个字符");
		}else{
			$(this).parent("div").next("span").html("您不能再输入了(^_^)");
		}
	})
	//修改头像
	$('#modifyuserimg').on('click',function(){
			$('#fileupload').click();
	})
	$('#fileupload').on('change',function(){
		var files=this.files;
		document.getElementById("modifyuserimg").src = window.URL.createObjectURL(files[0]);
		files.slice();
	})
	//ROM截图上传
	$('.romimg a').on('click',function(){
		$('.romimg input.'+$(this).attr('class')).click();
	});
	$(".romimg input[type='file']").on('change',function(){
		//这是取消的情况
		if($(this).val()==""){
			document.getElementById($(this).attr('class')).src = "/images/phone/touming.png	";
			//这是打开的情况
		}else{
			var files = this.files;
			//限制上传图片大小
			if(files[0].size<=665600){
				document.getElementById($(this).attr('class')).src = window.URL.createObjectURL(files[0]);
			}else{
				var cname = $(this).attr('class');
				var divHTML = $("#saverom a."+cname).next('div').html();
				alert(divHTML+"图片不能超过650KB");
				//清除选中图片
				$(this).val("");
				document.getElementById($(this).attr('class')).src = "/images/phone/touming.png	";
			}
		}
	})
	//表单提交时，遍历图片，为空则给出相应提示
	$(".saverom input[type='submit']").click(function(){
		$("#saverom input[type='file']").each(function(){
			if($(this).val()==""){
				var cname = $(this).attr('class');
				var divHTML = $("#saverom a."+cname).next('div').html();
				alert(divHTML+"不能为空");
			}
		})
	})
	//完善资料
	$('#dataModify').on('click',function(){
		$('#saveDataBtn').removeAttr('disabled');
		$('#saveDataBtn').attr('class',"btn btn-success");
		$('#fieldsetDisabled').removeAttr('disabled');
	})
	//遍历历史类型下的记录div数，获取并设置动态div高度
	$('.hismodel>div').each(function(index){
		var height = 0;
		var num = 0;
		if(index <= 8){
			if(index%4!=0){
				num = (index/4).toString().substring(0, (index/4).toString().lastIndexOf("."))*1+1;
			}else{
				num = index/4;
			}
			height = num*135+60;
			$(".hismodel").css({height: height+"px"});
			$(".hismodel").next("div").children("a").hide();
		}else{
			$(".hismodel").css({height: "330px"});
			$(".hismodel").next("div").children("a.down").show();
		}
	});
	$('.hisroms>div').each(function(index){
		var height = 0;
		var num = 0;
		if(index <= 4){
			if(index%2!=0){
				num = index/2+0.5;
			}else{
				num = index/2;
			}
			height = num*305+60;
			$(".hisroms").css({height: height+"px"});
			$(".hisroms").next("div").children("a").hide();
		}else{
			$(".hisroms").css({height: "670px"});
			$(".hisroms").next("div").children("a.down").show();
		}
	});
	$('.histeach>div').each(function(index){
		var height = 0;
		if(index <= 2){
			height = index*180+60;
			$(".histeach").css({height: height+"px"});
			$(".histeach").next("div").children("a").hide();
		}else{
			$(".histeach").css({height: "420px"});
			$(".histeach").next("div").children("a.down").show();
		}
	});
	$('.hisnews>div').each(function(index){
		var height = 0;
		if(index <= 2){
			height = index*180+60;
			$(".hisnews").css({height: height+"px"});
			$(".hisnews").next("div").children("a").hide();
		}else{
			$(".hisnews").css({height: "420px"});
			$(".hisnews").next("div").children("a.down").show();
		}
	});
	//历史展开
	$('.downup a').click(function(){
		$(this).toggle();
		$(this).siblings().toggle();
		var div = $(this).parent('div').prev('div');
		if(div.is('.hismodel')){
			var num = 0;
			var height=0;
			$('.hismodel>div').each(function(index){
				num = index;
			});
			if(num%4!=0){
				num = (num/4).toString().substring(0, (num/4).toString().lastIndexOf("."))*1+1;
			}else{
				num = num/4;
			}
			height = num*135+60;
			if($(this).is('.down')){
				div.stop().animate({height: height+"px"},500);
			}
			if($(this).is('.up')){
				div.stop().animate({height: "330px"},500);
			}
		}
		if(div.is('.hisroms')){
			if($(this).is('.down')){
				var num = 0;
				$('.hisroms>div').each(function(index){
					num = index;
				});
				if(num%2!=0)
					num = num/2+0.5;
				else
					num = num/2;
				var height = num*305+60;
				div.stop().animate({height: height+"px"},500);
			}
			if($(this).is('.up')){
				div.stop().animate({height: "670px"},500);
			}
		}
		if(div.is('.histeach')){
			if($(this).is('.down')){
				var num = 0;
				$('.histeach>div').each(function(index){
					num = index;
				});
				var height = num*180+60;
				div.stop().animate({height: height+"px"},500);
			}
			if($(this).is('.up')){
				div.stop().animate({height: "420px"},500);
			}
		}
		if(div.is('.hisnews')){
			if($(this).is('.down')){
				var num = 0;
				$('.hisnews>div').each(function(index){
					num = index;
				});
				var height = num*180+60;
				div.stop().animate({height: height+"px"},500);
			}
			if($(this).is('.up')){
				div.stop().animate({height: "420px"},500);
			}
		}
	});
})