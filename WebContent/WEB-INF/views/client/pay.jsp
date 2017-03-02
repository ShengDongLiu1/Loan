<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style media="screen"></style>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汇付天下</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="/Loan/js/pjjs/pay/style.css">
<link rel="shortcut icon" href="http://mertest.chinapnr.com/muser/favicon.ico">
<script src="/Loan/js/pjjs/pay/jquery-1.8.2.min.js"></script>
<script src="/Loan/js/pjjs/pay/pay_js1.js"></script>
<style type="text/css" adt="123"></style>
<style>
 .form-content .form-list .label{width: 125px;}
 .form-content .form-list .form-link{padding-left: 150px;}
 .form-content .form-btns{padding-left: 140px;}
 .form .result .result-content{padding-left: 105px}
</style>
<style>
	@font-face{
		font-family:uc-nexus-iconfont;
		src:url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_9qmmi8b8jsxxbt9.woff) format('woff'),url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_9qmmi8b8jsxxbt9.ttf) format('truetype')
	}
</style>
<script>

</script>
<style type="text/css">
	object,embed{          
	      -webkit-animation-duration:.001s;
	      -webkit-animation-name:playerInserted;
 		  -ms-animation-duration:.001s;
 		  -ms-animation-name:playerInserted;                
 		  -o-animation-duration:.001s;
 		  -o-animation-name:playerInserted;                
 		  animation-duration:.001s;animation-name:playerInserted;
 		  }                
 		  @-webkit-keyframes playerInserted{
 		  	from{opacity:0.99;}to{opacity:1;}
 		  }                
 		  @-ms-keyframes playerInserted{
 		  	from{opacity:0.99;}
 		  	to{opacity:1;}
 		  }                
 		  @-o-keyframes playerInserted{
 		  	from{opacity:0.99;}
 		  	to{opacity:1;}
 		  }                
 		  @keyframes playerInserted{
 		  	from{opacity:0.99;}
 		  	to{opacity:1;}
 		  }
</style>
</head>
<body class="w960">
  <div class="wrapper">
    <div class="min-width-out">
      <div class="min-width-in">
        <div class="min-width">
          <div class="main">
            <div class="content">
              <h1 class="page-title"></h1>
              <form action="http://mertest.chinapnr.com/muser/publicRequests/activeBidConfirm" method="post" id="activeBidConfirmForm" name="activeBidConfirmForm" class="validate-form errFocus" novalidate=""><input type="text" name="prevent_autofill" id="prevent_autofill" value="" style="display:none;"><input type="password" id="password_fake" value="" style="display:none;" pname="password_fake">
                <div class="form form-border mb30">
                  <div class="form-title form-title-big">
                    <p class="info mb15"><span>平台名称: 鸿金金融</span>
                    <span>公司名称: 鸿金金融运营有限公司</span></p>
                  </div>
                  <div class="form-content">
                  <!--账户余额开始-->
                    <dl class="form-list form-list-no-icon">
                      <dd>
                        <div class="form-group">
                          <label class="label">投资人:</label>
                          <span class="form-text">xxx</span>
                        </div>
                        <div class="form-group">
                          <label class="label">投标金额（元）:</label>
                          <span class="form-text">xxx</span>
                        </div>
                        <div class="form-group">
                          <label class="label">订单号:</label>
                          <span class="form-text">xxx</span>
                        </div>
                        <div class="form-group">
                          <label class="label">投标时间:</label>
                          <span class="form-text">xxx</span>
                        </div>
                      </dd>
                      <dd>
                        <div class="form-group">
                          <label class="label">账户可用余额（元）:</label>
                          <span class="form-text">xxx</span>
                        </div>
                        <div class="form-group">
                          <label class="label">汇付交易密码:</label>
                          <input type="password" class="form-unit" required="" maxlength="16" pname="transPwd">          
                          <label class="form-tips error required">
                            <div class="form-tips-content">
                              <p>汇付交易密码不能为空</p>
                            </div>
                          </label>
                          <a href="http://mertest.chinapnr.com/muser/password/transpwd/forgetTransPwd?&amp;MerCustId=6000060003321114&amp;UsrCustId=6000060004112605&amp;CmdId=InitiativeTender&amp;Version=20&amp;PageType=&amp;SourceId=00000007" class="form-link" target="_blank">忘记汇付交易密码？</a>
                        </div>
                        <div class="result result-warning">
                          <div class="result-content">
                            <p class="title">您正在使用汇付天下专属账户支付功能，您充分知晓交易对方信息及交易金额，并不可撤销地授权向汇付天下发出支付指令。<br>您应当对投资可能产生的风险有足够的承受能力。</p>
                          </div>
                        </div>
                      </dd>
                    </dl>
                    <div class="form-group form-btns">
                      <a href="javascript:;" class="btn btn-primary"><span>确定</span></a>
                      <input type="submit" class="btn-submit">
                    </div>
                  </div>
                </div>
              <input type="hidden" name="password_fake"><input type="hidden" name="transPwd"></form>
            </div>
          </div>
          <div class="secure-tips">
            <h2>汇付天下，全面保障您的资金安全<i></i></h2>
            <div class="content">
              <p>汇付天下P2P账户系统托管，是汇付天下为P2P行业量身定制的账户系统与支付服务系统。一方面，为P2P平台开发定制账户系统，提供系统外包运营服务；另一方面，为P2P平台提供支付和结算服务，帮助平台和用户实现充值、取现、资金划拨等服务；投资人资金划入虚拟账户后，平台无法触碰资金，避免了资金池模式。但是，我们对投资风险（包括但不限于平台或其他借款人违约）不承担任何责任，投资需谨慎。</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="push"></div>
  </div>
  <div class="min-width-out">
  <div class="min-width-in">
  <div class="footer min-width">
    <div class="content">
      汇付天下有限公司版权所有  Copyright © 2016 ChinaPnR All Right Reserved &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010402000137"><img src="/Loan/js/pjjs/pay/babhtb.png" style="absolute:middle;"> 沪公网安备 31010402000137号</a>
      <br>
      <a href="http://www.chinapnr.com/" target="_blank">关于汇付天下</a>
      <a href="http://www.chinapnr.com/security_01.html" target="_blank">安全保障</a>
      <a href="http://www.chinapnr.com/helpcenter.html" target="_blank">帮助中心</a>
      <a href="http://www.chinapnr.com/contactus.html" target="_blank">联系我们</a>
      <span class="phone">客服电话: <i>400 820 2819</i></span>
    </div>
  </div>
  <script src="/Loan/js/pjjs/pay/plugins.min.js"></script>
  <script src="/Loan/js/pjjs/pay/main.js"></script>
  <script>
    var conPath = '/muser';
    if(document.getElementById('isDepoBank') && document.getElementById('isDepoBank').value === 'Y'){
      document.getElementById('logo-extra-img').src = 'http://test.chinapnr.com/statics//common/images/bank/depo/'+document.getElementById('depoBankId').value+'.png';
      document.getElementById('logo-extra').style.display = 'inline-block';
    }
  </script>  </div>
  </div>
  <script src="/Loan/js/pjjs/pay/jsencrypt.js"></script>
  <script type="text/javascript" src="/Loan/js/pjjs/pay/itruslib"></script>
  <script type="text/javascript" src="/Loan/js/pjjs/pay/itruslib.js"></script>
  <script src="/Loan/js/pjjs/pay/cert.js"></script>
  <script type="text/javascript">
  var toSign = ["PAGEMD5EXTMUSER",$("#Version").val(),$("#MerCustId").val(),$("#OrdId").val(),$("#OrdDate").val(),
                $("#TransAmt").val(),$("#UsrCustId").val(),$("#PageType").val()]
  </script>
  <script>
    var pKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCp7nRzVJd2yMTmovNrZpF0zBK+U89HexVtgOVDi5kzeHgsrBuM7ZWznT2wET5UoGr7oVihMX9dtAeRVgIRt0pPicHqzMo4/tdEfP/1mPi1q7NJcLHC/L+l59PG+83jH0QWcsorWqttANJpA/qvg7jb9qYtpGxvkpf+648te+bFIQIDAQAB";
  </script>
  
<script type="text/javascript" src="/Loan/js/pjjs/pay/useragents.js"></script>
<!-- <script>
try{
  var t = jQuery;
  document.write("<script type='text/javascript' src='/muser/scripts/jQuery.md5.js'><\/script>");
}catch(e){
  document.write("<script type='text/javascript' src='/muser/scripts/zepto.md5.js'><\/script>");
}
</script> -->
<script type="text/javascript" src="/Loan/js/pjjs/pay/jQuery.md5.js"></script>
<script type="text/javascript" src="/Loan/js/pjjs/pay/postbe.js"></script>

<script>
try {
    initPostbeData("218.204.104.234","20","00000007"
                    ,"2017030210024437191120170302","6000060003321114","6000060004112605"
                    ,"http://192.168.0.206:9999","P2P","[source_id:00000000;source_id_source:null;user_id:null;usr_type:null;cert_id:null;card_id:null;bank_name:null;bank_prov:null;bank_area:null;failure_reason:null;]");
            var conPath='/muser';
            if(conPath!=null||conPath!=''){
             var path='/muser/ajax/sendPostUrl';
              javaSendUrl(path);
            }
} catch (e) {
    console.log(e);
}
</script>


</body>
</html>