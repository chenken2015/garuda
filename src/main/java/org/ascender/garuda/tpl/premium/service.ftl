package com.pti.fsc.api.service.${entityName?lower_case};

import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.fsc.common.AppContext;
import com.pti.util.exception.AppException;

public interface ${entityName}Service {

    public Vo${entityName} createSave${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException;
	
	public ${entityName}SearchCriteria search${entityName}(AppContext appContext,${entityName}SearchCriteria searchCriteria)throws AppException;
	
	public Vo${entityName} get${entityName}ByPk(AppContext appContext,String ${entityName}) throws AppException;
	
	public Vo${entityName} createSubmit${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;

	public Vo${entityName} createApproveVo${entityName}(AppContext appContext, Vo${entityName} vo${entityName})throws AppException;

	public void createRejectVo${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;

	public void createCancel(AppContext appContext,Vo${entityName} Vo${entityName})throws AppException;

	public void updateSaveVo${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException;

	public void updateSubmitVo${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;

	public Vo${entityName} getUpdateVo${entityName}ByPk(AppContext appContext, String ${entityName})throws AppException;

	public Vo${entityName}[] getDual${entityName}ByPk(AppContext appContext,String ${entityName})throws AppException;

	public void updateApprove${entityName}(AppContext appContext,Vo${entityName} vo${entityName}2)throws AppException;

	public void updateReject${entityName}(AppContext appContext,Vo${entityName} vo${entityName}2) throws AppException;

	public void updateCancel${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException;

	public void deleteSubmit${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;

	public void deleteApprove${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;

	public void deleteReject${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;

	public void deleteCancel${entityName}(AppContext appContext,Vo${entityName} vo${entityName})throws AppException;
	
}
