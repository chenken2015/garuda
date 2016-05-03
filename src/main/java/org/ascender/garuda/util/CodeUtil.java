package org.ascender.garuda.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.ascender.garuda.entity.Column;
import org.ascender.garuda.entity.Table;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;
import freemarker.template.Version;

public class CodeUtil {
	
	public final static String VERSION = "2.3.23";
	public final static String ROOT = "org/ascender/garuda/tpl";
	
	//类名
	public static String getEntityName(String tableName){
		if(tableName.startsWith("TE_"))
			tableName = tableName.replaceFirst("TE_+", "");
		else if(tableName.startsWith("T_"))
			tableName = tableName.replaceFirst("T_+", "");
		else if(tableName.startsWith("TS_"))
			tableName = tableName.replaceFirst("TS_+", "");
		else if(tableName.startsWith("TM_"))
			tableName = tableName.replaceFirst("TM_+", "");
		String[] array = tableName.split("_+");
		String result = "";
		for(String s : array){
			result += s.substring(0, 1);
			result += s.substring(1).toLowerCase();
		}
		return result;
	}
	
	//生成驼峰命名的属性名
	public static String getFieldName(String columnName){
		String[] array = columnName.split("_+");
		String result = "";
		for(int i = 0; i < array.length; i++){
			if(i == 0) {
				result += array[i].toLowerCase();
			} else{
				result += array[i].substring(0, 1);
				result += array[i].substring(1).toLowerCase();
			}
			
		}
		return result;
	}
	
	/**
	 * 获取数据库类型
	 * @param typeName 类型类名,如 VARCHAR2,NUMBER...
	 * @param columnSize 类型大小
	 * @param precision 精度
	 * @return
	 */
	public static String getDbType(String typeName,int columnSize,int precision){
		if("DATE".equals(typeName) || "TIMESTAMP".equals(typeName))
			return typeName;
		else if("NUMBER".equals(typeName)) {
			if(columnSize == 0)
				return "NUMBER";
			return typeName + "(" + columnSize + "," + precision + ")";
		} else {
			return typeName + "(" + columnSize + ")";
		}
	}
	
	/**
	 * 获取属性类型
	 * @param typeName
	 * @param columnSize
	 * @param precision
	 * @return
	 */
	public static String getDefaultJavaType(String typeName,int columnSize,int precision){
		if(typeName.startsWith("VARCHAR") || typeName.startsWith("CHAR")){
			return "String";
		} else if( typeName.startsWith("NUMBER") ){
			if( precision != 0 )
				return "Double";
			else if( columnSize < 3 )
				return "Byte";
			else if( columnSize < 5 )
				return "Short";
			else if( columnSize < 10 )
				return "Integer";
			else
				return "Long";
		} else if( "DATE".equals(typeName) || "TIMESTAMP".equals(typeName) ){
			return "Date";
		} else {
			return typeName;
		}
	}
	
	/**
	 * 获取可选的属性类型
	 * @param dbType
	 * @return
	 */
	public static String[] getPossibleJavaType(String dbType){
		if( dbType.matches("NUMBER\\(\\d+,0\\)") ){
			return new String[]{"Byte","Short","Integer","Long","Float","Double","Boolean"};
		} else if( dbType.matches("NUMBER\\(\\d+,[1-9]\\d*\\)") || "NUMBER".equals(dbType)){
			return new String[]{"Float","Double"};
		} else if( dbType.startsWith("VARCHAR") ){
			return new String[]{"String","Boolean"};//Y-N
		} else if( dbType.startsWith("CHAR")){
			if( dbType.matches("CHAR\\(1\\)") )
				return new String[]{"Character","String","Boolean"};
			else
				return new String[]{"String","Boolean"};//Y-N
		} else if( "DATE".equals(dbType) || "TIMESTAMP".equals(dbType) ){
			return new String[]{"Date"};
		}
		return new String[]{};
	}
	
	public static String getFullJavaType(String javaType){
		if("Date".equals(javaType))
			return "java.util.Date";
		else
			return "java.lang."+javaType;
	}
	
	/**
	 * 生成代码文件
	 * @param ftl 模板文件名
	 * @param model
	 * @param outputName 输出目标路径
	 */
	private static void genereateCode(String ftl,Object model,String outputName){
		Configuration cfg = new Configuration(new Version(VERSION));
		cfg.setClassLoaderForTemplateLoading(CodeUtil.class.getClassLoader(), ROOT);
		cfg.setDefaultEncoding("UTF-8");
		BufferedOutputStream bos = null;
		PrintWriter writer = null;
		try {
			File target = new File(outputName);
			if(target.exists())
				target.delete();
			File dir = new File(target.getParent());
			if(!dir.exists())
				dir.mkdirs();
			bos = new BufferedOutputStream(new FileOutputStream(target,true));
			writer = new PrintWriter(bos,true);
			Template template = cfg.getTemplate(ftl);
			template.process(model, writer);
		} catch (TemplateNotFoundException e) {
			e.printStackTrace();
		} catch (MalformedTemplateNameException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} finally {
			if(bos != null)
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if(writer != null)
				writer.close();
		}
	}
	
	//生成excel默认模板
	private static void generateDefaultExcelTemplate(Table table,String path){
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet(table.getComment());
		List<Column> columns = table.getGridColumns();
		Row row_1 = sheet.createRow(0);
		Row row_2 = sheet.createRow(1);
		
		sheet.setDefaultColumnWidth(15);
		CellStyle cs_1 = workbook.createCellStyle();
		cs_1.setAlignment(CellStyle.ALIGN_CENTER);
		cs_1.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
		cs_1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		Font font = workbook.createFont();
		font.setBold(true);
		cs_1.setFont(font);
		CellStyle cs_2 = workbook.createCellStyle();
		cs_2.setAlignment(CellStyle.ALIGN_CENTER);
		for(int i = 0; i < columns.size(); i++){
			Column column = columns.get(i);
			Cell cell_1 = row_1.createCell(i);
			cell_1.setCellValue(column.getComment());
			cell_1.setCellStyle(cs_1);
			
			Cell cell_2 = row_2.createCell(i);
			cell_2.setCellValue("${"+column.getFieldName()+"}");
			cell_2.setCellStyle(cs_2);
		}
		FileOutputStream fos = null;
		try {
			File target = new File(path);
			File dir = new File(target.getParent());
			if(!dir.exists())
				dir.mkdirs();
			fos = new FileOutputStream(target);
			workbook.write(fos);
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
			if(workbook != null)
				try {
					workbook.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
	
	//生成国际化配置
	private static void generateI18nConfig(Table table,String path){
		FileOutputStream fos = null;
		try {
			File file = new File(path);
			File dir = file.getParentFile();
			if(!dir.exists())
				dir.mkdirs();
			if(file.exists())
				file.createNewFile();
			fos = new FileOutputStream(file,true);
			Properties p = new Properties();
			if(path.contains("messages.properties")){
				String entityName = table.getEntityName().substring(0, 1).toLowerCase() + table.getEntityName().substring(1);
				List<Column> columns = table.getColumns();
				for(Column column : columns){
					p.put(entityName+"."+column.getFieldName(), column.getComment());
				}				
			}
			p.store(fos, "by " + System.getProperty("user.name"));
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
	 * 代码生成
	 * @param table
	 * @param path
	 */
	public static void gerenateAllCodes(Table table,String path){
		if(path.endsWith("/"))
			path = path.substring(0, path.length() - 1);
		String basePath = path + "/" + table.getProject() + "/" +table.getModule().replace(".", "/");
		//entity
		genereateCode("Entity.ftl",table,basePath+"/entity/"+table.getEntityName()+".java");
		//Controller
		genereateCode("controller.ftl",table,basePath+"/controller/"+table.getEntityName()+"Controller.java");
		//IXxxService
		genereateCode("service.ftl",table,basePath+"/service/I"+table.getEntityName()+"Service.java");
		//IXxxServiceImpl
		genereateCode("serviceImpl.ftl",table,basePath+"/service/impl/"+table.getEntityName()+"ServiceImpl.java");
		//IXxxDao
		genereateCode("IDao.ftl",table,basePath+"/dao/I"+table.getEntityName()+"Dao.java");
		//mapper
		genereateCode("mapper.xml.ftl",table,basePath+"/dao/"+table.getEntityName()+"Mapper.xml");
		
		//实体名首字母小写
		String lEnitityName  = table.getEntityName().substring(0, 1).toLowerCase()+table.getEntityName().substring(1);
		/*excel模板
		String excel = lEnitityName + ".xlsx";
		generateDefaultExcelTemplate(table, basePath+"/excel/"+excel);
		//暂时使用freemarker,应该使用dom4j操作xml实现配置文件生成
		genereateCode("mapping.xml.ftl",table,basePath+"/META-INF/config/"+lEnitityName+"_mapping.xml");
		genereateCode("beans.xml.ftl",table,basePath+"/META-INF/config/"+lEnitityName+"_beans.xml");
		genereateCode("action.xml.ftl",table,basePath+"/META-INF/config/"+lEnitityName+"_action.xml");
		generateI18nConfig(table, basePath+"/META-INF/i18n/"+lEnitityName+"_messages.properties");
		generateI18nConfig(table, basePath+"/META-INF/i18n/"+lEnitityName+"_messages_en_US.properties");
		generateI18nConfig(table, basePath+"/META-INF/i18n/"+lEnitityName+"_messages_zh_CN.properties");
		generateI18nConfig(table, basePath+"/META-INF/i18n/"+lEnitityName+"_messages_zh_TW.properties");
		*/
		//easyui版page,js
		genereateCode("jsp.ftl",table,basePath+"/META-INF/pages/"+table.getSimpleModule()+"/easyui_"+lEnitityName+".jsp");
		genereateCode("js.ftl",table,basePath+"/META-INF/pages/"+table.getSimpleModule()+"/js/"+lEnitityName+".js");
		
	}
	
}
