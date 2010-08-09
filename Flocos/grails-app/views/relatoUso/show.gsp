
<%@ page import="flocos.RelatoUso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relatoUso.label', default: 'RelatoUso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
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
                            <td valign="top" class="name"><g:message code="relatoUso.responsaveis.label" default="Responsaveis" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${relatoUsoInstance.responsaveis}" var="r">
                                    <li><g:link controller="responsavel" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${relatoUsoInstance?.data}" format="dd/MM/yyyy"/></td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.areas.label" default="Areas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${relatoUsoInstance.areas}" var="a">
                                    <li><g:link controller="area" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.dominiosUsados.label" default="Dominios Usados" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${relatoUsoInstance.dominiosUsados}" var="d">
                                    <li><g:link controller="dadosDominios" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.niveisEscolaridade.label" default="Niveis Escolaridade" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${relatoUsoInstance.niveisEscolaridade}" var="n">
                                    <li><g:link controller="nivelEscolaridade" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.idade.label" default="Idade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "idade")}</td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.classificacoes.label" default="Classificacoes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${relatoUsoInstance.classificacoes}" var="c">
                                    <li><g:link controller="classificacao" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.qtdParticipantes.label" default="Qtd Participantes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "qtdParticipantes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.conteudo.label" default="Conteudo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "conteudo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.preRequisitos.label" default="Pre Requisitos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "preRequisitos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.tempoPrevisto.label" default="Tempo Previsto" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "tempoPrevisto")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.objetivoEducacional.label" default="Objetivo Educacional" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "objetivoEducacional")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.anotacoesSemanticas.label" default="Anotacoes Semanticas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${relatoUsoInstance.anotacoesSemanticas}" var="a">
                                    <li><g:link controller="anotacaoSemantica" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.complemento.label" default="Complemento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "complemento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.dificuldade.label" default="Dificuldade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "dificuldade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.tipoInteratividade.label" default="Tipo Interatividade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "tipoInteratividade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="relatoUso.nivelInteratividade.label" default="Nivel Interatividade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: relatoUsoInstance, field: "nivelInteratividade")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${relatoUsoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
