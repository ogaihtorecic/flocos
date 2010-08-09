
<%@ page import="flocos.Parametro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parametro.label', default: 'Parametro')}" />
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
            	<label for="criteria"><g:message code="parametro.nomeParametro.label" default="Nome do Parâmetro" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        	<g:sortableColumn property="nomeParametro" title="${message(code: 'parametro.nomeParametro.label', default: 'Nome Parametro')}" />
                        
                            <g:sortableColumn property="tipoParametro" title="${message(code: 'parametro.tipoParametro.label', default: 'Tipo Parametro')}" />
                        
                            <g:sortableColumn property="opcional" title="${message(code: 'parametro.opcional.label', default: 'Opcional')}" />
                        
                            <g:sortableColumn property="metodoEnvio" title="${message(code: 'parametro.metodoEnvio.label', default: 'Metodo Envio')}" />
                        
                            <g:sortableColumn property="tipo" title="${message(code: 'parametro.tipo.label', default: 'Tipo')}" />
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${parametroInstanceList}" status="i" var="parametroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: parametroInstance, field: "nomeParametro")}</td>
                        
                            <td>${fieldValue(bean: parametroInstance, field: "tipoParametro")}</td>
                        
                            <td>${fieldValue(bean: parametroInstance, field: "opcional")}</td>
                        
                            <td>${fieldValue(bean: parametroInstance, field: "metodoEnvio")}</td>
                        
                            <td>${fieldValue(bean: parametroInstance, field: "tipo")}</td>
                        
                            <td>
								<g:link action="show" id="${parametroInstance.id}">[V]</g:link>
								<g:link action="edit" id="${parametroInstance.id}">[E]</g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${parametroInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
