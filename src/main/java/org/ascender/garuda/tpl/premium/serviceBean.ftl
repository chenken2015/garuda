package com.pti.fsc.api.service.${entityName?lower_case};

import javax.ejb.EJBException;
import javax.ejb.Local;
import javax.ejb.LocalBean;
import javax.ejb.Remote;
import javax.ejb.Stateless;

import com.pti.fsc.api.service.${entityName?lower_case}.bo.${entityName}Bo;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.fsc.common.AppContext;
import com.pti.fsc.common.AppContextUtil;
import com.pti.fsc.common.BaseServiceBean;
import com.pti.util.exception.AppException;
import com.pti.util.exception.AppSystemException;
import com.pti.util.log.Logger;



@Stateless
@Local(${entityName}ServiceLocal.class)
@Remote(${entityName}ServiceRemote.class)
@LocalBean
public class ${entityName}ServiceBean extends BaseServiceBean implements ${entityName}ServiceLocal,${entityName}ServiceRemote{

	private static Logger logger = Logger.getInstance(${entityName}ServiceBean.class.getName());

	@Override
	public Vo${entityName} createSave${entityName}(AppContext appContext, Vo${entityName} vo${entityName})
			throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.createSave${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public ${entityName}SearchCriteria search${entityName}(AppContext appContext,${entityName}SearchCriteria searchCriteria) throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.search${entityName}(searchCriteria);
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public Vo${entityName} get${entityName}ByPk(AppContext appContext, String ${entityName})
			throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.get${entityName}ByPk(${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public Vo${entityName} createSubmit${entityName}(AppContext appContext, Vo${entityName} vo${entityName})
			throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.createSubmit${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public Vo${entityName} createApproveVo${entityName}(AppContext appContext,
			Vo${entityName} vo${entityName}) throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.createApproveVo${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void createRejectVo${entityName}(AppContext appContext, Vo${entityName} vo${entityName})
			throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.createRejectVo${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void createCancel(AppContext appContext, Vo${entityName} vo${entityName})
			throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.createCancel(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void updateSaveVo${entityName}(AppContext appContext, Vo${entityName} vo${entityName})
			throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.updateSaveVo${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void updateSubmitVo${entityName}(AppContext appContext,
			Vo${entityName} vo${entityName}) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.updateSubmitVo${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public Vo${entityName} getUpdateVo${entityName}ByPk(AppContext appContext,
			String ${entityName}) throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.getUpdateVo${entityName}ByPk(${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public Vo${entityName}[] getDual${entityName}ByPk(AppContext appContext,String ${entityName}) throws AppException {
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			return bo.getDual${entityName}ByPk(${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void updateApprove${entityName}(AppContext appContext,Vo${entityName} vo${entityName}2) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.updateApprove${entityName}(vo${entityName}2);
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void updateReject${entityName}(AppContext appContext,Vo${entityName} vo${entityName}2) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.updateReject${entityName}(vo${entityName}2);
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void updateCancel${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.updateCancel${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void deleteSubmit${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.deleteSubmit${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void deleteApprove${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.deleteApprove${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void deleteReject${entityName}(AppContext appContext,
			Vo${entityName} vo${entityName}) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.deleteReject${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}


	@Override
	public void deleteCancel${entityName}(AppContext appContext,Vo${entityName} vo${entityName}) throws AppException {
		// TODO Auto-generated method stub
		boolean savedAppContext = AppContextUtil.saveAppContext(appContext);
		try {
			${entityName}Bo bo = new ${entityName}Bo();
			bo.deleteCancel${entityName}(vo${entityName});
		} catch (AppException e) {
			ctx.setRollbackOnly();
			throw e;
		} catch (EJBException e) {
			logger.error(e, e);
			ctx.setRollbackOnly();
			throw e;
		} catch (Throwable e) {
			ctx.setRollbackOnly();
			logger.error("error", e);
			throw new AppSystemException(e.getMessage());
		} finally {
			AppContextUtil.restoreAppContext(savedAppContext);
		}
	}

}
