
<%@ page import="flocos.MoafMc" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moafMc.label', default: 'MoafMc')}" />
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
            
            <g:form name="searchForm" action="list" method="get">
            	<label for="criteria">Search</label><br/>
                    <g:textField name="query" value="${query}"/>
                    <span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
            </g:form>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th>Title</th>
                        
                            <th>Initial concept</th>
                        
                            <th>Purpose</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${moafMcInstanceList}" status="i" var="moafMcInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${moafMcInstance.id}">${moafMcInstance.dadosGerais.title}</g:link></td>
                        
                            <td>${moafMcInstance.dadosGerais.initialConcept}</td>
                        
                            <td>${moafMcInstance.dadosEducacionais.purpose}</td>                       
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${moafMcInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
