package com.fpx.crm.service;

import java.util.List;

import com.fpx.crm.model.${entityName};

public interface ${entityName}Service {
	/**
	 * 
	* @Title: findBy  
	* @Description: 
	* @param @param 
	* @param @return      
	* @return 
	* @throws
	 */
	public List<${entityName}> findBy(${entityName} ${entityName?uncap_first});
	/**
	 * 
	* @Title: findById  
	* @Description: 根据id查询对象
	* @param	id
	* @return  
	* @throws
	 */
	public ${entityName} findById(Long id);
	/**
	 * 
	* @Title: save${entityName}  
	* @Description: 保存对象
	* @param	
	* @return  
	* @throws
	 */
	public void save${entityName}(${entityName} ${entityName?uncap_first});
	/**
	 * 
	* @Title: id  
	* @Description: 根据ID删除对象
	* @param
	* @return  
	* @throws
	 */
	public void deleteById(Long id);
}
