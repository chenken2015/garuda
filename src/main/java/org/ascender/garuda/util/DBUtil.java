package org.ascender.garuda.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ascender.garuda.entity.Column;
import org.ascender.garuda.entity.Table;

public class DBUtil {
	
	private static String driverClassName;
	private static String url;
	private static String username;
	private static String password;
	
	public static void init(String driverClassName,String url,String username,String password){
		try {
			DBUtil.driverClassName = driverClassName;
			DBUtil.url = url;
			DBUtil.username = username;
			DBUtil.password = password;
			Class.forName(driverClassName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			DriverManager.setLoginTimeout(2);//超时时间2"
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn){
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	/**
	 * 查找所有的表
	 * @return
	 */
	public static List<Table> getAllTables(){
		DBUtil.init(driverClassName, url, username, password);
		Connection conn = DBUtil.getConnection();
		List<Table> result = new ArrayList<Table>();
		try {
			DatabaseMetaData dmd = conn.getMetaData();
			ResultSet rs = dmd.getTables(null, username.toUpperCase(), "%", new String[]{"TABLE","VIEW"});
			while(rs.next()){
				String tableName = rs.getString(3);
				if(tableName.startsWith("BIN$"))
					continue;//跳过垃圾表
				Table t = new Table();
				t.setTableName(rs.getString(3));
				t.setTableType(rs.getString(4));
				t.setEntityName(CodeUtil.getEntityName(t.getTableName()));
				result.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);	
		}
		return result;
	}
	
	/**
	 * 获取指定表的所有字段信息
	 * @param tableName
	 * @return
	 */
	public static List<Column> getAllColumns(String tableName){
		DBUtil.init(driverClassName, url, username, password);
		Connection conn = DBUtil.getConnection();
		List<Column> result = new ArrayList<Column>();
		try {
			DatabaseMetaData dmd = conn.getMetaData();
			ResultSet rs = dmd.getColumns(null, username.toUpperCase(), tableName.toUpperCase(), "%");
			while(rs.next()){
				Column c = new Column();
				c.setColumnName(rs.getString(4));
				c.setFieldName(CodeUtil.getFieldName(c.getColumnName()));
				String typeName = rs.getString(6);
				int columnSize = rs.getInt(7);
				int precision = rs.getInt(9);
				c.setDbType(CodeUtil.getDbType(typeName, columnSize, precision));
				c.setJavaType(CodeUtil.getDefaultJavaType(typeName, columnSize, precision));
				if(columnSize == 0 && "NUMBER".equals(typeName))
					c.setColumnSize(10 + "");//默认给10
				else
					c.setColumnSize(columnSize + "");
				c.setPrecision(precision+"");
				//查找主键
				String primary = getPrimaryKey(rs.getString(3));
				if(c.getColumnName().equals(primary))
					c.setPrimary(true);
				else
					c.setPrimary(false);
				//设置是否查询
				String columnName = c.getColumnName();
				if( "CREATE_USER".equals(columnName) || "CREATE_DATE".equals(columnName) 
						|| "MODIFY_USER".equals(columnName) || "MODIFY_DATE".equals(c.getColumnName()) 
						|| "IF_DEL".equals(columnName) || "STATUS".equals(columnName) 
						|| columnName.endsWith("ID")|| columnName.endsWith("IDS")||c.isPrimary() ){
					c.setSearch(false);
					c.setGrid(false);
				} else {
					c.setSearch(true);
					c.setGrid(true);
				}				
				result.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}		
		return result;
	}
	
	//获取表主键
	private static String getPrimaryKey(String tableName){
//		DBUtil.init(driverClassName, url, username, password);
		Connection conn = DBUtil.getConnection();
		String primary = null;
		try {
			DatabaseMetaData dmd = conn.getMetaData();
			ResultSet rs = dmd.getPrimaryKeys(null, username.toUpperCase(), tableName.toUpperCase());
			while(rs.next()){
				primary = rs.getString(4);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		return primary;
	}

}
