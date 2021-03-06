﻿<%@page import="com.zhicloud.op.vo.SysGroupVO"%>
<%@page import="java.util.List"%>
<%@page import="com.zhicloud.op.app.propeties.AppProperties"%>
<%@page import="com.zhicloud.op.login.LoginInfo"%>
<%@page import="com.zhicloud.op.app.helper.LoginHelper"%>
<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String region = (String)request.getAttribute("region");
	String dataDiskMin = AppProperties.getValue("dataDiskMin","");
	String dataDiskMax = AppProperties.getValue("dataDiskMax","");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/popup.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/metro/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css" /> 

<div id="package_price_disk_add_dlg_container">

	<div id="package_price_disk_add_dlg" class="easyui-dialog" title="添加硬盘配置"
		style="width:500px; height:170px; padding:15px;"
		data-options="
			iconCls: 'icon-add',
			buttons: '#package_price_disk_add_dlg_buttons',
			modal: true,
			onMove:_package_price_disk_add_dlg_scope_.onMove,
			onClose: function(){
				$(this).dialog('destroy');
			},
			onDestroy: function(){
				delete _package_price_disk_add_dlg_scope_;
			}
		">
		<form id="package_price_disk_add_dlg_form" method="post">
			<input type="hidden" name="type" value="3"/>
			<input type="hidden" name="region" value="<%=region%>"/>
			<table border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td class="inputtitle"><img src="<%=request.getContextPath() %>/images/button_required_red_16_16.gif" width="12" height="12" alt="必填" />硬盘大小(G)：</td>
		      <td class="inputcont"><input class="textbox inputtext" type="text" style="width:180px;height:24px" id="disk" name="dataDisk" onblur="checkDisk()"/></td>
		      <td class="inputtip" id="tip-disk-add"><i>请输入硬盘大小(单位：GB)</i></td>
		    </tr>
		    
<!-- 		    <tr style="height:56px;"> -->
<%-- 		      <td class="inputtitle"><img src="<%=request.getContextPath() %>/images/button_required_red_16_16.gif" width="12" height="12" alt="必填" />价格：</td> --%>
<!-- 		      <td class="inputcont"><input class="textbox inputtext" type="text" style="width:180px;height:24px" id="price" name="price" onblur="checkPrice()"/></td> -->
<!-- 		      <td class="inputtip" id="tip-disk-price-add"><i>请输入价格</i></td> -->
<!-- 		    </tr> -->
		  </table>
		</form>
	</div>

	<div id="package_price_disk_add_dlg_buttons">
		<a href="javascript:" class="easyui-linkbutton" id="package_price_disk_add_dlg_save_btn"> &nbsp;保&nbsp;存&nbsp; </a>
		<a href="javascript:" class="easyui-linkbutton" id="package_price_disk_add_dlg_close_btn"> &nbsp;关&nbsp;闭&nbsp; </a>
	</div>
</div>

<script type="text/javascript">
var diskMin = "<%=dataDiskMin%>";
var diskMax = "<%=dataDiskMax%>";
var min = parseInt(diskMin);
var max = parseInt(diskMax);
//==================check begin==================
function checkDisk(){
	var disk = new String($("#disk").val()).trim(); 
	var diskValue = parseInt($("#disk").val());
	if(disk==null || disk==""){
		$("#tip-disk-add").html("<b>硬盘大小不能为空</b>");
		return false;		
	}
	if(!(/^[1-9][0-9]{0,4}?$/.test(disk))){
		$("#tip-disk-add").html("<b>硬盘大小应为最大五位的正整数</b>");
		return false;
	}
	if(diskMin>diskValue || diskValue>diskMax){
		$("#tip-disk-add").html("<b>硬盘大小超出设定范围["+diskMin+"-"+diskMax+"]GB</b>");
		return false;
	}
	$("#tip-disk-add").html("<img src='<%=request.getContextPath()%>/images/button_validated_green_16_16.gif' width='16' height='16' alt='正确' />");
	return true;
}
 

//====================check end================
var _package_price_disk_add_dlg_scope_ = new function(){
	
	var self = this;
	self.onMove = function(){
		var thisId = "#package_price_disk_add_dlg";
		var topValue = $(thisId).offset().top;
		var leftValue = $(thisId).offset().left;
		if(topValue==0){
			topValue = 30;
		}
		if(topValue<30){
			$(thisId).dialog('move',{
				left:leftValue,
				top:30
			});
			return;
		}
		if(leftValue>1315){
			$(thisId).dialog('move',{
				left:1300,
				top:topValue
			});
			return;
		}
		if(topValue>600){
			$(thisId).dialog('move',{
				left:leftValue,
				top:570
			});
			return;
		}
	};
	// 保存
	self.save = function() {
		var formData = $.formToBean(package_price_disk_add_dlg_form);
		ajax.remoteCall("bean://packageOptionService:addPackagePrice", 
			[ formData ],
			function(reply) {
				if (reply.status == "exception") {
					top.$.messager.alert('警告',reply.exceptionMessage,'warning');
				} else if (reply.result.status == "success") {
					var data = $("#package_price_disk_add_dlg_container").parent().prop("_data_");
					$("#package_price_disk_add_dlg").dialog("close");
					data.onClose(reply.result);
				} else {
					top.$.messager.alert('警告',reply.result.message,'warning');
				}
			}
		);
	};

	// 关闭
	self.close = function() {
		$("#package_price_disk_add_dlg").dialog("close");
	};

	//--------------------------
	
	// 初始化
	$(document).ready(function(){
		// 保存
		$("#package_price_disk_add_dlg_save_btn").click(function() {
			if(checkDisk()){
				self.save();
			}
		});
		// 关闭
		$("#package_price_disk_add_dlg_close_btn").click(function() {
			self.close();
		});
	});
};
</script>



