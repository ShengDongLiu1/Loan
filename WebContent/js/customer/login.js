var state = 1;
function checkLogin(){
	var username=$("#username").val();
	var userpwd=$("#userpwd").val();
	if(username == ""){
		$("#erro").html("*请输入用户名");
		return false;
	}else if(userpwd == ""){
		$("#erro").html("*请输入用户密码");
		return false;
	}else if(userpwd.length < 4){
		$("#erro").html("*用户名密码不小于4位");
		return false;
	}else{
		if(state == 1){
			state=2;
			$(".lg_btn").html("正在登录……");
			$.post("../customer/cusLogin.do",{'username':username,'userpwd':userpwd},function(index){
				if(index.result == 'success'){
					window.location.href="../client/index";
				}else{
					$("#erro").html(index.result);
					$(".lg_btn").html("立即登录");
					$("#userpwd").val("");
					state=1;
				}
			},"json");
		}
	}
}

//清除提示信息
function clearErro(){
	$("#erro").html("");
}