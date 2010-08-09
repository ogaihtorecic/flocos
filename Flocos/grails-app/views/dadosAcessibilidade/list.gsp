
<%@ page import="flocos.DadosAcessibilidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade')}" />
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        	<th><g:message code="dadosAcessibilidade.tiposPnee.label" default="Tipos de Pnee" /></th>
                        	
                        	<th><g:message code="dadosAcessibilidade.inaptidoesVisuais.label" default="Inaptidões Visuais" /></th>
                        	
                        	<g:sortableColumn property="inaptidaoAuditiva" title="${message(code: 'dadosAcessibilidade.inaptidaoAuditiva.label', default: 'Inaptidão Auditiva')}" />
                        
                        	<th><g:message code="dadosAcessibilidade.inaptidoesNeuro.label" default="Inaptidões Neurológicas" /></th>
                        
                            <g:sortableColumn property="descricaoPnee" title="${message(code: 'dadosAcessibilidade.descricaoPnee.label', default: 'Descricao Pnee')}" />

							<th><g:message code="default.actions.label" default="Ações" /></th>                        
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dadosAcessibilidadeInstanceList}" status="i" var="dadosAcessibilidadeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        	<td>${dadosAcessibilidadeInstance.tiposPnee}</td>
                        	
                        	<td>${dadosAcessibilidadeInstance.inaptidoesVisuais}</td>
                        	
                        	<td>${fieldValue(bean: dadosAcessibilidadeInstance, field: "inaptidaoAuditiva")}</td>
                        	
                        	<td>${dadosAcessibilidadeInstance.inaptidoesNeuro}</td>
                        
                            <td>${fieldValue(bean: dadosAcessibilidadeInstance, field: "descricaoPnee")}</td>
                        
                        	<td>
                        		<g:link action="show" id="${dadosAcessibilidadeInstance.id}">[V]</g:link>
                        		<g:link action="edit" id="${dadosAcessibilidadeInstance.id}">[E]</g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dadosAcessibilidadeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
