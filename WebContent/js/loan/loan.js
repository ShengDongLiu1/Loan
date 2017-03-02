//房产抵押借款
function checkLoan(){
	var lmoney = document.getElementsByName("lmoney")[0].value;
	var lterm = document.getElementsByName("lterm")[0].value;
	var lrate = document.getElementsByName("lrate")[0].value;
	var lnums = document.getElementsByName("lnums")[0].value;
	var lmoneys = document.getElementsByName("lmoneys")[0].value;
	var ltype = document.getElementsByName("ltype")[0].value;
	var ltitle = document.getElementsByName("ltitle")[0].value;
	var lmiaoshu = document.getElementsByName("lmiaoshu")[0].value;
	if(lmoney == ''){
		$('#me1').html('*请填写借款金额');
	}else if(lterm == ''){
		$('#me2').html('*请填写借款期限');
	}else if(lrate == ''){
		$('#me3').html('*请填写借款利率');
	}else if(lnums == ''){
		$('#me4').html('*房屋数量');
	}else if(lmoneys == ''){
		$('#me5').html('*房屋价值');
	}else if(ltype == ''){
		$('#me6').html('*请选择借款类型');
	}else if(ltitle == ''){
		$('#me7').html('*请填写借款标题');
	}else if(lmiaoshu == ''){
		$('#me8').html('*请填写借款描述');
	}else{
		return true;
	}
	return false;
}

//车辆抵押借款
function checkLoan1(){
	var lmoney = document.getElementsByName("lmoney")[1].value;
	var lterm = document.getElementsByName("lterm")[1].value;
	var lrate = document.getElementsByName("lrate")[1].value;
	var lnums = document.getElementsByName("lnums")[1].value;
	var lmoneys = document.getElementsByName("lmoneys")[1].value;
	var ltype = document.getElementsByName("ltype")[1].value;
	var ltitle = document.getElementsByName("ltitle")[1].value;
	var lmiaoshu = document.getElementsByName("lmiaoshu")[1].value;
	if(lmoney == ''){
		$('#me21').html('*请填写借款金额');
	}else if(lterm == ''){
		$('#me22').html('*请填写借款期限');
	}else if(lrate == ''){
		$('#me23').html('*请填写借款利率');
	}else if(lnums == ''){
		$('#me24').html('*车辆数量');
	}else if(lmoneys == ''){
		$('#me25').html('*车辆价值');
	}else if(ltype == ''){
		$('#me26').html('*请选择借款类型');
	}else if(ltitle == ''){
		$('#me27').html('*请填写借款标题');
	}else if(lmiaoshu == ''){
		$('#me28').html('*请填写借款描述');
	}else{
		return true;
	}
	return false;
}

//信用借款
function checkLoan2(){
	var lmoney = document.getElementsByName("lmoney")[2].value;
	var lterm = document.getElementsByName("lterm")[2].value;
	var lrate = document.getElementsByName("lrate")[2].value;
	var lclass = document.getElementsByName("lclass")[2].value;
	var ltype = document.getElementsByName("ltype")[2].value;
	var ltitle = document.getElementsByName("ltitle")[2].value;
	var lmiaoshu = document.getElementsByName("lmiaoshu")[2].value;
	if(lmoney == ''){
		$('#me31').html('*请填写借款金额');
	}else if(lterm == ''){
		$('#me32').html('*请填写借款期限');
	}else if(lrate == ''){
		$('#me33').html('*请填写借款利率');
	}else if(lclass == ''){
		$('#me34').html('*请输入担保方式');
	}else if(ltype == ''){
		$('#me36').html('*请选择借款类型');
	}else if(ltitle == ''){
		$('#me37').html('*请填写借款标题');
	}else if(lmiaoshu == ''){
		$('#me38').html('*请填写借款描述');
	}else{
		return true;
	}
	return false;
}

$(function(){
	$('input').focus(function(){
		$('.mess').html('');
	});
	$('select').click(function(){
		$('.mess').html('');
	});
	$('textarea').focus(function(){
		$('.mess').html('');
	});
});