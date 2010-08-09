
<%@ page import="flocos.DadosDominios" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosDominios.label', default: 'DadosDominios')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="createWithoutMoaf"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form name="searchForm" action="search">
            	<label for="criteria"><g:message code="dadosDominios.titulo.label" default="Título" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'dadosDominios.titulo.label', default: 'Titulo')}" />
                            
                            <th><g:message code="dadosDominios.idiomas.label" default="Idiomas" /></th>
                            
                            <th><g:message code="dadosDominios.dominioGeral.label" default="Domínio Geral" /></th>
                        
                            <g:sortableColumn property="dominioEspecifico" title="${message(code: 'dadosDominios.dominioEspecifico.label', default: 'Dominio Especifico')}" />
                        
							<th><g:message code="dadosDominios.locais.label" default="Locais" /></th>
                        
                            <g:sortableColumn property="data" title="${message(code: 'dadosDominios.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="versao" title="${message(code: 'dadosDominios.versao.label', default: 'Versão')}" />
                            
                            <th><g:message code="dadosDominios.responsaveis.label" default="Responsáveis" /></th>
                            
                            <th><g:message code="dadosDominios.formatos.label" default="Formatos" /></th>
                        
                            <g:sortableColumn property="descricaoOntologia" title="${message(code: 'dadosDominios.descricaoOntologia.label', default: 'Descrição da Ontologia')}" />
                            
                            <th><g:message code="default.actions.label" default="Ações" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dadosDominiosInstanceList}" status="i" var="dadosDominiosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: dadosDominiosInstance, field: "titulo")}</td>
                            
                            <td>${dadosDominiosInstance.idiomas}</td>
                            
                            <td>${dadosDominiosInstance.dominiosGerais}</td>
                        
                            <td>${fieldValue(bean: dadosDominiosInstance, field: "dominioEspecifico")}</td>
                            
                            <td>${dadosDominiosInstance.locais}</td>
                        
                            <td><g:formatDate date="${dadosDominiosInstance.data}" format="dd/MM/yyyy"/></td>
                        
                            <td>${fieldValue(bean: dadosDominiosInstance, field: "versao")}</td>
                            
                            <td>${dadosDominiosInstance.responsaveis}</td>
                            
                            <td>${dadosDominiosInstance.formatos}</td>
                        
                            <td>${fieldValue(bean: dadosDominiosInstance, field: "descricaoOntologia")}</td>
                            
                            <td>
                        		<g:link action="show" id="${dadosDominiosInstance.id}">[V]</g:link>
                        		<g:link action="edit" id="${dadosDominiosInstance.id}">[E]</g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dadosDominiosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
