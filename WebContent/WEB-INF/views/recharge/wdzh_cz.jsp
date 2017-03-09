<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>充值记录</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/theme.css">
</head>
<body>
	
	<table id="dg" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/recharge/queryAll.do',
		method:'post', 
		rownumbers:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		fit:true">
		<thead>
			<tr>
				<th field="rid" checkbox="true" width="100">编号</th>
				<th field="customer" width="150" align="center" formatter="username">用户名</th>
				<th field="rtype" align="center" width="110">充值类型</th>
				<th field="rserial" align="center" width="150">流水号</th>
				<th field="rmoney" align="center" width="80">充值金额</th>
				<th field="rcounterfee" align="center" width="80">费率</th>
				<th field="ractual" align="center" width="80">到账金额</th>
				<th field="rtime" width="120" align="center" formatter="toDate">充值时间</th>
				<th field="rstate" align="center"  width="100">状态</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<div class="header">
			<h1 class="page-title">
				充值记录
			</h1>
		</div>
		用户名：<input id="username" class="easyui-validatebox easyui-textbox" style="width:100px;"/>
		充值时间：<input id="rtime" class="easyui-datetimebox easyui-textbox" style="width:100px;"/>-
				<input id="rtime1" class="easyui-datetimebox easyui-textbox" style="width:100px;"/>
		状态：<select id="rstate" class="easyui-combobox" name="rstate" style="width:200px;">
				<option value="">全部</option>
				<option value="成功">成功</option>
				<option value="失败">失败</option>
			</select>
		<a href="javascript:selectfiltrate()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>

	
	<!-- <div id="dlg-buttons">
	    <a href="javascript:saveUser()" class="easyui-linkbutton"
	        iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
	        class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<div id="dlg" class="easyui-dialog"
            style="width: 730px;height:280px;padding:10px 10px;" closed="true"
            buttons="#dlg-buttons">
            <form method="post" id="fm">
                <table cellspacing="8px;">
                    <tr>
                        <td>姓名：</td>
                        <td><input id="tname" name="tname"
                            class="easyui-validatebox" required="true" />&nbsp;<span
                            style="color: red">*</span>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>性别：</td>
                        <td><input id="tsex" name="tsex"
                            class="easyui-validatebox" required="true" />&nbsp;<span
                            style="color: red">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td>绰号：</td>
                        <td><input id="tmes" name="tmes"
                            class="easyui-validatebox" required="true" />&nbsp;<span
                            style="color: red">*</span>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>时间：</td>
                        <td><input id="tdate" name="tdate"
                            class="easyui-datetimebox" required="true" />&nbsp;<span
                            style="color: red">*</span>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
 -->

	<script type="text/javascript">
		var url;
		$(function() {
			setPagination("list");
		});
		// 显示数据
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageSize:10,
				pageList:[10,20,30],
				beforePageText:"第",
				afterPageText:"页    共{pages}页",
				displayMsg:"当前显示{from} - {to} 条记录    共{total}条记录",
				onBeforeRefresh:function() {
					$(this).pagination("loading");
					$(this).pagination("loaded");
				}
			});
		}
		/* 将Thu Mar 19 2015 12:00:00 GMT+0800 (中国标准时间)转换为2015-3-19 12:00:00 */
		var formatDateTime = function (date) {  
		    var y = date.getFullYear();  
		    var m = date.getMonth() + 1;  
		    m = m < 10 ? ('0' + m) : m;  
		    var d = date.getDate();  
		    d = d < 10 ? ('0' + d) : d;  
		    var h = date.getHours();  
		    var minute = date.getMinutes();  
		    minute = minute < 10 ? ('0' + minute) : minute;
		    var s=date.getSeconds();
		    return y + '-' + m + '-' + d+'<br>'+h+':'+minute+':'+s;  
		};

		/* 将{"date":14,"day":3,"hours":19,"minutes"……}转换为Thu Mar 19 2015 12:00:00 GMT+0800 (中国标准时间) */
		function toDate(obj){
			var date = new Date();
			 date.setTime(obj.time);
			 date.setHours(obj.hours);
			 date.setMinutes(obj.minutes);
			 date.setSeconds(obj.seconds);
			return formatDateTime(date);
		}
		function username(value){
			var btn="<a href='javascript:onCustomer("+value.uid+")'>"+value.username+"</a>";
			return btn;
		}
		function selectfiltrate(){
	    	var username=$('#username').textbox('getValue');
	    	var rtime=$('#rtime').textbox('getValue');
	    	var rtime1=$('#rtime1').textbox('getValue');
	    	var rstate=$("#rstate").combobox('getValue')
	    	$('#dg').datagrid('load',{  
				username:username,
				rtime:rtime,
				rtime1:rtime1,
				rstate:rstate
			}); 
   	        $("#rstate").textbox('setValue',"");
   	        $("#username").textbox('setValue',"");
   	        $("#rtime").textbox('setValue',"");
   	        $("#rtime1").textbox('setValue',"");
	    	    
	    }
	    
	</script>
</body>
</html>