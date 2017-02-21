<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>资金管理</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
<script type="text/javascript" src="<%=path %>/js/toDate.js"></script>

<script type="text/javascript">
    var url;
    function searchUser() {
        $("#dg").datagrid('load', {
            "username" : $("#username").val()
        });
    }
   
</script>
</head>

<body style="margin: 1px">

    <table id="dg" title="资金管理" class="easyui-datagrid" fitColumns="true"
        pagination="true" rownumbers="true"
        url="${pageContext.request.contextPath}/capital/capitalPageList" fit="true"
        toolbar="#tb">
        <thead>
            <tr>
                <th field="cid"  checkbox="true"  width="50" align="center">编号</th>
                <th field="username" width="50" align="center">用户</th>
                <th field="allasset" width="50" align="center">资产总额</th>
                <th field="income" width="50" align="center">累计收入</th>
                <th field="expenditure" width="50" align="center">累计支出</th>
                <th field="collect" width="50" align="center">待收金额</th>
                <th field="available" width="50" align="center">可用金额</th>
                <th field="frozen" width="50" align="center">冻结金额</th>
                <th field="still" width="50" align="center">待还金额</th>
                <th field="ctime" width="50" align="center"  formatter="toDate">最近更新时间</th>
            </tr>
        </thead>
    </table>
    <div id="tb">
        <div>
            &nbsp;用户名：&nbsp;<input type="text" id="username" size="20"
                onkeydown="if(event.keyCode == 13)searchUser()" /> <a
                href="javascript:searchUser()" class="easyui-linkbutton"
                iconCls="icon-search" plain="true">查询</a>
        </div>
     </div>
</body>
</html>