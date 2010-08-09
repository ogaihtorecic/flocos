
<%@ page import="flocos.DadosEducacionais" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosEducacionais.label', default: 'DadosEducacionais')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dadosEducacionaisInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosEducacionaisInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dadosEducacionaisInstance?.id}" />
                <g:hiddenField name="version" value="${dadosEducacionaisInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="areas"><g:message code="dadosEducacionais.areas.label" default="Áreas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'areas', 'errors')}">
                                    <g:select name="areas" from="${flocos.Area.list()}" multiple="yes" optionKey="id" size="5" value="${dadosEducacionaisInstance?.areas*.id}" />
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dominiosPropostos"><g:message code="dadosEducacionais.dominiosPropostos.label" default="Domínios Propostos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'dominiosPropostos', 'errors')}">
                                    <g:select name="dominiosPropostos" from="${flocos.DadosDominios.list()}" multiple="yes" optionKey="id" size="5" value="${dadosEducacionaisInstance?.dominiosPropostos*.id}" />
                                    <a href="/Flocos/dadosDominios/create?backUri=/dadosEducacionais/edit/${dadosEducacionaisInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="niveisEscolaridade"><g:message code="dadosEducacionais.niveisEscolaridade.label" default="Níveis de Escolaridade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'niveisEscolaridade', 'errors')}">
                                    <g:select name="niveisEscolaridade" from="${flocos.NivelEscolaridade.list()}" multiple="yes" optionKey="id" size="5" value="${dadosEducacionaisInstance?.niveisEscolaridade*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="idade"><g:message code="dadosEducacionais.idade.label" default="Idade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'idade', 'errors')}">
                                    <g:textField name="idade" value="${dadosEducacionaisInstance?.idade}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="classificacoes"><g:message code="dadosEducacionais.classificacoes.label" default="Classificações" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'classificacoes', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosEducacionaisInstance?.classificacoes?}" var="c">
									    <li><g:link controller="classificacao" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="classificacao" action="create" params="['dadosEducacionais.id': dadosEducacionaisInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classificacao.label', default: 'Classificacao')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conteudo"><g:message code="dadosEducacionais.conteudo.label" default="Conteúdo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'conteudo', 'errors')}">
                                    <g:textField name="conteudo" value="${dadosEducacionaisInstance?.conteudo}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="objetivoEducacional"><g:message code="dadosEducacionais.objetivoEducacional.label" default="Objetivo Educacional" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'objetivoEducacional', 'errors')}">
                                    <g:textArea name="objetivoEducacional" cols="40" rows="5" value="${dadosEducacionaisInstance?.objetivoEducacional}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="anotacoesSemanticas"><g:message code="dadosEducacionais.anotacoesSemanticas.label" default="Anotacoes Semanticas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'anotacoesSemanticas', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosEducacionaisInstance?.anotacoesSemanticas?}" var="a">
									    <li><g:link controller="anotacaoSemantica" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="anotacaoSemantica" action="create" params="['dadosEducacionais.id': dadosEducacionaisInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="preRequisitos"><g:message code="dadosEducacionais.preRequisitos.label" default="Pré-Requisitos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'preRequisitos', 'errors')}">
                                    <g:textField name="preRequisitos" value="${dadosEducacionaisInstance?.preRequisitos}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tempoPrevisto"><g:message code="dadosEducacionais.tempoPrevisto.label" default="Tempo Previsto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'tempoPrevisto', 'errors')}">
                                    <g:textField name="tempoPrevisto" value="${fieldValue(bean: dadosEducacionaisInstance, field: 'tempoPrevisto')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="complemento"><g:message code="dadosEducacionais.complemento.label" default="Complemento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'complemento', 'errors')}">
                                    <g:textArea name="complemento" cols="40" rows="5" value="${dadosEducacionaisInstance?.complemento}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dificuldade"><g:message code="dadosEducacionais.dificuldade.label" default="Dificuldade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'dificuldade', 'errors')}">
                                    <g:select name="dificuldade" from="${dadosEducacionaisInstance.constraints.dificuldade.inList}" value="${dadosEducacionaisInstance?.dificuldade}" valueMessagePrefix="dadosEducacionais.dificuldade"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoInteratividade"><g:message code="dadosEducacionais.tipoInteratividade.label" default="Tipo de Interatividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'tipoInteratividade', 'errors')}">
                                    <g:select name="tipoInteratividade" from="${dadosEducacionaisInstance.constraints.tipoInteratividade.inList}" value="${dadosEducacionaisInstance?.tipoInteratividade}" valueMessagePrefix="dadosEducacionais.tipoInteratividade"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nivelInteratividade"><g:message code="dadosEducacionais.nivelInteratividade.label" default="Nível de Interatividade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosEducacionaisInstance, field: 'nivelInteratividade', 'errors')}">
                                    <g:select name="nivelInteratividade" from="${dadosEducacionaisInstance.constraints.nivelInteratividade.inList}" value="${dadosEducacionaisInstance?.nivelInteratividade}" valueMessagePrefix="dadosEducacionais.nivelInteratividade"  />
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
