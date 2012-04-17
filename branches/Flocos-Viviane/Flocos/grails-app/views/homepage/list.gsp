
<%@ page import="flocos.Homepage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homepage.label', default: 'Homepage')}" />
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
                        
                            <g:sortableColumn property="homepage" title="${message(code: 'homepage.homepage.label', default: 'Homepage')}" />
                        
                            <th><g:message code="homepage.responsavel.label" default="Responsavel" /></th>
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${homepageInstanceList}" status="i" var="homepageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: homepageInstance, field: "homepage")}</td>
                        
                            <td>${fieldValue(bean: homepageInstance, field: "responsavel")}</td>
                            
                            <td>
								<g:link action="show" id="${homepageInstance.id}"><img src="../images/ver.png"></g:link>
								<g:link action="edit" id="${homepageInstance.id}"><img src="../images/editar.png"></g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${homepageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
