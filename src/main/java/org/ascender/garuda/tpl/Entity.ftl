package ${module}.domain;

<#list columns as column>
<#if column.javaType == "Date">
import java.util.Date;
<#break>
</#if>
</#list>
import com.sf.framework.base.domain.BaseEntity;

/**
 * ${comment}
 * @author ${username}
 *
 */
@SuppressWarnings("serial")
public class ${entityName} extends BaseEntity {

<#list columns as column>
	//${column.comment}
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