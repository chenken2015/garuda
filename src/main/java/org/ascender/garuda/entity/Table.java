package org.ascender.garuda.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 表信息
 * @author 737878
 *
 */
public class Table {
	//用户名
	private String username;
	//表名
	private String tableName;
	//表类型
	private String tableType;
	//实体名
	private String entityName;
	//所属项目
	private String project;
	//所属模块,例如com.sf.module.ssv
	private String module;
	//模块简称,ssv
	private String simpleModule;
	//类注释
	private String comment;
	//excel模板名
	private String excelTpl;
	//主键序列
	private String sequence;
	//表结构
	private List<Column> columns;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getTableType() {
		return tableType;
	}
	public void setTableType(String tableType) {
		this.tableType = tableType;
	}
	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public List<Column> getColumns() {
		return columns;
	}
	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getExcelTpl() {
		return excelTpl;
	}
	public void setExcelTpl(String excelTpl) {
		this.excelTpl = excelTpl;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getSimpleModule() {
		return simpleModule;
	}
	public void setSimpleModule(String simpleModule) {
		this.simpleModule = simpleModule;
	}
	//获取查询表单
	public List<Column> getSearchColumns() {
		List<Column> searchColumns = new ArrayList<Column>();
		for(Column column : this.getColumns()){
			if(column.isSearch())
				searchColumns.add(column);
		}
		return searchColumns;
	}	
	//获取grid
	public List<Column> getGridColumns() {
		List<Column> gridColumns = new ArrayList<Column>();
		for(Column column : this.getColumns()){
			if(column.isGrid())
				gridColumns.add(column);
		}
		return gridColumns;
	}	
}
