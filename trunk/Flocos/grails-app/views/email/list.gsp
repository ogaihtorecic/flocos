
<%@ page import="flocos.Email" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />
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
                        
                            <g:sortableColumn property="email" title="${message(code: 'email.email.label', default: 'Email')}" />
                        
                            <th><g:message code="email.responsavel.label" default="Responsavel" /></th>
                   	    
                   	    	<th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${emailInstanceList}" status="i" var="emailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: emailInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: emailInstance, field: "responsavel")}</td>
                        
                        	<td>
								<g:link action="show" id="${emailInstance.id}"><img src="../images/ver.png"></g:link>
								<g:link action="edit" id="${emailInstance.id}"><img src="../images/editar.png"></g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${emailInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
