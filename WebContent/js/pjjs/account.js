var contentType = "application/x-www-form-urlencoded; charset=utf-8";
var oPage;
/*$(function(){
		var uid=${customer.uid};
		//初始化footer
		utils.initPage();
		if(uid==null){
			utils.alert('您还未登录，请先登录！',function(){
				window.location.href='http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/login.html';
			});
			return;
		};
		hashChange();
});*/
function hashChange(){
	var hash = location.hash.replace('#','');
	$('.sub-nav li').removeClass('active');
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
	switch(hash){
		case 'account':
			initAccount();
			break;
		case 'tuijian':
			initTuijian();
			break;
		case 'ipay':
			initIpay();
			break;
		case 'cash':
			initCash();
			break;
		case 'taste':
			initTaste();
			break;
		case 'fund':
			initFundRecord();
			break;
		case 'invest':
			initInvestManage();
			break;
		case 'claimm':
			initClaimManage();
			break;
		case 'claimb':
			initClaimBuy();
			break;
		case 'loan':
			initLoanManage();
			break;
		case 'bank':
			initMyDebitCard();
			break;
		case 'safe':
			initSafe();
			break;	
		case 'msg':
			initMsgCenters();
			break;
		case 'hetong':
			initHeTong();
			break;
		default : initAccount();$('a[href="#account"]').parent('li').addClass('active');
		break;
	};
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
}

//账户总览
function initAccount(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/account.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	var options = {
	    			//Boolean - Whether we should show a stroke on each segment
	    			segmentShowStroke : true,
	    			//String - The colour of each segment stroke
	    			segmentStrokeColor : "#fff",
	    			//Number - The width of each segment stroke
	    			segmentStrokeWidth : 0,
	    			//The percentage of the chart that we cut out of the middle.
	    			percentageInnerCutout :100,
	    			//Boolean - Whether we should animate the chart	
	    			animation : true,
	    			//Number - Amount of animation steps
	    			animationSteps : 100,
	    			//String - Animation easing effect
	    			animationEasing : "easeOutBounce",
	    			//Boolean - Whether we animate the rotation of the Doughnut
	    			animateRotate : true,
	    			//Boolean - Whether we animate scaling the Doughnut from the centre
	    			animateScale : true,
	    			//Function - Will fire on animation completion.
	    			onAnimationComplete : function(){}
	    		};
	    	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}"}; 
	    	utils.ajax({
	    		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/queryHome.do',
	    		data:param,
	    		success:function(data){
	    			if(data.error=='0'){
	    				//用户名
	    				$('.name').text(data.username);
	    				//总资产
	    				var allTotal = parseFloat(data.usableSum) + parseFloat(data.freezeAmount) + parseFloat(data.forPaySum);
	    				allTotal = allTotal.toFixed(2);
	    				//可用金额data.usableSum
	    				$('#usableSum').text(data.usableSum);
	    				//收益总额
	    				$('#earnSum').text(data.earnSum);
	    				//总资产
	    				$('#allTotal').text(allTotal);
	    				//投资总额
	    				var investSum = parseFloat(data.hasPayPrincipal)+parseFloat(data.forPayPrincipal);
	    				investSum = investSum.toFixed(2);
	    				$('#investSum').text(investSum);
	    				//冻结金额freezeAmount
	    				$('#freezeAmount').text(data.freezeAmount);
	    				//待收总额
	    				$('#forPaySum').text(data.forPaySum);
	    				//奖励金额
	    				$('#otherEarnAmount').text(data.otherEarnAmount==''?'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/0.00':data.otherEarnAmount);
	    				//代金券
	    				$('#voucher').text(data.voucher);
	    				//现金券
	    				$('#cashMap').text(data.cashMap);
	    				//生成图表
	    				//var ctx = document.getElementById("myChart").getContext("2d");
	    				//安全等级
	    				if(data.flag=='1'){
	    					$('#safeLevel').text('低');
	    				}else if(data.flag=='2'){
	    					$('#safeLevel').text('中');
	    				}else{
	    					$('#safeLevel').text('高');
	    				};
	    				//是否注册汇付
	    				if(data.ipayAccount!=''){
	    					$('#registpay').html('<a href="javascript:;">登录汇付</a>').click(function(){
	    						utils.ajax({
	    							url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/loginHuiFu.do',
	    							data:{},
	    							success:function(data){
	    								if(data.error =='0'){
	    									var oHtml = data.huiFuhtml.replace('_blank','');
	    									$('#huifuHtml').empty().html(oHtml);
	    								}
	    							}
	    						});
	    					});
	    				}else{
	    					if (data.busiCode != "") {
	    						$('#registpay').html('<a href="javascript:;">查看企业账户申请状态</a>').click(function(){
		    						utils.ajax({
		    				    		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/CorpRegisterQueryApp.do',
		    				    		data:param,	
		    				    		success:function(data){
		    				    			utils.alert(data.msg,function(){
		    				    				window.location.href='http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/account.html';
		    				    			});
		    				    		}
		    						});
	    						});
	    					} else {
		    					$('#registpay').html('<a href="javascript:;">注册汇付</a>').click(function(){
		    						utils.Dialog(true);
		    						$('.regist-box').fadeIn();
		    						$('.regist-box .close').click(function(){
		    							$('.regist-box').hide();
		    							utils.Dialog();
		    						});
		    						$('#person-submit').click(function(){
		    							window.location.href='http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/registpay.html';
		    						})
		    						$('#single-submit').click(function(){
		    							var param1={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}"}; 
		    					    	utils.ajax({ // 查询用户是否已经绑定企业
		    					    		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/regIpayEnterpriseAppInit.do',
		    					    		data:param1,
		    					    		success:function(data){
		    					    			if (data.error == 0) {
		    					    				window.location.href='http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/singleRegist.html';
		    					    			} else {
		    					    				utils.alert(data.msg);
		    					    			}
		    					    		}
		    					    	});
		    						})
		    					});
	    					}
	    				}
	    		    	$('.account-content').show();
	    		    	//环形图开始  
	   		    	 $('#myChart').highcharts({
	   		    		 	chart: {
	   				            plotBackgroundColor: null,
	   				            plotBorderWidth: null,
	   				            plotShadow: false
	   				        },
	   				        credits: {
	   							enabled: false   //右下角不显示LOGO
	   						},
	   						exporting: {
	   							enabled: false
	   						},
	   		    	        title: {
	   		    	            text: ''
	   		    	        },
	   		    	        colors:["#f8d280","#6dbfff","#fb9898","#86da70"],
	   		    	        plotOptions: {
	   			    	        pie: {
	   			    	        	shadow: false,
	   		 		                center: ['50%', '50%'],
	   				                allowPointSelect: true,
	   				                cursor: 'pointer',
	   				                dataLabels: {
	   				                    enabled: false
	   				                }
	   				            }
	   		    	        },
	   		    	        series: [{
	   		    	            type: 'pie',
	   		    	            name: '金额',
	   		    	            innerSize: '85%',
	   		    	            data: [
	   		    	                ['投资总额', Number(investSum)],
	   		    	                ['冻结金额', Number(data.freezeAmount)],
	   		    	                ['待收总额', Number(data.forPaySum)],
	   		    	                ['奖励金额', Number(data.otherEarnAmount==''?'0':data.otherEarnAmount)]
	   		    	            ]
	   		    	        }]
	   		    	    });
	    			}else{
	    				utils.alert(data.msg);
	    			}
	    		}
	    	})
	    }
	});
}
//充值初始化
//充值
function initIpay(){
	//充值页面
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/ipay.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	//查询汇付信息
	    	utils.ajax({
    			url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/findIpayAccountByUserId.do',
    			data:{},
    			success:function(data){
    				if(data.user.ipayAccount==''){
    					utils.confirm('您还未注册汇付，请先注册汇付',function(){
	        				window.location.href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/registpay.html";
	        			});
    				}
    			}
    		})
	    	//充值
	    	$('.show-ipay').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.ipay-pay').show();
	    		$('.ipay-list').hide();
	    	});
	    	
	    	//充值
    		$('#ipay-submit').click(function(){
    			
    			var money = $('#ipay-amt').val();
    			if(money == ''){
    				utils.toast('请输入充值金额');return;
    			}
    			if(utils.isMoney(money)){
    				utils.toast('金额格式不正确');return;
    			}
				utils.ajax({
			        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/findIpayAccountByUserId.do',
			        data:{},
			        dataType:'json',
			        success: function(data){
			        	if(data.error==0){
			        		if(data.user.ipayAccount == ''){
			        			utils.confirm('您还未注册汇付，请先注册汇付',function(){
			        				window.location.href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/registpay.html";
			        			})
			        		}else{
			        			//充值
			        			var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}","info":"{money:'"+money+"'}"};
			    				utils.ajax({
			    			        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/ipayPayment.do',
			    			        data:param,
			    			        dataType:'json',
			    			        success: function(data){
			    			        	if(data.error==0){
			    			        		$('#alipay').empty().html(data.html);
			    			        	}else{
			    			        		utils.alert(data.msg);
			    			        	}	
			    			        }
			    			    });
			        		}
			        	}else{
			        		utils.alert(data.msg);
			        	}	
			        }
			    })
    		})
	    	//充值记录
	    	$('.show-ipay-list').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.ipay-pay').hide();
	    		$('.ipay-list').show();
	    		
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	if($('.listData li').size() == 0){
		    		//初始化数据查询
			    	initIpayData();
		    	}
		    	//搜索
		    	$('#ipaySearch').unbind('click').click(function(){
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		initIpayData(startDate,endDate);
		    	});
	    	});
	    }
	});
};
//充值记录初始化
function initIpayData(startDate,endDate){
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'',resolve:function(val,record){
	       	    		 return utils.Storage.getItem('username');
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'rechargeMoney',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'investTime',resolve:function(val){
	       	    		 return '汇付充值';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'rechargeTime',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'result',resolve:function(val){
	       	    		var str ='';
	       	    		 if(val == '1'){
	       	    			str = '<p><span class="icon icon-true">成功</span></p>';
	       	    		 }else{
	       	    			str = '<p><span class="icon icon-wrong">失败</span></p>';
	       	    		 }
	       	    		 return str;
	       	    	 }
	       	     }
       	];
	var startDate = startDate||'';
	var endDate = endDate||'';
	var param={
			startTime:startDate,
			endTime:endDate
	};
	oPage = null;
	oPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/rechargeList.do',param,$('.listData'),$('.paging'),payData,function(){
		$('#invest').show();
	});
	
}
//提现
//提现初始化
//提现
function initCash(){
	//提现页面
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/cash.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	//充值
	    	$('.show-cash').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.cash-pay').show();
	    		$('.cash-list').hide();
	    	});
	    	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}"};
			utils.ajax({
		        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/queryWithdraw.do',
		        data:param,
		        dataType:'json',
		        success: function(data){
		        	if(data.error == '0'){
		        		$('#cash-realName').text(data.realName);
		        		$('#cash-usableSum').text(data.usableSum+"元");
		        		if(data.bankList.length>0){
			        		for(var i=0;i<data.bankList.length;i++){
			        			$('<li data-name="'+data.bankList[i].bankName+'" data-bankno="'+data.bankList[i].cardNo+'"><a href="javascript:;">'+data.bankList[i].bankName+'&nbsp;&nbsp;|&nbsp;&nbsp;'+utils.encodeBank(data.bankList[i].cardNo)+'</a></li>')
			        			.click(function(){
			        				var bankno = $(this).attr('data-bankno');//jquery bug
			        				var bankname = $(this).data('name');
			        				$('#select-bank')
			        				.val(bankname+'  |  '+utils.encodeBank(bankno))
			        				.data('bankno',bankno);
			        				$('.select-box').slideUp(200);
			        			})
			        			.appendTo($('.select-box'));
			        		};
			        		//默认值
			        		$("#select-bank").val(data.bankList[0].bankName+'  |  '+utils.encodeBank(data.bankList[0].cardNo))
			        		.data('bankno',data.bankList[0].cardNo)
			        		.click(function(){
			        			$('.select-box').slideToggle(200);
			        		});
			        		//计算手续费
			        		$('#cashInput').blur(function(){
			        			var value = $(this).val();
			        			if(utils.isMoney(value)){
			        				utils.toast('金额格式不正确');
			        				$('#cash-submit').addClass('disabled').unbind('click');
			        				return;
			        			}else if(value<100){
			        				utils.toast('提现金额不能小于100');return;
			        			}else{
			        				$('#cash-submit').removeClass('disabled').unbind('click').bind('click',function(){
			        					cashSubmit();
			        				});
			        			}
			        			var param = {
			        					dealMoney:value
			        			};
			        			//计算手续费
			        			utils.ajax({
			        				url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/withdrawFee.do',
			        				data:JSON.stringify(param),
			        				dataType:'json',
			        				success:function(data){
			        					if(data.code == 1){ 
			        		    			//无手续费
			        		    	  		$("#serviceFee").html("http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/0.00"); 
			        		    	  	}else if(data.code == 3){ 
			        		    	  		//服务费金额
			        		    	  		$('#refreew').text("http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/0.00")
			        		    	  	}else { 
			        		    	  		//服务费金额
			        		    	  		$('#refreew').text(data.msg)
			        			     	}
			        				}
			        			})
			        			
			        		});
			        		//获取验证码
			        		$('#getMsgCode').click(function(){
			        			var phone= data.bindingPhone;
			        			if(phone==''){
			        				utils.toast('请输入手机号');
			        				return;
			        			};
			        			utils.getSmsCode($(this),phone,'resetPwd');
			        		});
			        		$('.account-content').show();
		        		}else{
		        			utils.alert('您还未绑定银行，请先绑定银行卡',function(){
		        				location.hash = '#bank';
		        			});
		        		}
		        	}else if(data.error=='4'){
		        		utils.alert('您还未绑定银行，请先绑定银行卡',function(){
	        				location.hash = '#bank';
	        			});
		        	}else{
		        		utils.alert(data.msg);
		        	}
		        }
		    });
	    	//提现记录
	    	$('.show-cash-list').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.cash-pay').hide();
	    		$('.cash-list').show();
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	if($('.listData li').size() == 0){
		    		//初始化数据查询
		    		initcashData();
		    	};
		    	//搜索
		    	$('#cashSearch').unbind('click').click(function(){
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		initcashData(startDate,endDate);
		    	});
	    	});
	    }
	});
}
//提现
function cashSubmit(){
	var amt = $('#cashInput').val();
	var password = $('#cash-password').val();
	var smsCode = $('#cash-smsCode').val();
	var recivePhone = $('#getMsgCode').data('recivePhone');
	var randomCode = $('#getMsgCode').data('randomCode');
	var bankNo = $('#select-bank').data('bankno');
	if(amt == ''){
		utils.toast('金额不能为空');return;
	}
	if(password == ''){
		utils.toast('交易密码不能为空');return;
	}
	if(smsCode == ''){
		utils.toast('请填写短信验证码');return;
	}
	if(utils.isMoney(amt)){
		utils.toast('金额格式不正确');return;
	}
//	if(amt<100){
//		utils.toast('提现金额不能小于100');return;
//	}
	if(!recivePhone){
		utils.toast('请获取短信验证码');return;
	}
	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}","info":"{dealpwd:'"+password+"',code:'"+smsCode+"',randomCode:'"+randomCode+"',recivePhone:'"+recivePhone+"',money:'"+amt+"',bankId:'"+bankNo+"'}"}; 
	utils.ajax({
        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/addWithdraw.do',
        data:param,
        dataType:'json',
        success: function(data){
        	if(data.error =='0'){
        		$('#returnHtml').html(data.html.replace('target="_blank"',''));
        	}else{
        		utils.alert(data.msg);
        	}
        }
    })
}
function initcashData(startDate,endDate){
	//数据初始化
	var cashData = [
	       	     {
	       	    	 key:'',resolve:function(val,record){
	       	    		 return utils.Storage.getItem('username');
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'sum',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'bankId',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'poundage',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'applyTime',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'status',resolve:function(val){
	       	    		var str ='';
	       	    		 if(val == '2'){
	       	    			str = '<p><span class="icon icon-true">已提现</span></p>';
	       	    		 }else if(val=='1'){
	       	    			str = '<p><span class="icon icon-danger">审核中</span></p>';
	       	    		 }else if(val=='3'){
	       	    			str = '<p><span class="icon icon-wrong">取消</span></p>';
	       	    		 }else if(val=='4'){
	       	    			str = '<p><span class="icon icon-danger">转账中</span></p>';
	       	    		 }else if(val=='5'){
	       	    			str = '<p><span class="icon icon-wrong">失败</span></p>';
	       	    		 }
	       	    		 return str;
	       	    	 }
	       	     }
       	];
	var startDate = startDate||'';
	var endDate = endDate||'';
	var param={
			startTime:startDate,
			endTime:endDate
	};
	var payPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/withdrawList.do',param,$('.listData'),$('.paging'),cashData,function(){});
}
//我的赠券
function initTaste(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/taste.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}"};
			utils.ajax({
		        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/vocherAmts.do',
		        data:param,
		        dataType:'json',
		        success: function(data){
		        	if(data.error == 0){
		        		//代金券
	        			var taste1 = data.mapList1;
	        			//现金券
	        			var taste2 = data.mapList2;
		        		//代金券
		        		var dBox = $('#dtaste');
	        			for(var i = 0;i<taste1.length;i++){
	        				if(taste1[i].usestatus=='1'){
	        					var noLi =  $('<li class="bg-nouse">'+
		        						'<div class="bg">'+
		        							'<div class="taste-bg-l">'+
		        								'<p class="money">¥<span>'+utils.formatCurrency(taste1[i].money)+'</span></p>'+
		        								'<p class="date">有效期至'+taste1[i].useendtime+'</p>'+
		        							'</div>'+
		        							'<div class="taste-bg-r">'+
		        								'<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest_list.html" class="icon icon-right">立即投资</a>'+
		        							'</div>'+
		        						'</div>'+
		        						'<div class="text">'+
		        							'<p>单笔投资满100元使用</p>'+
		        						'</div>'+
		        						'</li>');
	        					dBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.nouse .none').remove();
	        					noLi.appendTo(dBox.find('.nouse'));
	        				}else {
	        					if(taste1[i].usestatus =='2'){
	        						var useLi =  $('<li class="bg-use">'+
			        						'<div class="nobg">'+
			        							'<div class="taste-bg-l">'+
			        								'<p class="money">¥<span>'+utils.formatCurrency(taste1[i].money)+'</span></p>'+
			        								'<p class="date">有效期至'+taste1[i].useendtime+'</p>'+
			        							'</div>'+
			        						'</div>'+
			        						'<div class="text">'+
			        							'<p>已使用</p>'+
			        						'</div>'+
			        						'</li>');
	        						dBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.use .none').remove();
	        						useLi.appendTo(dBox.find('.use'));
	        					}else{
	        						var useLi =  $('<li class="bg-use">'+
			        						'<div class="nobg">'+
			        							'<div class="taste-bg-l">'+
			        								'<p class="money">¥<span>'+utils.formatCurrency(taste1[i].money)+'</span></p>'+
			        								'<p class="date">有效期至'+taste1[i].useendtime+'</p>'+
			        							'</div>'+
			        						'</div>'+
			        						'<div class="text">'+
			        							'<p>已过期</p>'+
			        						'</div>'+
			        						'</li>');
	        						dBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.overdue .none').remove();
	        						useLi.attr('class','bg-date').appendTo(dBox.find('.overdue'));
	        					}
	        				}
	        			};
	        			//现金券
	        			var xBox = $('#xtaste');
	        			for(var i = 0;i<taste2.length;i++){
	        				if(taste2[i].usestatus=='1'){
	        					var noLi =  $('<li class="bg-nouse">'+
		        						'<div class="bg">'+
		        							'<div class="taste-bg-l">'+
		        								'<p class="money">¥<span>'+utils.formatCurrency(taste2[i].money)+'</span></p>'+
		        								'<p class="date">有效期至'+taste2[i].useendtime+'</p>'+
		        							'</div>'+
		        							'<div class="taste-bg-r">'+
		        								'<a href="javascript:;" onclick="useCard('+taste2[i].id+')" class="icon icon-right">立即使用</a>'+
		        							'</div>'+
		        						'</div>'+
		        						'<div class="text">'+
		        							'<p>点击使用后立即获取</p>'+
		        						'</div>'+
		        						'</li>');
	        					xBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.nouse .none').remove();
	        					noLi.appendTo(xBox.find('.nouse'));
	        				}else{
	        					if(taste2[i].usestatus =='2'){
	        						var useLi =  $('<li class="bg-use">'+
			        						'<div class="nobg">'+
			        							'<div class="taste-bg-l">'+
			        								'<p class="money">¥<span>'+utils.formatCurrency(taste2[i].money)+'</span></p>'+
			        								'<p class="date">有效期至'+taste2[i].useendtime+'</p>'+
			        							'</div>'+
			        						'</div>'+
			        						'<div class="text">'+
			        							'<p>已使用</p>'+
			        						'</div>'+
			        						'</li>');
	        						xBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.use .none').remove();
	        						useLi.appendTo(xBox.find('.use'));
	        					}else{
	        						var useLi =  $('<li class="bg-use">'+
			        						'<div class="nobg">'+
			        							'<div class="taste-bg-l">'+
			        								'<p class="money">¥<span>'+utils.formatCurrency(taste2[i].money)+'</span></p>'+
			        								'<p class="date">有效期至'+taste2[i].useendtime+'</p>'+
			        							'</div>'+
			        						'</div>'+
			        						'<div class="text">'+
			        							'<p>已过期</p>'+
			        						'</div>'+
			        						'</li>');
	        						xBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.overdue .none').remove();
	        						useLi.attr('class','bg-date').appendTo(xBox.find('.overdue'));
	        					}
	        				}
	        			};
	        			//体验金
	        			var tBox = $('#ttaste');
	        			if (data.isUse == 0) {
	        				var noLi =  $('<li class="bg-nouse">'+
	        						'<div class="bg">'+
	        							'<div class="taste-bg-l">'+
	        								'<p class="money">¥<span>'+data.experienceCash+'</span></p>'+
	        							'</div>'+
	        							'<div class="taste-bg-r">'+
	        								'<a href="javascript:;" onclick="investTYJ()" class="icon icon-right">立即使用</a>'+
	        							'</div>'+
	        						'</div>'+
	        						'<div class="text">'+
	        							'<p>点击使用后立即使用</p>'+
	        						'</div>'+
	        						'</li>');
	    					tBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.nouse .none').remove();
	    					noLi.appendTo(tBox.find('.nouse'));
	        			} else {
	        				var useLi =  $('<li class="bg-use">'+
	        						'<div class="nobg">'+
	        							'<div class="taste-bg-l">'+
	        								'<p class="money">¥<span>'+data.investAmount+'</span></p>'+
	        							'</div>'+
	        						'</div>'+
	        						'<div class="text">'+
	        							'<p>已使用</p>'+
	        						'</div>'+
	        						'</li>');
	        					tBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.use .none').remove();
        						useLi.appendTo(tBox.find('.use'));
//        					}else{
//        						xBox.find('http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/.overdue .none').remove();
//        						useLi.attr('class','bg-date').appendTo(xBox.find('.overdue'));
//        					}
	        			}
	        				
	        			dBox.show();
	        			
	        			//事件绑定
	        			$('#dLink').click(function(){
	        				if($(this).hasClass('active')){
	        					return;
	        				};
	        				$(this).addClass('active').siblings('a').removeClass('active');
	        	    		$('.em-line').animate({'left':'0'},500);
	        	    		$('#xtaste').hide();
	        	    		$('#ttaste').hide();
	        	    		$('#dtaste').show();
	        			});
	        			$('#xLink').click(function(){
	        				if($(this).hasClass('active')){
	        					return;
	        				};
	        				$(this).addClass('active').siblings('a').removeClass('active');
	        	    		$('.em-line').animate({'left':'120px'},500);
	        	    		$('#dtaste').hide();
	        	    		$('#xtaste').show();
	        	    		$('#ttaste').hide();
	        			})
	        			$('#tLink').click(function(){
	        				if($(this).hasClass('active')){
	        					return;
	        				};
	        				$(this).addClass('active').siblings('a').removeClass('active');
	        				$('.em-line').animate({'left':'240px'},500);
	        				$('#dtaste').hide();
	        				$('#xtaste').hide();
	        				$('#ttaste').show();
	        			})
	        			dBox.find('.sub-nav a').click(function(){
	        				if($(this).hasClass('active')){
	        					return;
	        				}
	        				var index = $(this).index();
        					$(this).addClass('active').siblings('a').removeClass('active');
        					dBox.children('ul').eq(index).show().siblings('ul').hide();
	        			});
	        			xBox.find('.sub-nav a').click(function(){
	        				if($(this).hasClass('active')){
	        					return;
	        				}
	        				var index = $(this).index();
        					$(this).addClass('active').siblings('a').removeClass('active');
	        				xBox.children('ul').eq(index).show().siblings('ul').hide();
	        			});
	        			tBox.find('.sub-nav a').click(function(){
	        				if($(this).hasClass('active')){
	        					return;
	        				}
	        				var index = $(this).index();
        					$(this).addClass('active').siblings('a').removeClass('active');
        					tBox.children('ul').eq(index).show().siblings('ul').hide();
	        			});
		        	}else{
		        		utils.alert(data.msg);
		        	}
		        }
			})
	    }
	});
}

function investTYJ() {
	window.location.href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id=1";
}

//使用现金券
function useCard(id){
	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}","info":"{id:'"+id+"'}"};
	utils.ajax({
        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/useXianJinQuan.do',
        data:param,
        dataType:'json',
        success: function(data){
        	if(data.error == 0){
        		utils.alert('现金券领取成功!',function(){
        			window.location.reload();
        		})
        	}else{
        		utils.alert(data.msg);
        	}
        }
    });
}
//资金记录
function initFundRecord(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/fundrecord.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	var transType='';
	    	$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	
	    	$('.fund-param-list li').click(function(){
	    		$(this).addClass('active').siblings('li').removeClass('active');
	    		transType = $(this).index();
	    	});
	    	initFundRecordData();
	    	//查询
	    	$('#fundSearch').unbind('click').click(function(){
	    		var startDate = $('#startDate').val();
	    		var endDate = $('#endDate').val();
	    		if(startDate == '' && endDate != ''){
	    			utils.toast('开始时间不能为空');
	    			return;
	    		}
	    		if(startDate != '' && endDate == ''){
	    			utils.toast('结束时间不能为空');
	    			return;
	    		}
	    		if((startDate != '' && endDate != '') && startDate>endDate){
	    			utils.toast('开始时间不能大于结束时间');
	    			return;
	    		}
	    		var param = {};
	    		param.startTime = startDate;
	    		param.endTime = endDate;
	    		param.momeyType = transType;
	    		initFundRecordData(param);
	    		
	    	})
	    }
	});
}
//资金记录初始化
function initFundRecordData(m){
	var param = {}; 
	if(m){
		param = m
	}else{
		param.startTime = '';
		param.endTime = '';
		param.momeyType = '';
	}
	var fundData = [
	                {
	                	key:'recordTime',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'fundMode',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'income',resolve:function(val,record){
	                		return inOrOut(val,record.spending);
	                	}
	                },
	                {
	                	key:'usableSum',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'',resolve:function(val,record){
	                		var a = $('<a href="javascript:;" class="btn-link">查看详情</a>');
	                		a.bind('click',function(){
	                			utils.alert(strChina(record.remarks));
	                		});
	                		return a;
	                	}
	                }
	                
	                ]
	var fundPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findFundrecordList.do',param,$('.listData'),$('.paging'),fundData,function(){});
	
}
//资金记录收入还是支出
function inOrOut(income,spending){
	if(income>0){
		return '+'+income.toFixed(2);
	}else if(income == 0 && spending==0){
		return income.toFixed(2);
	}else{
		return '-'+spending.toFixed(2);
	}
}
//匹配新闻中的中文字符
function strChina(str){
	return str.replace(/<[^>]+>/g,"");
}
//投资管理
function initInvestManage(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/investmanage.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	$('#invest-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#invest-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	initInvestList();
	    	$('#invest-manage-Link').unbind('click').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		initInvestList();
	    	});
	    	
	    	$('#invest-detail-Link').unbind('click').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		initInvestDetail();
	    	});
	    }
	});
}

//债权管理
function initClaimManage(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/claimmanage.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	initClaimmCan();
	    	$('.claimm a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		var index = $(this).index();
	    		$('.em-line').animate({'left':index*120+'px'},500);
	    		switch(index){
	    			case 0 :initClaimmCan();break;
	    			case 1 :initClaimmIn();break;
	    			case 2 :initClaimmIs();break;
	    			case 3 :initClaimmFail();break;
	    		}
	    	});
	    	
	    	$('#zhaiQuan').click(function(){
	    		var id = '24';
	    		utils.Dialog(true);
	    		$('.AgreeMent').fadeIn();
	    		$('.AgreeMent .close').click(function(){
	    			$('.AgreeMent').hide();
	    			utils.Dialog();
	    		});
	    		$('.AgreeMent .popup-area').empty();
	    		var param={"info":"{TypeId:'"+id+"'}"};
	    		utils.ajax({
	    	        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/querytips.do',
	    	        data:param,
	    	        dataType:'json',
	    	        success: function(data){
	    	        	if(data.error == '0'){
	    	        		$('.AgreeMent .popup-area').html(data.content);
	    	        	}
	    	        }
	    	    })
	    	});
	    	$('#shiLi').click(function(){
	    		var id = '33';
	    		utils.Dialog(true);
	    		$('.AgreeMent_shiLi').fadeIn();
	    		$('.AgreeMent_shiLi .close').click(function(){
	    			$('.AgreeMent_shiLi').hide();
	    			utils.Dialog();
	    		});
	    		$('.AgreeMent_shiLi .popup-area').empty();
	    		var param={"info":"{TypeId:'"+id+"'}"};
	    		utils.ajax({
	    			url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/querytips.do',
	    			data:param,
	    			dataType:'json',
	    			success: function(data){
	    				if(data.error == '0'){
	    					$('.AgreeMent_shiLi .popup-area').html(data.content);
	    				}
	    			}
	    		})
	    	});
	    }
	});
}
//可转让
function initClaimmCan(){
	$('#claimm-can').show().siblings('div').hide();
	var ClaimmCanData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'remainBorrowLimit',resolve:function(val,record){
		                		return val+'/'+record.deadline;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'recivedPrincipal',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(parseFloat(val)-parseFloat(record.hasPrincipal))+'元</span>';
		                	}
		                },
		                {
		                	key:'hasPI',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'recievedPI',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(parseFloat(val)-parseFloat(record.hasPI))+'元</span>';
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val,record){
		                		if(val == null || val=='4' || val=='5' || val=='6' || val=='7'){
		                			var a = $('<a href="javascript:;" class="btn-link">债权转让</a>');
		                			a.click(function(){
		                				addAssignmentDebt(record);
		                			});
		                		}else{
		                			var a = $('<a href="javascript:;">撤回</a>');
		                			a.click(function(){
		                				cancelApplyDebt(record.debtId);
		                			});
		                		}
		                		return a;
		                	}
		                }
		                ]
	var param = {
			assignFlag:'canAssign',
			borrowerName:$('#claimm-can-person').val(),
			borrowTitle:$('#claimm-can-title').val()
	}
	var claimmCanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-can .listData'),$('#claimm-can .paging'),ClaimmCanData,function(){});
	//search
	$('#claimm-can-Search').unbind('click').click(function(){
		param = {
				assignFlag:'canAssign',
				borrowerName:$('#claimm-can-person').val(),
				borrowTitle:$('#claimm-can-title').val()
		};
		claimmCanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-can .listData'),$('#claimm-can .paging'),ClaimmCanData,function(){});
	})
	
}
//转让中
function initClaimmIn(){
	$('#claimm-in').show().siblings('div').hide();
	var ClaimmInData = [
			                {
			                	key:'borrowTitle',resolve:function(val,record){
			                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
			                		return a;
			                	}
			                },
			                {
			                	key:'debtLimit',resolve:function(val,record){
			                		return val+'/'+record.deadline;
			                	}
			                },
			                {
			                	key:'annualRate',resolve:function(val,record){
			                		return val+'%';
			                	}
			                },
			                {
			                	key:'realAmount',resolve:function(val,record){
			                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
			                	}
			                },
			                {
			                	key:'auctionBasePrice',resolve:function(val){
			                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
			                	}
			                },
			                {
			                	key:'remainAuctionTime',resolve:function(val,record){
			                		return strTime(val);
			                	}
			                }
			                ]
		var param = {
				assignFlag:'assigning',
				borrowerName:$('#claimm-in-person').val(),
				borrowTitle:$('#claimm-in-title').val()
		}
		var claimmCanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-in .listData'),$('#claimm-in .paging'),ClaimmInData,function(){});
		//search
		$('#claimm-in-Search').unbind('click').click(function(){
			param = {
					assignFlag:'assigning',
					borrowerName:$('#claimm-in-person').val(),
					borrowTitle:$('#claimm-in-title').val()
			};
			claimmCanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-in .listData'),$('#claimm-in .paging'),ClaimmInData,function(){});
		})
}
//已转让
function initClaimmIs(){
	$('#claimm-is').show().siblings('div').hide();
	var ClaimmInData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		return val+'/'+record.deadline;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionEndTime',resolve:function(val,record){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'viewpdf_url',resolve:function(val,record){
		                		var a = '<a href="'+val+'" class="btn-link" target=“_blank”>查看合同</a>';
		                		return a;
		                	}
		                }
		                ]
	var param = {
			assignFlag:'alreadyAssign',
			borrowerName:$('#claimm-in-person').val(),
			borrowTitle:$('#claimm-in-title').val()
	}
	var claimmInPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-is .listData'),$('#claimm-is .paging'),ClaimmInData,function(){});
	//search
	$('#claimm-in-Search').unbind('click').click(function(){
		param = {
				assignFlag:'canAssign',
				borrowerName:$('#claimm-in-person').val(),
				borrowTitle:$('#claimm-in-title').val()
		};
		claimmInPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-is .listData'),$('#claimm-is .paging'),ClaimmInData,function(){});
	})
}
//转让失败
function initClaimmFail(){
	$('#claimm-fail').show().siblings('div').hide();
	var ClaimmFailData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		return val+'/'+record.deadline;
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val,record){
		                		if(val=='4'){
		                			return '竞拍失败';
		                		}
		                		if(val=='5'){
		                			return '撤销';
		                		}
		                		if(val=='6'){
		                			return '审核失败';
		                		}
		                		if(val=='7'){
		                			return '提前还款';
		                		}
		                	}
		                }
		                ]
	var param = {
			assignFlag:'',
			borrowerName:$('#claimm-fail-person').val(),
			borrowTitle:$('#claimm-fail-title').val()
	}
	var claimmInPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-fail .listData'),$('#claimm-fail .paging'),ClaimmFailData,function(){});
	//search
	$('#claimm-fail-Search').unbind('click').click(function(){
		param = {
				assignFlag:'',
				borrowerName:$('#claimm-fail-person').val(),
				borrowTitle:$('#claimm-fail-title').val()
		};
		claimmInPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsManage.do',param,$('#claimm-fail .listData'),$('#claimm-fail .paging'),ClaimmFailData,function(){});
	})
}
//债权转让提交
//债权转让submit
function addAssignmentDebt(list){
	utils.Dialog(true);
	$('.claimm-from').show();
	$('.claimm-from .close').click(function(){
		utils.Dialog();
		$('.claimm-from').hide();
	});
	$('#claimm-price').val("");
	$('#claimm-password').val("");
	$('#claimm-tips').val("");
	var canDebtsAmt = (parseFloat(list.recivedPrincipal)-parseFloat(list.hasPrincipal)).toFixed(2);
	$('#canDebtsAmt').text(canDebtsAmt);
	//债转提交
	$('#claimm-submit').unbind('click').bind('click',function(){
		//转让期限
		var Debtdate = $('#auctionDays').val();
		//转让price
		var claimmPrice = $('#claimm-price').val();
		//交易密码
		var claimmPwd = $('#claimm-password').val();
		//转让描述
		var tips = $('#claimm-tips').val();
		if(Debtdate==''){
			utils.toast('请输入转让期限');
			return;
		}
		if(claimmPrice==''){
			utils.toast('请输入转让价格');
			return;
		}
		if(utils.isMoney(claimmPrice)){
			utils.toast('请输入正确金额');
			return;
		}
		var maxClaimm = canDebtsAmt*1.1;
		var minClaimm = canDebtsAmt*0.5;
		if((claimmPrice>maxClaimm) || (claimmPrice<minClaimm)){
			utils.alert('转让价格范围为'+minClaimm.toFixed(2)+'到'+maxClaimm.toFixed(2)+'元之间,请重新输入');
			return;
		}
		if(claimmPwd==''){
			utils.toast('请输入交易密码');
			return;
		}
		var parap = {
				debtLimit:list.remainBorrowLimit,
				auctionDays:Debtdate,
				auctionBasePrice:claimmPrice,
				dealpwd:claimmPwd,
				borrowId:list.borrowId,
				investId:list.investId,
				debtSum:canDebtsAmt,
				details:tips
		}
		utils.ajax({
			url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/debtsAssignment.do',
			data:JSON.stringify(parap),
			type:'POST',
			success:function(data){
				if(data.error=='0'){
					utils.alert('债权发布成功',function(){
						window.location.reload();
					});
				}else{
					utils.alert(data.msg);
				}
			}
		})
	})
}
//撤回
function cancelApplyDebt(id){
	utils.confirm('您确定要撤回吗？',function(){
		var parm = {
				debtId:id
		}
		utils.ajax({
			url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/recallDebtsAssignment.do',
			data:JSON.stringify(parm),
			success:function(data){
				if(data.error == '0'){
					utils.alert('债权撤回成功！',function(){
						window.location.reload();
					})
				}
			}
		})
		
	})
}
//债权购买
function initClaimBuy(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/claimbuy.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	$('#played-claimbuy-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#played-claimbuy-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	
	    	$('#success-claim-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#success-claim-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	
	    	initPlayedClaimBuy();
	    	$('.played-claimbuy').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		initPlayedClaimBuy();
	    	});
	    	$('.success-claimbuy').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		initSuccessClaimBuy();
	    	});
	    }
	});
}
//参与购买的债权
function initPlayedClaimBuy(){
	$('#played-claimbuy').show();
	$('#success-claimbuy').hide();
	var PlayedData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.debtId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowerName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		if(val){
		                			return val+'/'+record.deadline;
		                		}else{
		                			return record.deadline;
		                		}
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val,record){
		                		if(val =='2'){
		                			return record.remainDays;
		                		}else{
		                			return '--';
		                		}
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val){
		                		return getDebtStatus(val);
		                	}
		                }
		                ]
	var param = {
			borrowTitle:'',
			startTime:$('#played-claimbuy-startDate').val(),
			endTime:$('#played-claimbuy-endDate').val()
	}
	var playedClaimBuyPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findBuyingDebt.do',param,$('#played-claimbuy .listData'),$('#played-claimbuy .paging'),PlayedData,function(){});
	
	$('#played-claimbuy-Search').unbind('click').click(function(){
		param = {
				borrowTitle:'',
				startTime:$('#played-claimbuy-startDate').val(),
				endTime:$('#played-claimbuy-endDate').val()
		}
		playedClaimBuyPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findBuyingDebt.do',param,$('#played-claimbuy .listData'),$('#played-claimbuy .paging'),PlayedData,function(){});
	})

}


//成功购买的债权
function initSuccessClaimBuy(){
	
	$('#played-claimbuy').hide();
	$('#success-claimbuy').show();
	
	var SuccessClaimData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.debtId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		if(val){
		                			return val+'/'+record.deadline;
		                		}else{
		                			return record.deadline;
		                		}
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'borrowAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionEndTime',resolve:function(val,record){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'viewpdf_url',resolve:function(val){
		                		var a = '<a href="'+val+'" class="btn-link" target=“_blank”>查看合同</a>';
		                		return a;
		                	}
		                }
		                ]
	var param = {
			borrowTitle:'',
			startTime:$('#success-claim-startDate').val(),
			endTime:$('#success-claim-endDate').val()
	}
	var SuccessClaimBuyPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findSucessBuyedDebt.do',param,$('#success-claimbuy .listData'),$('#success-claimbuy .paging'),SuccessClaimData,function(){});
	$('#success-claim-Search').unbind('click').click(function(){
		param = {
				borrowTitle:'',
				startTime:$('#success-claim-startDate').val(),
				endTime:$('#success-claim-endDate').val()
		}
		SuccessClaimBuyPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findSucessBuyedDebt.do',param,$('#success-claimbuy .listData'),$('#success-claimbuy .paging'),SuccessClaimData,function(){});
	})
}
//获取债权状态
function getDebtStatus(status){
	
	if(status == '2'){
		return '转让中';
	}
	if(status == '3'){
		return '购买成功';
	}
	if(status == '4'){
		return '购买失败';
	}
	if(status == '5'){
		return '撤销';
	}
	if(status == '6'){
		return '审核失败';
	}
	if(status == '7'){
		return '提前还款';
	}
	
}

//投资列表
function initInvestList(){
	$('#invest').show();
	$('#payment').hide();
	var borrowFlag = 'successLoan';
	var investData1 = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                },
	                {
	                	key:'borrowWayName',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val,record){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'investAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	                	}
	                },
	                {
	                	key:'investTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                }
	                ]
	var investData2 = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'paymentMode',resolve:function(val){
		                		return paymentMode(val);
		                	}
		                },
		                {
		                	key:'publishTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'investAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'investTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                }
		                ]
	var investData3 = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'forTotalSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'recentlyRepayDate',resolve:function(val){
		                		return strTime(val);
		                	}
		                },
		                
		                {
		                	key:'viewpdf_url',resolve:function(val,record){
		                		/*<a class="ml10" href="'+record.download_url+'">下载</a>*/
		                		var a = '<a href="'+val+'" class="btn-link" target=“_blank”>查看合同</a>';
		                		return a;
		                	}
		                }
		                ]
	var investData4 = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'forTotalSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'publishTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'viewpdf_url',resolve:function(val,record){
		                		/*var div = $('<div class="more-content"></div>');
		                		var ul = $('<div class="more-box"></div>');
		                		var a = $('<a href="javascript:;">查看更多</a>').appendTo(div);
		                		var detail = $('<a href="javascript:;">查看详情</a>').click(function(){
		                			investRepayDetail(record.borrowId);
		                		}).appendTo(ul);
		                		var sea = $('<a href="'+record.viewpdf_url+'">查看合同</a>').appendTo(ul);
		                		var down = $('<a href="'+record.download_url+'">下载合同</a>').appendTo(ul);
		                		ul.appendTo(div);*/
		                		var str = '<a href="javascript:paymentDetail('+record.borrowId+','+record.bid+');">详情</a><a class="ml10" href="'+val+'" target=“_blank”>查看合同</a>';
		                		return str;
		                	}
		                }
		                ]
	var param = {
			borrowFlag:borrowFlag,
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	var investPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investmentManage.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),investData1,function(){});
	
	$('#invest-s1').unbind('click').click(function(){
		borrowFlag = 'successLoan';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData1').show().siblings('div.invest-listData').hide();
		investPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investmentManage.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),investData1,function(){});
	});
	$('#invest-s2').unbind('click').click(function(){
		borrowFlag = 'tendersingBorrow';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData2').show().siblings('div.invest-listData').hide();
		investPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investmentManage.do',param,$('.invest-listData2 .listData'),$('.invest-listData2 .paging'),investData2,function(){});
	});
	$('#invest-s3').unbind('click').click(function(){
		$(this).addClass('active').siblings('a').removeClass('active');
		borrowFlag = 'recycleBorrow';
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData3').show().siblings('div.invest-listData').hide();
		
		investPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investmentManage.do',param,$('.invest-listData3 .listData'),$('.invest-listData3 .paging'),investData3,function(){});
	});
	$('#invest-s4').unbind('click').click(function(){
		$(this).addClass('active').siblings('a').removeClass('active');
		borrowFlag = '';
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData4').show().siblings('div.invest-listData').hide();
		
		investPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investmentManage.do',param,$('.invest-listData4 .listData'),$('.invest-listData4 .paging'),investData4,function(){});
	});
	$('#investSearch').unbind('click').click(function(){
		if(borrowFlag=='successLoan'){
			$('#invest-s1').click();
		}
		if(borrowFlag=='tendersingBorrow'){
			$('#invest-s2').click();
		}
		if(borrowFlag=='recycleBorrow'){
			$('#invest-s3').click();
		}
		if(borrowFlag==''){
			$('#invest-s4').click();
		}
	});
	
}
//收款明细
function initInvestDetail(){
	$('#invest').hide();
	$('#payment').show();
	$('#payment-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#payment-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var param = {
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	var investDetailData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'forHasSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'publishTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                }
		                ]
	var investDetailPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/getMoneyDetail.do',param,$('.invest-detailTable .listData'),$('.invest-detailTable .paging'),investDetailData,function(data){
		var backAcountStatisMap = data.backAcountStatisMap;
		$('#allForPI').text(backAcountStatisMap.allForPI);
		$('#allForPIOneMonth').text(backAcountStatisMap.allForPIOneMonth);
		$('#allForPIThreeMonth').text(backAcountStatisMap.allForPIThreeMonth);
		$('#allForPIYear').text(backAcountStatisMap.allForPIYear);
	});

	$('#invest-detailSearch').unbind('click').click(function(){
		param = {
				publishTimeStart:$('#payment-startDate').val(),
				publishTimeEnd:$('#payment-endDate').val(),
				title:''
		};
		investDetailPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/getMoneyDetail.do',param,$('.invest-detailTable .listData'),$('.invest-detailTable .paging'),investDetailData,function(){});
	})
}
//还款详情
function paymentDetail(borrowId,id){
	utils.Dialog(true);
	$('.payment-detail .listData').empty();
	$('.payment-detail').show();
	$('.payment-detail .close').click(function(){
		utils.Dialog();
		$('.payment-detail').hide();
	});
	var param = {
			borrowId:borrowId,
			id:id
	}
	var repayData = [
	                 {
	                	 key:'repayPeriod',resolve:function(val,record,index){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val,record){
	                		 return strTime(val);
	                	 }
	                 },
	                 {
	                	 key:'forpayPrincipal',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'forpayInterest',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'principalBalance',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'manage',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'isLate',resolve:function(val,record){
	                		 if(val=='1'){
	                			 return '否';
	                		 }else{
	                			 return '是';
	                		 }
	                	 }
	                 },
	                 {
	                	 key:'lateDay',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'forFI',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'earn',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'isWebRepay',resolve:function(val,record){
	                		 if(val=='2'){
	                			 return '网站垫付';
	                		 }else{
	                			 return record.username.substring(0,3)+'...';
	                		 }
	                	 }
	                 }
	                 ]
	utils.ajax({
		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/findBorrowForpayDetail.do',
		data:JSON.stringify(param),
		success:function(data){
			utils.initListData(repayData,data.listMap,$('.payment-detail .listData'));
		}
	})
	//var repayTable = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findBorrowForpayDetail.do',param,$('.payment-detail .listData'),$('.payment-detail .paging'),function(){},repayData);
}
//借款管理
function initLoanManage(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/loanmanage.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	loanLinkInit();
	    	$('#repayEdit').hide();
	    	$('#loanLink').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('#repay').hide();
	    		$('#repayEdit').hide();
	    		$('#loan').show();
	    		loanLinkInit();
	    	});
	    	$('#detailLink').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('#loan').hide();
	    		$('#repayEdit').hide();
	    		$('#repay').show();
	    		detailLinkInit();
	    	});
	    	$('#repayEditLink').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'240px'},500);
	    		$('#loan').hide();
	    		$('#repay').hide();
	    		autoRepaymentInit();
	    	});
	    }
	});
}

function autoRepaymentInit() {
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/app/autoRepaymentInit.do',
	    type: "get",
	    dataType: "json",
	    contentType:contentType,
	    success: function (data) {
	    	if (data.error == 0) {
	    		$("#payment_money").text(data.automaticBidMap.usableSum);
	    		$("#payment_state").text(data.bidStatus == 2 ? '已开启' : '已关闭');
	    		$("#payment_btn").text(data.bidStatus == 1 ? '开启' : '关闭');
	    		$('#repayEdit').show();
	    	} else {
	    		utils.alert(data.msg);
	    	}
	    	
	    	$('#payment_btn').unbind('click').click(function(){
	    		var state;
	    		if (data.bidStatus == 1) {
	    			state = 2;
	    		} else if (data.bidStatus == 2) {
	    			state = 1;
	    		}
	    		var param = {'state':state};
	    		$.ajax({
	    		    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/app/autoRepayment.do',
	    		    type: "get",
	    		    data: JSON.stringify(param),
	    		    dataType: "json",
	    		    contentType:contentType,
	    		    success: function (data) {
	    		    	utils.alert(data.msg);
	    		    	autoRepaymentInit();
	    		    }
	    		});
	    	});
	    }
	});
}

//借款管理初始化
function loanLinkInit(){
	var borrowFlag = 'auditing';
	var param = {
			borrowFlag:borrowFlag,
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var listData = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                	
	                },
	                {
	                	key:'borrowWayName',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'borrowAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'publishTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                },
	                {
	                	key:'schedules',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'borrowStatus',resolve:function(val){
	                		return borrowStatus(val);
	                	}
	                }
	                ];
	var listData1 = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                	
	                },
	                {
	                	key:'',resolve:function(val,record){
	                		var a =$('<a href="javascript:;" target=“_blank”>查看协议</a>');
	                		a.bind('click',function(){
	                			showContract(record.borrowId);
	                		 });
	                		return a;
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'borrowAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'publishTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                },
	                {
	                	key:'stillTotalSum',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'borrowStatus',resolve:function(val){
	                		return borrowStatus(val);
	                	}
	                }
	                ];
	var listData2 = [
    	                {
    	                	key:'borrowTitle',resolve:function(val,record){
    	                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
    	                		return a;
    	                	}
    	                	
    	                },
    	                {
    	                	key:'username',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'realAmount',resolve:function(val){
    	                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
    	                	}
    	                },
    	                {
    	                	key:'recivedPI',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'hasPrincipal',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'hasInterest',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'forPrincipal',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'forInterest',resolve:function(val){
    	                		return val;
    	                	}
    	                }
    	                ];
	var loanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/borrowManageList.do',param,$('#loan .loan-listData1 .listData'),$('#loan .loan-listData1 .paging'),listData,function(){});
	//审核中
	$('#loan-s').unbind('click').click(function(){
		borrowFlag = 'auditing';
		/*if($(this).hasClass('active')&&search==true){
			return;
		}*/
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#startDate').val(),
    			publishTimeEnd:$('#endDate').val(),
    			title:''
    	};
		$('.loan-listData1').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-investor').hide();
		$('#loan .account-form-manage').show();
		loanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/borrowManageList.do',param,$('#loan .loan-listData1 .listData'),$('#loan .loan-listData1 .paging'),listData,function(){});
	});
	//招标中
	$('#loan-z').unbind('click').click(function(){
		borrowFlag = 'inviting';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#startDate').val(),
    			publishTimeEnd:$('#endDate').val(),
    			title:''
    	};
		$('.loan-listData2').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-investor').hide();
		$('#loan .account-form-manage').show();
		loanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/borrowManageList.do',param,$('#loan .loan-listData2 .listData'),$('#loan .loan-listData2 .paging'),listData,function(){});
	});
	//成功借款
	$('#loan-c').unbind('click').click(function(){
		borrowFlag = 'success';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#startDate').val(),
    			publishTimeEnd:$('#endDate').val(),
    			title:''
    	};
		$('.loan-listData3').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-investor').hide();
		$('#loan .account-form-manage').show();
		$('#loan .listData').removeClass('loanData-investor');
		loanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/borrowManageList.do',param,$('#loan .loan-listData3 .listData'),$('#loan .loan-listData3 .paging'),listData1,function(){});
	});
	//借款明细
	$('#loan-j').unbind('click').click(function(){
		borrowFlag = '';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:'',
				investor:$('#investor').val(),
				title:''
		};
		
		$('.loan-listData4').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-manage').hide();
		$('#loan .account-form-investor').show();
		loanPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/borrowManageList.do',param,$('#loan .loan-listData4 .listData'),$('#loan .loan-listData4 .paging'),listData2,function(){});
	});
	$('#loanSearch').unbind('click').click(function(){
		if(borrowFlag=='auditing'){
			$('#loan-s').click();
		}
		if(borrowFlag=='inviting'){
			$('#loan-z').click();
		}
		if(borrowFlag=='success'){
			$('#loan-c').click();
		}
	});
	$('#j-loanSearch').unbind('click').click(function(){
		if($('#investor').val()==''){
			utils.toast('请输入投资者');
			return;
		}
		$('#loan-j').click();
	})
}

//还款明细初始化
function detailLinkInit(){
	var borrowFlag = 'repaymenting';
	var param = {
			borrowFlag:borrowFlag,
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	$('#d-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#d-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var dlistData = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                
	                },
	                {
	                	key:'borrowWayName',resolve:function(val,record){
	                		var a =$('<a href="javascript:;" class="btn-link" target=“_blank”>查看合同</a>');
	                		 a.bind('click',function(){
	                			showContract(record.borrowId);
	                		 });
	                		 return a;
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'borrowAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'publishTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                },
	                {
	                	key:'hasSum',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'borrowId',resolve:function(val){
	                		var a =$('<a href="javascript:;">明细</a>');
	                		a.bind('click',function(){
	                			showRepayDetail(val);
	                		});
	                		return a;
	                	}
	                }
	                ];
	var dlistData1 = [
	                 {
	                	 key:'borrowTitle',resolve:function(val,record){
	                		 var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		 return a;
	                	 }
	                 
	                 },
	                 {
	                	 key:'',resolve:function(val,record){
	                		 var a =$('<a href="javascript:;" class="btn-link" target=“_blank”>查看合同</a>');
	                		 a.bind('click',function(){
	                			showContract(record.borrowId);
	                		 });
	                		 return a;
	                	 }
	                 },
	                 {
	                	 key:'borrowAmount',resolve:function(val){
	                		 return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	 }
	                 },
	                 {
	                	 key:'annualRate',resolve:function(val){
	                		 return val+'%';
	                	 }
	                 },
	                 {
	                	 key:'deadline',resolve:function(val,record){
	                		 return getDeadLine(val,record.isDayThe);
	                	 }
	                 },
	                 {
	                	 key:'publishTime',resolve:function(val){
	                		 return strTime(val);
	                	 }
	                 },
	                 {
	                	 key:'stillTotalSum',resolve:function(val){
	                		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	                	 }
	                 },
	                 {
	                	 key:'hasFI',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'borrowId',resolve:function(val){
	                		 var a =$('<a href="javascript:;">明细</a>');
		                		a.bind('click',function(){
		                			showRepayDetail(val);
		                		});
		                		return a;
	                	 }
	                 }
	                 ];
	var dlistData2 = [
	                 {
	                	 key:'borrowTitle',resolve:function(val,record){
	                		 var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		 return a;
	                	 }
	                 
	                 },
	                 {
	                	 key:'repayPeriod',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'realRepayDate',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'forPI',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'stillInterest',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateFI',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateDay',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val){
	                		 if(val == '1'){
	                			 return '未偿还';
	                		 }else{
	                			 return '已偿还';
	                		 }
	                		 
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val,record){
	                		 if(val!='1'){
	                			 return '--'
	                		 }else{
	                			 var a =$('<a href="javascript:;">还款</a>');
			                		a.bind('click',function(){
			                			showRepaySubmit(record.payId);
			                		});
			                		return a;
	                		 }
	                	 }
	                 }
	                 ];
	var detailPage = new Page('../app/repaymentDetail.do.htm'/*tpa=http://120.76.203.19:8090/shzc_test/WEB-PC/app/repaymentDetail.do*/,param,$('#repay .listTable1 .listData'),$('#repay .listTable1 .detailPaging'),dlistData,function(){});
	//还款中
	$('#detail-h').unbind('click').click(function(){
		borrowFlag = 'repaymenting';
		/*if($(this).hasClass('active')&&search==true){
			return;
		}*/
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d-endDate').val(),
				title:''
		};
		$('.listTable3').hide();
		$('.listTable2').hide();
		$('.listTable1').show();
		detailPage = new Page('../app/repaymentDetail.do.htm'/*tpa=http://120.76.203.19:8090/shzc_test/WEB-PC/app/repaymentDetail.do*/,param,$('#repay .listTable1 .listData'),$('#repay .listTable1 detailPaging'),dlistData,function(){});
	});
	//已还完
	$('#detail-y').unbind('click').click(function(){
		borrowFlag = 'alreadyRepaid';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d-endDate').val(),
				title:''
		};
		$('.listTable3').hide();
		$('.listTable1').hide();
		$('.listTable2').show();
		detailPage = new Page('../app/repaymentDetail.do.htm'/*tpa=http://120.76.203.19:8090/shzc_test/WEB-PC/app/repaymentDetail.do*/,param,$('#repay .listTable2 .listData'),$('#repay .listTable2 .detailPaging'),dlistData1,function(){});
	});
	//还款明细
	$('#detail-m').unbind('click').click(function(){
		borrowFlag = '';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d-endDate').val(),
				title:''
		};
		$('.listTable2').hide();
		$('.listTable1').hide();
		$('.listTable3').show();
		detailPage = new Page('../app/repaymentDetail.do.htm'/*tpa=http://120.76.203.19:8090/shzc_test/WEB-PC/app/repaymentDetail.do*/,param,$('#repay .listTable3 .listData'),$('#repay .listTable3 .detailPaging'),dlistData2,function(){});
	});
	$('#detailSearch').unbind('click').click(function(){
		if(borrowFlag=='repaymenting'){
			$('#detail-h').click();
		}
		if(borrowFlag=='alreadyRepaid'){
			$('#detail-y').click();
		}
		if(borrowFlag==''){
			$('#detail-m').click();
		}
	});
}
//还款明细列表
//还款详细明细
function  showRepayDetail(borrowId){
	utils.Dialog(true);
	$('.repay-detail').show();
	$('.repay-detail .close').click(function(){
		utils.Dialog();
		$('.repay-detail').hide();
	});
	var param = {
			borrowId:borrowId,
			status:'1'
	}
	var repayData = [
	                 {
	                	 key:'repayStatus',resolve:function(val,record,index){
	                		 return index;
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayTotal',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'realRepayDate',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateDay',resolve:function(val,record){
	                		 return val+'天';
	                	 }
	                 },
	                 {
	                	 key:'hasPI',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateTotal',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'total',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val,record){
	                		 if(val == '已偿还'){
	                			 return val;
	                		 }else{
	                			 var a = $( '<a href="javascript:;">还款</a>');
	                			 a.bind('click',function(){
	                				 	utils.Dialog();
	                					$('.repay-detail').hide();
	                				 showRepaySubmit(record.id);
	                			 })
	                			 return a;
	                		 }
	                		 
	                	 }
	                 }
	                 ]
	var repayTable = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/findPayingDetailsByBorrowId.do',param,$('.repay-detail .listData'),$('.repay-detail .paging'),repayData,function(){});
}
//借款合同
function  showContract(borrowId){
	utils.Dialog(true);
	$('.contract-detail').show();
	$('.contract-detail .close').click(function(){
		utils.Dialog();
		$('.contract-detail').hide();
	});
	var param = {
			borrowId:borrowId
	}
	var ContractData = [
	                 {
	                	 key:'borrowTitle',resolve:function(val,record,index){
	                		 return index;
	                	 }
	                 },
	                 {
	                	 key:'publishName',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'investName',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'viewpdf_url',resolve:function(val,record){
	                		 if(val){
	                			 return '<a href="'+val+'" target=“_blank”>查看</a>';
	                		 }else{
	                			 return '--';
	                		 }
	                	 }
	                 },
	                 {
	                	 key:'download_url',resolve:function(val,record){
	                		 if(val){
	                			 return '<a href="'+val+'">下载</a>';
	                		 }else{
	                			 return '--';
	                		 }
	                	 }
	                 }
	                 ]
	var ContractTable = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/queryPactList.do',param,$('.contract-detail .listData'),$('.contract-detail .paging'),ContractData,function(){});
}

//还款表单显示
function showRepaySubmit(id){
	$('#input-imgCode').val(''); 
	$('#use-password').val(''); 
	utils.Dialog(true);
	$('.repay-from').show();
	$('.repay-from .close').click(function(){
		utils.Dialog();
		$('.repay-from').hide();
	});
	var param = {
			payId:id,
	};
	utils.ajax({
		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/findMyPayData.do',
		data:JSON.stringify(param),
		success:function(data){
			if(data.error=='0'){ 
				//账户余额
				$('#repay-amt').text(data.payMap.totalSum);
				//可用余额
				$('#repay-use').text(data.payMap.usableSum);
				//还款日期
				$('#repay-redate').text(data.payMap.repayDate);
				//待还本息
				$('#repay-dbent').text(data.payMap.forPI);
				//逾期本息
				$('#repay-rbent').text(data.payMap.lateFI);
				//需还金额
				$('#repay-must').text(data.payMap.needSum);
				utils.getImgCode($('#imgCode'),'invest');
				$('#imgCode').click(function(){
					utils.getImgCode($(this),'invest');
				});
				//还款
				$('#repay-submit').unbind('click').bind('click',function(){
					if($(this).hasClass('disabled'))
						return;
					RepaySubmit(data.payMap.id,data.payMap.needSum);
				});
			}else{
				utils.alert(data.msg);
			}
		}
	})
}
//submit
function RepaySubmit(repayid,needSums){
	var code = $('#input-imgCode').val(); 
	var password = $('#use-password').val(); 
	
	if(password==''){
		utils.toast('请输入密码');
		return;
	};
	if(code==''){
		utils.toast('请输入图形验证码');
		return;
	};  
	var repayparam = {
			code:code,
			id:repayid,
			pwd:password,
			needSum:needSums,
	};
	$('#repay-submit').addClass('disabled').text('还款中...').unbind('click');
	//ajax
	utils.ajax({
		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/referPay.do',
		data:JSON.stringify(repayparam),
		success:function(data){
			$('#repay-submit').removeClass('disabled').text('还款').bind('click',function(){ 
				RepaySubmit(repayid,needSums);
			});
			if(data.error=='0'){
				utils.alert('还款成功',function(){
					$('.repay-from').hide();
					utils.Dialog();
				});
				$('#detail-m').click();
			}else{
				utils.alert(data.msg);
			}
		}
	});	
}
//获取还款方式
function paymentMode(val){
	if(val==4){
		return ' 一次性还款';
	}else if(val==1){
		return '等额本息';
	}else{
		return '按月付息，到期还本';
	}
};
//获取标的时间
function getDeadLine(deadline,isDayThe){
	if(isDayThe == '1'){
		return deadline+'个月';
	}else{
		return deadline+'天';
	}
}
//时间格式化
function strTime(time){
	return time.substring(0,10);
}
//还款状态
function borrowStatus(s){
	if(s == 2){
		return '招标中';
	}else if(s == 3){
		return '已满标';
	}else if(s == 4){
		return '还款中';
	}else if(s == 5){
		return '已还完';
	}else if(s == 6){
		return '已流标';
	}
}
//标题格式化
function strTitle(title){
	if(title.length>7){
		return title.substring(0,6)+'...';
	}else{
		return title;
	}
}
//推荐好友初始化
var isEmployeeReferral = -1;
//推荐好友
function initTuijian(){
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/friend.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	utils.ajax({
	    		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/friendManagerInit.do?is=1',
	    		data:{},
	    		dataType:'json',
	    		success:function(record){
	    			if(record.error=='0'){
	    				if (record.isEmployeeReferral == 2) {
	    					// 内部员工推荐
	    					isEmployeeReferral = 2;
	    				}
	    			}
	    		}
	    	})
	    	
	    	$('.account-right').html(data);
	    	//uid
	    	$('#uid').text(utils.Storage.getItem('uid'));
	    	//生成推荐链接
	    	$('#tj-clip-text').text('http://www.pujinziben.com/WEB-PC/regist.html?useCode='+utils.Storage.getItem('uid'));
	    	//复制文本
	    	var text = $(".tj-clip-text").text();
	    	clipboard(text,'tj-clip-btn','复制成功！','tj-clip');
	    		    	
	    	$('.tuijian-list').hide();
	    	$(".invest-list").hide();
	    	$(".investList").hide();
	    	$(".fanhui").hide();
	    	
	    	$(".tuijian").click(function () {
	    		tuiJianList();
	    		
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.tuiJianShow').show();
	    		$('.tuijian-list').hide();
		    	$(".invest-list").hide();
		    	$(".investList").hide();
		    	$(".fanhui").hide();
	    	});
	    	
	    	$(".show-tuijian-list").bind("click", function () {
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.tuiJianShow').hide();
	    		$('.tuijian-list').show();
		    	$(".invest-list").hide();
		    	$(".investList").hide();
		    	$(".fanhui").hide();
	    		
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	if($('.listData li').size() == 0){
		    		//初始化数据查询
		    		tuiJianList();
		    	};
		    	//搜索
		    	$('#cashSearch').unbind('click').click(function(){
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		tuiJianList();
		    	});
	    	});
	    	
	    }
	});
	
}

// 推荐列表查询
function tuiJianList() {
	var begin = $("#startDate").val();
	var end = $("#endDate").val();
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'username',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'createTime',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'rewardMoney',resolve:function(val, record){
	       	    		if (val == null) {
	       	    			return '<span class="black">0</span>';	
	       	    		} else {
	       	    			return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    		}
	       	    		
	       	    	 }
	       	     }, {
	       	    	 key:'',resolve:function(val, record){
	       	    		 if (isEmployeeReferral != 2){
	       	    			 return "- -";
	       	    		 }
	       	    		 var a = $("<a href='javascript:;'>查看</a>");
	       	    		 a.click(function() {
	       	    			 // 查看推荐的好友投资详细信息
	       	    			 $(".tuijian-list").hide();
	       	    			 $(".investList").show();
	       	    			 $(".invest-listData").show();
	       	    			 $(".fanhui").css({"float":"right","dispaly":"block","color":"#87CEFA"});
	       	    			 $(".fanhui").show();
	       	    			 investRecordInit(record.username, record.userId);
	       	    		 });
	       	    		 return a;
	       	    	 }
	       	     }
       	];
	var param={'begin':begin,'end':end}; 
	oPage = null;
	oPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/friendManagerInit.do',param,$('.tuijian-list .listData'),$('.tuijian-list .paging'),payData,function(data){
		if (data.error != 0) {
			alert(data.msg);
			return;
		}
	});
}

function investRecordInit(username, userId) {
	$('#invest-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#invest-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var payData = [
        {
        	key:'borrowTitle',resolve:function(val,record){
        		var a =$('<a href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
        		return a;
        	}
        },
        {
        	key:'borrowWayName',resolve:function(val){
        		return val;
        	}
        },
        {
        	key:'annualRate',resolve:function(val,record){
        		return val+'%';
        	}
        },
        {
        	key:'deadline',resolve:function(val,record){
        		return getDeadLine(val,record.isDayThe);
        	}
        },
        {
        	key:'paymentMode',resolve:function(val){
        		return paymentMode(val);
        	}
        },
        {
        	key:'investAmount',resolve:function(val){
        		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
        	}
        },
        {
        	key:'investTime',resolve:function(val){
        		return strTime(val);
        	}
        }
    ]
	
	var begin = '';
	var end = '';
	$('#investSearch').unbind('click').click(function(){
		begin = $("#invest-startDate").val();
		end = $("#invest-endDate").val();
		var param={'username':username,'userId':userId,'publishTimeStart':begin,'publishTimeEnd':end,'title':''};
		
		oPage = null;
		oPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investRecordInit.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),payData,function(data){
			if (data.error != 0) {
				alert(data.msg);
				return;
			}
		});
	});
	
	$(".fanhui").click(function() {
		$('.tuiJianShow').hide();
		$('.tuijian-list').show();
    	$(".invest-list").hide();
    	$(".investList").hide();
    	$(".fanhui").hide();
		
		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    	if($('.listData li').size() == 0){
    		//初始化数据查询
    		tuiJianList();
    	};
    	//搜索
    	$('#cashSearch').unbind('click').click(function(){
    		var startDate = $('#startDate').val();
    		var endDate = $('#endDate').val();
    		if(startDate == ''){
    			utils.toast('开始时间不能为空');
    			return;
    		}
    		if(endDate == ''){
    			utils.toast('结束时间不能为空');
    			return;
    		}
    		if(startDate>endDate){
    			utils.toast('开始时间不能大于结束时间');
    			return;
    		}
    		tuiJianList(startDate,endDate);
    	});
	});
	
	var param={'username':username,'userId':userId,'publishTimeStart':begin,'publishTimeEnd':end,'title':''};
	
	oPage = null;
	oPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/investRecordInit.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),payData,function(data){
		if (data.error != 0) {
			alert(data.msg);
			return;
		}
	});
}


//复制初始化
function clipboard(text,button,msg,parent) {
    if(window.clipboardData){        //for ie
        var copyBtn = document.getElementById(button);
        copyBtn.onclick = function(){
            window.clipboardData.setData('text',text);
            utils.alert(msg);
        }
    }else{
    	initclip(text);
    }
    return false;
}
//获取复制文本
function initclip(text) {
	var clip = new ZeroClipboard.Client();
	clip.setHandCursor( true );
	clip.addEventListener('mouseOver', function(){
		clip.setText( text );
	},false);
	clip.addEventListener('complete', function(){
		utils.alert('复制成功！');
	});
	clip.glue( 'tj-clip-btn' );
}
//安全中心
function initSafe(){
	//充值页面
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/safe.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	//获取安全信息
	    	utils.ajax({
	    		url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/safeCenterData.do',
	    		data:{},
	    		dataType:'json',
	    		success:function(record){
	    			if(record.error=='0'){
		    			//资料完善度
	    				var informationFinishedDgree = record.informationFinishedDgree;
	    				$('.safe-t-line em').css({'width':informationFinishedDgree+'%'});
	    				if(informationFinishedDgree=='30'){
	    					$('.safe-t-r').text('低');
	    				}else if(informationFinishedDgree=='50'){
	    					$('.safe-t-r').text('中');
	    				}else{
	    					$('.safe-t-r').text('高');
	    				}
	    				//登录密码
	    				$('#password-btn').click(function(){
	    					changePwd('login');
	    				})
	    				//交易密码
	    				var dealset = record.usermap.dealset;
	    				if(dealset == '1'){
	    					$('#dealpwd').text('设置').click(function(){
	    						changePwd('dealpwd');
	    					});
	    					$('#forgetpwd').remove();
	    				}else{
	    					$('#dealpwd').text('修改').click(function(){
	    						changePwd('dealpwd');
	    					});
	    				}
	    				//手机号码
	    				if(record.usermap.cellPhone ==''){
	    					$('#cellPhone').text('进行绑定');
	    					$('#cellPhone-text').text('请绑定手机号');
	    					$('#cellPhone-icon').attr('class','icon icon-wrong');
	    					$('#changePhone').hide();
	    				}else{
	    					$('#cellPhone').text('已绑定').addClass('on');
	    					$('#cellPhone-text').text(record.map.cellPhone);
	    					$('#changePhone').click(function(){
	    						changePhone(record.map.cellPhone);
	    					})
	    				}
	    				//邮箱
	    				if(record.usermap.email ==''){
	    					$('#email').text('进行绑定').click(function(){
	    						bindEmail();
	    					});
	    					$('#email-text').text('获取最新的投资讯息和账户信息变动通知');
	    					$('#email-icon').attr('class','icon icon-wrong');
	    				}else{
	    					$('#email-text').text(record.usermap.email);
	    					$('#email').text('已绑定').addClass('on');
	    				}
	    				//身份认证
	    				if(record.map.realName!=''){
	    					$('#realName-text').text(record.map.realName+'    '+record.map.idNo);
	    					$('#realName').text('已认证').addClass('on');
	    				}else{
	    					$('#realName-text').text('一旦实名认证通过将不能修改');
	    					$('#realName').text('去认证').click(function(){
	    						window.location.href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/registpay.html";
	    					});
	    					$('#realName-icon').attr('class','icon icon-wrong');
	    				}
	    				$('.account-content').show();
	    			}else{
	    				utils.alert(record.msg);
	    			}
	    			
	    		}
	    	})
	    }
	});
}
//邮箱绑定
function bindEmail(path){
	utils.Dialog(true);
	$('.bind-email').fadeIn();
	$('.bind-email .close').click(function(){
		$('.bind-email').hide();
		utils.Dialog();
	});
	//修改邮箱
	$('#email-submit').unbind('click').click(function(){
		var email = $('#addEmail').val();
		if(email == ''){
			utils.toast('邮箱不能为空');
			return;
		}
		if(!utils.isEmail(email)){
			utils.toast('请输入正确邮箱');
			return;
		}
		var param = {
				email:email
		};
		utils.ajax({
			url:path+'/customer/send?email='+email,
			data:JSON.stringify(param),
			dataType:'json',
			success:function(data){
				if(data.mailAddress=='0'){
		             utils.alert("邮箱不能为空");
		        }else if(data.mailAddress=='1'){
		        	utils.alert("该邮箱不存在");
		        }else if (data.mailAddress=='4'){
		        	utils.alert("该邮箱已被绑定,请重新输入");
			    }else{
			    	utils.alert("邮件已经发送到你的邮箱,请<a href=http://"+data.mailAddress+"  target='_blank'><font color='green'> 登录</font></a>到你的邮箱验证");
		        }
			}
		})
		utils.toast('一封邮件已发到您的邮箱');
		setTimeout(function(){  //使用  setTimeout（）方法设定定时1000毫秒
			$("#email_form").submit();
    	},500);
	});
	
};
//修改绑定手机号
function changePhone(path,phone,btn){
	utils.Dialog(true);
	var wait = 60; 
	$('.change-phone').fadeIn();
	$('.change-phone .close').click(function(){
		$('.change-phone').hide();
		utils.Dialog();
	});
	$('.change-phone .step1').show().siblings('.step2').hide();
	$('#oldMobliePhoneCode').val('');
	
	$('#getMsgCodeOld').removeClass('disabled').text('获取验证码').unbind('click').click(function(){
		utils.toast('验证码已发送到您的手机请注意查收！');
		//获取原手机短信验证码
        $.post(path+"/customer/verification",{'phone':phone},function(index){ 
	    },"json") 
	});
	//验证原手机号码
	$('#phone-submit').unbind('click').click(function(){
		var codemess = $('#codemes').val();
		var oldMobileCode = $('#oldMobliePhoneCode').val();
		var mobile = $('#newMobliePhone').val();
		if($('#getMsgCodeOld').data('error')){
			utils.alert($('#getMsgCodeOld').data('error'));
			return;
		};
		if(oldMobileCode == ''){
			utils.toast('验证码不能为空');
			return;
		}
		if(mobile == ''){
			utils.toast('新手机号码不能为空');
			return;
		}
		if(utils.isPhone(mobile)){
			utils.toast('请填写正确的手机号码');
			return;
		}
		if(codemess != 'ok'){
			utils.toast('验证码错误');
			return;
		}
		$("#phoneupdate_form").submit();
	})
}

//修改登录交易密码
function changePwd(){
	utils.Dialog(true);
	$('.change-pwd').fadeIn();
	$('.change-pwd .close').click(function(){
		$('.change-pwd').hide();
		utils.Dialog();
	});
	$('#oldPassword').val("");
	$('#newPassword').val("");
	$('#confirmPassword').val("");
	//修改登录密码
	$('#pwd-submit').unbind('click').click(function(){
		changePwdSubmit();
	});
}

function changePwdSubmit(){
	var oldPassword = $('#oldPassword').val();
	var newPassword = $('#newPassword').val();
	var confirmPassword = $('#confirmPassword').val();
	var wornpwd = $('#wornpwd').val();
	if(oldPassword == ''){
		utils.toast('原始密码不能为空');
		return;
	}
	if(oldPassword != wornpwd){
		utils.toast('您输入的原密码有误');
		return;
	}
	if(newPassword == '' || newPassword.length<4){
		utils.toast('密码长度必须为4-20个字符');
		return;
	}
	if(confirmPassword == ''){
		utils.toast('确认密码不能为空');
		return;
	}
	if(oldPassword == newPassword){
		utils.toast('新密码与原始密码一致');
		return;
	}
	if(newPassword != confirmPassword){
		utils.toast('两次密码输入不一致');
		return;
	}
	if(newPassword == confirmPassword){
		utils.toast('密码修改成功，请重新登录');
		$("#update_form").submit();
	}
	
}


//我的银行卡
function initMyDebitCard() {
	$.ajax({
	    url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/debitCard.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	// 查询数据库中银行卡信息
	    	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}"};
			utils.ajax({
				url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/queryBankList.do',
				data:param,
				dataType:'json',
				success: function(data){
	        	if(data.error =='0'){
	        		var cards = $("#myDebitCard");
	        		for (var i = 0; i < data.bankList.length; i++) {
	        			// 银行卡项 
	        			var item = data.bankList[i];
	        			var cardColor = 'bank-card_1';
	        			if (i % 2 != 0) {
	        				cardColor = 'bank-card_2';
	        			}
	        			// 卡号 
	        			var cardNo1 = item.cardNo.substr(0,4);
	        			var cardNo2 = item.cardNo.substr(item.cardNo.length - 4,item.cardNo.length - 1);
	        			var cardUserName = item.cardUserName.substr(1, item.cardUserName.length - 1);
	        			var card = 
	        				$('<div id="card1" class="'+ cardColor +'">' +
	        					'<div class="bank-top">' +
		        					/*'<div class="bank-cardLogo"></div>' +*/
		        					'<div class="bank-cardTitle">'+ item.bankName +'</div>' +
		        					'<div class="bank-cardType">储蓄卡</div>' +
		        				'</div>' +
		        				'<div class="bank-center">' +
		        					/*'<div class="bank-empty"></div>' +*/
		        					'<div class="bank-cardNumber">'+ cardNo1 +' **** **** '+ cardNo2 +'</div>' +
		        					'<div class="bank-userName">*'+ cardUserName +'</div>' +
		        				'</div>' +
	        				'</div>');
	        			card.appendTo(cards);
	        		}
	        		// 循环完银行卡后显示添加银行卡
	        		var cards = $("#myDebitCard");
	        		// 添加银行卡对象
	        		var card = 
        				$('<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">'+
    						'<div class="bank-addCard"><a href="javascript:;" >添加银行卡</a></div>'+
    					'</div>');
        			card.appendTo(cards);
	        		
	        	}else if(data.error =='4'){
	        		// 循环完银行卡后显示添加银行卡
	        		var cards = $("#myDebitCard");
	        		// 添加银行卡对象
	        		var card = 
        				$('<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">'+
    						'<div class="bank-addCard"><a href="javascript:;" >添加银行卡</a></div>'+
    					'</div>');
        			card.appendTo(cards);
	        	}else{
	        		utils.alert(data.msg);
	        	}
	        }
    })
	    	
	    }
	});
}
//添加银行卡
function addCard(){
	var param={"auth":"{uid:'"+utils.Storage.getItem('uid')+"'}"};
	utils.ajax({
        url:'http://120.76.203.19:8090/shzc_test/WEB-PC/app/addBankInfo.do',
        data:param,
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		$('#myDebitCard').empty().html(data.html);
        	}else if(data.msg=='请先注册汇付'){
        		utils.alert(data.msg,function(){
        			window.location.href="http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/registpay.html";
        		});
        	}else{
        		utils.alert(data.msg);
        	}
        }
    })
}
//消息中心
function initMsgCenters(){
	$.ajax({
		url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/msgCenters.html',
		type: "get",
		dataType: "html",
		contentType:contentType,
		success: function (data) {
			$('.account-right').empty();
			$('.account-right').html(data);
			initMsgData();
		}
	});
}
//消息列表初始化
function initMsgData(){
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'',resolve:function(val, record){
	       	    		 var check;
	       	    		 if (record.mailStatus == '已读'){
	       	    			 check = $('<input class="check" type="checkbox" value="'+ record.id +'" name="sysMail" />');
	       	    		 } else {
	       	    			 check = $('<input type="checkbox" value="'+ record.id +'" name="sysMail" />');
	       	    		 }
	       	    		 return check;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'',resolve:function(val){
	       	    		 return '系统消息';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'mailTitle',resolve:function(val,record,index){
	       	    		 var data;
	       	    		 if (record.mailStatus == '已读'){
	       	    			 data = $("<a href='javascript:;' style='color: #c0c0c0;'>" + val + "</a>");
	       	    		 } else {
	       	    			 data = $("<a href='javascript:;' style='color: #333;'>" + val + "</a>");
	       	    		 }
	       	    		data.click(function(){
	       	    			initMsgxq(record.id);
	       	    		})
	       	    		return data;
	       	    	 }
	       	     },
	       	     {			
	       	    	 key:'sendTime',resolve:function(val){
	       	    		 var date = new Date(val.time);
	       	    		 return timeToStr(date);
	       	    	 }
	       	     }
       	];
	var app = "app";
	var param={app:app};
	oPage = null;
	oPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/querySysMails2.do',param,$('.msg-list.listData'),$('.paging'),payData,function(){});
	
}
//合同查询
function initHeTong(){
	$.ajax({
		url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/hetong.html',
		type: "get",
		dataType: "html",
		contentType:contentType,
		success: function (data) {
			$('.account-right').empty();
			$('.account-right').html(data);
			
			$('#hetong-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
			$('#hetong-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
			heTongData();
			$('#hetongSearch').unbind('click').click(function(){
				heTongData();
			})
		}
	});
}
//合同查询
function heTongData() {
	var begin = $("#hetong-startDate").val();
	var end = $("#hetong-endDate").val();
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'borrower',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'borrowTitle',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'borrowWayName',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'paymentMode',resolve:function(val, record){
	       	    		 if (val == "1") {
	       	    			 return "按月等额本息还款";
	       	    		 } else if (val == "2") {
	       	    			 return "按先息后本还款";
	       	    		 } else if (val == "4") {
	       	    			 return "一次性还款";
	       	    		 }
	       	    	 }
	       	     }, {
	       	    	 key:'schedules',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'annualRate',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'deadline',resolve:function(val, record){
	       	    		 return val + "个月";
	       	    	 }
	       	     }, {
	       	    	 key:'publishTime',resolve:function(val, record){
	       	    		 return strTime(val);
	       	    	 }
	       	     }, {
	       	    	 key:'download_url',resolve:function(val, record){
	       	    		 return "<a href="+ val +" target=“_blank”>查看</a>";
	       	    	 }
	       	     }
       	];
	var param={"publishTimeStart":begin, "publishTimeEnd":end};
	oPage = new Page('http://120.76.203.19:8090/shzc_test/WEB-PC/app/queryHeTongList2.do',param,$('.listData'),$('.paging'),payData,function(data){
		if (data.error != 0) {
			alert(data.msg);
			return;
		}
	});
	
}
// 日期转换
function timeToStr(time) {   
      var year = time.getFullYear();  
      var month = time.getMonth() + 1;  //月  
      var day = time.getDate();         //日  
      var hh = time.getHours();       //时  
      var mm = time.getMinutes();    //分  
      var str= year + "-";  
      if(month < 10) {
    	  str+= "0" + month + "-";
      } else {
    	  str+= month + "-";
      }
      if(day < 10) {
          str+= "0" + day;
      } else {
    	  str+= day;
      }
      str+= " " + hh + ":" + (mm < 10 ? "0"+mm : mm);
     return(str);   
 } 

// 消息详情
function initMsgxq(id) {
	$.ajax({
		url: 'http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/template/msgxq.html',
		type: "get",
		dataType: "html",
		contentType:contentType,
		success: function (data) {
			$('.account-right').empty();
			$('.account-right').html(data);
			$(".msgPerson").hide();
			initMsgxq2(id);
		}
	});
}
function initMsgxq2(id) {
	utils.ajax({
		url: "../app/queryEmailById2.do?mailId="+id+"&type=1",
		dataType: "json",
		success: function (data) {
			$(".msgPerson").show();
			$(".msgTitle").html(data.msgTitle);
			$(".msgContent").html(data.msgContent);
			$(".msgTime").html(data.msgTime);
		}
	});
}
// 选中已读
function checkAll_Sys(e){
	if(e.checked){
		$("input[name='sysMail']").attr("checked","checked");
	}else{
		$("input[name='sysMail']").attr("checked",false);
	}
}
// 删除选中已读
function deleteMsg (obj) {
	$("#deleteMsg").attr("disabled",true);
	var stIdArray = [];
	$("input[name='sysMail']:checked").each(function(){
		stIdArray.push($(this).val());
	});
	if(stIdArray.length == 0){
		alert("请选择需要删除的内容");
		$("#deleteMsg").attr("disabled",false);
		return ;
	}
	if(!window.confirm("确定要删除吗?")){
	  $("#deleteMsg").attr("disabled",false);
		return; 
	}
	var ids = stIdArray.join(",");
	$.ajax({
		url: "http://120.76.203.19:8090/shzc_test/WEB-PC/app/deleteSysMails2.do",
		type: "get",
		data: {ids:ids},
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				initMsgCenters();
			} else {
				utils.alert(data.msg);
			}
			$("#deleteMsg").attr("disabled",false);
		}
	});
}

function readedSys(){
    $("#readedSys").attr("disabled",true);	
	var stIdArray = [];
	$("input[name='sysMail']:checked").each(function(){
		stIdArray.push($(this).val());
	});
	if(stIdArray.length == 0){
		alert("请选择要标记的内容");
		$("#readedSys").attr("disabled",false);
		return ;
	}
	if(!window.confirm("确定要将所选邮件标记为已读吗?")){
		 $("#readedSys").attr("disabled",false);
		return;
	}
	var ids = stIdArray.join(",");
	var param = {};
	param["http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/paramMap.ids"] = ids;
	param["http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/paramMap.type"]="readed";
	$.ajax({
		url: "http://120.76.203.19:8090/shzc_test/WEB-PC/app/updateSys2Readed2.do",
		type: "get",
		data: param,
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				initMsgCenters();
			} else {
				utils.alert(data.msg);
			}
			$("#readedSys").attr("disabled",false);
		}
	});
}

function unReadSys(){
   $("#unReadSys").attr("disabled",true);
	var stIdArray = [];
	$("input[name='sysMail']:checked").each(function(){
		stIdArray.push($(this).val());
	});
	if(stIdArray.length == 0){
		alert("请选择要标记的内容");
		$("#unReadSys").attr("disabled",false);
		return ;
	}
	if(!window.confirm("确定要将所选邮件标记为未读吗?")){
    	$("#unReadSys").attr("disabled",false);
		return;
	}
	var ids = stIdArray.join(",");
	var param = {};
	param["http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/paramMap.ids"] = ids;
	param["http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/paramMap.type"]="unread";
	$.ajax({
		url: "http://120.76.203.19:8090/shzc_test/WEB-PC/app/updateSys2UNReaded2.do",
		type: "get",
		data: param,
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				initMsgCenters();
			} else {
				utils.alert(data.msg);
			}
			$("#unReadSys").attr("disabled",false);
		}
	});
}

function weixin1() {
	$("#weixin").attr("style","background:url('src/images/wechart.jpg'/*tpa=http://120.76.203.19:8090/shzc_test/WEB-PC/scripts/src/images/wechart.jpg*/)left top /100% no-repeat;");
}

function weixin2() {
	$("#weixin").attr("style","background-position:left -1705px;");
}