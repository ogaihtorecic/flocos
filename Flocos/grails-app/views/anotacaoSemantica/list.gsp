
<%@ page import="flocos.AnotacaoSemantica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')}" />
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="localAnotacao" title="${message(code: 'anotacaoSemantica.localAnotacao.label', default: 'Local Anotacao')}" />
                        
                            <g:sortableColumn property="tipoAnotacao" title="${message(code: 'anotacaoSemantica.tipoAnotacao.label', default: 'Tipo Anotacao')}" />

							<th><g:message code="default.actions.label" default="Actions" /></th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${anotacaoSemanticaInstanceList}" status="i" var="anotacaoSemanticaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: anotacaoSemanticaInstance, field: "localAnotacao")}</td>
                        
                            <td>${fieldValue(bean: anotacaoSemanticaInstance, field: "tipoAnotacao")}</td>
                        
                            <td>
                        		<g:link action="show" id="${anotacaoSemanticaInstance.id}">[V]</g:link>
                        		<g:link action="edit" id="${anotacaoSemanticaInstance.id}">[E]</g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${anotacaoSemanticaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
