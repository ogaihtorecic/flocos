
<%@ page import="flocos.Formato" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'formato.label', default: 'Formato')}" />
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
                        
                            <g:sortableColumn property="formato" title="${message(code: 'formato.formato.label', default: 'Formato')}" />
                        
                            <th><g:message code="formato.dadosDominios.label" default="Dados Dominios" /></th>
                   	    
                   	    	<th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${formatoInstanceList}" status="i" var="formatoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: formatoInstance, field: "formato")}</td>
                        
                            <td>${fieldValue(bean: formatoInstance, field: "dadosDominios")}</td>
                            
                            <td>
								<g:link action="show" id="${formatoInstance.id}">[V]</g:link>
								<g:link action="edit" id="${formatoInstance.id}">[E]</g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${formatoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
