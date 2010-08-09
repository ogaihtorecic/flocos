
<%@ page import="flocos.RelatoUso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relatoUso.label', default: 'RelatoUso')}" />
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
            <g:hasErrors bean="${relatoUsoInstance}">
            <div class="errors">
                <g:renderErrors bean="${relatoUsoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${relatoUsoInstance?.id}" />
                <g:hiddenField name="version" value="${relatoUsoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="responsaveis"><g:message code="relatoUso.responsaveis.label" default="Responsaveis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'responsaveis', 'errors')}">
                                    <g:select name="responsaveis" from="${flocos.Responsavel.list()}" multiple="yes" optionKey="id" size="5" value="${relatoUsoInstance?.responsaveis}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="relatoUso.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'data', 'errors')}">
                                    <g:datePicker name="data" precision="day" value="${relatoUsoInstance?.data}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="areas"><g:message code="relatoUso.areas.label" default="Areas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'areas', 'errors')}">
                                    <g:select name="areas" from="${flocos.Area.list()}" multiple="yes" optionKey="id" size="5" value="${relatoUsoInstance?.areas}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dominiosUsados"><g:message code="relatoUso.dominiosUsados.label" default="Dominios Usados" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'dominiosUsados', 'errors')}">
                                    <g:select name="dominiosUsados" from="${flocos.DadosDominios.list()}" multiple="yes" optionKey="id" size="5" value="${relatoUsoInstance?.dominiosUsados}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="niveisEscolaridade"><g:message code="relatoUso.niveisEscolaridade.label" default="Niveis Escolaridade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'niveisEscolaridade', 'errors')}">
                                    <g:select name="niveisEscolaridade" from="${flocos.NivelEscolaridade.list()}" multiple="yes" optionKey="id" size="5" value="${relatoUsoInstance?.niveisEscolaridade}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="idade"><g:message code="relatoUso.idade.label" default="Idade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'idade', 'errors')}">
                                    <g:textField name="idade" value="${fieldValue(bean: relatoUsoInstance, field: 'idade')}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="classificacoes"><g:message code="relatoUso.classificacoes.label" default="Classificacoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'classificacoes', 'errors')}">
                                    
									<ul>
									<g:each in="${relatoUsoInstance?.classificacoes?}" var="c">
									    <li><g:link controller="classificacao" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="classificacao" action="create" params="['relatoUso.id': relatoUsoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classificacao.label', default: 'Classificacao')])}</g:link>

                                </td>
                            </tr>
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="qtdParticipantes"><g:message code="relatoUso.qtdParticipantes.label" default="Qtd Participantes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'qtdParticipantes', 'errors')}">
                                    <g:textField name="qtdParticipantes" value="${relatoUsoInstance?.qtdParticipantes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conteudo"><g:message code="relatoUso.conteudo.label" default="Conteudo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'conteudo', 'errors')}">
                                    <g:textField name="conteudo" value="${relatoUsoInstance?.conteudo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="preRequisitos"><g:message code="relatoUso.preRequisitos.label" default="Pre Requisitos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'preRequisitos', 'errors')}">
                                    <g:textField name="preRequisitos" value="${relatoUsoInstance?.preRequisitos}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tempoPrevisto"><g:message code="relatoUso.tempoPrevisto.label" default="Tempo Previsto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'tempoPrevisto', 'errors')}">
                                    <g:textField name="tempoPrevisto" value="${fieldValue(bean: relatoUsoInstance, field: 'tempoPrevisto')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="objetivoEducacional"><g:message code="relatoUso.objetivoEducacional.label" default="Objetivo Educacional" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'objetivoEducacional', 'errors')}">
                                    <g:textArea name="objetivoEducacional" cols="40" rows="5" value="${relatoUsoInstance?.objetivoEducacional}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="anotacoesSemanticas"><g:message code="relatoUso.anotacoesSemanticas.label" default="Anotacoes Semanticas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'anotacoesSemanticas', 'errors')}">
                                    
									<ul>
									<g:each in="${relatoUsoInstance?.anotacoesSemanticas?}" var="a">
									    <li><g:link controller="anotacaoSemantica" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="anotacaoSemantica" action="create" params="['relatoUso.id': relatoUsoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="complemento"><g:message code="relatoUso.complemento.label" default="Complemento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'complemento', 'errors')}">
                                    <g:textField name="complemento" value="${relatoUsoInstance?.complemento}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dificuldade"><g:message code="relatoUso.dificuldade.label" default="Dificuldade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'dificuldade', 'errors')}">
                                    <g:select name="dificuldade" from="${relatoUsoInstance.constraints.dificuldade.inList}" value="${relatoUsoInstance?.dificuldade}" valueMessagePrefix="relatoUso.dificuldade"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoInteratividade"><g:message code="relatoUso.tipoInteratividade.label" default="Tipo Interatividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'tipoInteratividade', 'errors')}">
                                    <g:select name="tipoInteratividade" from="${relatoUsoInstance.constraints.tipoInteratividade.inList}" value="${relatoUsoInstance?.tipoInteratividade}" valueMessagePrefix="relatoUso.tipoInteratividade"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nivelInteratividade"><g:message code="relatoUso.nivelInteratividade.label" default="Nivel Interatividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relatoUsoInstance, field: 'nivelInteratividade', 'errors')}">
                                    <g:select name="nivelInteratividade" from="${relatoUsoInstance.constraints.nivelInteratividade.inList}" value="${relatoUsoInstance?.nivelInteratividade}" valueMessagePrefix="relatoUso.nivelInteratividade"  />
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
