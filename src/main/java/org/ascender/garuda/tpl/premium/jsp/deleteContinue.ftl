<%@ taglib uri="jstl-core" prefix="c" %>
<%@ taglib uri="waf" prefix="waf" %>
<%@page import="com.pti.util.format.FormatConstants"%>
<waf:html>
<head>
	<title>${entityName}DeleteContinue</title>
	<script language="javascript" src="./resources/<waf:theme/>/js/util/listformactor.js"></script>
	<script language="JavaScript" src="./resources/<waf:theme/>/js/util/tableutil.js"></script>
	<script language="javascript" src="./resources/<waf:theme/>/js/util/numberAndChar.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/common/uploadattachments.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/util/calendar.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/uit/scrolltable.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/util/collections.js"></script>
	<script language="javascript" src="resources/<waf:theme/>/js/util/selectutil.js"></script>
	<script language="javascript">
	function doSubmit() {
		var okCallback = function() {
			generalSubmit(document.forms[0],  "./apiKeyDeleteSubmit.do");	
		};
		_confirmDelete(document.forms[0].elements['voApiKey.apiKey'].value, okCallback);
	}
	function doCancel() {
       	var okCallback = function() {
		    generalSubmit(document.forms[0],  "./apiKeyDeleteCancel.do");	
		};
		_confirmCancel(document.forms[0].elements['voApiKey.apiKey'].value, okCallback);
	}
	var JS_PK_SPLITOR="<%=com.pti.fsc.common.BaseConstants.PK_SPLITOR%>";
	function createNote(){
		var noteAction = "./noteCreate.do";
		var dataKey = document.forms[0].elements['voApiKey.apiKey'].value;
		var dataType = "APIKEY";
		var dataStatus = document.forms[0].elements['voApiKey.dataStatus'].value;
		if(dataKey != "" && dataType !="" && dataStatus != "") {
			openNote(noteAction,dataKey,dataType,dataStatus);
		}
	}	
	function initItems() {
        //note
        addIconIntoToolbar('./icons/note.gif','<waf:label key="icon.alt.note"/>',createNote);
        //audit
        prepareAuditData(null, "APIKEY", document.forms[0].elements['voApiKey.apiKey'].value);
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
										<td class="info"><waf:label key="apiKey.apiKeyDeleteContinueTitle" /></td>
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
										<button id="btnSubmit" class="appButton" type="button" title="<waf:label key='button.alt.submit'/>" onclick="return doSubmit();">
										<span class="btnSubmit"><label><waf:label key="button.text.submit"/></label></span>
										</button>
									</td>
									<td class="button-space">
										<button id="btnCancel" class="appButton" type="button" title="<waf:label key='button.alt.cancel'/>" onclick="return doCancel();">
										<span class="btnCancel"><label><waf:label key="button.text.cancel"/></label></span>
										</button>
									</td>
									<td class="button-space">
										<button id="btnBack" class="appButton" type="button" title="<waf:label key='button.alt.back'/>" onclick="backOriginPage(document.forms['apiKeyForm']);">
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
														<jsp:include page="include/apiKeyViewGeneral.jsp" flush="true"/>
														<jsp:include page="include/apiKeyViewRelation.jsp" flush="true"/>
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