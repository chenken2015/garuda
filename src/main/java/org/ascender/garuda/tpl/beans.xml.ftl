<?xml version="1.0" encoding="UTF-8"?>
<beans xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-3.0.xsd http://www.springframework.org/schema/jee http://www.springframework.org/schema/jee/spring-jee-3.0.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd" xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:jee="http://www.springframework.org/schema/jee" xmlns:tx="http://www.springframework.org/schema/tx" xmlns:context="http://www.springframework.org/schema/context">
    <bean id="${entityName?uncap_first}Biz" class="${module}.biz.${entityName}Biz">
        <property name="${entityName?uncap_first}Dao" ref="${entityName?uncap_first}Dao"/>
    </bean>
    <bean id="${entityName?uncap_first}Action" class="${module}.action.${entityName}Action" scope="prototype">
        <property name="${entityName?uncap_first}Biz" ref="${entityName?uncap_first}Biz"/>
        <property name="excelHelperBiz" ref="excelHelperBiz"/>
    </bean>
    <bean id="${entityName?uncap_first}Dao" class="${module}.dao.${entityName}Dao">
        <property name="sessionFactory" ref="sessionFactory"/>
    </bean>  
</beans>