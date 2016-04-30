<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="app" uri="/app-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="../commom/jsp/com_head.jsp"%>
<%@ include file="../commom/jsp/com_style.jsp"%>
<%@ include file="../commom/jsp/com_script.jsp"%>
</head>
<body class="commom_body">
	<div id="jquery_fn_Div"></div>
	<div style="width: 95%; min-width: 1000px">
		<div class="workflow_spit">
			<div id="${entityName?uncap_first}_title" class="workflow_spitTitle">${comment}</div>
		</div>
		<div class="workflow_handleArea">
			<!-- ${entityName?uncap_first} 查询 -->
			<div id="search_div" class="commomSearch_div">
				<input type="hidden" id="basePath" value="<%=basePath%>" />
				<form id="${entityName?uncap_first}_search_form">
					<table class="commom_center_table" style="font-size: 13px;">
					<#list searchColumns as column>
						<#if column_index % 2 == 0>
						<tr>
							<td class="commomSearch_showtd " style="text-align: right">
								<label>${column.comment}:</label>
							</td>
							<td>
								<#if column.javaType == 'Date'>
								<input name="query.${column.fieldName}" class="easyui-datebox" data-options="editable:false">
								<#elseif column.javaType == 'Byte' || column.javaType == 'Short' || column.javaType == 'Integer' || column.javaType == 'Long'>
								<input name="query.${column.fieldName}" class="easyui-numberbox" data-options="precision:0">
								<#elseif column.javaType == 'Double' || column.javaType == 'Float'>
								<input name="query.${column.fieldName}" class="easyui-numberbox" data-options="precision:2">
								<#else>
								<input name="query.${column.fieldName}">
								</#if>
							</td>
							<#if column_has_next>
							<td class="commomSearch_showtd " style="text-align: right">
								<label>${searchColumns[column_index+1].comment}:</label>
							</td>
							<td>
								<#if searchColumns[column_index+1].javaType == 'Date'>
								<input name="query.${searchColumns[column_index+1].fieldName}" class="easyui-datebox" data-options="editable:false">
								<#elseif searchColumns[column_index+1].javaType == 'Byte' || searchColumns[column_index+1].javaType == 'Short' || searchColumns[column_index+1].javaType == 'Integer' || searchColumns[column_index+1].javaType == 'Long'>
								<input name="query.${searchColumns[column_index+1].fieldName}" class="easyui-numberbox" data-options="precision:0">
								<#elseif searchColumns[column_index+1].javaType == 'Double' || searchColumns[column_index+1].javaType == 'Float'>
								<input name="query.${searchColumns[column_index+1].fieldName}" class="easyui-numberbox" data-options="precision:2">
								<#else>
								<input name="query.${searchColumns[column_index+1].fieldName}">
								</#if>								
							</td>								
							</#if>
						</tr>
						</#if>
					</#list>						
					    <tr>  
						    <td colspan="4" style="text-align: center;">
						    	<a style="margin-right: 20px;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="search-btn">查询</a>			
						    	<a style="margin-left: 20px;" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" id="reset-btn">重置</a>
						    </td>
		                </tr> 						
					</table>
				</form>
			</div>
			<!-- ${entityName?uncap_first} 新增/修改 -->
			<div id="edit_div" class="commomSearch_div" style="display:none;">
				<form id="${entityName?uncap_first}_edit_form">
					<!-- 主键 -->
					<#list columns as column>
					<#if column.primary>
					<input type="hidden" name="${entityName?uncap_first}.${column.fieldName}">
					</#if>
					</#list>
					<table class="commom_center_table" style="font-size: 13px;">
					<#list searchColumns as column>
						<#if column_index % 2 == 0>
						<tr>
							<td class="commomSearch_showtd " style="text-align: right">
								<label>${column.comment}:</label>
							</td>
							<td>
								<#if column.javaType == 'Date'>
								<input name="${entityName?uncap_first}.${column.fieldName}" class="easyui-datebox" data-options="editable:false">
								<#elseif column.javaType == 'Byte' || column.javaType == 'Short' || column.javaType == 'Integer' || column.javaType == 'Long'>
								<input name="${entityName?uncap_first}.${column.fieldName}" class="easyui-numberbox" data-options="precision:0">
								<#elseif column.javaType == 'Double' || column.javaType == 'Float'>
								<input name="${entityName?uncap_first}.${column.fieldName}" class="easyui-numberbox" data-options="precision:2">
								<#else>
								<input name="${entityName?uncap_first}.${column.fieldName}">
								</#if>								
							</td>
							<#if column_has_next>
							<td class="commomSearch_showtd " style="text-align: right">
								<label>${searchColumns[column_index+1].comment}:</label>
							</td>
							<td>
								<#if searchColumns[column_index+1].javaType == 'Date'>
								<input name="${entityName?uncap_first}.${searchColumns[column_index+1].fieldName}" class="easyui-datebox" data-options="editable:false">
								<#elseif searchColumns[column_index+1].javaType == 'Byte' || searchColumns[column_index+1].javaType == 'Short' || searchColumns[column_index+1].javaType == 'Integer' || searchColumns[column_index+1].javaType == 'Long'>
								<input name="${entityName?uncap_first}.${searchColumns[column_index+1].fieldName}" class="easyui-numberbox" data-options="precision:0">
								<#elseif searchColumns[column_index+1].javaType == 'Double' || searchColumns[column_index+1].javaType == 'Float'>
								<input name="${entityName?uncap_first}.${searchColumns[column_index+1].fieldName}" class="easyui-numberbox" data-options="precision:2">
								<#else>
								<input name="${entityName?uncap_first}.${searchColumns[column_index+1].fieldName}">
								</#if>									
							</td>								
							</#if>
						</tr>
						</#if>
					</#list>					
					    <tr>  
						    <td colspan="4" style="text-align: center;">
						    	<a style="margin-right: 20px;" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="save-btn">保存</a>			
						    	<a style="margin-left: 20px;" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" id="undo-btn">取消</a>
						    </td>
						   
		                </tr> 						
					</table>
				</form>
			</div>
			
			<div style="margin: 15px 0px 5px 5px;" id="tool-bar">			
			    <a class="easyui-linkbutton"  id="add-btn" data-options="iconCls:'icon-add'" >新增</a>
			    <a class="easyui-linkbutton"  id="edit-btn"	data-options="iconCls:'icon-edit'" >修改</a>
			    <a class="easyui-linkbutton"  id="remove-btn" data-options="iconCls:'icon-remove'" >删除</a>
				<a class="easyui-linkbutton"  id="export-btn" data-options="iconCls:'icon-export'">导出</a> 
			</div>
			<!-- ${entityName?uncap_first} 列表 -->
			<div style="margin-left: 5px; margin-right: 5px; margin-bottom: 10px;">
				<table id="${entityName?uncap_first}Table"></table>
			</div>
		</div>
	</div>
	<div id="loading" class="loadingDiv"></div>
	<%@ include file="../commom/jsp/com_scriptForUI.jsp"%>
	<script type="text/javascript" src="/scripts/lib/DateUtils.js"></script>
	<script type="text/javascript" src="/pages/${simpleModule}/js/${entityName?uncap_first}.js"></script>
</body>
</html>