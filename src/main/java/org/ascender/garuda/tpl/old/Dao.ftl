package ${module}.dao;

import java.util.Collection;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.sf.framework.base.IPage;
import com.sf.framework.server.base.dao.BaseEntityDao;
import com.sf.module.frameworkimpl.domain.QueryObj;
<#list columns as column>
<#if column.javaType=="Date">
import com.sf.module.security.util.DateUtils;
<#break>
</#if>
</#list>
import com.sf.module.security.util.CommMethod;
import ${module}.domain.${entityName};

/**
 * ${entityName} DAO接口实现
 * @author ${username}
 *
 */
public class ${entityName}Dao extends BaseEntityDao<${entityName}> implements I${entityName}Dao {

	public Collection<${entityName}> findBy(QueryObj queryObj) {
		DetachedCriteria criteria = generateCriteria(queryObj);
		return super.findBy(criteria);
	}

	public IPage<${entityName}> findPageBy(QueryObj queryObj) {
		DetachedCriteria criteria = generateCriteria(queryObj);
		return super.findPageBy(criteria, queryObj.getPageSize(), queryObj.getPageIndex(), queryObj.getSortField(), queryObj.isAsc());
	}

	private DetachedCriteria generateCriteria(QueryObj queryObj) {
		DetachedCriteria criteria = DetachedCriteria.forClass(super.entityClass);
		String queryValue = null;
		<#list searchColumns as column>
		queryValue = queryObj.getQueryValue("${column.fieldName}");
		if(!CommMethod.isEmpty(queryValue)){
			<#if column.javaType=="Byte">
			criteria.add(Restrictions.eq("${column.fieldName}", Byte.parseByte(queryValue)));
			<#elseif column.javaType=="Short">
			criteria.add(Restrictions.eq("${column.fieldName}", Short.parseShort(queryValue)));
			<#elseif column.javaType=="Integer">
			criteria.add(Restrictions.eq("${column.fieldName}", Integer.parseInteger(queryValue)));
			<#elseif column.javaType=="Long">
			criteria.add(Restrictions.eq("${column.fieldName}", Long.parseLong(queryValue)));
			<#elseif column.javaType=="Float">
			criteria.add(Restrictions.eq("${column.fieldName}", Float.parseFloat(queryValue)));
			<#elseif column.javaType=="Double">
			criteria.add(Restrictions.eq("${column.fieldName}", Double.parseDouble(queryValue)));
			<#elseif column.javaType=="Boolean">
			criteria.add(Restrictions.eq("${column.fieldName}", Boolean.parseBoolean(queryValue)));
			<#elseif column.javaType=="Date">
			criteria.add(Restrictions.eq("${column.fieldName}", DateUtils.parseDate(queryValue,DateUtils.FORMAT_DATE)));
			<#else>
			criteria.add(Restrictions.eq("${column.fieldName}", queryValue));
			</#if>
		}
		</#list>
		return criteria;
	}
}