
<%@ page import="flocos.Classificacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classificacao.label', default: 'Classificacao')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${classificacaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${classificacaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${classificacaoInstance?.id}" />
                <g:hiddenField name="version" value="${classificacaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoClassificacao"><g:message code="classificacao.tipoClassificacao.label" default="Tipo Classificacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classificacaoInstance, field: 'tipoClassificacao', 'errors')}">
                                    <g:select name="tipoClassificacao" from="${classificacaoInstance.constraints.tipoClassificacao.inList}" value="${classificacaoInstance?.tipoClassificacao}" valueMessagePrefix="classificacao.tipoClassificacao"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subcategoria"><g:message code="classificacao.subcategoria.label" default="Subcategoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classificacaoInstance, field: 'subcategoria', 'errors')}">
                                    <g:select name="subcategoria" from="${classificacaoInstance.constraints.subcategoria.inList}" value="${classificacaoInstance?.subcategoria}" valueMessagePrefix="classificacao.subcategoria"  />
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
