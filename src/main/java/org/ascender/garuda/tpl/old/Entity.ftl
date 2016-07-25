package com.fpx.product.entity;

<#list columns as column>
<#if column.javaType == "Date">
import java.util.Date;
<#break>
</#if>
</#list>
import java.io.Serializable;
/**
 * @Title: 
 * @Description:对应表:
 * @Company:
 * @author
 * @date 
 * @since v1.0.0
 */
public class ${entityName} implements Serializable {

<#list columns as column>
	/**
	 *	${column.comment}
	*/
	private ${column.javaType} ${column.fieldName};
</#list>

<#list columns as column>  
    public ${column.javaType} get${column.fieldName?cap_first}(){  
      return this.${column.fieldName};  
    }  
    public void set${column.fieldName?cap_first}(${column.javaType} ${column.fieldName}){  
      this.${column.fieldName} = ${column.fieldName};  
    }  
</#list>
}