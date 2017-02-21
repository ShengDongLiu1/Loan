<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>入库列表</title>
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
$(function(){
	//setPagination("list");
/**	$(document).bind('contextmenu',function(e){	//给网页绑定右键菜单
		e.preventDefault();		//阻止浏览器的默认右键菜单
		$("#mm").menu('show',{
			left:e.pageX,	//鼠标右键的x坐标
			top:e.pageY		//鼠标右键的y坐标
		});
	});
*/
	function setPagination(tableid){
		var op=$("#"+tableid).datagrid("getPager");	//分页组件
		$(op).pagination({
			pageList:[10,15,20,25,30],
			beforePageText:"第",
			afterPageText:"页	共{pages}页",
			displayMsg:"当前显示{from}-{to}条记录 	共{total}条记录",
			onBeforRefresh:function(){
				$(this).pagination("loading");
				$(this).pagination("loaded");
			}
		});
	}
	$(function(){
		setPagination("list");
	});
	
	$("#list").datagrid({
		onRowContextMenu:function(e,rowIndex,rowData){
			e.preventDefault();
			$("#mm").menu('show',{
				left:e.pageX,
				top:e.pageY	
			});
		}
	});
	
	//双击
	$("#list").datagrid({   
		//rowIndex 是序号 row是json数据
	 	onDblClickRow:function(rowIndex,row){
	 		$.post("<%=path%>/goods/goodByid",{'gid':row.gid},function(index){
	 			$("#goodbyWin").dialog("open").dialog("setTitle", "客户订单详情");
			},"json");
	    }
	});
	
});


//条件查询
	function seachs(){
		var username = $('#susername').textbox('getValue');
		var realname = $('#srealname').textbox('getValue');
		var idnumber = $('#sidnumber').numberbox('getValue');
		var ustate = '${ustate}';
		//var ustate = $('#sustate').combobox('getValue');
		$('#list').datagrid('load',{  
			username:username,
			realname:realname,
			idnumber:idnumber,
			ustate:ustate
		}); 
	}
	
	//客户状态
	function cusState(value){
		var btn="";
		if(value == 1){
			btn="正常";
		}else if(value == 2){
			btn="已冻结";
		}
		return btn;
	}
	
	//操作按钮
	function upState(val,obj){
		var btn="";
		if(obj.ustate == 1){
			btn="<a href=\"#\" class=\"dj\" onclick=\"upCusSta(2,"+obj.uid+");\">冻结</a>";
		}else if(obj.ustate == 2){
			btn="<a href=\"#\" class=\"jd\" onclick=\"upCusSta(1,"+obj.uid+");\">解冻</a>";
		}
		return btn;
	}
	
	//执行修改状态操作
	function upCusSta(ustate,uid){
		$.post("<%=path%>/customer/upState",{'ustate':ustate,'uid':uid},function(index){
 			$.messager.alert('系统提示',index.result,'info');
 			$("#list").datagrid("reload");	//刷新表格
		},"json");
	}
</script>
</head>
<body>
	<table id="list" class="easyui-datagrid" toolbar="#kj" style="width:100%" data-options="
		url:'<%=path %>/customer/cusList',
		queryParams:{ustate:${ustate}},
		method:'post',
		rownumbers:true,	
		singleSelect:false,
		autoRowHeight:true,
		pagination:true,
		border:false,
		pageSize:20,
		fit:true
	">
		<thead data-options="frozen:true">
			<tr>
				<th field="uid" checkbox="true">编号</th>
				<th field="username" width="9%" align="center">用户名</th>
				<th field="realname" width="9%" align="center">真实姓名</th>
				<th field="sex" width="8%" align="center">性别</th>
				<th field="idnumber" width="14%" align="center">身份证号</th>
				<th field="phone" width="10%" align="center">电话号码</th>
				<th field="credit" width="8%" align="center">信用度</th>
				<th field="createtime" width="10%" align="center" formatter="jsonDateFormat">创建时间</th>
				<th field="information" width="13%" align="center">投资信息</th>
				<th field="ustate" width="8%" align="center" formatter="cusState">状态</th>
				<th field="caozuo" width="8%" align="center" formatter="upState">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- 菜单 -->
	<div id="kj" style="padding: 2px;">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="window.print();">打印</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-export1'" onclick="location.href='#'">导出</a>
		用户名：<input id="susername" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		真实姓名：<input id="srealname" class="easyui-validatebox easyui-textbox" data-options="required:false" />&nbsp;
		身份证号码：<input id="sidnumber" class="easyui-validatebox easyui-numberbox" data-options="required:false" />&nbsp;
		<!-- 状态：<select id="sustate" class="easyui-combobox" data-options="editable:false" style="width:10%">
			<option value=""> </option>
			<option value="1">正常</option>
			<option value="2">冻结</option>
		</select> -->
		&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="seachs();">搜索</a>
	</div>
	
	<!-- 自定义窗口按钮 -->
	<div id="ls-buttons">
		<a href="javascript:subRece()" class="easyui-linkbutton" iconCls="icon-ok">确认</a>
	    <a href="javascript:closeGoodWin()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>