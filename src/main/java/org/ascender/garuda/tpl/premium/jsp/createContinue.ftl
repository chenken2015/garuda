<%@ taglib uri="jstl-core" prefix="c" %>
<%@ taglib uri="waf" prefix="waf" %>
<%@page import="com.pti.util.format.FormatConstants"%>
<waf:html>
<head>
	<title>${entityName}CreateContinue</title>
	<script language="javascript" src="./resources/<waf:theme/>/js/util/listformactor.js"></script>
	<script language="JavaScript" src="./resources/<waf:theme/>/js/util/tableutil.js"></script>
	<script language="javascript" src="./resources/<waf:theme/>/js/util/numberAndChar.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/common/uploadattachments.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/util/calendar.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/uit/scrolltable.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/util/collections.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/util/selectutil.js"></script>
	<script language="javascript">
		function doReset() {
			document.forms[0].reset();
			return false;
		}
		function doSave() {
	        if(doValidate()){
	        	var createdApiIds = document.all('createdApiIds');
	        	setAllOptionsSelected(createdApiIds, true);
			    generalSubmit(document.forms[0], "./apiKeyCreateSave.do");		
	        }
			return false;
		}
		
		function doCancel(){
			var okCallback = function() {
				generalSubmit(document.forms[0],  "./apiKeyCreateCancel.do");
			};
			_confirmCancel(document.forms[0].elements['voApiKey.apiKey'].value, okCallback);
		}

		function doSubmit() {
			if(doValidate()){
				var createdApiIds = document.all('createdApiIds');
	        	setAllOptionsSelected(createdApiIds, true);
			    generalSubmit(document.forms[0], "./apiKeyCreateSubmit.do");
			}
			return false;
		}

	    function doValidate() {
	    	clearMessages();
			if (isEmpty(document.all["voApiKey.applicationId"].value)) {
				addErrorMessage("js.pub.required","<waf:label key="apiKey.applicationId"/>");
			}
			if(hasMessages()) {
				showMessages();
				return false;
			} else {
				return true;
			}
	    }
	</script>
</head>
<body leftmargin="0" topmargin="0">
	<waf:form action="/apiKeyCreateSave.do" method="POST">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td valign="top" class="body-title">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="title-left30"><KBD><VAR><STRONG><B><%----%></B></STRONG></VAR></KBD>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="info"><waf:label key="apiKey.apiKeyCreateContinueTitle" /></td>
										<td class="work-info"></td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</td>
						<td width="77" valign="top"></td>
						<td width="20"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="main-box1">
					<table width="950" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" valign="top">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="button-space">
										<button id="btnSubmit" class="appButton" type="button" title="<waf:label key='button.alt.submit'/>" 
											onclick="return doSubmit();">
											<span class="btnSubmit"><label><waf:label key="button.text.submit"/></label></span>
										</button>
									</td>
									<td class="button-space">
										<button id="btnSave" class="appButton" type="button" title="<waf:label key='button.alt.save'/>" 
											onclick="return doSave();">
											<span class="btnSave"><label><waf:label key="button.text.save"/></label></span>
										</button>
									</td>
									<td class="button-space">
										<button id="btnCancel" class="appButton" type="button" title="<waf:label key='button.alt.cancel'/>" onclick="return doCancel();">
										<span class="btnCancel"><label><waf:label key="button.text.cancel"/></label></span>
										</button>
									</td>
									<td class="button-space">
										<button id="btnReset" class="appButton" type="button" title="<waf:label key='button.alt.reset'/>" 
											onclick="return doReset();">
											<span class="btnReset"><label><waf:label key="button.text.reset"/></label></span>
										</button>
									</td>
									<td class="button-space">
										<button id="btnBack" class="appButton" type="button" title="<waf:label key='button.alt.back'/>" 
											onclick="backOriginPage(document.forms[0]);">
											<span class="btnBack"><label><waf:label key="button.text.back"/></label></span>
										</button>
									</td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
			        		<td id="tabGrp1">
					    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
					        		<tr>
					           			<td id="tabTitle">
				            				<table height="25" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td id="apiKeyDiv_h" class="appTabOn"><span><label><waf:label key="label.apiKey"/></label></span></td>
								                	<td id="apisDiv_h" class="appTabOff"><span><label><waf:label key="label.apis"/></label></span></td>
													<td>&nbsp;</td>
												</tr>
											</table>
					            		</td>
					        		</tr>
									<tr>
										<td class="appTabBar"></td>
									</tr>
									<tr>
										<td id="tabBody" class="appTabPanelBorder">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>
														<jsp:include page="include/apiKeyCreateGeneral.jsp" flush="true"/>
														<jsp:include page="include/apiKeyCreateRelation.jsp" flush="true"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<waf:hidden property="originUrl" value="./wfSetupQueueList.do" />
		<waf:hidden property="wfItemId"/>
		<waf:hidden name="apiKeyForm" property="voApiKey.dataStatus" />
		<waf:hidden name="apiKeyForm" property="voApiKey.dataActive" />
		<waf:hidden name="apiKeyForm" property="voApiKey.updateTime" dataFormat="<%=FormatConstants.DFN_LONGTIMESTAMPZ%>" />
		<waf:hidden name="apiKeyForm" property="voApiKey.updateBy"/>
	</waf:form>
</body>
</waf:html>
<script>
	var tabGrp1 = JAF.buildAppTab("tabGrp1");
</script>