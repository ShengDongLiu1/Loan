<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0070)http://mertest.chinapnr.com/cash/cashier/charge/desktop/showPayChannel -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style media="screen"></style>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汇付天下</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon" href="http://mertest.chinapnr.com/cash/favicon.ico">
<link rel="stylesheet" href="/Loan/css/huifucss/style.css">
<script src="/Loan/js/huifujs/jquery-1.8.2.min.js"></script><style type="text/css" adt="123"></style><style>@font-face{font-family:uc-nexus-iconfont;src:url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_9qmmi8b8jsxxbt9.woff) format('woff'),url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_9qmmi8b8jsxxbt9.ttf) format('truetype')}</style>
<script>doAdblock();
function doAdblock(){
    (function() {
        function A() {}
        A.prototype = {
            rules: {
                /*youku_loader: {
                 find: /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/loaders?[^\.]*\.swf/,
                 replace: "http://2016.adtchrome.com/loader.swf"
                 },
                 youku_player: {
                 find: /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/(q?player[^\.]*|\w{13})\.swf/,
                 replace: "http://2016.adtchrome.com/player.swf"
                 },*/
                'pps_pps': {
                    'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/pps_flvplay_s\.swf/,
                    'replace': 'http://swf.adtchrome.com/pps_20140420.swf'
                },
                /*'iqiyi_1': {
                 'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/.+\.swf$/,
                 'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
                 },
                 'iqiyi_2': {
                 'find': /^http:\/\/www\.iqiyi\.com\/common\/flashplayer\/\d+\/.+\.swf$/,
                 'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
                 },*/
                'ku6': {
                    'find': /^http:\/\/player\.ku6cdn\.com\/default\/.*\/\d+\/(v|player|loader)\.swf/,
                    'replace': 'http://swf.adtchrome.com/ku6_20140420.swf'
                },
                'ku6_topic': {
                    'find': /^http:\/\/player\.ku6\.com\/inside\/(.*)\/v\.swf/,
                    'replace': 'http://swf.adtchrome.com/ku6_20140420.swf?vid=$1'
                },
                'sohu': {
                    'find':/http:\/\/(tv\.sohu\.com\/upload\/swf\/(?!(ap|56)).*\d+|(\d+\.){3}\d+(:\d+)?\/(web|test)player)\/(Main|PlayerShell)[^\.]*\.swf/,
                    'replace': "http://adtchrome.b0.upaiyun.com/sohu_live.swf"
                },
                /*'sohu2':{
                 'find':/^http:\/\/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/testplayer\/Main0?\.swf/,
                 'replace':'http://www.adtchrome.com/sohu/sohu_20150104.swf'
                 },
                 'sohu_share': {
                 'find': /^http:\/\/share\.vrs\.sohu\.com\/my\/v\.swf&/,
                 'replace': 'http://www.adtchrome.com/sohu/sohu_20150104.swf?'
                 },
                 'sohu_sogou' : {
                 'find': /^http:\/\/share\.vrs\.sohu\.com\/(\d+)\/v\.swf/,
                 'replace': 'http://www.adtchrome.com/sohu/sohu_20150104.swf?vid=$1'
                 },
                 'letv': {
                 'find': /^http:\/\/player\.letvcdn\.com\/.*p\/.*\/newplayer\/LetvPlayer\.swf/,
                 'replace': 'http://swf.adtchrome.com/20150110_letv.swf'
                 },
                 'letv_topic': {
                 'find': /^http:\/\/player\.hz\.letv\.com\/hzplayer\.swf\/v_list=zhuanti/,
                 'replace': 'http://swf.adtchrome.com/20150110_letv.swf'
                 },
                 'letv_duowan': {
                 'find': /^http:\/\/assets\.dwstatic\.com\/video\/vpp\.swf/,
                 'replace': 'http://yuntv.letv.com/bcloud.swf'
                 },*/
                '17173_in':{
                    'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/PreloaderFile(Customer)?\.swf/,
                    'replace':"http://swf.adtchrome.com/17173_in_20150522.swf"
                },
                '17173_out':{
                    'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/PreloaderFileFirstpage\.swf/,
                    'replace':"http://swf.adtchrome.com/17173_out_20150522.swf"
                },
                '17173_live':{
                    'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/Player_stream(_firstpage)?\.swf/,
                    'replace':"http://swf.adtchrome.com/17173_stream_20150522.swf"
                },
                '17173_live_out':{
                    'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/Player_stream_(custom)?Out\.swf/,
                    'replace':"http://swf.adtchrome.com/17173.out.Live.swf"
                }
            },
            _done: null,
            get done() {
                if(!this._done) {
                    this._done = new Array();
                }
                return this._done;
            },
            addAnimations: function() {
                var style = document.createElement('style');
                style.type = 'text/css';
                style.innerHTML = 'object,embed{\
                -webkit-animation-duration:.001s;-webkit-animation-name:playerInserted;\
                -ms-animation-duration:.001s;-ms-animation-name:playerInserted;\
                -o-animation-duration:.001s;-o-animation-name:playerInserted;\
                animation-duration:.001s;animation-name:playerInserted;}\
                @-webkit-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                @-ms-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                @-o-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                @keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}';
                document.getElementsByTagName('head')[0].appendChild(style);
            },
            animationsHandler: function(e) {
                if(e.animationName === 'playerInserted') {
                    this.replace(e.target);
                }
            },
            replace: function(elem) {
                if (/http:\/\/v.youku.com\/v_show\/.*/.test(window.location.href)){
                    var tag = document.getElementById("playerBox").getAttribute("player")
                    if (tag == "adt"){
                        console.log("adt adv")
                        return;
                    }
                }
                if(this.done.indexOf(elem) != -1) return;
                this.done.push(elem);
                var player = elem.data || elem.src;
                if(!player) return;
                var i, find, replace = false;
                for(i in this.rules) {
                    find = this.rules[i]['find'];
                    if(find.test(player)) {
                        replace = this.rules[i]['replace'];
                        if('function' === typeof this.rules[i]['preHandle']) {
                            this.rules[i]['preHandle'].bind(this, elem, find, replace, player)();
                        }else{
                            this.reallyReplace.bind(this, elem, find, replace)();
                        }
                        break;
                    }
                }
            },
            reallyReplace: function(elem, find, replace) {
                elem.data && (elem.data = elem.data.replace(find, replace)) || elem.src && ((elem.src = elem.src.replace(find, replace)) && (elem.style.display = 'block'));
                var b = elem.querySelector("param[name='movie']");
                this.reloadPlugin(elem);
            },
            reloadPlugin: function(elem) {
                var nextSibling = elem.nextSibling;
                var parentNode = elem.parentNode;
                parentNode.removeChild(elem);
                var newElem = elem.cloneNode(true);
                this.done.push(newElem);
                if(nextSibling) {
                    parentNode.insertBefore(newElem, nextSibling);
                } else {
                    parentNode.appendChild(newElem);
                }
            },
            init: function() {
                var handler = this.animationsHandler.bind(this);
                document.body.addEventListener('webkitAnimationStart', handler, false);
                document.body.addEventListener('msAnimationStart', handler, false);
                document.body.addEventListener('oAnimationStart', handler, false);
                document.body.addEventListener('animationstart', handler, false);
                this.addAnimations();
            }
        };
        new A().init();
    })();
}
// 20140730
(function cnbeta() {
    if (document.URL.indexOf('cnbeta.com') >= 0) {
        var elms = document.body.querySelectorAll("p>embed");
        Array.prototype.forEach.call(elms, function(elm) {
            elm.style.marginLeft = "0px";
        });
    }
})();
//baidu
//display: inline !important; visibility: visible !important;
//display:block !important;visibility:visible !important; display:block !important;visibility:visible !important
if(document.URL.indexOf('www.baidu.com') >= 0){
    if(document && document.getElementsByTagName && document.getElementById && document.body){
        var a = function(){
            Array.prototype.forEach.call(document.body.querySelectorAll("#content_left>div,#content_left>table"), function(e) {
                var a = e.getAttribute("style");
                if(a && /display:(table|block)\s!important/.test(a)){
                    e.parentNode.removeChild(e)
                }
            });
        };
        a();
        var MutationObserver = window.MutationObserver ||  window.WebKitMutationObserver || window.MozMutationObserver;
        var callback = function(records) {
            records.map(function(record) {
                console.log('block baidu')
                a();
            });
        };
        var mo = new MutationObserver(callback);
        mo.observe(document.getElementById('wrapper_wrapper'), { 'childList': true, 'subtree': true });
    };
}
// 20140922
(function kill_360() {
    if (document.URL.indexOf('so.com') >= 0) {
        document.getElementById("e_idea_pp").style.display = none;
    }
})();
//解决腾讯视频列表点击无效
if(document.URL.indexOf("v.qq.com") >= 0){
    if (document.getElementById("mod_videolist")){
        var listBox = document.getElementById("mod_videolist")
        var list = listBox.getElementsByClassName("list_item")
        for (i = 0;i < list.length;i++){
            list[i].addEventListener("click", function() {
                var url = this.getElementsByTagName("a")[0]
                url = url.getAttribute("href")
                var host = window.location.href
                url = host.replace(/cover\/.*/,url)
                window.location.href = url
            })
        }
    }
}
if (document.URL.indexOf("tv.sohu.com") >= 0){
    if (document.cookie.indexOf("fee_status=true")==-1){document.cookie='fee_status=true'};
}
if (document.URL.indexOf("56.com") >= 0){
    if (document.cookie.indexOf("fee_status=true")==-1){document.cookie='fee_status=true'};
}
if(/v\.youku\.com\/v_show\/id/.test(document.URL)){
    document.getElementById('module_basic_playarea').style.paddingBottom = '40px';
    document.getElementById('vpactionv5_wrap').style.position = 'absolute';
    document.getElementById('vpactionv5_wrap').style.top = '50px'
}
</script><style type="text/css">object,embed{                -webkit-animation-duration:.001s;-webkit-animation-name:playerInserted;                -ms-animation-duration:.001s;-ms-animation-name:playerInserted;                -o-animation-duration:.001s;-o-animation-name:playerInserted;                animation-duration:.001s;animation-name:playerInserted;}                @-webkit-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}                @-ms-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}                @-o-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}                @keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}</style></head>
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
          <h1 class="page-title">支付</h1>
          <form action="http://mertest.chinapnr.com/cash/cashier/charge/desktop/routingPayChannel" method="post" name="chargeVoForm" id="chargeVoForm" class="errFocus">
              <input type="hidden" name="sysId" value="MUSER">
              <input type="hidden" name="merCustId" value="6000060003321114" id="merCustId">
              <input type="hidden" name="usrCustId" value="6000060004112605" id="usrCustId">
              <input type="hidden" name="ordId" value="0001103472">
              <input type="hidden" name="ordDate" value="20170223">
              <input type="hidden" name="subAcctId" value="MDT000001">
              <input type="hidden" name="acctType" value="MERDT">
              <input type="hidden" name="chargeAmt" value="213.00">
              <input type="hidden" name="merPriv" value="Version=10|CmdId=NetSave|MerCustId=6000060003321114|UsrCustId=6000060004112605|TransAmt=213.00|OrdId=0001103472|OrdDate=20170223">
              <input type="hidden" name="retUrl" value="http://mertest.chinapnr.com/muser/result/b2csave">
              <input type="hidden" name="bgRetUrl" value="">
              <input type="hidden" name="operId" value="000001">
              <input type="hidden" name="loginId" value="pjzb_1223566788">
              <input type="hidden" name="pageType" value="">
              <input type="hidden" name="orgOrdId" value="20170223150226393557">
              <input type="hidden" name="checkValue" value="d391bc5d4151dd3415fb941d8fcabc49">
              <input type="hidden" name="routeSysId" value="">
              <input type="hidden" name="veriRuleId" value="">
              <input type="hidden" name="payRuleId" value="">
              <input type="hidden" name="usrQpAuth" value="Y">
              <input type="hidden" name="SourceId" value="00000032">
              <!--设置商户是否存管银行标识和存管行简称-->
              <input type="hidden" name="isDepoBank" id="isDepoBank" value="N">
              <input type="hidden" name="depoBankId" id="depoBankId" value="">
              <input type="hidden" name="chargeTimeStamp" value="1487833347034">
              <input type="hidden" name="verifySeqId" value="">
              <input type="hidden" id="p2pSaveId" name="p2pSaveId" value="201702230001103472">
              <input type="hidden" name="chargeFeeObj" value="">
              <input type="hidden" id="isQpCashSupport" name="isQpCashSupport" value="N">
              <input type="hidden" id="payType" name="payType" value="">
              <input type="hidden" id="collCustId" name="collCustId" value="">
              <input type="hidden" id="transPayAmt" name="transPayAmt" value="">
              <input type="hidden" id="forwordQpBp" name="forwordQpBp" value="false">
              <input type="hidden" id="isFrzPayAmt" name="isFrzPayAmt" value="">  
              <input type="hidden" id="cmdId" name="cmdId" value="NetSave">  
              <input type="hidden" id="AccountReformSwitch" name="AccountReformSwitch" value="">  
              <input type="hidden" id="Version" name="Version" value="10">  
              <input type="hidden" id="transName" name="transName" value="">
              <input type="hidden" id="transFeeName" name="transFeeName" value="">
              <input type="hidden" id="transObj" name="transObj" value="">            <input type="hidden" name="gateBusiId" value="">
            <input type="hidden" name="gateBankId" value="">
            <input type="hidden" name="dcFlag" value="">
            <input type="hidden" name="bankId" value="">
            <input type="hidden" name="cardId" value="">
            <input type="hidden" name="IsDepoBank" value="N">
			<input type="hidden" name="AccountReformSwitch" value="">
			<input type="hidden" name="Version" value="10">

            <div class="form form-border mb30">
              <!--平台名称-->
              <div class="form-title form-title-big">
                <p class="info mb15"><span>平台名称:普金资本</span>
                <span>公司名称: 普金资本运营(赣州)有限公司</span></p>
                <p class="info"><span>汇付账号：pjzb_1223566788</span></p>
              </div>
              <!--end-->
              <div class="form-content">
                <!--账户余额开始-->
                <dl class="form-list form-list-no-icon">
                  <dd>
                    	<div class="form-group">
	                      <label class="label">支付金额:</label>
	                      <input id="chargeAmt" name="chargeAmt" type="hidden" value="213.00">
	                      <span class="form-text"><i class="form-money">${money }</i> 元</span>
	                    </div>
                  </dd>
                  <dd>
                    <a class="recharge-type recharge-bank recharge-type-on" href="javascript:;">
                      <i></i>
                      <h2>网银支付</h2>
                    </a>
                  </dd>
                  <dd>
                    <div class="recharge-type-div" style="height: auto;">
                      <p>个人网银：</p>
                        <div class="bank-list">
                            <select id="rbank" name="rbank">
			                </select>
                        </div>
                      <p>&nbsp;</p>
                    </div>
                  </dd>
                </dl>
                <!--确定按钮-->
                <div class="form-btns form-btns-nopadding">
                  <a href="javascript:article_edit('${id}');" class="btn btn-primary"><span>登录到网上银行支付</span></a>
                </div>
                <!--end-->
              </div>
            </div>
          </form>
        </div>
      </div>
<div class="secure-tips mb30">
  <h2>汇付天下，全面保障您的资金安全<i></i></h2>
  <div class="content">
    <p>汇付天下P2P账户系统托管，是汇付天下为P2P行业量身定制的账户系统与支付服务系统。一方面，为P2P平台开发定制账户系统，提供系统外包运营服务；另一方面，为P2P平台提供支付和结算服务，帮助平台和用户实现充值、取现、资金划拨等服务；投资人资金划入虚拟账户后，平台无法触碰资金，避免了资金池模式。但是，我们对投资风险（包括但不限于平台或其他借款人违约）不承担任何责任，投资需谨慎。</p>
  </div>
</div>    </div>
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
  <script src="/Loan/js/huifujs/plugins.min.js"></script>
  <script src="/Loan/js/huifujs/main.js"></script>
  <!--<script src="http://192.168.31.236:8004/v3/script/main.js"></script>-->
  <script>
  jQuery(document).ready(function() {
		$.post("<%=path%>/recharge/queryBank.do",function(data){
			var uu=$("#rbank");
			var str="";
			for(var o in data) {
				str += '<option value="'+data[o].bcardnumber+'||'+data[o].baccount+'">'+data[o].baccount+'</option>';
			}
			uu.append(str);
		});
	});
	function article_edit(id){
		var rbank=$("#rbank").val();
		alert(rbank+"++++");
		$.post("<%=path%>/recharge/update?rid="+id+"&rbank="+rbank,
			function(data){
				if(data.result=="fail"){
					/* alert(data.errorMsg); */
				}else if(data.result=="seccuss"){
					window.location.href="<%=path %>/index.jsp"; 
				}
		})
	}
  </script>  
<script type="text/javascript" src="/Loan/js/huifujs/useragents.js"></script>
<script type="text/javascript" src="/Loan/js/huifujs/jQuery.md5.js"></script>
<script type="text/javascript" src="/Loan/js/huifujs/postbe.js"></script>

</body></html>