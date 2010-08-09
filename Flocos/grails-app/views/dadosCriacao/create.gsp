
<%@ page import="flocos.DadosCriacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosCriacao.label', default: 'DadosCriacao')}" />
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
            <g:hasErrors bean="${dadosCriacaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosCriacaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="versao"><g:message code="dadosCriacao.versao.label" default="Versão" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosCriacaoInstance, field: 'versao', 'errors')}">
                                    <g:textField name="versao" value="${dadosCriacaoInstance?.versao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data"><g:message code="dadosCriacao.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosCriacaoInstance, field: 'data', 'errors')}">
                                    <g:datePicker name="data" precision="day" value="${dadosCriacaoInstance?.data}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="responsaveis"><g:message code="dadosCriacao.responsaveis.label" default="Responsáveis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosCriacaoInstance, field: 'responsaveis', 'errors')}">
                                    <g:select name="responsaveis" from="${flocos.Responsavel.list()}" multiple="yes" optionKey="id" size="5" value="${[flocos.Usuario.findById(session.usuario.id).responsavel?.id]}" />
                                    <a href="/Flocos/responsavel/create?backUri=/dadosCriacao/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="licenca"><g:message code="dadosCriacao.licenca.label" default="Licenca" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosCriacaoInstance, field: 'licenca', 'errors')}">
                                    <g:select name="licenca" from="${dadosCriacaoInstance.constraints.licenca.inList}" value="${dadosCriacaoInstance?.licenca}" valueMessagePrefix="dadosCriacao.licenca"  />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="meiosAcesso"><g:message code="dadosCriacao.meiosAcesso.label" default="Meios de Acesso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosCriacaoInstance, field: 'meiosAcesso', 'errors')}">
                                    <g:select name="meiosAcesso" from="${flocos.MeioAcesso.list()}" multiple="yes" optionKey="id" size="5" />
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
