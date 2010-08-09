
<%@ page import="flocos.Moaf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moaf.label', default: 'Moaf')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                     	<tr class="prop">
                            <td valign="top" class="name"><g:message code="moaf.dadosGerais.label" default="Dados Gerais" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dadosGerais" action="show" id="${moafInstance?.dadosGerais?.id}">${moafInstance?.dadosGerais?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="moaf.dadosCriacao.label" default="Dados de Criacao" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dadosCriacao" action="show" id="${moafInstance?.dadosCriacao?.id}">${moafInstance?.dadosCriacao?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="moaf.dadosTecnicos.label" default="Dados Técnicos" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dadosTecnicos" action="show" id="${moafInstance?.dadosTecnicos?.id}">${moafInstance?.dadosTecnicos?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moaf.dadosEducacionais.label" default="Dados Educacionais" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dadosEducacionais" action="show" id="${moafInstance?.dadosEducacionais?.id}">${moafInstance?.dadosEducacionais?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="moaf.dadosDominios.label" default="Dados de Domínios" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${moafInstance.dadosDominios}" var="d">
                                    <li><g:link controller="dadosDominios" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="moaf.dadosAcessibilidade.label" default="Dados de Acessibilidade" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dadosAcessibilidade" action="show" id="${moafInstance?.dadosAcessibilidade?.id}">${moafInstance?.dadosAcessibilidade?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${moafInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
