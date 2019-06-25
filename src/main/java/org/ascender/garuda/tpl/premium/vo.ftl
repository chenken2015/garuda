package com.pti.fsc.api.service.${entityName?lower_case}.vo;

<#list columns as column>
<#if column.javaType == "Date">
import java.util.Date;
<#break>
</#if>
</#list>
import java.io.Serializable;

public class ${entityName} implements Serializable {

	<#list columns as column>
	/**
	 *	${column.comment}
	*/
	private ${column.javaType} ${column.fieldName};
	</#list>

	private String message;
	
	/**
	 * For workflow item id.
	 */
	private long workflowItemId = 0L;

	<#list columns as column>  
    public ${column.javaType} get${column.fieldName?cap_first}(){  
      return this.${column.fieldName};  
    }  
    public void set${column.fieldName?cap_first}(${column.javaType} ${column.fieldName}){  
      this.${column.fieldName} = ${column.fieldName};  
    }  
	</#list>

	/**
	 * Get primary key value of this VO.
	 */
	public String getPrimaryKey() {
		String pk = String.valueOf(this.id);
		return pk;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public long getWorkflowItemId() {
		return workflowItemId;
	}

	public void setWorkflowItemId(long workflowItemId) {
		this.workflowItemId = workflowItemId;
	}
}