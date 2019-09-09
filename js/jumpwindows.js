function CloseText(){
	layer.close(layer.index);
	}

function ShowUserActionText(i){
	var h = '250px';
	var title = '';
	if(i == 'Login'){
		title = '登录';
	}else if(i == 'Register'){
		h = '420px';
		title = '注册';
	}else if(i == 'FindResetPasswdUser'){
		title = '找回密码';
	}else if(i == 'ResetQuestion'){
		title = '设置问题'
	}else if(i == 'ResetPasswd'){
		h = '200px';
		title = '设置密码';
	}else if(i=='ModifyUserimg'){
		h ='300px';
		title = '修改头像';
	}else if(i == 'ModifyUname'){
		h ='170px';
		title = '修改用户名';
	}else if(i == 'ModifySign'){
		h ='170px';
		title = '修改个签';
	}else{
		title = 'ROM申请适配';
	}
	layer.open({
        type:1,
        title:title,
        closeBtn:0,
        shadeClose: true,
        anim: "2",
        skin: "layui-layer-lan",
        area:["438px",h],
        content:$("."+i),
    	});
	}
function ShowReportText(){
	layer.open({
        type:1,
        title:0,
        area:["400px","200px"],
        content:$("#bugreport"),
        });
	}
function ShowImgText(i){
	layer.open({
        type:1,
        title:0,
        area:["337px","604px"],
        content:$(i),
        });
	}

function ShowVideoText(i){
	var h = '454px';
	if(i=='flyme7_video'){
		var h = '338px';
	}
	layer.open({
        type:1,         
        title:0,
        area:["800px",h],
        content:$("."+i),
        });
    }
function ShowRomDescText(i){
	var id = i.toString();
	layer.open({
        type:1,
        title:0,
        area:["400px","400px"],
        content:$(".romdesc"+id),
        });
	}
function ShowDownReaSonText(i){
	var id = i.toString();
	layer.open({
        type:1,
        title:0,
        area:["500px","200px"],
        content:$(".downreason"+id),
        });
}