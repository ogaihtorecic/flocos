
<%@ page import="flocos.DadosGerais" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosGerais.label', default: 'DadosGerais')}" />
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
            	<label for="criteria"><g:message code="dadosGerais.nome.label" default="Nome" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        	<g:sortableColumn property="nome" title="${message(code: 'dadosGerais.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="palavrasChave" title="${message(code: 'dadosGerais.palavrasChave.label', default: 'Palavras Chave')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'dadosGerais.descricao.label', default: 'Descricao')}" />
                        
                            <th><g:message code="dadosGerais.idiomas.label" default="Idiomas" /></th>
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dadosGeraisInstanceList}" status="i" var="dadosGeraisInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: dadosGeraisInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: dadosGeraisInstance, field: "palavrasChave")}</td>
                        
                            <td>${fieldValue(bean: dadosGeraisInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: dadosGeraisInstance, field: "idiomas")}</td>
                            
                            <td>
                        		<g:link action="show" id="${dadosGeraisInstance.id}"><img src="../images/ver.png"></g:link>
                        		<g:link action="edit" id="${dadosGeraisInstance.id}"><img src="../images/editar.png"></g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dadosGeraisInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
