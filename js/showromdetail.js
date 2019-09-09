$(function(){
	//评分星星
	$('li.star').hover(function(){
        $(this).addClass('active');
        var i;
        var index = $(this).index();
        var score = (index+1)*2;
        for(i=0;i<index;i++){
            $('.star').eq(i).addClass('active');
        }
        $('div>span.score').html(score+"分");

    },function(){
        $('.star').removeClass('active');
        $('div>span.score').html("");
    });
    $('li.star').click(function(){
        $(this).mouseout(function(){
            var index = $(this).index();
            var score = (index+1)*2;
            for(i=0;i<index+1;i++){
                $('.star').eq(i).addClass('active');
            }
            $('div>span.score').html(score+"分");
            $('#userscore>form>input').eq(3).attr('value',score);
        })
    });
    /*机型热门ROM模块*/
	$('.showmrc ul>li').hover(function(){
		$(this).removeClass('hideli');
	},function(){
		$(this).addClass('hideli');
	});
	//评论文本框验证
	$("#commentBtn").click(function(){
		var textval = $("#uctextare textarea").val();
		if(textval.trim().length == 0){
			alert("评论不能为空！！")
			return false;
		}
	})
})