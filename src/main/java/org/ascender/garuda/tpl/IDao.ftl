package ${module}.dao;

import java.util.Collection;
import com.sf.framework.base.IPage;
import com.sf.framework.server.base.dao.IEntityDao;
import com.sf.module.frameworkimpl.domain.QueryObj;
import ${module}.domain.${entityName};

/**
 * ${entityName} DAO接口定义
 * @author ${username}
 *
 */
public interface I${entityName}Dao extends IEntityDao<${entityName}> {

	public Collection<${entityName}> findBy(QueryObj queryObj);

	public IPage<${entityName}> findPageBy(QueryObj queryObj);

}