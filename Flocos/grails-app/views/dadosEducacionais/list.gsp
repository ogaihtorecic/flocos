
<%@ page import="flocos.DadosEducacionais" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosEducacionais.label', default: 'DadosEducacionais')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form name="searchForm" action="search">
            	<label for="criteria"><g:message code="dadosEducacionais.conteudo.label" default="Conteúdo" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        	<th><g:message code="dadosEducacionais.areas.label" default="Áreas" /></th>
                        	
                        	<th><g:message code="dadosEducacionais.dominiosPropostos.label" default="Domínios Propostos" /></th>
                        	
                        	<th><g:message code="dadosEducacionais.niveisEscolaridade.label" default="Níveis de Escolaridade" /></th>
                        	
                            <g:sortableColumn property="idade" title="${message(code: 'dadosEducacionais.idade.label', default: 'Idade')}" />
                            
                            <th><g:message code="dadosEducacionais.classificacoes.label" default="Classificações" /></th>
                        
                            <g:sortableColumn property="conteudo" title="${message(code: 'dadosEducacionais.conteudo.label', default: 'Conteudo')}" />
                            
                            <th><g:message code="dadosEducacionais.objetivoEducacional.label" default="Objetivo Educacional" /></th>
                            
                            <th><g:message code="dadosEducacionais.anotacoesSemanticas.label" default="Anotações Semânticas" /></th>
                        
                            <g:sortableColumn property="preRequisitos" title="${message(code: 'dadosEducacionais.preRequisitos.label', default: 'Pré-Requisitos')}" />
                        
                            <g:sortableColumn property="tempoPrevisto" title="${message(code: 'dadosEducacionais.tempoPrevisto.label', default: 'Tempo Previsto')}" />
                        
                            <g:sortableColumn property="complemento" title="${message(code: 'dadosEducacionais.complemento.label', default: 'Complemento')}" />
                            
                            <th><g:message code="dadosEducacionais.dificuldade.label" default="Dificuldade" /></th>
                            
                            <th><g:message code="dadosEducacionais.tipoInteratividade.label" default="Tipo de Interatividade" /></th>
                            
                            <th><g:message code="dadosEducacionais.nivelInteratividade.label" default="Nível de Interatividade" /></th>
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dadosEducacionaisInstanceList}" status="i" var="dadosEducacionaisInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        	<td>${dadosEducacionaisInstance.areas}</td>
                            
                            <td>${dadosEducacionaisInstance.dominiosPropostos}</td>
                            
                            <td>${dadosEducacionaisInstance.niveisEscolaridade}</td>
                        
                            <td>${fieldValue(bean: dadosEducacionaisInstance, field: "idade")}</td>
                            
                            <td>${dadosEducacionaisInstance.classificacoes}</td>
                        
                            <td>${fieldValue(bean: dadosEducacionaisInstance, field: "conteudo")}</td>
                            
                            <td>${dadosEducacionaisInstance.objetivoEducacional}</td>
                            
                            <td>${dadosEducacionaisInstance.anotacoesSemanticas}</td>
                        
                            <td>${fieldValue(bean: dadosEducacionaisInstance, field: "preRequisitos")}</td>
                        
                            <td>${fieldValue(bean: dadosEducacionaisInstance, field: "tempoPrevisto")}</td>
                        
                            <td>${fieldValue(bean: dadosEducacionaisInstance, field: "complemento")}</td>
                            
                            <td>${dadosEducacionaisInstance.dificuldade}</td>
                            
                            <td>${dadosEducacionaisInstance.tipoInteratividade}</td>
                            
                            <td>${dadosEducacionaisInstance.nivelInteratividade}</td>
                        
                        	<td>
                        		<g:link action="show" id="${dadosEducacionaisInstance.id}">[V]</g:link>
                        		<g:link action="edit" id="${dadosEducacionaisInstance.id}">[E]</g:link>
                        		<g:if test="${session.usuario.id != dadosEducacionaisInstance.usuario.id}">
                        			<g:link controller="relatoUso" action="create" params="['dadosEducacionais.id': dadosEducacionaisInstance?.id]">[R]</g:link>
                        		</g:if>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dadosEducacionaisInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
