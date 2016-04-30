package ${module}.biz;

import java.util.Collection;

import com.sf.framework.base.IPage;
import com.sf.framework.server.base.biz.BaseBiz;
import com.sf.framework.util.BeanUtils;
import com.sf.module.frameworkimpl.domain.QueryObj;
import ${module}.dao.I${entityName}Dao;
import ${module}.domain.${entityName};

/**
 * ${entityName} BIZ接口实现
 * @author ${username}
 *
 */
public class ${entityName}Biz extends BaseBiz implements I${entityName}Biz {

	// ${entityName?uncap_first}Dao
	private I${entityName}Dao ${entityName?uncap_first}Dao;

	public void set${entityName}Dao(I${entityName}Dao ${entityName?uncap_first}Dao) {
		this.${entityName?uncap_first}Dao = ${entityName?uncap_first}Dao;
	}

	public void save${entityName}(${entityName} ${entityName?uncap_first}) {
		// save ${entityName?uncap_first}
		this.${entityName?uncap_first}Dao.saveOrUpdate(${entityName?uncap_first});
	}

	public ${entityName} find${entityName}(Long id) {
		// load ${entityName?uncap_first}
		${entityName} ${entityName?uncap_first} = this.${entityName?uncap_first}Dao.load(id);
		return ${entityName?uncap_first};
	}

	public Collection<${entityName}> findBy(${entityName} ${entityName?uncap_first}) {
		if (${entityName?uncap_first} == null) {
			${entityName?uncap_first} = new ${entityName}();
		} else {
			BeanUtils.clearEmptyProperty(${entityName?uncap_first});
		}
		return this.${entityName?uncap_first}Dao.findBy(${entityName?uncap_first});
	}
	
	public Collection<${entityName}> findBy(QueryObj queryObj){
		return this.${entityName?uncap_first}Dao.findBy(queryObj);
	}

	public IPage<${entityName}> findPageBy(QueryObj queryObj) {
		return this.${entityName?uncap_first}Dao.findPageBy(queryObj);
	}

	public void delete${entityName}s(String ids) {
		String[] idArray = ids.split(",");
		for (String sid : idArray) {
			Long id = Long.parseLong(sid);
			// delete ${entityName}
			this.${entityName?uncap_first}Dao.remove(id);
		}
	}
}
