<%@ taglib uri="waf" prefix="waf" %>
<waf:html>
<head>
<title><waf:label key="${entityName}"/></title>
<script language="javascript" src="./resources/<waf:theme/>/js/util/dropdownlist.js"></script>
<script language="javascript" src="./resources/<waf:theme/>/js/util/numberAndChar.js"></script>
<script language="javascript" src="resources/<waf:theme/>/js/validation/regexp.js"></script>
<script language="javascript" src="resources/<waf:theme/>/js/util/imageswapper.js"></script>
<script language="javascript" src="./resources/<waf:theme/>/js/util/lookup.js"></script>
<script language="javascript" src="./resources/<waf:theme/>/js/util/search.js"></script>
<script language="javascript">

	var arrSearchingItem = new Array("searchCriteria.apiKey","searchCriteria.clientName");
</script>

</head>
<%@ include file="/jsp/common/error/error_messages.jsp" %>
<body>
<waf:form action="/apiRegisterSearch">
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="td-box4">
		<tr>
			<td class="box4">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="form-title-left"><img
							src="./resources/<waf:theme/>/images/layout/box_bottom_left.gif"></td>
						
						<td class="form-title"><waf:label key="apiKey.apiKeySearchTitle" /></td>
						<td class="form-title-right"><img
							src="./resources/<waf:theme/>/images/layout/box_bottom_right.gif"></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" bgcolor="#FFFFFF" class="td-box3">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="right" class="form-label">
										<waf:label key="apiKey.apiKey" />:
									</td>							
									<td><waf:text property="searchCriteria.apiKey" value="" size="20" maxlength="100" onblur="this.value=this.value.toUpperCase()"
									  styleClass="input-uppercase"/></td>						
								</tr>
								<tr>
									<td align="right" class="form-label">
										<waf:label key="apiKey.clientName" />:
									</td>							
									<td><waf:text property="searchCriteria.clientName" value="" size="20" maxlength="100" /></td>						
								</tr>
						   </table>
					 	</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" class="submit-line">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button-space">
							<button id="btnSearch" class="appButton" type="button" title="<waf:label key='button.alt.search'/>" onclick="doEnter();">
							<span class="btnSearch"><label><waf:label key="button.text.search"/></label></span>
							</button>
						</td>
						<td class="button-space">
							<button id="btnReset" class="appButton" type="button" title="<waf:label key='button.alt.reset'/>" onclick="javascript:document.forms[0].reset();">
							<span class="btnReset"><label><waf:label key="button.text.reset"/></label></span>
							</button>
						</td>
						<td class="button-space">
							<button id="btnCancel" class="appButton" type="button" title="<waf:label key='button.alt.cancel'/>" onclick="JSAF.getWafPopup().closePopup();">
							<span class="btnCancel"><label><waf:label key="button.text.cancel"/></label></span>
							</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</waf:form>
</body>
</waf:html>