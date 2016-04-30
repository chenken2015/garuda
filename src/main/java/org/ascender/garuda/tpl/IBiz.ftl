package ${module}.biz;

import java.util.Collection;

import com.sf.framework.base.IPage;
import com.sf.framework.server.base.biz.IBiz;
import com.sf.module.frameworkimpl.domain.QueryObj;
import ${module}.domain.${entityName};

/**
 * ${entityName} BIZ接口定义
 * @author ${username}
 *
 */
public interface I${entityName}Biz extends IBiz {

	public void save${entityName}(${entityName} ${entityName?uncap_first});

	public ${entityName} find${entityName}(Long id);

	public Collection<${entityName}> findBy(${entityName} ${entityName?uncap_first});
	
	public Collection<${entityName}> findBy(QueryObj queryObj);

	public IPage<${entityName}> findPageBy(QueryObj queryObj);

	public void delete${entityName}s(String ids);

}
