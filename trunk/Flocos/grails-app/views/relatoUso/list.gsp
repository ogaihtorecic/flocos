
<%@ page import="flocos.RelatoUso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relatoUso.label', default: 'RelatoUso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form name="searchForm" action="search">
            	<label for="criteria"><g:message code="relatoUso.conteudo.label" default="Conteúdo" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        	<th><g:message code="relatoUso.responsaveis.label" default="Responsáveis" /></th>
                        
                            <g:sortableColumn property="data" title="${message(code: 'relatoUso.data.label', default: 'Data')}" />
                            
                            <th><g:message code="relatoUso.areas.label" default="Areas" /></th>
                            
                            <th><g:message code="relatoUso.dominiosUsados.label" default="Dominios Usados" /></th>
                            
                            <th><g:message code="relatoUso.niveisEscolaridade.label" default="Niveis Escolaridade" /></th>
                        
                            <g:sortableColumn property="idade" title="${message(code: 'relatoUso.idade.label', default: 'Idade')}" />
                            
                            <th><g:message code="relatoUso.classificacoes.label" default="Classificacoes" /></th>
                        
                            <g:sortableColumn property="qtdParticipantes" title="${message(code: 'relatoUso.qtdParticipantes.label', default: 'Qtd Participantes')}" />
                        
                            <g:sortableColumn property="conteudo" title="${message(code: 'relatoUso.conteudo.label', default: 'Conteudo')}" />
                        
                            <g:sortableColumn property="preRequisitos" title="${message(code: 'relatoUso.preRequisitos.label', default: 'Pre Requisitos')}" />
                            
                            <th><g:message code="relatoUso.tempoPrevisto.label" default="Tempo Previsto" /></th>
                            
                            <th><g:message code="relatoUso.objetivosEducacionais.label" default="Objetivos Educacionais" /></th>
                            
                            <th><g:message code="relatoUso.anotacoesSemanticas.label" default="Anotações Semãnticas" /></th>
                            
                            <th><g:message code="relatoUso.complemento.label" default="Complemento" /></th>
                            
                            <th><g:message code="relatoUso.dificuldade.label" default="Dificuldade" /></th>
                            
                            <th><g:message code="relatoUso.tipoInteratividade.label" default="Tipo Interatividade" /></th>
                            
                            <th><g:message code="relatoUso.nivelInteratividade.label" default="Nivel Interatividade" /></th>
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${relatoUsoInstanceList}" status="i" var="relatoUsoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        	<td>${relatoUsoInstance.responsaveis}</td>
                        	
                        	<td><g:formatDate date="${relatoUsoInstance.data}" format="dd/MM/yyyy" /></td>
                        
                        	<td>${relatoUsoInstance.areas}</td>
                        
                            <td>${relatoUsoInstance.dominiosUsados}</td>
                            
                            <td>${relatoUsoInstance.niveisEscolaridade}</td>
                        
                            <td>${fieldValue(bean: relatoUsoInstance, field: "idade")}</td>
                            
                            <td>${relatoUsoInstance.classificacoes}</td>
                        
                            <td>${fieldValue(bean: relatoUsoInstance, field: "qtdParticipantes")}</td>
                        
                            <td>${fieldValue(bean: relatoUsoInstance, field: "conteudo")}</td>
                        
                            <td>${fieldValue(bean: relatoUsoInstance, field: "preRequisitos")}</td>
                            
                            <td>${fieldValue(bean: relatoUsoInstance, field: "tempoPrevisto")}</td>
                            
                            <td>${relatoUsoInstance.objetivoEducacional}</td>
                            
                            <td>${relatoUsoInstance.anotacoesSemanticas}</td>
                            
                            <td>${fieldValue(bean: relatoUsoInstance, field: "complemento")}</td>
                            
                            <td>${fieldValue(bean: relatoUsoInstance, field: "dificuldade")}</td>
                            
                            <td>${fieldValue(bean: relatoUsoInstance, field: "tipoInteratividade")}</td>
                            
                            <td>${fieldValue(bean: relatoUsoInstance, field: "nivelInteratividade")}</td>
                            
                            <td>
								<g:link action="show" id="${relatoUsoInstance.id}">[V]</g:link>
								<g:link action="edit" id="${relatoUsoInstance.id}">[E]</g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${relatoUsoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
