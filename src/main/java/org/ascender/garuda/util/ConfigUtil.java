package org.ascender.garuda.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;

public class ConfigUtil {
	
	public static final String folderPath = 
			System.getProperty("user.home")+File.separator+".garuda";
	public static final String userTemplateFolder = 
			System.getProperty("user.home")+File.separator+".garuda" + File.separator + "tpl";
	public static final String dbConfigPath =
			System.getProperty("user.home")+File.separator+".garuda" + File.separator + "db.ini";
	public static final String historyPath =
			System.getProperty("user.home")+File.separator+".garuda" + File.separator + "history.ini";
	
	/**
	 * 获取驱动名,默认oracle.jdbc.OracleDriver
	 * @return
	 */
	public static String getDriverName(){
		String dbType = getDBType();
		if("Oracle".equals(dbType))
			return "oracle.jdbc.OracleDriver";
		else
			return "com.mysql.jdbc.Driver";
	}
	
	/**
	 * 获取数据库类型,默认Oracle
	 * @return
	 */
	public static String getDBType(){
		String db = getValue(dbConfigPath, "db");
		if(db == null || "".equals(db))
			return "Oracle";
		return db;
	}
	
	/**
	 * 获取连接字符串
	 * @return
	 */
	public static String getUrl(){
		String host = getHost();
		String port = getPort();
		String inst = getInst();
		String db = getDBType();
		if("Oracle".equals(db))
			return "jdbc:oracle:thin:@" + host + ":" + port + ":" + inst;
		else
			return "jdbc:mysql://" + host + ":" + port + "/" + inst;
	}
	
	//获取主机IP
	public static String getHost(){
		String host = getValue(dbConfigPath, "host");
		if(host == null || "".equals(host))
			return "127.0.0.1";
		return host;
	}
	
	//端口号
	public static String getPort(){
		String port = getValue(dbConfigPath, "port");
		if(port == null || "".equals(port))
			return "1521";
		return port;
	}
	
	//连接名
	public static String getInst(){
		String inst = getValue(dbConfigPath, "inst");
		if(inst == null || "".equals(inst))
			return "orcl";
		return inst;		
	}
	
	//用户名
	public static String getUsername(){
		String username = getValue(dbConfigPath, "username");
		return username == null ? "" : username;
	}
	
	//密码
	public static String getPassword(){
		String pwd = getValue(dbConfigPath, "password");	
		return pwd == null ? "" : pwd;
	}
	
	//保存数据库配置
	public static void saveDBConfig(String db,String host,String port,String inst,String user,String pwd){
		FileOutputStream fos = null;
		try {
			new File(dbConfigPath).delete();//删除旧的配置
			new File(dbConfigPath).createNewFile();//新建
			fos = new FileOutputStream(dbConfigPath,true);
			Properties p = new Properties();
			p.setProperty("db", db);
			p.setProperty("host", host);
			p.setProperty("port", port);
			p.setProperty("inst", inst);
			p.setProperty("username", user);
			p.setProperty("password", pwd);
			p.store(fos, null);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(fos != null)
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
	
	/**
	 * ini文件的值
	 * @param file
	 * @param key
	 * @return
	 */
	private static String getValue(String file,String key){
		String value = null;
		InputStream is = null;
		try {
			is = new FileInputStream(file);
			Properties p = new Properties();
			p.load(is);
			value = p.getProperty(key);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(is != null)
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return value;
	}
	
	/**
	 * 获取填写过的项目历史记录
	 * @return
	 */
	public static String[] getHistoryProjects(){
		String projects = getValue(historyPath,"projects");
		if(projects != null){
			String[] array = projects.split(",");
			return array;
		}
		return new String[]{};
	}
	
	public static String[] getHistoryModules(String project){
		String projects = getValue(historyPath,project);
		if(projects != null){
			String[] array = projects.split(",");
			return array;
		}
		return new String[]{};
	}
	
	public static void saveBasicInfoHistory(Map<String,String> history){
		FileOutputStream fos = null;
		try {
			new File(historyPath).delete();
			new File(historyPath).createNewFile();
			fos = new FileOutputStream(historyPath,true);
			Properties p = new Properties();
			p.putAll(history);
			p.store(fos, null);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(fos != null)
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

}
