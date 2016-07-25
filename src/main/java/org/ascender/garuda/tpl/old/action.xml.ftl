<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE struts PUBLIC "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN" "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>
    <package name="${simpleModule}" namespace="/${simpleModule}" extends="web-default">
        <action name="${entityName?uncap_first}" class="forwardAction">
            <result>easyui_${entityName?uncap_first}.jsp</result>
        </action>
        <action name="${entityName?uncap_first}_*" class="${entityName?uncap_first}Action" method="{1}">
            <result type="json" name="success"/>
        	<result name="export" type="stream">
                <param name="contentType">application/vnd.ms-excel</param>
                <param name="inputName">stream</param>
                <param name="contentDisposition">attachment;filename="${entityName?uncap_first}.xlsx"</param>
                <param name="bufferSize">4096</param>            	
            </result>            
        </action>                                 
    </package>
</struts>