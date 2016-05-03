<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//ibatis.apache.org//DTD Mapper 3.0//EN" 
"http://ibatis.apache.org/dtd/ibatis-3-mapper.dtd">

<mapper namespace="com.fpx.product.dao.I${entityName}Dao">
	<resultMap id="${entityName}Map" type="com.fpx.product.entity.${entityName}">
	<#list columns as column>
        <result property="${column.fieldName}" column="${column.columnName}"/>
	</#list>
    </resultMap>
	<sql id="columns">
        <![CDATA[
        <#list columns as column>
        	${column.columnName},
		</#list>
        ]]>
    </sql>
    
    <sql id="where">
        <where>
        	<#list columns as column>
        	<if test="@Ognl@isNotEmpty(${column.fieldName})">
                AND ${column.columnName} = \#\{${column.fieldName}\}
            </if>
            </#list>
        </where>
    </sql>
    
    <select id="findBy" resultMap="${entityName}Map">
	        SELECT
	            <include refid="columns" />
	        FROM
	            ${tableName}   LEFT JOIN dictionary dc 
			ON pc.category_name_code = dc.item_code
	        <include refid="where"/>
	</select>
	
	<select id="findById" resultMap="${entityName}Map">
	        SELECT
	            <include refid="columns" />
	        FROM
	            ${tableName} 
	        where id = \#\{id\}
	</select>
	<!-- keyProperty="categoryId"-->
	<insert id="save${entityName}" useGeneratedKeys="true"   parameterType="com.fpx.product.entity.${entityName}">
		insert into product_category(
			<#list columns as column>
        		${column.columnName},
			</#list>
		) values (
			<#list columns as column>
        		\#\{${column.fieldName}\},
			</#list>
		)
	</insert>
	
	<delete id="deleteById">
        <![CDATA[
            DELETE
            FROM
                ${tableName}
            WHERE
                id = \#\{id\}
        ]]>
    </delete>
    
     <update id="update${entityName}">
        	UPDATE
                ${tableName}
            <set>
            	<#list columns as column>
                <if test="${column.fieldName} != null">
                	<![CDATA[ ${column.columnName} = \#\{${column.fieldName}\} ]]>,
                </if>
                </#list>
            </set>
            WHERE
                id = \#\{id\}
    </update>
</mapper>