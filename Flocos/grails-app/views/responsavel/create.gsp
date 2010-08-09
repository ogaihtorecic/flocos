
<%@ page import="flocos.Responsavel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'responsavel.label', default: 'Responsavel')}" />
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
            <g:hasErrors bean="${responsavelInstance}">
            <div class="errors">
                <g:renderErrors bean="${responsavelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                                  <label for="instituicoes"><g:message code="responsavel.instituicoes.label" default="Instituicoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'instituicoes', 'errors')}">
                                    <g:select name="instituicoes" from="${flocos.Instituicao.list()}" multiple="yes" optionKey="id" size="5" value="${responsavelInstance?.instituicoes}" />
                                    <a href="/Flocos/instituicao/create?backUri=/responsavel/create">[+]</a>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="papeis"><g:message code="responsavel.papeis.label" default="Papeis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelInstance, field: 'papeis', 'errors')}">
                                    <g:select name="papeis" from="${flocos.Papel.list()}" multiple="yes" optionKey="id" size="5" value="${responsavelInstance?.papeis}" />
                                    <a href="/Flocos/papel/create?backUri=/responsavel/create">[+]</a>
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
