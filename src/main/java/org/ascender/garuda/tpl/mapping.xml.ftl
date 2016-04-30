<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN" "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">
<hibernate-mapping package="${module}.domain" auto-import="false">
    <class name="${entityName}" table="${tableName}">
<#list columns as column>
    <#if column.primary>
         <id name="${column.fieldName}" type="${column.fullJavaType}">
            <column name="${column.columnName}" precision="${column.columnSize}" not-null="true"/>
            <generator class="sequence">
                <param name="sequence">${sequence}</param>
            </generator>
        </id>
    <#elseif column.javaType=="String" || column.javaType=="Date" || column.javaType="Boolean">
        <property name="${column.fieldName}" type="${column.fullJavaType}">
            <column name="${column.columnName}" length="${column.columnSize}"/>
        </property>  
    <#elseif column.javaType=="Double" || column.javaType="Float">
        <property name="modifyUser" type="java.lang.Long">
            <column name="${column.columnName}" precision="${column.precision}" scale="${column.precision}"/>
        </property>
    <#else>
        <property name="${column.fieldName}" type="${column.fullJavaType}">
            <column name="${column.columnName}" precision="${column.columnSize}"/>
        </property>   	      	   			
    </#if>
</#list>
    </class>
</hibernate-mapping>