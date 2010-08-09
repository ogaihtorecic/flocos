
<%@ page import="flocos.Classificacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classificacao.label', default: 'Classificacao')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="tipoClassificacao" title="${message(code: 'classificacao.tipoClassificacao.label', default: 'Tipo Classificacao')}" />
                        
                            <g:sortableColumn property="subcategoria" title="${message(code: 'classificacao.subcategoria.label', default: 'Subcategoria')}" />
                        
                        	<th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classificacaoInstanceList}" status="i" var="classificacaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: classificacaoInstance, field: "tipoClassificacao")}</td>
                        
                            <td>${fieldValue(bean: classificacaoInstance, field: "subcategoria")}</td>
                        
                        	<td>
                        		<g:link action="show" id="${classificacaoInstance.id}">[V]</g:link>
                        		<g:link action="edit" id="${classificacaoInstance.id}">[E]</g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${classificacaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
