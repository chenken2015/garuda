package com.pti.fsc.api.service.${entityName?lower_case}.dao;

import java.util.Date;

import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.util.exception.AppException;

public interface ${entityName}Dao {

	public void create${entityName}(Vo${entityName} vo${entityName}) throws AppException;
	
	public ${entityName}SearchCriteria search${entityName}(${entityName}SearchCriteria searchCriteria) throws AppException;
	
	public int update${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp) throws AppException;
	
	public Vo${entityName} get${entityName}ByPk(String ${entityName}) throws AppException;

	public int updateVerify${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException;

	public int updateVerifyStatus(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException;

	public int delete${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException;

	public int updateStatusAndXml(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException;

	public int updateStatus(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException;
}
