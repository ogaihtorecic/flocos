
<%@ page import="flocos.Instituicao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'instituicao.label', default: 'Instituicao')}" />
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
            	<label for="criteria"><g:message code="instituicao.instituicao.label" default="Instituicao" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="instituicao" title="${message(code: 'instituicao.instituicao.label', default: 'Instituicao')}" />
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${instituicaoInstanceList}" status="i" var="instituicaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: instituicaoInstance, field: "instituicao")}</td>
                            
                            <td>
								<g:link action="show" id="${instituicaoInstance.id}"><img src="../images/ver.png"></g:link>
								<g:link action="edit" id="${instituicaoInstance.id}"><img src="../images/editar.png"></g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${instituicaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
