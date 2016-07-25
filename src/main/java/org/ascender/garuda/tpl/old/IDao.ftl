package com.fpx.product.dao;

import java.util.List;

import com.fpx.product.entity.${entityName};

public interface I${entityName}Dao {
	
	public List<${entityName}> findBy(${entityName} pc);
	/**
	 * 根据id查询对象
	 * @param ${entityName?uncap_first}
	 * @return	
	 */
	public ${entityName} findById(Long id);
	/**
	 * 保存对象
	 * @param ${entityName?uncap_first}
	 * @return	
	 */
	public Long save${entityName}(${entityName} ${entityName?uncap_first});
	/**
	 * 根据id删除对象
	 * @param id
	 * @return	
	 */
	public void deleteById(Long id);
	/**
	 * 更新数据库对象信息
	 * @param ${entityName?uncap_first}
	 */
	public void update${entityName}(${entityName} ${entityName?uncap_first});
}