package com.pti.fsc.api.service.${entityName?lower_case}.vo;

import java.util.List;

import com.pti.fsc.common.BaseSearchCriteria;

public class ${entityName}SearchCriteria extends BaseSearchCriteria{


	private List<Vo${entityName}> ${entityName?uncap_first}s;


	public List<Vo${entityName}> get${entityName}s() {
		return apiKeys;
	}

	public void setApiKeys(List<Vo${entityName}> ${entityName?uncap_first}s) {
		this.${entityName?uncap_first}s = ${entityName?uncap_first}s;
	}
}