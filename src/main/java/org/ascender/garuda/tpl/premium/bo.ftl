package com.pti.fsc.api.service.${entityName?lower_case}.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pti.fsc.api.service.${entityName?lower_case}.dao.${entityName}Dao;
import com.pti.fsc.api.service.${entityName?lower_case}.dao.${entityName}DaoFactory;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.fsc.api.service.note.bo.NoteBo;
import com.pti.fsc.api.service.note.vo.VoNote;
import com.pti.fsc.cda.common.CdaConstants;
import com.pti.fsc.common.BaseBo;
import com.pti.fsc.common.BaseConstants;
import com.pti.fsc.common.date.DateUtil;
import com.pti.fsc.common.setup.SetupConstants;
import com.pti.fsc.common.setup.SetupUtil;
import com.pti.util.exception.AppException;
import com.pti.util.log.Logger;

public class ${entityName}Bo extends BaseBo{

	private static Logger logger = Logger.getInstance(${entityName}Bo.class.getName());
	
	/**
	 * task type
	 */
	private static final String TASK_TYPE = "${entityName?upper_case}";

	
	Date tCurrentTime = null;
	private String tUserID = null;
	
	public ${entityName}Bo() {
		super();
		if (this.getCurrentUser() != null) {
			tUserID = this.getCurrentUser().getUserId();
		}
		tCurrentTime = DateUtil.getGMTTimestamp().getTime();
	}
	
	public Vo${entityName} createSave${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		if(oldTimestamp==null){
			vo${entityName} = create${entityName}(vo${entityName});
		}else{
			int rows = createUpdate${entityName}(vo${entityName});
			if (rows == 0) {
				throw new AppException(
						BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, 
						new Object[] {TASK_TYPE,vo${entityName}.getPrimaryKey()});
			}
		}
		audit("createSave${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
		return vo${entityName};
	}
	
	public ${entityName}SearchCriteria search${entityName}(${entityName}SearchCriteria searchCriteria) throws AppException{
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		return ${entityName}Dao.search${entityName}(searchCriteria);
	}
	
	public Vo${entityName} get${entityName}ByPk(String ${entityName}) throws AppException{
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();

		return null;
	}
	
	private int delete${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp) throws AppException{
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		
		return 0;
	}
	
	private Vo${entityName} create${entityName}(Vo${entityName} vo${entityName}) throws AppException {
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}.setUpdateBy(tUserID);
		vo${entityName}.setUpdateTime(tCurrentTime);
		vo${entityName}.setVerifyBy(tUserID);
		vo${entityName}.setVerifyTime(tCurrentTime);
		vo${entityName}.setDataStatus(SetupConstants.CREATE);
		vo${entityName}.setDataActive(BaseConstants.NO);
		${entityName}Dao.create${entityName}(vo${entityName});
		
		
		
		
		
		
		audit("create${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
		return vo${entityName};
	}

	public Vo${entityName} createSubmit${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		boolean isDualControl = SetupUtil.isDualControl();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateBy(userCode);
		vo${entityName}.setUpdateTime(gmtTimestamp);
		if (isDualControl) {
			vo${entityName}.setDataStatus(SetupConstants.PENDING_CREATE);//p
			vo${entityName}.setDataActive(BaseConstants.NO);
		} else {
			vo${entityName}.setDataStatus(SetupConstants.VERIFIED);
			vo${entityName}.setDataActive(BaseConstants.YES);
			vo${entityName}.setVerifyBy(userCode);
			vo${entityName}.setVerifyTime(gmtTimestamp);
		}
		try {
			if (oldTimestamp == null) {
				${entityName}Dao.create${entityName}(vo${entityName});
			} else {
				int rows = 0;
				if (isDualControl) {
					rows = ${entityName}Dao.update${entityName}(vo${entityName}, oldTimestamp);
				} else {
					rows = ${entityName}Dao.updateVerify${entityName}(vo${entityName}, oldTimestamp);
				}
				if (rows == 0) {
					throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {
						TASK_TYPE,vo${entityName}.getPrimaryKey()});
				}
			}
			//createKeyApis(vo${entityName}.get${entityName}(),vo${entityName}.getVoApiRegisters());
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		audit("createSubmit${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
		return vo${entityName};
	}

	public Vo${entityName} createApproveVo${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}.setDataStatus(SetupConstants.VERIFIED);
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateTime(gmtTimestamp);
		vo${entityName}.setVerifyBy(userCode);
		vo${entityName}.setVerifyTime(gmtTimestamp);
		vo${entityName}.setDataActive(CdaConstants.YES);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateVerifyStatus(vo${entityName}, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {
				TASK_TYPE, vo${entityName}.getPrimaryKey() });
		}
		audit("createApproveVo${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
		return vo${entityName};
	}

	public void createRejectVo${entityName}(Vo${entityName} vo${entityName})throws AppException {
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}.setDataStatus(SetupConstants.CREATION_REJECTED);
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateTime(gmtTimestamp);
		vo${entityName}.setVerifyBy(userCode);
		vo${entityName}.setVerifyTime(gmtTimestamp);
		vo${entityName}.setDataActive(CdaConstants.NO);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateVerifyStatus(vo${entityName},oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {
				TASK_TYPE, vo${entityName}.getPrimaryKey() });
		}
		//add note
		VoNote note = new VoNote();
		note.setDataKey(vo${entityName}.getPrimaryKey());
		note.setNoteType(vo${entityName}.getDataStatus());
		note.setNoteMsg(vo${entityName}.getMessage());
		note.setCreateBy(userCode);
		note.setUpdateTime(gmtTimestamp);
		createNote(note);
		audit("createRejectVo${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
	}

	private void createNote(VoNote note) throws AppException {
		note.setDataType(TASK_TYPE);
		note.setCompanyCode(this.getCurrentUser().getWorkingCompanyCode());
		NoteBo noteBo = new NoteBo();
		try {
			noteBo.createNote(note);
		} catch (AppException e) {
			logger.error("create note is error for settle config.", e);
			throw new AppException(e.getMessage());
		}
	}

	public void createCancel(Vo${entityName} vo${entityName}) throws AppException{
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		int rows = 0;
		try {
			rows = delete${entityName}(vo${entityName}, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {
				TASK_TYPE, vo${entityName}.getPrimaryKey() });
		}
		// delete workflow
		audit("createCancelVo${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
	}

	public void updateSaveVo${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setDataStatus(SetupConstants.UPDATE);
		vo${entityName}.setUpdateBy(userCode);
		vo${entityName}.setUpdateTime(gmtTimestamp);
		vo${entityName}.setDataXml(SetupUtil.serializeObjectToBase64(vo${entityName}));
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateStatusAndXml(vo${entityName}, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {
				TASK_TYPE, vo${entityName}.getPrimaryKey() });
		}
		audit("updateSave${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
	}

	public void updateSubmitVo${entityName}(Vo${entityName} vo${entityName}) throws AppException {
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		boolean isDualControl = SetupUtil.isDualControl();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateBy(userCode);
		vo${entityName}.setUpdateTime(gmtTimestamp);
		if (isDualControl) {
			vo${entityName}.setDataXml(SetupUtil.serializeObjectToBase64(vo${entityName}));
			vo${entityName}.setDataStatus(SetupConstants.PENDING_UPDATE);
			vo${entityName}.setDataActive(BaseConstants.NO);
		} else {
			vo${entityName}.setDataXml(null);
			vo${entityName}.setDataStatus(SetupConstants.VERIFIED);
			vo${entityName}.setVerifyBy(userCode);
			vo${entityName}.setDataActive(BaseConstants.YES);
			vo${entityName}.setVerifyTime(gmtTimestamp);
		}
		int rows = 0;
		try {
			if (isDualControl) {
				rows = ${entityName}Dao.updateStatusAndXml(vo${entityName}, oldTimestamp);
			} else {
				rows = ${entityName}Dao.updateVerify${entityName}(vo${entityName}, oldTimestamp);
				//createUpdateKeyApis(vo${entityName}.get${entityName}(), vo${entityName}.getVoApiRegisters());
			}
		} catch (AppException e) {
			logger.error("vo${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {
				TASK_TYPE, vo${entityName}.getPrimaryKey() });
		}
		audit("updateSubmitVo${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(), vo${entityName});
	}

	public Vo${entityName} getUpdateVo${entityName}ByPk(String primarkKey) throws AppException{
		Vo${entityName} vo${entityName} = null;
		try {
			vo${entityName} = get${entityName}ByPk(primarkKey);
		} catch (AppException e) {
			logger.error("vo${entityName} error", e);
			throw e;
		}
		Vo${entityName} vo${entityName}2 = (Vo${entityName})SetupUtil.restoreObjectFromBase64(vo${entityName}.getDataXml());
		if (vo${entityName}2 == null) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[] {TASK_TYPE,primarkKey});
		}
		vo${entityName}2.setUpdateBy(vo${entityName}.getUpdateBy());
		vo${entityName}2.setUpdateTime(vo${entityName}.getUpdateTime());
		vo${entityName}2.setDataStatus(vo${entityName}.getDataStatus());
		return vo${entityName}2;
	}

	public Vo${entityName}[] getDual${entityName}ByPk(String primarkKey) throws AppException{
		Vo${entityName}[] dual = new Vo${entityName}[2];
		Vo${entityName} vo${entityName} = null;
		try {
			vo${entityName} = get${entityName}ByPk(primarkKey);
		} catch (AppException e) {
			logger.error("vo${entityName} error", e);
			throw e;
		}
		dual[0] = vo${entityName};
		dual[1] = (Vo${entityName})SetupUtil.restoreObjectFromBase64(vo${entityName}.getDataXml());
		return dual;
	}

	public void updateApprove${entityName}(Vo${entityName} vo${entityName}2) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}2.setDataStatus(SetupConstants.VERIFIED);
		Date oldTimestamp = vo${entityName}2.getUpdateTime();
		vo${entityName}2.setDataXml(null);
		vo${entityName}2.setUpdateTime(gmtTimestamp);
		vo${entityName}2.setVerifyBy(userCode);
		vo${entityName}2.setVerifyTime(gmtTimestamp);
		vo${entityName}2.setDataActive(BaseConstants.YES);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateVerify${entityName}(vo${entityName}2, oldTimestamp);
			//createUpdateKeyApis(vo${entityName}2.get${entityName}(),vo${entityName}2.getVoApiRegisters());
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[]{TASK_TYPE, vo${entityName}2.getPrimaryKey() });
		}
		audit("updateApprove${entityName}", TASK_TYPE, vo${entityName}2.getPrimaryKey(),vo${entityName}2);
	}

	public void updateReject${entityName}(Vo${entityName} vo${entityName}2) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}2.setDataStatus(SetupConstants.UPDATION_REJECTED);
		Date oldTimestamp = vo${entityName}2.getUpdateTime();
		vo${entityName}2.setUpdateTime(gmtTimestamp);
		vo${entityName}2.setVerifyBy(userCode);
		vo${entityName}2.setVerifyTime(gmtTimestamp);
		vo${entityName}2.setDataActive(BaseConstants.YES);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateVerifyStatus(vo${entityName}2, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[]{TASK_TYPE, vo${entityName}2.getPrimaryKey() });
		}
		//add note
		VoNote note = new VoNote();
		note.setDataKey(vo${entityName}2.getPrimaryKey());
		note.setNoteType(vo${entityName}2.getDataStatus());
		note.setNoteMsg(vo${entityName}2.getMessage());
		note.setCreateBy(userCode);
		note.setUpdateTime(gmtTimestamp);
		createNote(note);
		audit("updateReject${entityName}", TASK_TYPE, vo${entityName}2.getPrimaryKey(),vo${entityName}2);
	}

	public void updateCancel${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}.setDataXml(null);
		vo${entityName}.setDataStatus(SetupConstants.VERIFIED);
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateBy(userCode);
		vo${entityName}.setUpdateTime(gmtTimestamp);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateStatusAndXml(vo${entityName}, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[]{TASK_TYPE, vo${entityName}.getPrimaryKey() });
		}
		// delete workflow
		audit("updateCancel${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(),vo${entityName});
	}

	public void deleteSubmit${entityName}(Vo${entityName} vo${entityName}) throws AppException {
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		boolean isDualControl = SetupUtil.isDualControl();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		int rows = 0;
		try {
			if (isDualControl) {
				vo${entityName}.setDataStatus(SetupConstants.PENDING_DELETE);
				vo${entityName}.setUpdateBy(userCode);
				vo${entityName}.setUpdateTime(gmtTimestamp);
				rows = ${entityName}Dao.updateStatus(vo${entityName}, oldTimestamp);
			} else {
				rows = delete${entityName}(vo${entityName}, oldTimestamp);
			}
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[]{TASK_TYPE,vo${entityName}.getPrimaryKey() });
		}
		audit("deleteSubmit${entityName}", TASK_TYPE, vo${entityName}.getPrimaryKey(),vo${entityName});
	}

	public void deleteApprove${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		int rows = 0;
		try {
			rows = delete${entityName}(vo${entityName}, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE,new Object[]{TASK_TYPE,vo${entityName}.getPrimaryKey() });
		}
		audit("deleteApprove${entityName}",TASK_TYPE,vo${entityName}.getPrimaryKey(),vo${entityName});
	}

	public void deleteReject${entityName}(Vo${entityName} vo${entityName}) throws AppException{
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}.setDataStatus(SetupConstants.DELETE_REJECTED);
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateTime(gmtTimestamp);
		vo${entityName}.setVerifyBy(userCode);
		vo${entityName}.setVerifyTime(gmtTimestamp);
		vo${entityName}.setDataActive(BaseConstants.YES);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateVerifyStatus(vo${entityName}, oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE,new Object[]{TASK_TYPE,vo${entityName}.getPrimaryKey() });
		}
		//add note
		VoNote note = new VoNote();
		note.setDataKey(vo${entityName}.getPrimaryKey());
		note.setNoteType(vo${entityName}.getDataStatus());
		note.setNoteMsg(vo${entityName}.getMessage());
		note.setCreateBy(userCode);
		note.setUpdateTime(gmtTimestamp);
		createNote(note);
		audit("deleteReject${entityName}",TASK_TYPE,vo${entityName}.getPrimaryKey(),vo${entityName});
	}

	public void deleteCancel${entityName}(Vo${entityName} vo${entityName}) throws AppException {
		Date gmtTimestamp = DateUtil.getGMTTimestamp().getTime();
		String userCode = getCurrentUser().getUserId();
		${entityName}Dao ${entityName}Dao = ${entityName}DaoFactory.getDao();
		vo${entityName}.setDataStatus(SetupConstants.VERIFIED);
		Date oldTimestamp = vo${entityName}.getUpdateTime();
		vo${entityName}.setUpdateBy(userCode);
		vo${entityName}.setUpdateTime(gmtTimestamp);
		int rows = 0;
		try {
			rows = ${entityName}Dao.updateStatus(vo${entityName},oldTimestamp);
		} catch (AppException e) {
			logger.error("${entityName} error", e);
			throw e;
		}
		if (rows == 0) {
			throw new AppException(BaseConstants.CONCURRENT_CONFLICT_ERROR_CODE, new Object[]{TASK_TYPE,vo${entityName}.getPrimaryKey() });
		}
		audit("deleteCancel${entityName}", TASK_TYPE,vo${entityName}.getPrimaryKey(),vo${entityName});
	}

	
}
