
<%@ page import="flocos.DadosAcessibilidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dadosAcessibilidadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosAcessibilidadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tiposPnee"><g:message code="dadosAcessibilidade.tiposPnee.label" default="Tipos de Pnee" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosAcessibilidadeInstance, field: 'tiposPnee', 'errors')}">
                                    <g:select name="tiposPnee" from="${flocos.TipoPnee.list()}" multiple="yes" optionKey="id" size="5" value="${dadosAcessibilidadeInstance?.tiposPnee*.id}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="inaptidoesVisuais"><g:message code="dadosAcessibilidade.inaptidoesVisuais.label" default="Inaptidoes Visuais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosAcessibilidadeInstance, field: 'inaptidoesVisuais', 'errors')}">
                                    <g:select name="inaptidoesVisuais" from="${flocos.InaptidaoVisual.list()}" multiple="yes" optionKey="id" size="5" value="${dadosAcessibilidadeInstance?.inaptidoesVisuais*.id}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inaptidaoAuditiva"><g:message code="dadosAcessibilidade.inaptidaoAuditiva.label" default="Inaptidao Auditiva" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosAcessibilidadeInstance, field: 'inaptidaoAuditiva', 'errors')}">
                                    <g:select name="inaptidaoAuditiva" from="${dadosAcessibilidadeInstance.constraints.inaptidaoAuditiva.inList}" value="${dadosAcessibilidadeInstance?.inaptidaoAuditiva}" valueMessagePrefix="dadosAcessibilidade.inaptidaoAuditiva"  />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="inaptidoesNeuro"><g:message code="dadosAcessibilidade.inaptidoesNeuro.label" default="Inaptidoes Neurologicas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosAcessibilidadeInstance, field: 'inaptidoesNeuro', 'errors')}">
                                    <g:select name="inaptidoesNeuro" from="${flocos.InaptidaoNeuro.list()}" multiple="yes" optionKey="id" size="5" value="${dadosAcessibilidadeInstance?.inaptidoesNeuro*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricaoPnee"><g:message code="dadosAcessibilidade.descricaoPnee.label" default="Descricao do Pnee" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosAcessibilidadeInstance, field: 'descricaoPnee', 'errors')}">
                                    <g:textArea name="descricaoPnee" cols="40" rows="5" value="${dadosAcessibilidadeInstance?.descricaoPnee}" />
                                </td>
                            </tr>
                        
                            <g:hiddenField name="usuario.id" value="${session.usuario.id}" />
                            
                            <g:hiddenField name="backUri" value="${params.backUri}" />
                            
                            <g:hiddenField name="moaf.id" value="${params.moaf.id}"/>
                        
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
