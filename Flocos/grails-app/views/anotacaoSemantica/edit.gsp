
<%@ page import="flocos.AnotacaoSemantica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${anotacaoSemanticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${anotacaoSemanticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${anotacaoSemanticaInstance?.id}" />
                <g:hiddenField name="version" value="${anotacaoSemanticaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localAnotacao"><g:message code="anotacaoSemantica.localAnotacao.label" default="Local Anotacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anotacaoSemanticaInstance, field: 'localAnotacao', 'errors')}">
                                    <g:textField name="localAnotacao" value="${anotacaoSemanticaInstance?.localAnotacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoAnotacao"><g:message code="anotacaoSemantica.tipoAnotacao.label" default="Tipo Anotacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anotacaoSemanticaInstance, field: 'tipoAnotacao', 'errors')}">
                                    <g:textField name="tipoAnotacao" value="${anotacaoSemanticaInstance?.tipoAnotacao}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
