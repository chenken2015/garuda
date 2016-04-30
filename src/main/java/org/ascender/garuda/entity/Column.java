package org.ascender.garuda.entity;

/**
 * 列信息
 * @author 737878
 *
 */
public class Column {
	//列名
	private String columnName; 
	//属性名
	private String fieldName;
	//数据库类型
	private String dbType;
	//字段长度,hibernate配置需要
	private String columnSize;
	//小数位,hibernate配置需要
	private String precision;
	//属性类型,例如Long
	private String javaType;
	//属性类全名,例如,java.lang.Long
	private String fullJavaType;
	//注释
	private String comment;
	//是否主键
	private boolean primary;
	//是否表单查询
	private boolean search;
	//是否列表
	private boolean grid;
	
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getDbType() {
		return dbType;
	}
	public void setDbType(String dbType) {
		this.dbType = dbType;
	}
	public String getJavaType() {
		return javaType;
	}
	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}
	public boolean isPrimary() {
		return primary;
	}
	public void setPrimary(boolean primary) {
		this.primary = primary;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public boolean isSearch() {
		return search;
	}
	public void setSearch(boolean search) {
		this.search = search;
	}
	public String getFullJavaType() {
		return fullJavaType;
	}
	public void setFullJavaType(String fullJavaType) {
		this.fullJavaType = fullJavaType;
	}
	public String getColumnSize() {
		return columnSize;
	}
	public void setColumnSize(String columnSize) {
		this.columnSize = columnSize;
	}
	public String getPrecision() {
		return precision;
	}
	public void setPrecision(String precision) {
		this.precision = precision;
	}
	public boolean isGrid() {
		return grid;
	}
	public void setGrid(boolean grid) {
		this.grid = grid;
	}
}
