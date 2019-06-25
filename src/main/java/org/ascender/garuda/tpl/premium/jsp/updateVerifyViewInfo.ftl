<%@ taglib uri="jstl-core" prefix="c" %>
<%@ taglib uri="waf" prefix="waf" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="5">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="form-title-left"><img src="resources/<waf:theme/>/images/layout/box_bottom_left.gif"></td>
					<td class="form-title"><waf:label key="voApiRegister.updateVerify" /></td>
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
						<waf:label key="voApiRegister.apiName"/>:
					</td>
					<td width="85%"
						<c:if test='${apiRegisterForm.voApiRegister2.apiName!=apiRegisterForm.voApiRegister.apiName}'>class="font-diff"</c:if>>
						<waf:write name="apiRegisterForm" property="voApiRegister2.apiName" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box-req">
						<waf:label key="voApiRegister.apiUrl" />:
					</td>
					<td width="75%"
						<c:if test='${apiRegisterForm.voApiRegister2.apiUrl!=apiRegisterForm.voApiRegister.apiUrl}'>class="font-diff"</c:if>>
						<waf:write name="apiRegisterForm" property="voApiRegister2.apiUrl" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box">
						<waf:label key="voApiRegister.apiDescription"/>:
					</td>
					<td width="75%"
						<c:if test='${apiRegisterForm.voApiRegister2.apiDescription!=apiRegisterForm.voApiRegister.apiDescription}'>class="font-diff"</c:if>>
						<waf:write name="apiRegisterForm" property="voApiRegister2.apiDescription" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="5">
		<table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="box-main-angle-left"><img src="./resources/<waf:theme/>/images/layout/box_left_angle.gif"></td>
				<td class="box-main-angle" ><img src="./resources/<waf:theme/>/images/layout/space.gif"></td>
				<td class="box-main-angle-right"><img src="./resources/<waf:theme/>/images/layout/box_middle_right.gif"></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="frame-boder">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="15%" class="form-label-box-req">
						<waf:label key="voApiRegister.apiName"/>:
					</td>
					<td width="85%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiName" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box-req">
						<waf:label key="voApiRegister.apiUrl" />:
					</td>
					<td width="75%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiUrl" />
					</td>
				</tr>
				<tr>
					<td width="15%" class="form-label-box">
						<waf:label key="voApiRegister.apiDescription"/>:
					</td>
					<td width="75%">
						<waf:write name="apiRegisterForm" property="voApiRegister.apiDescription" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<waf:hidden property="voApiRegister2.apiName" />
<waf:hidden property="voApiRegister2.apiUrl" />
<waf:hidden property="voApiRegister2.apiDescription" />