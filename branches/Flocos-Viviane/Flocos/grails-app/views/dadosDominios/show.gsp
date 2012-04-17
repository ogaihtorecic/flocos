
<%@ page import="flocos.DadosDominios" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosDominios.label', default: 'DadosDominios')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="createWithoutMoaf"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="dadosDominios.titulo.label" default="Título" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosDominiosInstance, field: "titulo")}</td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.idiomas.label" default="Idiomas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosDominiosInstance.idiomas}" var="i">
                                    <li><g:link controller="idioma" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.dominiosGerais.label" default="Domínios Gerais" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosDominiosInstance.dominiosGerais}" var="d">
                                    <li><g:link controller="dominioGeral" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.dominioEspecifico.label" default="Domínio Especifico" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosDominiosInstance, field: "dominioEspecifico")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.locais.label" default="Locais" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosDominiosInstance.locais}" var="l">
                                    <li><g:link controller="local" action="show" id="${l.id}">${l}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dadosDominiosInstance?.data}" format="dd/MM/yyyy"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.versao.label" default="Versão" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosDominiosInstance, field: "versao")}</td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.responsaveis.label" default="Responsáveis" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosDominiosInstance.responsaveis}" var="r">
                                    <li><g:link controller="responsavel" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.formatos.label" default="Formatos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosDominiosInstance.formatos}" var="f">
                                    <li><g:link controller="formato" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosDominios.descricaoOntologia.label" default="Descrição da Ontologia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosDominiosInstance, field: "descricaoOntologia")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dadosDominiosInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
