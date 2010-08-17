
<%@ page import="flocos.Funcao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcao.label', default: 'Funcao')}" />
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
            	<label for="criteria"><g:message code="funcao.nomeFuncao.label" default="Nome da Funcao" /></label><br/>
				<g:textField name="criteria"/>
				<span class="button"><g:submitButton name="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>
			</g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="nomeFuncao" title="${message(code: 'funcao.nomeFuncao.label', default: 'Nome Funcao')}" />
                        
                            <g:sortableColumn property="descricaoFuncao" title="${message(code: 'funcao.descricaoFuncao.label', default: 'Descricao Funcao')}" />
                   	    
                            <g:sortableColumn property="parametroEntrada" title="${message(code: 'funcao.parametroEntrada.label', default: 'Parametro Entrada')}" />
                        
                            <g:sortableColumn property="parametroSaida" title="${message(code: 'funcao.parametroSaida.label', default: 'Parametro Saida')}" />
                        
                        	<th><g:message code="funcao.dadosTecnicos.label" default="Dados Tecnicos" /></th>
                        
                        	<th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${funcaoInstanceList}" status="i" var="funcaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: funcaoInstance, field: "nomeFuncao")}</td>
                        
                            <td>${fieldValue(bean: funcaoInstance, field: "descricaoFuncao")}</td>
                        
                            <td>${fieldValue(bean: funcaoInstance, field: "parametroEntrada")}</td>
                        
                            <td>${fieldValue(bean: funcaoInstance, field: "parametroSaida")}</td>
                            
                            <td>${fieldValue(bean: funcaoInstance, field: "dadosTecnicos")}</td>
                            
                            <td>
								<g:link action="show" id="${funcaoInstance.id}"><img src="../images/ver.png"></g:link>
								<g:link action="edit" id="${funcaoInstance.id}"><img src="../images/editar.png"></g:link>
							</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${funcaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
