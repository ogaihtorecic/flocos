
<%@ page import="flocos.Resolucao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'resolucao.label', default: 'Resolucao')}" />
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
            	<label for="criteria"><g:message code="resolucao.resolucao.label" default="Hardware" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="resolucao" title="${message(code: 'resolucao.resolucao.label', default: 'Resolucao')}" />
                        
                        	<th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${resolucaoInstanceList}" status="i" var="resolucaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: resolucaoInstance, field: "resolucao")}</td>
                            
                            <td>
								<g:link action="show" id="${resolucaoInstance.id}">[V]</g:link>
								<g:link action="edit" id="${resolucaoInstance.id}">[E]</g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${resolucaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
