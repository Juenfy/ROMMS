$(function(){
	$("input[type='text']").on("input propertychange",function(){
		var maxlen = $(this).attr("maxlength");
		var len = $(this).val().length;
		if(len <maxlen ){
			$(this).parent("div").next("span").html("您还可以输入<span class='text-info'>"+(maxlen-len)+"</span>个字符");
		}else{
			$(this).parent("div").next("span").html("您不能再输入了(^_^)");
		}
	})
	$('a.addfile').click(function(){
		$("input[type='file']").click();
	});
	$("input[type='file']").change(function(){
		var files = this.files;
			document.getElementById($(this).attr('class')).src = window.URL.createObjectURL(files[0]);
			files.slice();
	});
})