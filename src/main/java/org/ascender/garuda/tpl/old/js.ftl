$(function(){
	//search
	$('#search-btn').click(function(){
		var param = $('#${entityName?uncap_first}_search_form').serializeJson();
		$('#${entityName?uncap_first}Table').datagrid('load',param);
	});
	
	//reset
	$('#reset-btn').click(function(){
		$('#${entityName?uncap_first}_search_form').form('reset');
	});
	
	//save
	$('#save-btn').click(function(){
		var ${entityName?uncap_first} = $('#${entityName?uncap_first}_edit_form').serializeJson();
		$.ajax({
			cache:false,
			async:true,
			type:'post',
			dataType:'json',
			data:${entityName?uncap_first},
			url:'/${simpleModule}/${entityName?uncap_first}_save${entityName}.action',
			success:function(data){
				$('#${entityName?uncap_first}Table').datagrid('reload');
				$('#undo-btn').click();
			},
			error:function(){
				$.messager.alert('提示','保存失败')
			}
		});	
	});
	
	//undo
	$('#undo-btn').click(function(){
		$('#${entityName?uncap_first}_edit_form').form('clear');
		$('#edit_div').hide();
		$('#search_div').show();
		$('#${entityName?uncap_first}_title').html('${comment}');	
	});
	
	//add
	$('#add-btn').click(function(){
		$('#edit_div').show();
		$('#search_div').hide();
		$('#${entityName?uncap_first}_title').html('${comment}'+'-新增');
	});
	
	//edit
	$('#edit-btn').click(function(){
		var rows = $('#${entityName?uncap_first}Table').datagrid('getSelections');
		if(rows == null || rows.length != 1){
			$.messager.alert('提示','请选中一行进行修改')
			return;
		}
		var obj = {};
		for(var p in rows[0])
			obj['${entityName?uncap_first}.'+p]=rows[0][p];
		$('#${entityName?uncap_first}_edit_form').form('load',obj);
		$('#edit_div').show();
		$('#search_div').hide();
		$('#${entityName?uncap_first}_title').html('${comment}'+'-编辑');	
	});
	
	//delete
	$('#remove-btn').click(function(){
		var rows = $('#${entityName?uncap_first}Table').datagrid('getSelections');
		if(rows == null || rows.length == 0){
			$.messager.alert('提示','请选中一行进行删除')
			return;
		}
		var ids = [];
		for(var i = 0; i < rows.length; i++){
			var row = rows[i];
			ids.push(row[<#list columns as column><#if column.primary>'${column.fieldName}'</#if></#list>]);
		}
		ids = ids.join(',');
		// delete by ids
		$.ajax({
			cache:false,
			async:true,
			type:'post',
			dataType:'json',
			data:{ids:ids},
			url:'/${simpleModule}/${entityName?uncap_first}_delete${entityName}s.action',
			success:function(data){
				$('#${entityName?uncap_first}Table').datagrid('reload');
			},
			error:function(){
				$.messager.alert('提示','删除失败')
			}
		});				
	});
	
	//export
	$('#export-btn').click(function(){
		var form = $("#${entityName?uncap_first}_edit_form");
		form.attr('method','post');
		form.attr('action','/${simpleModule}/${entityName?uncap_first}_export.action');
		form.submit();		
	});	
			
	//${entityName?uncap_first} grid
	$('#${entityName?uncap_first}Table').datagrid({
		title: "${comment}",
		url:'/${simpleModule}/${entityName?uncap_first}_findPageBy${entityName}.action',
		height:333,
		pagination:true,
		singleSelect:false,
		fitColumns:false,
		columns:[[
		<#list columns as column>
			<#if column.primary>
			{field:'${column.fieldName}',title:'',checkbox:true},
			</#if>
		</#list>
		<#list gridColumns as column>
			<#if column_has_next>
				<#if column.javaType=='Date'>
			{field:'${column.fieldName}',title:'${column.comment}',width:100,align:'center',formatter:function(val,row){
				if(val) return val.replace('T',' ');
			}},
				<#else>
			{field:'${column.fieldName}',title:'${column.comment}',width:100,align:'center'},	
				</#if>
			<#else>
				<#if column.javaType=='Date'>
			{field:'${column.fieldName}',title:'${column.comment}',width:100,align:'center',formatter:function(val,row){
				if(val) return val.replace('T',' ');
			}}
				<#else>
			{field:'${column.fieldName}',title:'${column.comment}',width:100,align:'center'}
				</#if>
			</#if>
		</#list>
		]]
	});	
});