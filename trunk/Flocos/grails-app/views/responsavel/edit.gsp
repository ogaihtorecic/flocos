
<%@ page import="flocos.Responsavel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'responsavel.label', default: 'Responsavel')}" />
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
            <g:hasErrors bean="${responsavelInstance}">
            <div class="errors">
                <g:renderErrors bean="${responsavelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${responsavelInstance?.id}" />
                <g:hiddenField name="version" value="${responsavelInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="responsavel.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${responsavelInstance?.nome}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="emails"><g:message code="responsavel.emails.label" default="Emails" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'emails', 'errors')}">
                                    
									<ul>
									<g:each in="${responsavelInstance?.emails?}" var="e">
									    <li><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="email" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="homepages"><g:message code="responsavel.homepages.label" default="Homepages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'homepages', 'errors')}">
                                    
									<ul>
									<g:each in="${responsavelInstance?.homepages?}" var="h">
									    <li><g:link controller="homepage" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="homepage" action="create" params="['responsavel.id': responsavelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'homepage.label', default: 'Homepage')])}</g:link>

                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instituicoes"><g:message code="responsavel.instituicoes.label" default="Instituicoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'instituicoes', 'errors')}">
                                    <g:select name="instituicoes" from="${flocos.Instituicao.list()}" multiple="yes" optionKey="id" size="5" value="${responsavelInstance?.instituicoes}" />
                                    <a href="/Flocos/instituicao/create?backUri=/responsavel/edit/${responsavelInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="papeis"><g:message code="responsavel.papeis.label" default="Papeis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'papeis', 'errors')}">
                                    <g:select name="papeis" from="${flocos.Papel.list()}" multiple="yes" optionKey="id" size="5" value="${responsavelInstance?.papeis}" />
                                    <a href="/Flocos/papel/create?backUri=/responsavel/edit/${responsavelInstance?.id}">[+]</a>
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
