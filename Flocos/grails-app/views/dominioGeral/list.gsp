
<%@ page import="flocos.DominioGeral" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dominioGeral.label', default: 'DominioGeral')}" />
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
                        
                            <g:sortableColumn property="dominioGeral" title="${message(code: 'dominioGeral.dominioGeral.label', default: 'Dominio Geral')}" />
                        
                            <th><g:message code="dominioGeral.dadosDominios.label" default="Dados dos Dominios" /></th>
                            
                           	<th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dominioGeralInstanceList}" status="i" var="dominioGeralInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: dominioGeralInstance, field: "dominioGeral")}</td>
                        
                            <td>${fieldValue(bean: dominioGeralInstance, field: "dadosDominios")}</td>
                            
                            <td>
                        		<g:link action="show" id="${dominioGeralInstance.id}"><img src="../images/ver.png"></g:link>
                        		<g:link action="edit" id="${dominioGeralInstance.id}"><img src="../images/editar.png"></g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dominioGeralInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
