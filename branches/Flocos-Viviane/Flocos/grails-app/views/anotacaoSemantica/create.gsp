
<%@ page import="flocos.AnotacaoSemantica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')}" />
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
            <g:hasErrors bean="${anotacaoSemanticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${anotacaoSemanticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localAnotacao"><g:message code="anotacaoSemantica.localAnotacao.label" default="Local da Anotacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anotacaoSemanticaInstance, field: 'localAnotacao', 'errors')}">
                                    <g:textField name="localAnotacao" value="${anotacaoSemanticaInstance?.localAnotacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoAnotacao"><g:message code="anotacaoSemantica.tipoAnotacao.label" default="Tipo da Anotacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anotacaoSemanticaInstance, field: 'tipoAnotacao', 'errors')}">
                                    <g:textField name="tipoAnotacao" value="${anotacaoSemanticaInstance?.tipoAnotacao}" />
                                </td>
                            </tr>
                        
                            <g:hiddenField name="dadosEducacionais.id" value="${anotacaoSemanticaInstance?.dadosEducacionais?.id}" />
                            
                            <g:hiddenField name="relatoUso.id" value="${anotacaoSemanticaInstance?.relatoUso?.id}" />
                        
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
