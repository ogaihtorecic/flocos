
<%@ page import="flocos.Responsavel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'responsavel.label', default: 'Responsavel')}" />
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
            	<label for="criteria"><g:message code="responsavel.nome.label" default="Nome" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="nome" title="${message(code: 'responsavel.nome.label', default: 'Nome')}" />
                            
                            <th><g:message code="responsavel.emails.label" default="Emails" /></th>
                            
                            <th><g:message code="responsavel.homepages.label" default="Homepages" /></th>
                            
                            <th><g:message code="responsavel.instituicoes.label" default="Instituições" /></th>
                            
                            <th><g:message code="responsavel.papeis.label" default="Papéis" /></th>
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${responsavelInstanceList}" status="i" var="responsavelInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: responsavelInstance, field: "nome")}</td>
                            
                            <td>${responsavelInstance.emails}</td>
                            
                           	<td>${responsavelInstance.homepages}</td>
                           	
                           	<td>${responsavelInstance.instituicoes}</td>
                           	
                           	<td>${responsavelInstance.papeis}</td> 
                            
                            <td>
								<g:link action="show" id="${responsavelInstance.id}"><img src="../images/ver.png"></g:link>
								<g:link action="edit" id="${responsavelInstance.id}"><img src="../images/editar.png"></g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${responsavelInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
