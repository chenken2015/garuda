package com.pti.fsc.api.service.${entityName?lower_case}.accessor;

import com.pti.fsc.api.service.${entityName?lower_case}.${entityName}Service;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.fsc.common.AppContextUtil;
import com.pti.util.exception.AppException;
import com.pti.util.locator.ResourceInfo;
import com.pti.util.locator.ResourceLocator;
import com.pti.util.log.Logger;

public class ${entityName}ServiceAccessor {

	private static Logger logger = Logger.getInstance(${entityName}ServiceAccessor.class.getName());
	
	public static final String SERVICE_NAME = "API-EJB/" + ${entityName}Service.class.getName();
	
	private static ResourceInfo serviceInfo = null;
	
	private ${entityName}Service service = null;
	
	static {
		try {
			serviceInfo = ResourceLocator.getInstance().getEjbInfo(SERVICE_NAME);
		} catch (Exception e) {
			logger.error("Service " + SERVICE_NAME + " can not be located.", e);
		}
	}

	public ${entityName}ServiceAccessor() {
		try {
			if (serviceInfo != null){
				service = (${entityName}Service) ResourceLocator.getInstance().lookup(serviceInfo);
			}
		} catch (Exception e) {
			logger.error("creating service error", e);
		}
	}
	
	public Vo${entityName} createSave${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		if (service != null){
			return service.createSave${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
		return null;
	}
	
	public ${entityName}SearchCriteria search${entityName}(${entityName}SearchCriteria searchCriteria)throws AppException{
		if (service != null){
			return service.search${entityName}(AppContextUtil.createAppContext(),searchCriteria);
		}
		return null;
	}
	
	public Vo${entityName} get${entityName}ByPk(String ${entityName}) throws AppException{
		if (service != null){
			return service.get${entityName}ByPk(AppContextUtil.createAppContext(),${entityName});
		}
		return null;
	}
	
	public Vo${entityName} createSubmit${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			return service.createSubmit${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
		return null;
	}

	public Vo${entityName} createApproveVo${entityName}( Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			return service.createApproveVo${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
		return null;
	}

	public void createRejectVo${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.createRejectVo${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void createCancel(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.createCancel(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void updateSaveVo${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		if (service != null){
			service.updateSaveVo${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void updateSubmitVo${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.updateSubmitVo${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public Vo${entityName} getUpdateVo${entityName}ByPk(String ${entityName})throws AppException{
		if (service != null){
			return service.getUpdateVo${entityName}ByPk(AppContextUtil.createAppContext(),${entityName});
		}
		return null;
	}

	public Vo${entityName}[] getDual${entityName}ByPk(String ${entityName})throws AppException{
		if (service != null){
			return service.getDual${entityName}ByPk(AppContextUtil.createAppContext(),${entityName});
		}
		return null;
	}

	public void updateApprove${entityName}(Vo${entityName} vo${entityName}2)throws AppException{
		if (service != null){
			service.updateApprove${entityName}(AppContextUtil.createAppContext(),vo${entityName}2);
		}
	}

	public void updateReject${entityName}(Vo${entityName} vo${entityName}2) throws AppException{
		if (service != null){
			service.updateReject${entityName}(AppContextUtil.createAppContext(),vo${entityName}2);
		}
	}

	public void updateCancel${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		if (service != null){
			service.updateCancel${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void deleteSubmit${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.deleteSubmit${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void deleteApprove${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.deleteApprove${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void deleteReject${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.deleteReject${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}

	public void deleteCancel${entityName}(Vo${entityName} vo${entityName})throws AppException{
		if (service != null){
			service.deleteCancel${entityName}(AppContextUtil.createAppContext(),vo${entityName});
		}
	}
}
