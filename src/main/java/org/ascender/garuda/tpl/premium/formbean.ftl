package com.pti.fsc.api.restful.formbean;

import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.waf.mvc.controller.WafModel;

public class ${entityName}Form extends WafModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3104660543011334512L;

	private String pk;
	
	/**
	 * For workflow item id.
	 */
	private long wfItemId = 0L;
	
	private Vo${entityName} vo${entityName} = new Vo${entityName}();
	
	public String getPk() {
		return apiKey;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}

	public long getWfItemId() {
		return wfItemId;
	}

	public void setWfItemId(long wfItemId) {
		this.wfItemId = wfItemId;
	}

	public Vo${entityName} getVo${entityName}() {
		return vo${entityName};
	}

	public void setVo${entityName}(Vo${entityName} vo${entityName}) {
		this.vo${entityName} = vo${entityName};
	}
	
}
