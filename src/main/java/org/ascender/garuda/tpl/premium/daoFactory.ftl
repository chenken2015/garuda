package com.pti.fsc.api.service.${entityName?lower_case}.dao;

import com.pti.util.jdbc.DaoGetter;
import com.pti.util.jdbc.DaoUtility;

public class ${entityName}DaoFactory {

	private static DaoGetter daoGetter = null;

	private ${entityName}DaoFactory() {
		super();
	}
	
	static {
		try {
			daoGetter = DaoUtility.getDaoGetter(${entityName}DaoFactory.class.getName(),${entityName}DaoImpl.class);
		} catch (Exception e) {
			
		}
	}
	
	public static ${entityName}Dao getDao(){
		return (${entityName}Dao) daoGetter.getDaoInstance();
	}
	
}
