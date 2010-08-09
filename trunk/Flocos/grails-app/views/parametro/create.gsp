
<%@ page import="flocos.Parametro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parametro.label', default: 'Parametro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${parametroInstance}">
            <div class="errors">
                <g:renderErrors bean="${parametroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeParametro"><g:message code="parametro.nomeParametro.label" default="Nome Parametro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parametroInstance, field: 'nomeParametro', 'errors')}">
                                    <g:textField name="nomeParametro" value="${parametroInstance?.nomeParametro}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoParametro"><g:message code="parametro.tipoParametro.label" default="Tipo Parametro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parametroInstance, field: 'tipoParametro', 'errors')}">
                                    <g:select name="tipoParametro" from="${parametroInstance.constraints.tipoParametro.inList}" value="${parametroInstance?.tipoParametro}" valueMessagePrefix="parametro.tipoParametro"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="opcional"><g:message code="parametro.opcional.label" default="Opcional" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parametroInstance, field: 'opcional', 'errors')}">
                                    <g:select name="opcional" from="${parametroInstance.constraints.opcional.inList}" value="${parametroInstance?.opcional}" valueMessagePrefix="parametro.opcional"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="metodoEnvio"><g:message code="parametro.metodoEnvio.label" default="Metodo Envio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parametroInstance, field: 'metodoEnvio', 'errors')}">
                                    <g:select name="metodoEnvio" from="${parametroInstance.constraints.metodoEnvio.inList}" value="${parametroInstance?.metodoEnvio}" valueMessagePrefix="parametro.metodoEnvio"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="parametro.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parametroInstance, field: 'tipo', 'errors')}">
                                    <g:select name="tipo" from="${parametroInstance.constraints.tipo.inList}" value="${parametroInstance?.tipo}" valueMessagePrefix="parametro.tipo"  />
                                </td>
                            </tr>
                        
                            <g:hiddenField name="dadosTecnicos.id" value="${parametroInstance?.dadosTecnicos?.id}" />
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
