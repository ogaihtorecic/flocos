
<%@ page import="flocos.DadosCriacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosCriacao.label', default: 'DadosCriacao')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form name="searchForm" action="search">
            	<label for="criteria"><g:message code="dadosCriacao.versao.label" default="Versao" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="versao" title="${message(code: 'dadosCriacao.versao.label', default: 'Versao')}" />
                        
                            <g:sortableColumn property="data" title="${message(code: 'dadosCriacao.data.label', default: 'Data')}" />
                        
                        	<th><g:message code="dadosCriacao.responsaveis.label" default="Responsaveis" /></th>
                        
                            <g:sortableColumn property="licenca" title="${message(code: 'dadosCriacao.licenca.label', default: 'Licenca')}" />
                        
                            <th><g:message code="dadosCriacao.meiosAcesso.label" default="Meios de Acesso" /></th>
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dadosCriacaoInstanceList}" status="i" var="dadosCriacaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: dadosCriacaoInstance, field: "versao")}</td>
                        
                            <td><g:formatDate date="${dadosCriacaoInstance.data}" format="dd/MM/yyyy" /></td>
                            
                            <td>${dadosCriacaoInstance.responsaveis}</td>
                        
                            <td>${fieldValue(bean: dadosCriacaoInstance, field: "licenca")}</td>
                        
                            <td>${dadosCriacaoInstance.meiosAcesso}</td>
                        
                        	<td>
                        		<g:link action="show" id="${dadosCriacaoInstance.id}"><img src="../images/ver.png"></g:link>
                        		<g:link action="edit" id="${dadosCriacaoInstance.id}"><img src="../images/editar.png"></g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dadosCriacaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
