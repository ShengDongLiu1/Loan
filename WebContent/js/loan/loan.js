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

//查询客户的借款申请
function selCusLoan(num){
	var page=1;
	var addpage=0;
	if(num == 2){//上一页
		addpage=$("#page").html();
		page=parseInt(addpage)-1;
		if(page == 0){
			page=1;
			alert('当前页已经是第一页！');
			return false;
		}
	}else if(num == 3){//下一页
		addpage=$("#page").html();
		page+=parseInt(addpage);
		if(parseInt($("#count").html())<page){
			page=parseInt($("#count").html());
			alert('当前页已经是最后一页！');
			return false;
		}
	}
	$.post("../loan/selCusLoan",{'page':page,'rows':10},function(index){
		if(index.error != null){
			alert(index.error);
			return false;
		}
		var tbody = ""; 
		$.each(index.loanList,function(n,value){
			tbody+=
			"<tr class='loantr'>"+
				"<td>"+(n+1)+"</td>"+
 				"<td>"+value.ltitle+"</td>"+
 				"<td>"+value.lmoney+"</td>"+
 				"<td>"+value.lterm+"</td>"+
 				"<td>"+value.lrate+"%</td>"+
 				"<td>"+value.lclass+"</td>"+
 				"<td>"+xingyong(value.lclass,value.lnums)+"</td>"+
 				"<td>"+xingyong(value.lclass,value.lmoneys)+"</td>"+
 				"<td>"+value.ltype+"</td>"+
 				"<td>"+value.lmiaoshu+"</td>"+
 				"<td>"+lstate(value.lstate)+"</td>"+
 				"<td>"+jsonDateFormat(value.ltime)+"</td>"+
 				"<td>"+isUpFile(value.lid,value.lstate)+"</td>"+
			"</tr>"
		});
		$('#cusLoan').html(tbody);
		$("#page").html(index.page);
	    $("#count").html(index.count);
	    $("#total").html(index.total);
		$("tr:odd").css("background-color", "#F3F3F3");
	},"json");
}

function isUpFile(lid,lstate){
	var btn=""
	if(lstate == 1){
		btn="<a href='javascript:void(0)' onclick='upFile("+lid+");'>上传资料</a>"
	}else{
		btn="<a href='javascript:void(0)' onclick=''>查看</a>"
	}
	return btn;
}

//信用贷款
function xingyong(lclass,lnums){
	if(lclass == '信用贷款'){
		return '无';
	}else{
		return lnums;
	}
}

//借款状态
function lstate(value){
	var btn="";
	if(value == 0){
		btn="未通过";
	}else if(value == 1){
		btn="初审中";
	}else if(value == 2){
		btn="招标中";
	}else if(value == 3){
		btn="满标";
	}else if(value == 4){
		btn="还款中";
	}else if(value == 5){
		btn="已还款";
	}else if(value == 6){
		btn="流标";
	}
	return btn;
}

function upFile(lid){
	$('#upfile').show();
	$('#flid').val(lid);
}

$(function(){
	$('#close').click(function(){
		$('#upfile').hide();
		$('#flid').val('');
	});
});

function getFileName(fid){
    $('#'+fid).append("(<span class='okimg'>已选取</span>)");  
}
