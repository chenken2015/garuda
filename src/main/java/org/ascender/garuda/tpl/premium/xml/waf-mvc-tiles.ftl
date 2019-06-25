<!-- waf-mvc-titles.xml ${entityName} START-->
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}List" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}List.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}Search" extends=".searchTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}Search.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}View" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}View.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}Create" extends=".editTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}Create.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}CreateContinue" extends=".editTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}CreateContinue.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}CreateVerify" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}CreateVerify.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}Update" extends=".editTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}Update.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}UpdateContinue" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}UpdateContinue.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}UpdateVerify" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}UpdateVerify.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}Delete" extends=".editTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}Delete.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}DeleteVerify" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}DeleteVerify.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}DeleteContinue" extends=".mainTemplate">
		<put name="content" value="/jsp/${entityName}/${entityName?uncap_first}DeleteContinue.jsp" />
	</definition>
	<definition name="${entityName?uncap_first}.${entityName?uncap_first}LookupList" extends=".popupTemplate">
		<put name="content" value="/jsp/${entityName}/lookup/${entityName?uncap_first}LookupList.jsp" />
	</definition>
<!-- waf-mvc-titles.xml ${entityName} END-->