package com.pti.fsc.api.restful.delegate;

import com.pti.fsc.api.service.${entityName?lower_case}.accessor.${entityName}ServiceAccessor;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.util.exception.AppException;

public class ${entityName}Delegate {

	private static ${entityName}Delegate delegate = new ${entityName}Delegate();
	
	public static ${entityName}Delegate getInstance(){
		return delegate;
	}
	
	public ${entityName}Delegate(){
		super();
	}
	
	public Vo${entityName} createSave${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.createSave${entityName}(vo${entityName});
	}
	
	public ${entityName}SearchCriteria search${entityName}(${entityName}SearchCriteria searchCriteria) throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.search${entityName}(searchCriteria);
	}
	
	public Vo${entityName} get${entityName}ByPk(String pk) throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.get${entityName}ByPk(pk);
	}
	
	public Vo${entityName} createSubmit${entityName}(Vo${entityName} vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.createSubmit${entityName}(vo${entityName});
	}

	public Vo${entityName} createApproveVo${entityName}(Vo${entityName} vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.createApproveVo${entityName}(Vo${entityName});
	}

	public void createRejectVo${entityName}(Vo${entityName} vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.createRejectVo${entityName}(vo${entityName});
	}

	public void createCancel(Vo${entityName} vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.createCancel(vo${entityName});
	}

	public void updateSaveVo${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.updateSaveVo${entityName}(vo${entityName});
	}

	public void updateSubmitVo${entityName}(Vo${entityName} vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.updateSubmitVo${entityName}(vo${entityName});
	}

	public Vo${entityName} getUpdateVo${entityName}ByPk(String pk)throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.getUpdateVo${entityName}ByPk(pk);
	}

	public Vo${entityName}[] getDual${entityName}ByPk(String pk)throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		return accessor.getDual${entityName}ByPk(pk);
	}

	public void updateApprove${entityName}(Vo${entityName} Vo${entityName}2)throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.updateApprove${entityName}(Vo${entityName}2);
	}

	public void updateReject${entityName}(Vo${entityName} Vo${entityName}2) throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.updateReject${entityName}(Vo${entityName}2);
	}

	public void updateCancel${entityName}(Vo${entityName} Vo${entityName}) throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.updateCancel${entityName}(Vo${entityName});
	}

	public void deleteSubmit${entityName}(Vo${entityName} Vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.deleteSubmit${entityName}(Vo${entityName});
	}

	public void deleteApprove${entityName}(Vo${entityName} Vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.deleteApprove${entityName}(Vo${entityName});
	}

	public void deleteReject${entityName}(Vo${entityName} Vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.deleteReject${entityName}(Vo${entityName});
	}

	public void deleteCancel${entityName}(Vo${entityName} Vo${entityName})throws AppException{
		${entityName}ServiceAccessor accessor = new ${entityName}ServiceAccessor();
		accessor.deleteCancel${entityName}(Vo${entityName});
	}
	
}
