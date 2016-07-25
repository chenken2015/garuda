package com.fpx.product.service;

import java.util.List;

import com.fpx.product.entity.${entityName};
import com.fpx.product.entity.TreeDTO;

public interface I${entityName}Service {
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
	public boolean save${entityName}(${entityName} ${entityName?uncap_first});
	/**
	 * 
	* @Title: id  
	* @Description: 根据ID删除对象
	* @param
	* @return  
	* @throws
	 */
	public boolean deleteById(Long id);
}
