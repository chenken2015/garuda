package com.pti.fsc.api.restful.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pti.fsc.api.restful.ApiAction;
import com.pti.fsc.api.restful.delegate.${entityName}Delegate;
import com.pti.fsc.api.restful.formbean.${entityName}Form;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.fsc.cda.common.CdaSetupStatusInfo;
import com.pti.fsc.common.setup.SetupUtil;
import com.pti.fsc.common.wf.WfException;
import com.pti.fsc.common.wf.WfTask;
import com.pti.fsc.wfe.AdminWfHelper;
import com.pti.fsc.wfe.AdminWfTaskConstants;
import com.pti.util.exception.AppException;
import com.pti.util.messagebundle.MessageInfo;
import com.pti.util.messagebundle.MessagesInfo;
import com.pti.waf.common.AcknowledgeInfo;
import com.pti.waf.mvc.controller.WafControllerConfig;
import com.pti.waf.mvc.controller.WafModel;
import com.pti.waf.mvc.controller.WafViewer;

public class ${entityName}Controller extends ApiAction{

	private final static String ACTION_CREATE = "/${entityName?uncap_first}Create";
	private final static String ACTION_CREATE_SAVE = "/${entityName?uncap_first}CreateSave";
	private final static String ACTION_CREATE_SUBMIT = "/${entityName?uncap_first}CreateSubmit";
	private final static String ACTION_CREATE_CONTINUE = "/${entityName?uncap_first}CreateContinue";
	private final static String ACTION_CREATE_VERIFY = "/${entityName?uncap_first}CreateVerify";
	private final static String ACTION_CREATE_APPROVE = "/${entityName?uncap_first}CreateApprove";
	private final static String ACTION_CREATE_REJECT = "/${entityName?uncap_first}CreateReject";
	private final static String ACTION_CREATE_CANCEL = "/${entityName?uncap_first}CreateCancel";
	private final static String ACTION_CREATE_PURGE = "/${entityName?uncap_first}CreatePurge";
	private final static String ACTION_CREATE_PURGE_SUBMIT = "/${entityName?uncap_first}CreatePurgeSubmit";
	private final static String ACTION_UPDATE = "/${entityName?uncap_first}Update";
	private final static String ACTION_UPDATE_SAVE = "/${entityName?uncap_first}UpdateSave";
	private final static String ACTION_UPDATE_SUBMIT = "/${entityName?uncap_first}UpdateSubmit";
	private final static String ACTION_UPDATE_CONTINUE = "/${entityName?uncap_first}UpdateContinue";
	private final static String ACTION_UPDATE_VERIFY = "/${entityName?uncap_first}UpdateVerify";
	private final static String ACTION_UPDATE_APPROVE = "/${entityName?uncap_first}UpdateApprove";
	private final static String ACTION_UPDATE_REJECT = "/${entityName?uncap_first}UpdateReject";
	private final static String ACTION_UPDATE_CANCEL = "/${entityName?uncap_first}UpdateCancel";
	private final static String ACTION_UPDATE_PURGE = "/${entityName?uncap_first}UpdatePurge";
	private final static String ACTION_UPDATE_PURGE_SUBMIT = "/${entityName?uncap_first}UpdatePurgeSubmit";
	private final static String ACTION_DELETE = "/${entityName?uncap_first}Delete";
	private final static String ACTION_DELETE_SUBMIT = "/${entityName?uncap_first}DeleteSubmit";
	private final static String ACTION_DELETE_CONTINUE = "/${entityName?uncap_first}DeleteContinue";
	private final static String ACTION_DELETE_VERIFY = "/${entityName?uncap_first}DeleteVerify";
	private final static String ACTION_DELETE_APPROVE = "/${entityName?uncap_first}DeleteApprove";
	private final static String ACTION_DELETE_REJECT = "/${entityName?uncap_first}DeleteReject";
	private final static String ACTION_DELETE_CANCEL = "/${entityName?uncap_first}DeleteCancel";
	private final static String ACTION_DELETE_PURGE = "/${entityName?uncap_first}DeletePurge";
	private final static String ACTION_DELETE_PURGE_SUBMIT = "/${entityName?uncap_first}DeletePurgeSubmit";
	private final static String ACTION_VIEW = "/${entityName?uncap_first}View";
	
	private static AcknowledgeInfo createSaveOkAckInfo = null;
	private static AcknowledgeInfo createSubmitOkAckInfo = null;
	private static AcknowledgeInfo createApproveOkAckInfo = null;
	private static AcknowledgeInfo createRejectOkAckInfo = null;
	private static AcknowledgeInfo createCancelOkAckInfo = null;
	private static AcknowledgeInfo createPurgeSubmitOkAckInfo = null;
	private static AcknowledgeInfo updateSaveOkAckInfo = null;
	private static AcknowledgeInfo updateSubmitOkAckInfo = null;
	private static AcknowledgeInfo updateApproveOkAckInfo = null;
	private static AcknowledgeInfo updateRejectOkAckInfo = null;
	private static AcknowledgeInfo updateCancelOkAckInfo = null;
	private static AcknowledgeInfo updatePurgeSubmitOkAckInfo = null;
	private static AcknowledgeInfo deleteSubmitOkAckInfo = null;
	private static AcknowledgeInfo deleteApproveOkAckInfo = null;
	private static AcknowledgeInfo deleteRejectOkAckInfo = null;
	private static AcknowledgeInfo deleteCancelOkAckInfo = null;
	private static AcknowledgeInfo deletePurgeSubmitOkAckInfo = null;
	
	static {
		MessageInfo title = new MessageInfo("${entityName?uncap_first}.acktitle.createSave");
		MessageInfo msg = new MessageInfo("${entityName?uncap_first}.ack.createSaveOk");
		MessagesInfo msgs = new MessagesInfo();
		msgs.addMessage(msg);
		createSaveOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.createSubmit");
		msg = new MessageInfo("apiKey.ack.createSubmitOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		createSubmitOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.createApprove");
		msg = new MessageInfo("${entityName?uncap_first}.ack.createApproveOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		createApproveOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.createReject");
		msg = new MessageInfo("${entityName?uncap_first}.ack.createRejectOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		createRejectOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.createCancel");
		msg = new MessageInfo("${entityName?uncap_first}.ack.createCancelOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		createCancelOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.createPurgeSubmit");
		msg = new MessageInfo("${entityName?uncap_first}.ack.createPurgeSubmitOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		createPurgeSubmitOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.updateSave");
		msg = new MessageInfo("${entityName?uncap_first}.ack.updateSaveOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		updateSaveOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.updateSubmit");
		msg = new MessageInfo("${entityName?uncap_first}.ack.updateSubmitOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		updateSubmitOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.updateApprove");
		msg = new MessageInfo("${entityName?uncap_first}.ack.updateApproveOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		updateApproveOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.updateReject");
		msg = new MessageInfo("${entityName?uncap_first}.ack.updateRejectOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		updateRejectOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.updateCancel");
		msg = new MessageInfo("${entityName?uncap_first}.ack.updateCancelOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		updateCancelOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.updatePurgeSubmit");
		msg = new MessageInfo("${entityName?uncap_first}.ack.updatePurgeSubmitOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		updatePurgeSubmitOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.deleteSubmit");
		msg = new MessageInfo("${entityName?uncap_first}.ack.deleteSubmitOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		deleteSubmitOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.deleteApprove");
		msg = new MessageInfo("${entityName?uncap_first}.ack.deleteApproveOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		deleteApproveOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.deleteReject");
		msg = new MessageInfo("${entityName?uncap_first}.ack.deleteRejectOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		deleteRejectOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.deleteCancel");
		msg = new MessageInfo("${entityName?uncap_first}.ack.deleteCancelOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		deleteCancelOkAckInfo = new AcknowledgeInfo(title, msgs);
		title = new MessageInfo("${entityName?uncap_first}.acktitle.deletePurgeSubmit");
		msg = new MessageInfo("${entityName?uncap_first}.ack.deletePurgeSubmitOk");
		msgs = new MessagesInfo();
		msgs.addMessage(msg);
		deletePurgeSubmitOkAckInfo = new AcknowledgeInfo(title, msgs);
	}
	
	private final static String WF_DATATYPE = "${entityName?upper_case}";
	
	public ${entityName}Controller(){
		super();
	}
	
	@Override
	public WafViewer apiExecute(WafControllerConfig mapping, WafModel wafModel,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardName = null;
		String action = mapping.getPath();
		${entityName}Form theForm = (${entityName}Form)wafModel;
		${entityName}Delegate delegate = ${entityName}Delegate.getInstance();
		if(ACTION_CREATE.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			//set other attribute
			
			
			forwardName = "${entityName?uncap_first}Create";
		}else if(ACTION_CREATE_SAVE.equals(action)){
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			WfTask task = null;
			long wfItemId = theForm.getWfItemId();
			voApiKey = delegate.createSaveApiKey(voApiKey);
		    if(wfItemId!=0){
				if("C".equals(voApiKey.getDataStatus())||"J".equals(voApiKey.getDataStatus())){
					task = AdminWfHelper.getWfTask(request);
				}
				AdminWfHelper.completeTask(task,AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_CREATE_SAVED));
		    }else{
			   AdminWfHelper.startProcess(AdminWfTaskConstants.RESULT_CREATE_SAVED,Vo${entityName}.getPrimaryKey(),WF_DATATYPE);
		    }
		    this.setAcknowledgeMessages(request, createSaveOkAckInfo);
		    forwardName = "${entityName?uncap_first}CreateSaveOK";
		}else if(ACTION_VIEW.equals(action)){
			//String apiKey = theForm.getApiKey();
			//VoApiKey voApiKey = delegate.getApiKeyByPk(apiKey);
			//theForm.setVoApiKey(voApiKey);
			forwardName = "apiKeyView";
		}else if(ACTION_CREATE_SUBMIT.equals(action)){
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			vo${entityName} = delegate.createSubmit${entityName}(vo${entityName});
			WfTask task=null;
		    long wfItemId = theForm.getWfItemId();
		    if(wfItemId!=0){
		    	/*if("P".equals(voApiKey.getDataStatus())){
					task = AdminWfHelper.getWfTask(request);
				}*/
		    	task = AdminWfHelper.getWfTask(request);
				AdminWfHelper.completeTask(task,AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_CREATE_SUBMITED));
		    }else{
			   AdminWfHelper.startProcess(
					   AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_CREATE_SUBMITED),
					   vo${entityName}.getPrimaryKey(), 
					   WF_DATATYPE);
		    }
		    this.setAcknowledgeMessages(request, createSubmitOkAckInfo);
		    forwardName = "createSubmitOk";
		}else if(ACTION_CREATE_CONTINUE.equals(action)){
			WfTask task = AdminWfHelper.getWfTask(request);
			//VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			//theForm.setVoApiKey(voApiKey);
			forwardName = "apiKeyCreateContinue";
		}else if(ACTION_CREATE_VERIFY.equals(action)){
			WfTask task = AdminWfHelper.getWfTask(request);
			//VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			//theForm.setVoApiKey(voApiKey);
			forwardName = "createVerify";
		}else if (ACTION_CREATE_APPROVE.equals(action)) {
			 WfTask task = AdminWfHelper.getWfTask(request);
			 //VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			 //delegate.createApproveVoApiKey(voApiKey);
			 
			 AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_CREATE_APPROVED);
			 forwardName = "createApproveOk";
			 this.setAcknowledgeMessages(request, createApproveOkAckInfo);
		}else if (ACTION_CREATE_REJECT.equals(action)) {
			 /*VoApiKey voApiKeyFromPage = theForm.getVoApiKey();
			 WfTask task = AdminWfHelper.getWfTask(request);
			 VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			 voApiKey.setMessage(voApiKeyFromPage.getMessage());
			 delegate.createRejectVoApiKey(voApiKey);
			 String coments = voApiKey.getMessage();*/
			// AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_CREATE_REJECTED, coments);
			 forwardName = "createRejectOk";
			 this.setAcknowledgeMessages(request, createRejectOkAckInfo);
		}else if (ACTION_CREATE_CANCEL.equals(action)) {
			 WfTask task = AdminWfHelper.getWfTask(request);
			 //VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			 //delegate.createCancel(vo${entityName});
			 AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_CREATE_CANCELED);
			 forwardName = "createCancelOk";
			 this.setAcknowledgeMessages(request, createCancelOkAckInfo);
		}else if(ACTION_CREATE_PURGE.equals(action)){
			
		}else if (ACTION_UPDATE.equals(action)) {
			//String apiKey = theForm.getApiKey();
			//VoApiKey voApiKey = delegate.getApiKeyByPk(apiKey);
			request.setAttribute("originUrl", "apiKeyList.do");//for concurrent-conflict back
			if (!CdaSetupStatusInfo.DATASTATUS_VERIFIED.equals(voApiKey.getDataStatus())) {
				throw new WfException("global.error.concurrent-conflict", new Object[] { WF_DATATYPE, apiKey.toString() });
			}
			//theForm.setVoApiKey(voApiKey);
			setTheFormOtherItems(theForm);
			forwardName = "update";
		}else if (ACTION_UPDATE_SAVE.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			long wfItemId = theForm.getWfItemId();
			WfTask task=null;
			//delegate.updateSaveVoApiKey(voApiKey);
		    if(wfItemId!=0){
				if("U".equals(voApiKey.getDataStatus())||"T".equals(voApiKey.getDataStatus())){
					task = AdminWfHelper.getWfTask(request);
				}
				AdminWfHelper.completeTask(task,AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_UPDATE_SAVED));
		    }else{
			    AdminWfHelper.startProcess(AdminWfTaskConstants.RESULT_UPDATE_SAVED, 
			    					vo${entityName}.getPrimaryKey(), 
			    					WF_DATATYPE);
	        }
			forwardName = "updateSaveOk";
			this.setAcknowledgeMessages(request, updateSaveOkAckInfo);
		}else if (ACTION_UPDATE_SUBMIT.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			//delegate.updateSubmitVoApiKey(voApiKey);
		    WfTask task=null;
			long wfItemId = theForm.getWfItemId();
		    if(wfItemId!=0){
				if("G".equals(voApiKey.getDataStatus())||"U".equals(voApiKey.getDataStatus())){
					task = AdminWfHelper.getWfTask(request);
				}
				AdminWfHelper.completeTask(task,AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_UPDATE_SUBMITED));
		    }else{
			   AdminWfHelper.startProcess(AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_UPDATE_SUBMITED), 
			   					vo${entityName}.getPrimaryKey(), 
			   					WF_DATATYPE);
		    }
			forwardName = "updateSubmitOk";
			this.setAcknowledgeMessages(request, updateSubmitOkAckInfo);
		}else if (ACTION_UPDATE_CONTINUE.equals(action)) {
			WfTask task = AdminWfHelper.getWfTask(request);
			//VoApiKey voApiKey = delegate.getUpdateVoApiKeyByPk(task.getItemKey());
			theForm.setVo${entityName}(vo${entityName});
			setTheFormOtherItems(theForm);
			forwardName = "updateContinue";
		}else if (ACTION_UPDATE_VERIFY.equals(action)) {
			/*VoApiKey voApiKey = theForm.getVoApiKey();
			VoApiKey voApiKey2 = theForm.getVoApiKey2();
			WfTask task = AdminWfHelper.getWfTask(request);
			VoApiKey[] dual = delegate.getDualApiKeyByPk(task.getItemKey());
			voApiKey = dual[0];
			voApiKey2 = dual[1];
			theForm.setVoApiKey(voApiKey);
			theForm.setVoApiKey2(voApiKey2);*/
			forwardName = "updateVerify";
		}else if (ACTION_UPDATE_APPROVE.equals(action)) {
			/*WfTask task = AdminWfHelper.getWfTask(request);
			VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			VoApiKey voApiKey2 = (VoApiKey)SetupUtil.restoreObjectFromBase64(voApiKey.getDataXml());
			voApiKey2.setUpdateTime(voApiKey.getUpdateTime());
			delegate.updateApproveApiKey(voApiKey2);*/
			AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_UPDATE_APPROVED);
			forwardName = "updateApproveOk";
			this.setAcknowledgeMessages(request, updateApproveOkAckInfo);
		}else if (ACTION_UPDATE_REJECT.equals(action)) {
			WfTask task = AdminWfHelper.getWfTask(request);
			/*VoApiKey voApiKeyFromPage = theForm.getVoApiKey();
			VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			VoApiKey voApiKey2 = (VoApiKey)SetupUtil.restoreObjectFromBase64(voApiKey.getDataXml());
			voApiKey2.setUpdateTime(voApiKey.getUpdateTime());
			voApiKey2.setMessage(voApiKeyFromPage.getMessage());
			delegate.updateRejectApiKey(voApiKey2);
			String comments = voApiKey2.getMessage();*/
			AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_UPDATE_REJECTED, comments);
			forwardName = "updateRejectOk";
			this.setAcknowledgeMessages(request, updateRejectOkAckInfo);
		}else if (ACTION_UPDATE_CANCEL.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			WfTask task = AdminWfHelper.getWfTask(request);
			delegate.updateCancel${entityName}(vo${entityName});
			AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_UPDATE_CANCELED);
			forwardName = "updateCancelOk";
			this.setAcknowledgeMessages(request, updateCancelOkAckInfo);
		}else if (ACTION_DELETE.equals(action)) {
			String pk = theForm.getPk();
			Vo${entityName} vo${entityName} = delegate.get${entityName}ByPk(pk);
			request.setAttribute("originUrl", "apiKeyList.do");
			if (!CdaSetupStatusInfo.DATASTATUS_VERIFIED.equals(voApiKey.getDataStatus())) {
				throw new WfException("global.error.concurrent-conflict", new Object[] { WF_DATATYPE, apiKey.toString() });
			}
			theForm.setVo${entityName}(vo${entityName});
			setTheFormOtherItems(theForm);
			forwardName = "delete";
		}else if (ACTION_DELETE_CONTINUE.equalsIgnoreCase(action)) {
			WfTask task = AdminWfHelper.getWfTask(request);
			VoApiKey voApiKey = delegate.getApiKeyByPk(task.getItemKey());
			theForm.setVoApiKey(voApiKey);
			setTheFormOtherItems(theForm);
			forwardName = "deleteContinue";
		}else if (ACTION_DELETE_SUBMIT.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			vo${entityName} = delegate.get${entityName}ByPk(vo${entityName}.get${entityName}());
			String dataStatus = voApiKey.getDataStatus();
			delegate.deleteSubmit${entityName}(vo${entityName});
			if("V".equals(dataStatus)){
				AdminWfHelper.startProcess(
						AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_DELETE_SUBMITTED), 
						vo${entityName}.getPrimaryKey(), 
						WF_DATATYPE);
			}else if("H".equals(dataStatus)){
				WfTask task = AdminWfHelper.getWfTask(request);
				AdminWfHelper.completeTask(task,AdminWfTaskConstants.getTaskResult(AdminWfTaskConstants.RESULT_DELETE_SUBMITTED));
			}
			forwardName = "deleteSubmitOk";
			this.setAcknowledgeMessages(request, deleteSubmitOkAckInfo);
		}else if (ACTION_DELETE_VERIFY.equalsIgnoreCase(action)) {
			WfTask task = AdminWfHelper.getWfTask(request);
			Vo${entityName} vo${entityName} = delegate.get${entityName}ByPk(task.getItemKey());
			theForm.setVo${entityName}(vo${entityName});
			forwardName = "deleteVerify";
		}else if (ACTION_DELETE_APPROVE.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			WfTask task = AdminWfHelper.getWfTask(request);
			delegate.deleteApprove${entityName}(vo${entityName});
			AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_DELETE_APPROVED);
			forwardName = "deleteApproveOk";
			this.setAcknowledgeMessages(request, deleteApproveOkAckInfo);
		}else if (ACTION_DELETE_REJECT.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			WfTask task = AdminWfHelper.getWfTask(request);
			delegate.deleteReject${entityName}(vo${entityName});
			String comments = vo${entityName}.getMessage();
			AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_DELETE_REJECTED, comments);
			forwardName = "deleteRejectOk";
			this.setAcknowledgeMessages(request, deleteRejectOkAckInfo);
		}else if (ACTION_DELETE_CANCEL.equals(action)) {
			Vo${entityName} vo${entityName} = theForm.getVo${entityName}();
			WfTask task = AdminWfHelper.getWfTask(request);
			delegate.deleteCancel${entityName}(vo${entityName});
			AdminWfHelper.completeTask(task, AdminWfTaskConstants.RESULT_DELETE_CANCELED);
			forwardName = "deleteCancelOk";
			this.setAcknowledgeMessages(request, deleteCancelOkAckInfo);
		}
		return mapping.findViewer(forwardName);
	}

}
