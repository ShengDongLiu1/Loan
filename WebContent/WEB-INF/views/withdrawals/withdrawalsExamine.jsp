<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>提现审核</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
<script type="text/javascript" src="<%=path %>/js/toDate.js"></script>

<style type="text/css">

.easyui-textbox{width:10%;}

.dj:link{color:orange;}

.jd:link{color:green;}
</style>
<script>
$(function() {
	setPagination("list");
});
// 显示数据
function setPagination(tableId) {
	var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
	$(p).pagination({
		pageSize:20,
		pageList:[20,30,40],
		beforePageText:"第",
		afterPageText:"页    共{pages}页",
		displayMsg:"当前显示{from} - {to} 条记录    共{total}条记录",
		onBeforeRefresh:function() {
			$(this).pagination("loading");
			$(this).pagination("loaded");
		}
	});
}



//条件查询
	function seachs(){
		var username = $('#susername').textbox('getValue');
		var wnumber = $('#srealname').textbox('getValue');
		var wbank = $('#sidnumber').textbox('getValue');
		$('#list').datagrid('load',{  
			username:username,
			wnumber:wnumber,
			wbank:wbank
		}); 
	}
	
	//客户状态
	function cusState(value){
		var btn="";
		if(value == 1){
			btn="已通过";
		}else if(value == 2){
			btn="不通过";
		}else if(value == 3){
			btn="审核中";
		}
		return btn;
	}
	
	function toDate(obj){
		var date = new Date();
		 date.setTime(obj.time);
		 date.setHours(obj.hours);
		 date.setMinutes(obj.minutes);
		 date.setSeconds(obj.seconds);
		return formatDateTime(date);
	}
	
	/* 用户姓名 */
	function username(value){
		var btn="<a href='javascript:onCustomer("+value.uid+")'>"+value.username+"</a>";
		return btn;
	}
	
	/* 表格按钮 */
	function toSub(value,obj){
		var btn="";
		if(value=3){
			btn+="&nbsp;<a href='javascript:void(0);' onclick='save(1,"+obj.wid+");' >通过 </a>";
			btn+="&nbsp;<a href='javascript:void(0);' onclick='save(2,"+obj.wid+");' >不通过 </a>";
		}else if(value == 1){
			btn="已通过";
		}else if(value == 2){
			btn="不通过"
		}
		return btn;
	}
	
	function save(obj,wid){
		 $.post("<%=path %>/withdrawals/examine", {
             wstate : obj,wid : wid
         }, function(result) {
             if (result.success) {
                 $.messager.alert("系统提示", "审批成功！");
                 $("#list").datagrid("load");
             } else {
                 $.messager.alert("系统提示", "审批失败，请联系系统管理员！");
             }
         }, "json");
	}
</script>
</head>
<body>
	<table id="list" class="easyui-datagrid" toolbar="#kj" style="width:100%" data-options="
		url:'<%=path %>/withdrawals/withdrawalsExamine',
		method:'post',
		rownumbers:true,	
		singleSelect:true,
		autoRowHeight:true,
		pagination:true,
		border:false,
		pageSize:20,
		fit:true
	">
		<thead data-options="frozen:true">
			<tr>
				<th field="wid" checkbox="true">编号</th>
				<th field="customer" width="9%" align="center" formatter="username">用户名</th>
				<th field="wnumber" width="15%" align="center">提现账号</th>
				<th field="wbank" width="8%" align="center">提现银行</th>
				<th field="wmoney" width="14%" align="center">提现金额</th>
				<th field="wcounterfee" width="10%" align="center">提现手续费</th>
				<th field="wactual" width="8%" align="center">实际到账金额</th>
				<th field="wtime" width="15%" align="center" formatter="toDate">提现时间</th>
				<th field="wstate" width="8%" align="center" formatter="toSub">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- 菜单 -->
	<div id="kj" style="padding: 2px;">
		用户名：<input id="susername" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		提现账号：<input id="srealname" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		提现银行：<input id="sidnumber" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="seachs();">搜索</a>
	</div>
</body>
</html>