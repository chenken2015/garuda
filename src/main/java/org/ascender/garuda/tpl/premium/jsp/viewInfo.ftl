<%@ taglib uri="jstl-core" prefix="c" %>
<%@ taglib uri="waf" prefix="waf" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="5">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="form-title-left"><img src="resources/<waf:theme/>/images/layout/box_bottom_left.gif"></td>
				<td class="form-title"><waf:label key="voApiRegister.create" /></td>
				<td class="form-title-right"><img src="resources/<waf:theme/>/images/layout/box_bottom_right.gif"></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="frame-boder">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="15%" class="form-label-box-req">
						<waf:label key="apiRegister.apiName"/>:
					</td>
					<td width="85%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiName" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box-req">
						<waf:label key="apiRegister.apiUrl" />:
					</td>
					<td width="75%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiUrl" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box">
						<waf:label key="apiRegister.apiDescription"/>:
					</td>
					<td width="75%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiDescription" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box">
						<waf:label key="apiRegister.apiRegisterDate" />:
					</td>
					<td width="75%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiRegisterDate" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>