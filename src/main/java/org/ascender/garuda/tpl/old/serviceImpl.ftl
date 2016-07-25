package com.fpx.product.service.impl;

import java.util.ArrayList;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("${entityName?uncap_first}Service")
public class ${entityName}Service implements I${entityName}Service{
	private static final Logger log = LoggerFactory.getLogger(${entityName}Service.class);
	@Resource
	private I${entityName}yDao ${entityName?uncap_first}Dao;

	/**
	 * 
	* @Title: findBy  
	* @Description: 
	* @param @param 
	* @param @return      
	* @return 
	* @throws
	 */
	public List<${entityName}> findBy(${entityName} ${entityName?uncap_first}){
		return ${entityName?uncap_first}Dao.findBy(pc);
	}
	/**
	 * 
	* @Title: findById  
	* @Description: 根据id查询对象
	* @param	id
	* @return
	* @throws
	 */
	public ${entityName} findById(Long id){
		return ${entityName?uncap_first}Dao.findById(id);
	}
	/**
	 * 
	* @Title: save${entityName}  
	* @Description: 
	* @param	${entityName?uncap_first}
	* @return  
	* @throws
	 */
	public boolean save${entityName}(${entityName} ${entityName?uncap_first}){
		return ${entityName?uncap_first}Dao.save${entityName}(${entityName?uncap_first});
	}
	/**
	 * 
	* @Title: id  
	* @Description: 根据ID删除对象
	* @param
	* @return  
	* @throws
	 */
	public boolean deleteById(Long id){
		return ${entityName?uncap_first}Dao.deleteById(id);
	}
	
}
