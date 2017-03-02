(function(window) {
    var thisObj = null;
    var interval = null;
    HuiFuCert = function(token, toSign, signInputId) {
        if (!!!token || token === undefined) {
            this.tips("token参数不能为空");
            this.status = false;
            return;
        }
        if (!!!toSign || token === undefined) {
            this.tips("toSign参数不能为空");
            this.status = false;
            return;
        }
        if (!!!signInputId || signInputId === undefined) {
            this.tips("signInputId参数不能为空");
            this.status = false;
            return;
        }
        // 对象初始化结果状态：true: 初始化成功  ,false 失败
        this.status = true;
        // 可设置类属性值
        this.options = {};
        // 默认关闭调试
        this.options.debug = false;
        // 数字证书签名token
        this.token = token;
        // 待签名明文串
        this.toSign = toSign;
        // 签名后存放的隐藏域id
        this.signInputId = signInputId;
        // 自动刷新时间间隔（已弃用）
        this.autoRunTime = 1000;
        thisObj = this;
    };

    HuiFuCert.prototype.start = function() {
        if (this.status) {
            this.checkHasCerts();
        }
    };

    /*HuiFuCert.prototype.start = function(){
        if(this.status) {
            interval = setInterval(function(){
                thisObj.checkHasCerts();
            }, thisObj.autoRunTime);
        }
    };
    HuiFuCert.prototype.clearInterval = function(toSign){
        if(interval){
             // 当控件加载/安装完成后，取消定时对象
             this.debug("控件已加载/安装成功， 清除轮询任务");
            clearInterval(interval);
         }
    };*/

    /**
     * 校验是否安装证书助手及数字证书
     */
    HuiFuCert.prototype.checkHasCerts = function() {
        // 判断是否下载控件
        var active = thisObj.initActive();
        if (active != "inited") {
          // 如果控件未加载完成，就不执行
          //thisObj.tips("请先安装控件；安装成功后，请关闭当前页面或重启浏览器生效");
          return;
        }
        //this.clearInterval();

        thisObj.debug("执行用户证书校验");
        // 执行证书校验
        var token = thisObj.token;
        $.ajax({
            type: "GET",
            async: false,
            cache: false,
            //url : "${rc.contextPath}/ajax/requestUserCertsList",
            url: "/muser/ajax/requestUserCertsList",
            dataType: "json",
            data: {
                'token': token
            },
            success: function(response) {
                var code = response['code'];
                if (code == '000') {
                    var certsserver = response['certs'];
                    var found = thisObj.checkCertEffective(certsserver);
                    if (!found) {
                        //没有证书的情况下，申请证书
                        thisObj.debug("没有证书的情况下，申请证书");
                        thisObj.certRequest();
                    } else {
                        thisObj.debug("已有证书，开始签名");
                        var signInputId = thisObj.signInputId;
                        var signRes = thisObj.sign();
                        $("#" + signInputId).val(signRes);
                        //校验是否失效
                        if (thisObj.checkCertStatus()) {
                            thisObj.certRequestUpdate(thisObj.localCert.serialNumber());
                        }
                    }
                } else {
                    var desc = response['desc'];
                    thisObj.tips("查询用户证书列表请求失败，" + desc);
                }
            },
            error: function() {
                thisObj.tips("获取用户证书请求系统异常！");
            }
        });
    };

    /**
     * 校验是否安装数字证书助手，提示安装
     * @returns {String}
     */
    HuiFuCert.prototype.initActive = function() {
        if (this.active == "downloading") {
            // 表示已经该函数已经被调用并且正在下载 
            return this.active;
        }
        this.active = "start";
        try {
            TCA.config(config);
            this.active = "inited";
        } catch (e) {
            if (e instanceof TCACErr) {
                if (confirm('请点击确定下载数字证书助手，待下载并安装完成后重启浏览器继续进行交易。')) {
                    window.location.href = "http://vnetcdn-download.chinapnr.com/itrusweb/statics/download/天诚安信数字证书助手-3.2.0.2-20160706.exe";
                    this.active = "downloading";
                }
            }
        }
        return this.active;
    };

    //申请证书
    HuiFuCert.prototype.certRequest = function() {
        var token = thisObj.token;
        var certStore = thisObj.getSelectedCertStore();
        var csr = certStore.genCsr(TCA.RSA2048);
        var certReqBuf = csr.toBase64();
        $.ajax({
            type: "GET",
            async: false,
            cache: false,
            //url : "${rc.contextPath}/ajax/requestCert",
            url: "/muser/ajax/requestCert",
            dataType: "json",
            data: {
                'certReqBuf': certReqBuf,
                'token': token
            },
            success: function(response) {
                var code = response['code'];
                if (code == '000') {
                    var certSignBufP7 = response['p7'];
                    try {
                        // 根据服务器端的P7安装证书
                        var certificate = CertStore.installCert(certSignBufP7);
                        //certSn = certificate.serialNumber();
                        thisObj.debug('证书安装成功, 开始签名');
                        thisObj.localCert = certificate;
                        var signRes = thisObj.sign();

                        if (!!!signRes) {
                            thisObj.debug("数字证书加密失败：结果为空字符");
                            return;
                        }
                        // TODO 加密成功，显示提交按钮
                        // showSubmitBtn();
                        var signInputId = thisObj.signInputId;
                        $("#" + signInputId).val(signRes);
                    } catch (e) {
                        if (e instanceof TCACErr) {
                            thisObj.tips(e.toStr());
                        } else {
                            thisObj.tips("证书安装发生未知错误！");
                        }
                    }
                } else {
                    var desc = response['desc'];
                    thisObj.tips("证书请求失败，" + desc);
                }
            },
            error: function() {
                thisObj.tips("证书请求系统异常！");
            }
        });
    };

    /**
     * @param certSignData    后台接口参数
     * @param certSeriaNumber 后台接口参数
     * @param ajaxUrl  ajax更新证书请求地址  // ${rc.contextPath}/ajax/requestUpdateCert
     */
    HuiFuCert.prototype.certRequestUpdate = function(certSeriaNumber) {
        var token = thisObj.token;
        var cert = thisObj.localCert;
        var certStore = thisObj.getSelectedCertStore();
        var certReqBuf = certStore.genCsr(cert).toBase64();
        var certSignData = cert.signLogondata(certReqBuf);
        $.ajax({
            type: "post",
            async: false,
            cache: false,
            url: "/muser/ajax/requestUpdateCert",
            dataType: "json",
            data: {
                'certReqBuf': certReqBuf,
                'token': token,
                'certSignData': certSignData,
                'certSeriaNumber': certSeriaNumber
            },
            success: function(response) {
                var code = response['code'];
                if (code == '000') {
                    var certSignBufP7 = response['p7'];
                    try {
                        // 根据服务器端的P7安装证书
                        var certificate = CertStore.installCert(certSignBufP7);
                        //certSn = certificate.serialNumber();
                        thisObj.tips('证书更新成功');
                    } catch (e) {
                        if (e instanceof TCACErr) {
                            thisObj.tips(e.toStr());
                        } else {
                            thisObj.tips("证书更新发生未知错误！");
                        }
                    }
                } else {
                    var desc = response['desc'];
                    thisObj.tips("证书更新失败，" + desc);
                }
            },
            error: function() {
                thisObj.tips("证书更新系统异常！");
            }
        });
    };

    /**
     * 获取证书库
     * @returns
     */
    HuiFuCert.prototype.getSelectedCertStore = function() {
        try {
            var cur = CertStore.byName('RSA软证书');
            return cur;
        } catch (e) {
            if (e instanceof TCACErr) {
                thisObj.tips(e.toStr());
            } else {
                thisObj.tips("Here is Error !!!");
            }
        }
    };

    /**
     * 校验当前用户可用证书
     * @param certsserver
     * @returns {Boolean}
     */
    HuiFuCert.prototype.checkCertEffective = function(certsserver) {
        // var found = false;
        var certslocal = CertStore.listAllCerts(); //循环本地天威证书集合
        if (certslocal.size() > 0) {
            for (var i = 0; i < certslocal.size(); i++) {
                var certlocal = certslocal.get(i);
                var localSn = certlocal.serialNumber();
                for (var j = 0; j < certsserver.length; j++) {
                    var serverCert = certsserver[j];
                    var serverSn = serverCert.CertSeriaNumber;
                    //thisObj.debug("sn2: "+sn2);
                    if (localSn == serverSn) { //serialNumber相同,找到证书
                        //found = true;
                        thisObj.localCert = certlocal;
                        return true;
                    }
                }
            }
        }
        return false;
    };


    /**
     * 调用数字证书签名
     */
    HuiFuCert.prototype.sign = function() {
        try {

            //            var localCert = thisObj.localCert;
            //            //thisObj.debug("数字证书序列号: serialNumber "+localCert.serialNumber());
            //            thisObj.debug("签名明文串:"+ thisObj.toSign);
            //            var signRes =  localCert.signMessage(thisObj.toSign, false);
            //            return signRes;
            var cert = thisObj.localCert;
            var certStore = thisObj.getSelectedCertStore();
            var certReqBuf = certStore.genCsr(cert).toBase64();
            var certSignData = cert.signLogondata(certReqBuf);
            return certSignData;
        } catch (e) {
            thisObj.tips("数字证书加密失败");
        }
        return null;
    };
    /**
     * 校验数字证书是否需要更新
     */
    HuiFuCert.prototype.checkCertStatus = function() {
        var localCertStatus = false;
        var localCert = thisObj.localCert;
        var certLocalDate = localCert.notAfter();
        var localCertDate = new Date(formatCSTDate(certLocalDate, "yyyy-M-d")); //证书有效期
        var nowDate = new Date(formatCSTDate(new Date(), "yyyy-M-d"));
        if (nowDate >= localCertDate) {
            localCertStatus = true;
        }
        return localCertStatus;
    };
    HuiFuCert.prototype.tips = function(msg) {
        alert("提示：" + msg);
    };

    HuiFuCert.prototype.debug = function(msg) {
        if (this.options.debug) {
            alert("调试：" + msg);
        }
    };

    HuiFuCert.prototype.set = function(k, v) {
        this.options[k] = v;
    };

    HuiFuCert.prototype.get = function(k, v) {
        if (this.options[k]) {
            return this.options[k];
        }
        return v;
    };
    //格式化CST日期的字串
    function formatCSTDate(strDate, format) {
        return formatDate(new Date(strDate), format);
    }

    //格式化日期,
    function formatDate(date, format) {
        var paddNum = function(num) {
                num += "";
                return num.replace(/^(\d)$/, "0$1");
            }
            //指定格式字符
        var cfg = {
            yyyy: date.getFullYear() //年 : 4位
                ,
            yy: date.getFullYear().toString().substring(2) //年 : 2位
                ,
            M: date.getMonth() + 1 //月 : 如果1位的时候不补0
                ,
            MM: paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
                ,
            d: date.getDate() //日 : 如果1位的时候不补0
                ,
            dd: paddNum(date.getDate()) //日 : 如果1位的时候补0
                ,
            hh: date.getHours() //时
                ,
            mm: date.getMinutes() //分
                ,
            ss: date.getSeconds() //秒
        }
        format || (format = "yyyy-MM-dd hh:mm:ss");
        return format.replace(/([a-z])(\1)*/ig, function(m) {
            return cfg[m];
        });
    }

})(window);

$(function(){
  // 开始证书业务
  if($("#isPbcMoneyLimit").val() === 'Y'){
    var token = $("#token").val();
    var huiFuCert = new HuiFuCert(token, toSign.join(''), 'signStr');
    huiFuCert.start();
  }
})