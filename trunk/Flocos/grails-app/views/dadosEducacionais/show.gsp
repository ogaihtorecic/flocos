
<%@ page import="flocos.DadosEducacionais" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosEducacionais.label', default: 'DadosEducacionais')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="dadosEducacionais.areas.label" default="Áreas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosEducacionaisInstance.areas}" var="a">
                                    <li>${a?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.dominiosPropostos.label" default="Domínios Propostos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosEducacionaisInstance.dominiosPropostos}" var="d">
                                    <li><g:link controller="dadosDominios" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.niveisEscolaridade.label" default="Níveis de Escolaridade" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosEducacionaisInstance.niveisEscolaridade}" var="n">
                                    <li>${n?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.idade.label" default="Idade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "idade")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.classificacoes.label" default="Classificações" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosEducacionaisInstance.classificacoes}" var="c">
                                    <li><g:link controller="classificacao" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.conteudo.label" default="Conteúdo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "conteudo")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.objetivoEducacional.label" default="Objetivo Educacional" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "objetivoEducacional")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.anotacoesSemanticas.label" default="Anotacoes Semanticas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosEducacionaisInstance.anotacoesSemanticas}" var="a">
                                    <li><g:link controller="anotacaoSemantica" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.preRequisitos.label" default="Pré-Requisitos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "preRequisitos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.tempoPrevisto.label" default="Tempo Previsto" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "tempoPrevisto")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.complemento.label" default="Complemento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "complemento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.dificuldade.label" default="Dificuldade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "dificuldade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.tipoInteratividade.label" default="Tipo de Interatividade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "tipoInteratividade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.nivelInteratividade.label" default="Nível de Interatividade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosEducacionaisInstance, field: "nivelInteratividade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosEducacionais.relatosUso.label" default="Relatos de Uso" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosEducacionaisInstance.relatosUso}" var="r">
                                    <li><g:link controller="relatoUso" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dadosEducacionaisInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
