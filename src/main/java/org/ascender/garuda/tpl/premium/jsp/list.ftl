<%@page import="com.pti.util.application.ApplicationConfig"%>
<%@ taglib uri="jstl-core" prefix="c" %>
<%@ taglib uri="waf" prefix="waf" %>
<%@page import="com.pti.util.format.FormatConstants"%>
<%
ApplicationConfig appConfig = ApplicationConfig.getApplicationConfig();
String ssoAuthOnly = (String)appConfig.getAppProperty("SSO_AUTHENTICATE_ONLY"); 
%>
<waf:html>
<head>
<title>${entityName}List</title>
<script language="javascript" src="./resources/<waf:theme/>/js/util/search.js"></script>
<script language="javascript" src="resources/<waf:theme/>/js/util/imageswapper.js"></script>
<script language="javascript" src="./resources/<waf:theme/>/js/api/api.js"></script>
<script language="JavaScript" type="text/JavaScript">
	function radioButtonClick(formt, dataKeyValue, dataStatusValue) {
	    formt.elements['dataKey'].value = dataKeyValue;
	    formt.elements['dataStatus'].value = dataStatusValue;
	}
	/**
	* Do search.
	*/
	function doSearch() {	
		var arrSearchingItem = new Array("searchCriteria.apiKey","searchCriteria.clientName");
	    var sUrl = renderSearchingAction('./apiKeySearch.do', arrSearchingItem);
		fillSearchingItems(document.forms[0], sUrl, arrSearchingItem);
	}
</script>
</head>
	<%@ include file="/jsp/common/error/error_messages.jsp" %>
<body leftmargin="0" topmargin="0">
	<waf:form action="/apiKeyList.do" method="post">
		<input type="hidden" name="noteDataKey" value="" />
		<input type="hidden" name="noteDataStatus" value="" />
		<input type="hidden" name="dataKey"/>
		<input type="hidden" name="dataStatus" />
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" class="body-title">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="title-left30">
											<table width="750" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td class="info"><waf:label key="apiKey" /></td>
													<td class="work-info">&nbsp;</td>
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
		<table width="750" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="main-box1">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" valign="top">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="button-space" id="viewImg">
											<button id="btnView" 
													class="appButton" 
													type="button" 
													title="<waf:label key='button.alt.view'/>"
												    onclick="doService('V',document.forms[0],'./apiKeyView.do');">
												<span class="btnView">
													<label><waf:label key="button.text.view"/></label>
												</span>
											</button>
										</td>
										<td class="button-space" id="openImg">
											<button id="btnOpen" class="appButton" type="button" title="<waf:label key='button.alt.open'/>" 
											onclick="doService('O',document.forms[0],'./apiKeyUpdate.do');">
												<span class="btnOpen"><label><waf:label key="button.text.open"/></label></span>
											</button>
										</td>
										<td class="button-space" id="deleteImg">
											<button id="btnDelete" class="appButton" type="button" title="<waf:label key='button.alt.delete'/>" 
											onclick="doService('D',document.forms[0],'./apiKeyDelete.do');">
									    		<span class="btnDelete"><label><waf:label key="button.text.delete"/></label></span>
									    	</button>
										</td>
										<td class="button-space">
											<button 
												id="btnCreate" 
												class="appButton" 
												type="button" 
												title="<waf:label key='button.alt.create'/>"
												onclick="doService('C',document.forms[0],'./apiKeyCreate.do');">
												<span class="btnCreate">
													<label><waf:label key="button.text.create"/></label>
												</span>
											</button>
										</td>
										<td class="button-space">
											<button id="btnSearch" class="appButton" type="button" title="<waf:label key='button.alt.search'/>" onclick="doSearch();">
												<span class="btnSearch"><label><waf:label key="button.text.search"/></label></span>
											</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5">
							<table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="box-main-angle-left"><img src="./resources/<waf:theme/>/images/layout/box_left_angle.gif"></td>
									<td class="box-main-angle"><img src="./resources/<waf:theme/>/images/layout/space.gif"></td>
									<td class="box-main-angle-right"><img src="./resources/<waf:theme/>/images/layout/box_middle_right.gif"></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td class="frame-boder">
								<table id="tableData" width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="31" height="31" class="list-title">&nbsp;</td>
										<td class="list-title">
											<waf:label key="apiKey.apiKey" />
										</td>
										<td class="list-title">
											<waf:label key="apiKey.apiSecret" />
										</td>
										<td class="list-title">
											<waf:label key="apiKey.clientName" />
										</td>
										<td class="list-title">
											<waf:label key="apiKey.applicationId" />
										</td>
										<td class="list-title">
											<waf:label key="apiKey.dataStatus" />
										</td>
									</tr>
									<%boolean isOddRow = true;%>
									<waf:iterate id="_apiKey" name="apiKeyGridForm" property="apiKeys">
									<%String className = (isOddRow) ? "list-tr1" : "list-tr2";isOddRow = !isOddRow;%>
									<tr>
										<td class="<%=className%>">
											<input type="radio" name="apiKey"  
												   value="<waf:write name="_apiKey" property="apiKey"/>"
												   onclick="radioButtonClick(document.forms[0], 
											'<waf:write name="_apiKey" property="apiKey"/>',
											'<waf:write name="_apiKey" property="dataStatus"/>');" />
										</td>
										<td class="<%=className%>">
											<waf:write name="_apiKey" property="apiKey" />
										</td>
										<td class="<%=className%>">
											<waf:write name="_apiKey" property="apiSecret" />
										</td>
										<td class="<%=className%>">
											<waf:write name="_apiKey" property="clientName" />
										</td>
										<td class="<%=className%>">
											<waf:write name="_apiKey" property="applicationId" />
										</td>
										<td class="<%=className%>">
											<img 
											name="dataStatus"
											title="<waf:write name="_apiKey" property="dataStatus"/>"
											src="resources/<waf:theme/>/images/icons/<waf:write name="_apiKey" property="dataStatus"/>.gif" />
										</td>
									</tr>
									</waf:iterate>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="750" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="40" align="right">
					<jsp:include flush="true" page="/jsp/common/pagelet/page_bar.jsp">
						<jsp:param name="formName" value="apiKeyGridForm" />
					</jsp:include>
				</td>
			</tr>
		</table>
		<waf:hidden name="apiKeyGridForm" property="searchCriteria.apiKey" />
		<waf:hidden name="apiKeyGridForm" property="searchCriteria.clientName" />
	</waf:form>
</body>
</waf:html>