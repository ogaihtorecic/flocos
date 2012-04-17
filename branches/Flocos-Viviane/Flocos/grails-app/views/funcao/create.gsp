
<%@ page import="flocos.Funcao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcao.label', default: 'Funcao')}" />
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
            <g:hasErrors bean="${funcaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${funcaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeFuncao"><g:message code="funcao.nomeFuncao.label" default="Nome Funcao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoInstance, field: 'nomeFuncao', 'errors')}">
                                    <g:textField name="nomeFuncao" value="${funcaoInstance?.nomeFuncao}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricaoFuncao"><g:message code="funcao.descricaoFuncao.label" default="Descricao Funcao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoInstance, field: 'descricaoFuncao', 'errors')}">
                                    <g:textField name="descricaoFuncao" value="${funcaoInstance?.descricaoFuncao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parametroEntrada"><g:message code="funcao.parametroEntrada.label" default="Parametro Entrada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoInstance, field: 'parametroEntrada', 'errors')}">
                                    <g:textField name="parametroEntrada" value="${funcaoInstance?.parametroEntrada}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parametroSaida"><g:message code="funcao.parametroSaida.label" default="Parametro Saida" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoInstance, field: 'parametroSaida', 'errors')}">
                                    <g:textField name="parametroSaida" value="${funcaoInstance?.parametroSaida}" />
                                </td>
                            </tr>
                        
                        	<g:hiddenField name="dadosTecnicos.id" value="${funcaoInstance?.dadosTecnicos?.id}" />
                        
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
