
<%@ page import="flocos.DominioGeral" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dominioGeral.label', default: 'DominioGeral')}" />
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
            <g:hasErrors bean="${dominioGeralInstance}">
            <div class="errors">
                <g:renderErrors bean="${dominioGeralInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dominioGeral"><g:message code="dominioGeral.dominioGeral.label" default="Dominio Geral" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dominioGeralInstance, field: 'dominioGeral', 'errors')}">
                                    <g:textField name="dominioGeral" value="${dominioGeralInstance?.dominioGeral}" />
                                </td>
                            </tr>
                        
                        	<g:hiddenField name="dadosDominios.id" value="${dominioGeralInstance?.dadosDominios?.id}" />
                        
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
