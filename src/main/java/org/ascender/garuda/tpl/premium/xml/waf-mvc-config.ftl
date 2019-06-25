<model name="${entityName?uncap_first}Form" type="com.pti.fsc.${entityName?lower_case}.restful.formbean.${entityName}Form"/>
<model name="${entityName?uncap_first}GridForm" type="com.pti.fsc.${entityName?lower_case}.restful.formbean.${entityName}GridForm"/>
<!-- ${entityName} start -->
<controller path="/${entityName}List" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}GridController" 
	name="${entityName?uncap_first}GridForm" 
	scope="request"
	input="home"
	roles=""
	validate="true">
	<set-property property="validation" value="Form"/>
	<viewer name="home" path="/home.do"/>
	<viewer name="${entityName}List" path="${entityName?uncap_first}.${entityName}List"/>
</controller>
<controller path="/${entityName}Search" 
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}GridController" 
	name="${entityName?uncap_first}GridForm"
	scope="request"
	input="home">
	<viewer name="${entityName}Search" path="${entityName?uncap_first}.${entityName}Search"/>
	<viewer name="${entityName}List" path="${entityName?uncap_first}.${entityName}List"/>
</controller>
<controller path="/${entityName}View" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="${entityName}List"
	roles=""
	validate="true">
	<set-property property="validation" value="Form"/>
	<viewer name="${entityName}List" path="${entityName?uncap_first}.${entityName}List"/>
	<viewer name="${entityName}View" path="${entityName?uncap_first}.${entityName}View"/>
</controller>
<controller path="/${entityName}Create" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="home"
	roles=""
	validate="true">
	<set-property property="validation" value="Form"/>
	<viewer name="home" path="/home.do"/>
	<viewer name="${entityName}Create" path="${entityName?uncap_first}.${entityName}Create"/>
</controller>
<controller path="/${entityName}CreateSave" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="${entityName}CreateSaveFail"
	roles=""
	validate="true">
	<set-property property="validation" value="Form"/>
	<viewer name="createSaveOK" path="acknowledge"/>
	<viewer name="${entityName}CreateSaveOK" path="acknowledge"/>
	<viewer name="${entityName}CreateSaveFail" path="/${entityName}Create.do"/>
</controller>
<controller path="/${entityName}CreateSubmit" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="home"
	roles=""
	validate="true">
	<set-property property="validation" value="Form"/>
	<viewer name="createSubmitOk" path="acknowledge"/>
</controller>
<controller path="/${entityName}CreateContinue" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="${entityName}CreateContinueFail"
	roles=""
	validate="true">
	<viewer name="${entityName}CreateContinue" path="${entityName?uncap_first}.${entityName}CreateContinue"/>
	<viewer name="${entityName}CreateContinueFail" path="/wfSetupQueueList.do"/>
	<viewer name="createSaveOK" path="acknowledge"/>
</controller>
<controller path="/${entityName}CreateVerify" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="createVerifyFail"
	roles=""
	validate="true">
	<viewer name="createVerify" path="${entityName?uncap_first}.${entityName}CreateVerify"/>
	<viewer name="createVerifyFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}CreateApprove" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="createApproveFail"
	roles=""
	validate="true">
	<viewer name="createApproveOk" path="acknowledge"/>
	<viewer name="createApproveFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}CreateReject" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="createRejectFail"
	roles=""
	validate="true">
	<viewer name="createRejectOk" path="acknowledge"/>
	<viewer name="createRejectFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}CreateCancel" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="createCancelFail"
	roles=""
	validate="true">
	<viewer name="createCancelOk" path="acknowledge"/>
	<viewer name="createCancelOk" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}Update" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="${entityName}List"
	roles=""
	validate="true">
	<viewer name="update" path="${entityName?uncap_first}.${entityName}Update"/>
	<viewer name="${entityName}List" path="/${entityName}List.do"/>
</controller>
<controller path="/${entityName}UpdateSave" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateSaveFail"
	roles=""
	validate="true">
	<viewer name="updateSaveOk" path="acknowledge"/>
	<viewer name="updateSaveFail" path="/${entityName}Update.do"/>
</controller>
<controller path="/${entityName}UpdateSubmit" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateSubmitFail"
	roles=""
	validate="true">
	<viewer name="updateSubmitOk" path="acknowledge"/>
	<viewer name="updateSubmitFail" path="/${entityName}Update.do"/>
</controller>
<controller path="/${entityName}UpdateContinue" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateContinueFail"
	roles=""
	validate="true">
	<viewer name="updateContinue" path="${entityName?uncap_first}.${entityName}UpdateContinue"/>
	<viewer name="updateContinueFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}UpdateVerify" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateVerifyFail"
	roles=""
	validate="true">
	<viewer name="updateVerify" path="${entityName?uncap_first}.${entityName}UpdateVerify"/>
	<viewer name="updateVerifyFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}UpdateApprove" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateApproveFail"
	roles=""
	validate="true">
	<viewer name="updateApproveOk" path="acknowledge"/>
	<viewer name="updateApproveFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}UpdateReject" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateRejectFail"
	roles=""
	validate="true">
	<viewer name="updateRejectOk" path="acknowledge"/>
	<viewer name="updateRejectFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}UpdateCancel" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="updateCancelFail"
	roles=""
	validate="true">
	<viewer name="updateCancelOk" path="acknowledge"/>
	<viewer name="updateCancelFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}Delete" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteFail"
	roles=""
	validate="true">
	<viewer name="delete" path="${entityName?uncap_first}.${entityName}Delete"/>
	<viewer name="deleteFail" path="/${entityName}List.do"/>
</controller>
<controller path="/${entityName}DeleteContinue" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteContinueFail"
	roles=""
	validate="true">
	<viewer name="deleteContinue" path="${entityName?uncap_first}.${entityName}DeleteContinue"/>
	<viewer name="deleteContinueFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}DeleteSubmit" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteSubmitFail"
	roles=""
	validate="true">
	<viewer name="deleteSubmitOk" path="acknowledge"/>
	<viewer name="deleteSubmitFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}deleteVerify" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteVerifyFail"
	roles=""
	validate="true">
	<viewer name="deleteVerify" path="${entityName?uncap_first}.${entityName}DeleteVerify"/>
	<viewer name="deleteVerifyFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}DeleteApprove" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteApproveFail"
	roles=""
	validate="true">
	<viewer name="deleteApproveOk" path="acknowledge"/>
	<viewer name="deleteApproveFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}DeleteReject" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteRejectFail"
	roles=""
	validate="true">
	<viewer name="deleteRejectOk" path="acknowledge"/>
	<viewer name="deleteRejectFail" path="/wfSetupQueueList.do"/>
</controller>
<controller path="/${entityName}DeleteCancel" 		          
	type="com.pti.fsc.${entityName?lower_case}.restful.controller.${entityName}Controller" 
	name="${entityName?uncap_first}Form" 
	scope="request"
	input="deleteCancelFail"
	roles=""
	validate="true">
	<viewer name="deleteCancelOk" path="acknowledge"/>
	<viewer name="deleteCancelFail" path="/wfSetupQueueList.do"/>
</controller>
<!-- ${entityName} end -->