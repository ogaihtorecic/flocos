
<%@ page import="flocos.Resolucao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'resolucao.label', default: 'Resolucao')}" />
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
            <g:hasErrors bean="${resolucaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${resolucaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="resolucao"><g:message code="resolucao.resolucao.label" default="Resolucao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: resolucaoInstance, field: 'resolucao', 'errors')}">
                                    <g:textField name="resolucao" value="${resolucaoInstance?.resolucao}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                
                <g:hiddenField name="backUri" value="${params.backUri}" />
                
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
