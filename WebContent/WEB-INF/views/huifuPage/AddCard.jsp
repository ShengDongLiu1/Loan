<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0050)http://mertest.chinapnr.com/muser/bankcard/addCard -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style media="screen"></style>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汇付天下</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="/Loan/css/huifucss/style.css">
<link rel="shortcut icon" href="http://mertest.chinapnr.com/muser/favicon.ico">
<script src="/Loan/js/huifujs/jquery-1.8.2.min.js.下载"></script>

</head>
<body class="w960">
  <div class="wrapper">
    <div class="min-width-out">
    <div class="min-width-in">
    <div class="min-width">
          <div class="header">
            <div class="content">
              <a href="http://www.chinapnr.com/" target="_blank" class="logo-new" title="汇付天下"></a>
            	<div id="logo-extra"><img id="logo-extra-img"></div>
            </div>
          </div>
      <div class="main">
        <div class="content">
          <h1 class="page-title">绑定取现银行卡<span> 该银行卡将作为利息发放及本金发放的银行卡</span></h1>
          <form method="post" action="<%=path %>/banktion/addbank" autocomplete="off" class="validate-form errFocus" novalidate=""><input type="text" name="prevent_autofill" id="prevent_autofill" value="" style="display:none;"><input type="password" id="password_fake" value="" style="display:none;" pname="password_fake">
                  <input type="hidden" name="loginId" id="loginId" value="pjzb_1223566788">
                  <input type="hidden" name="custId" value="6000060004112605">
                  <input type="hidden" name="merUsrName" value="普金资本运营(赣州)有限公司">
                  <input type="hidden" name="merShortName" value="普金资本">
                 
            <div class="form form-border mb30">
              <!--平台名称-->
              <div class="form-title form-title-big">
                <p class="info mb15"><span>平台名称: 普金资本</span>
                <span>公司名称: 普金资本运营(赣州)有限公司</span></p>
              </div>
              <div class="form-content">
              <!--账户余额开始-->
                <dl class="form-list form-list-no-icon">
                  <dd>
                    <div class="form-group">
                      <label class="label">真实姓名:</label>
                      <span class="form-text">${customer.realname }</span>
                    </div>
                    <div class="form-group">
                      <label class="label">证件号码:</label>
                      <span class="form-text">${customer.idnumber }</span>
                    </div>
                  </dd>
                  <dd>
                    <div class="form-group form-group-card">
                      <label class="label">所属银行:</label>
                      <div class="form-unit form-unit-action">
                        <div class="form-unit-info">
                          <b class="form-unit-icon" style="background-image: url(&quot;http://test.chinapnr.com/statics//common/images/bank/sml/ABC.png&quot;);"></b>
                          <span></span>
                          <i class="form-unit-action-arrow"></i>
                        </div>
                        <input type="hidden" name="bankId" required="" value="ABC" class="showBankId">
                      </div>
                      <label class="form-tips tip tip-card-city">
                        <div class="form-tips-content">
                          <div class="tips-content-short">
                          </div>
                          <div class="tips-content-long">
                            <div class="tips-list tips-list-bank">
                                    <a href="javascript:;" rel="ICBC" name="中国工商银行">
                                      <img src="../images/huifu/ICBC.png" width="114" height="34">
                                      <span>中国工商银行</span>
                                    </a>
                                    <a href="javascript:;" rel="ABC" name="中国农业银行" class="on">
                                      <img src="../images/huifu/ABC.png" width="114" height="34">
                                      <span>中国农业银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CMB" name="招商银行">
                                      <img src="../images/huifu/CMB.png" width="114" height="34">
                                      <span>招商银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CCB" name="中国建设银行">
                                      <img src="../images/huifu/CCB.png" width="114" height="34">
                                      <span>中国建设银行</span>
                                    </a>
                                    <a href="javascript:;" rel="BJRCB" name="北京农村商业银行">
                                      <img src="../images/huifu/BJRCB.png" width="114" height="34">
                                      <span>北京农村商业银行</span>
                                    </a>
                                    <a href="javascript:;" rel="BOC" name="中国银行">
                                      <img src="../images/huifu/BOC.png" width="114" height="34">
                                      <span>中国银行</span>
                                    </a>
                                    <a href="javascript:;" rel="BOCOM" name="交通银行">
                                      <img src="../images/huifu/BOCOM.png" width="114" height="34">
                                      <span>交通银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CEB" name="中国光大银行">
                                      <img src="../images/huifu/CEB.png" width="114" height="34">
                                      <span>中国光大银行</span>
                                    </a>
                                    <a href="javascript:;" rel="SDB" name="深圳发展银行">
                                      <img src="../images/huifu/SDB.png" width="114" height="34">
                                      <span>深圳发展银行</span>
                                    </a>
                                    <a href="javascript:;" rel="SPDB" name="浦东发展银行">
                                      <img src="../images/huifu/SPDB.png" width="114" height="34">
                                      <span>浦东发展银行</span>
                                    </a>
                                    <a href="javascript:;" rel="BCCB" name="北京银行">
                                      <img src="../images/huifu/BCCB.png" width="114" height="34">
                                      <span>北京银行</span>
                                    </a>
                                    <a href="javascript:;" rel="BOS" name="上海银行">
                                      <img src="../images/huifu/BOS.png" width="114" height="34">
                                      <span>上海银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CBHB" name="渤海银行">
                                      <img src="../images/huifu/CBHB.png" width="114" height="34">
                                      <span>渤海银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CIB" name="兴业银行">
                                      <img src="../images/huifu/CIB.png" width="114" height="34">
                                      <span>兴业银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CMBC" name="中国民生银行">
                                      <img src="../images/huifu/CMBC.png" width="114" height="34">
                                      <span>中国民生银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CZB" name="浙商银行">
                                      <img src="../images/huifu/CZB.png" width="114" height="34">
                                      <span>浙商银行</span>
                                    </a>
                                    <a href="javascript:;" rel="GDB" name="广发银行">
                                      <img src="../images/huifu/GDB.png" width="114" height="34">
                                      <span>广发银行</span>
                                    </a>
                                    <a href="javascript:;" rel="HXB" name="华夏银行">
                                      <img src="../images/huifu/HXB.png" width="114" height="34">
                                      <span>华夏银行</span>
                                    </a>
                                    <a href="javascript:;" rel="HZCB" name="杭州银行">
                                      <img src="../images/huifu/HZCB.png" width="114" height="34">
                                      <span>杭州银行</span>
                                    </a>
                                    <a href="javascript:;" rel="MINTAI" name="浙江民泰商业银行">
                                      <img src="../images/huifu/MINTAI.png" width="114" height="34">
                                      <span>浙江民泰商业银行</span>
                                    </a>
                                    <a href="javascript:;" rel="NJCB" name="南京银行">
                                      <img src="../images/huifu/NJCB.png" width="114" height="34">
                                      <span>南京银行</span>
                                    </a>
                                    <a href="javascript:;" rel="PINGAN" name="平安银行">
                                      <img src="../images/huifu/PINGAN.png" width="114" height="34">
                                      <span>平安银行</span>
                                    </a>
                                    <a href="javascript:;" rel="PSBC" name="中国邮政储蓄银行">
                                      <img src="../images/huifu/PSBC.png" width="114" height="34">
                                      <span>中国邮政储蓄银行</span>
                                    </a>
                                    <a href="javascript:;" rel="SRCB" name="上海农村商业银行">
                                      <img src="../images/huifu/SRCB.png" width="114" height="34">
                                      <span>上海农村商业银行</span>
                                    </a>
                                    <a href="javascript:;" rel="ZJTLCB" name="浙江泰隆商业银行">
                                      <img src="../images/huifu/ZJTLCB.png" width="114" height="34">
                                      <span>浙江泰隆商业银行</span>
                                    </a>
                                    <a href="javascript:;" rel="CITIC" name="中信银行">
                                      <img src="../images/huifu/CITIC.png" width="114" height="34">
                                      <span>中信银行</span>
                                    </a>
                              <!-- -->
                            </div>
                          </div>
                        </div>
                      </label>
                      <label class="form-tips error required">
                        <div class="form-tips-arrow"></div>
                        <div class="form-tips-content">
                          <p>所属银行不能为空</p>
                        </div>
                      </label>
                      <label class="form-tips okay active">&nbsp;</label>
                    </div>
                    <div class="form-group">
                      <label class="label">银行卡号:</label>
                        <input type="text" name="cardId" class="form-unit" required="" maxlength="32" value="6228480402564890018" match="bankCard" autocomplete="off">
                      <label class="form-tips tip tip-card-id">
                        <div class="form-tips-arrow"></div>
                        <div class="form-tips-content">
                          <div class="tips-content-long">
                            <p>请输入您的银行<b>储蓄卡</b>号，并确保此卡用以上身份证开户。</p>
                          </div>
                          <div class="tips-card-zoom" style="">6228 4804 0256 4890 018</div>
                        </div>
                      </label>
                      <label class="form-tips error required">
                        <div class="form-tips-arrow"></div>
                        <div class="form-tips-content">
                          <p>银行卡号不能为空</p>
                        </div>
                      </label>
                      <label class="form-tips error match">
                        <div class="form-tips-arrow"></div>
                        <div class="form-tips-content">
                          <p>银行卡号长度为10-32位数字</p>
                        </div>
                      </label>
                      <label class="form-tips error errorInfo">
                        <div class="form-tips-arrow"></div>
                        <div class="form-tips-content">
                          <p>银行卡号长度为10-32位数字</p>
                        </div>
                      </label>
                    </div>
                    
                    
                    <div class="form-group" style="margin-top:40px;">
                      <label class="label label-top">&nbsp;</label>
                      <label class="checkbox" for="Checkbox-1" style="width:175px;display:inline-block">
                        <input type="checkbox" name="cashFlag" id="Checkbox-1" value="D" checked="checked"> 将此卡设置为默认取现卡
                      </label>
                    </div>
                  </dd>
                </dl>
                <div class="form-group form-btns">
                  <a href="javascript:tj();" class="btn btn-primary"><span>确定</span></a>
                  <input type="submit" class="btn-submit">
                </div>
              </div>
            </div>
          <input type="hidden" name="password_fake"><input type="hidden" name="transPwd" value="IAHnEKC40WBE2tEQy/o6Kxel0rch645n59UIFwl5mftSCHRzKoT52FHSRzU4SQ1hRqRwG7j/MTcGG3wszSvIthdR0pQtq5JHKrg5Szmy0XJ4lhRBe1AmItdyCELzZklpMhV/yh/2ZOONDjT5EydwqSKwiXd1lSr4PPWG9ZmSTQo="></form>
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
      汇付天下有限公司版权所有  Copyright © 2016 ChinaPnR All Right Reserved &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010402000137"><img src="./汇付天下_files/babhtb.png" style="absolute:middle;"> 沪公网安备 31010402000137号</a>
      <br>
      <a href="http://www.chinapnr.com/" target="_blank">关于汇付天下</a>
      <a href="http://www.chinapnr.com/security_01.html" target="_blank">安全保障</a>
      <a href="http://www.chinapnr.com/helpcenter.html" target="_blank">帮助中心</a>
      <a href="http://www.chinapnr.com/contactus.html" target="_blank">联系我们</a>
      <span class="phone">客服电话: <i>400 820 2819</i></span>
    </div>
  </div>
  <script src="/Loan/js/huifujs/plugins.min.js.下载"></script>
  <script src="/Loan/js/huifujs/main.js.下载"></script>
  <script>
    var conPath = '/muser';
    if(document.getElementById('isDepoBank') && document.getElementById('isDepoBank').value === 'Y'){
      document.getElementById('logo-extra-img').src = 'http://test.chinapnr.com/statics//common/images/bank/depo/'+document.getElementById('depoBankId').value+'.png';
      document.getElementById('logo-extra').style.display = 'inline-block';
    }
  </script>  </div>
  </div>
  <script src="/Loan/js/huifujs/jsencrypt.js.下载"></script>
  <script>
    var pKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCp7nRzVJd2yMTmovNrZpF0zBK+U89HexVtgOVDi5kzeHgsrBuM7ZWznT2wET5UoGr7oVihMX9dtAeRVgIRt0pPicHqzMo4/tdEfP/1mPi1q7NJcLHC/L+l59PG+83jH0QWcsorWqttANJpA/qvg7jb9qYtpGxvkpf+648te+bFIQIDAQAB";
    var staticsRoot = 'http://test.chinapnr.com/statics/';
    var queryAreaByProvUrl = '/muser/ajax/queryAreaByProv';
  </script>
<script type="text/javascript" src="/Loan/js/huifujs/useragents.js.下载"></script>
<script>
try{
  var t = jQuery;
  document.write("<script type='text/javascript' src='/Loan/js/huifujs/jQuery.md5.js'><\/script>");
}catch(e){
  document.write("<script type='text/javascript' src=/Loan/js/huifujs/zepto.md5.js'><\/script>");
}

tj(){
	alert("提交");
}
</script><script type="text/javascript" src="/Loan/js/huifujs/jQuery.md5.js.下载"></script>
<script type="text/javascript" src=/Loan/js/huifujs/postbe.js.下载"></script>

<script>

    //    /muser/ajax/posebe
    //http://mobileservice.chinapnr.com/postbe
    //http://192.168.3.100:9819/muser/ajax/posebe


  //  if(supportUnload()){
//        window.addEventListener("onbeforeunload", smartSend, false);
//        window.addEventListener("onunload", smartSend, false);

       // window.onbeforeunload = function (e) {
       //     smartSend();
      //  };
     //  window.onunload = function (e) {
     //       smartSend();
      // };
     
            var conPath='/muser';
            if(conPath!=null||conPath!=''){
             var path='/muser/ajax/sendPostUrl';
              javaSendUrl(path);
            }
     
           
        
       // setTimeout('smartSend()',1000*60*30);
   // }else{
     //   sendPostbe('NA');
    //}
</script>


</body></html>