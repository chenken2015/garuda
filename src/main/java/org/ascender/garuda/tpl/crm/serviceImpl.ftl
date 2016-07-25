package com.fpx.crm.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpx.crm.mapper.${entityName}Mapper;
import com.fpx.crm.model.${entityName};
import com.fpx.crm.service.${entityName}Service

@Service("${entityName?uncap_first}Service")
public class ${entityName}ServiceImpl implements ${entityName}Service{
	private static final Logger log = LoggerFactory.getLogger(${entityName}Service.class);
	@Resource
	private ${entityName}Mapper ${entityName?uncap_first}Mapper;

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
		return ${entityName?uncap_first}Mapper.findBy(${entityName?uncap_first});
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
		return ${entityName?uncap_first}Mapper.findById(id);
	}
	/**
	 * 
	* @Title: save${entityName}  
	* @Description: 
	* @param	${entityName?uncap_first}
	* @return  
	* @throws
	 */
	public void save${entityName}(${entityName} ${entityName?uncap_first}){
		 ${entityName?uncap_first}Mapper.save${entityName}(${entityName?uncap_first});
	}
	/**
	 * 
	* @Title: id  
	* @Description: 根据ID删除对象
	* @param
	* @return  
	* @throws
	 */
	public void deleteById(Long id){
		${entityName?uncap_first}Mapper.deleteById(id);
	}
	
}
