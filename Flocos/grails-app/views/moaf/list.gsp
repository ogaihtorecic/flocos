
<%@ page import="flocos.Moaf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moaf.label', default: 'Moaf')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create" controller="dadosGerais"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        	<th><g:message code="moaf.dadosGerais.label" default="Dados Gerais" /></th>
                        	
                        	<th><g:message code="moaf.dadosCriacao.label" default="Dados de Criação" /></th>
                        	
                        	<th><g:message code="moaf.dadosTecnicos.label" default="Dados Tecnicos" /></th>
                        
                            <th><g:message code="moaf.dadosEducacionais.label" default="Dados Educacionais" /></th>

							<th><g:message code="moaf.dadosDominios.label" default="Dados de Domínio" /></th>
                   	    
                            <th><g:message code="moaf.dadosAcessibilidade.label" default="Dados Acessibilidade" /></th>
                   	    
                   	    	<th><g:message code="default.actions.label" default="Actions" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${moafInstanceList}" status="i" var="moafInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        	<td><g:link controller="dadosGerais" action="show" id="${moafInstance.dadosGerais?.id}">${fieldValue(bean: moafInstance, field: "dadosGerais")}</g:link></td>
                        	
                        	<td><g:link controller="dadosCriacao" action="show" id="${moafInstance.dadosCriacao?.id}">${fieldValue(bean: moafInstance, field: "dadosCriacao")}</g:link></td>
                        	
                        	<td><g:link controller="dadosTecnicos" action="show" id="${moafInstance.dadosTecnicos?.id}">${fieldValue(bean: moafInstance, field: "dadosTecnicos")}</g:link></td>
                        
                            <td><g:link controller="dadosEducacionais" action="show" id="${moafInstance.dadosEducacionais?.id}">${fieldValue(bean: moafInstance, field: "dadosEducacionais")}</g:link></td>
                            
                            <td>${fieldValue(bean: moafInstance, field: "dadosDominios")}</td>
                        
                            <td><g:link controller="dadosAcessibilidade" action="show" id="${moafInstance.dadosAcessibilidade?.id}">${fieldValue(bean: moafInstance, field: "dadosAcessibilidade")}</g:link></td>
                        
                        	<td>
                        		<g:link action="show" id="${moafInstance.id}">[V]</g:link>
                        		<g:if test="${moafInstance.dadosEducacionais && session.usuario.id != moafInstance.usuario.id}">
                        			<g:link controller="relatoUso" action="create" params="['dadosEducacionais.id': moafInstance.dadosEducacionais?.id]">[R]</g:link>
                        		</g:if>
                        		<g:if test="${(!moafInstance.dadosGerais || 
                        						!moafInstance.dadosCriacao ||
                        						!moafInstance.dadosTecnicos ||
                        						!moafInstance.dadosEducacionais ||
                        						!moafInstance.dadosDominios ||
												moafInstance.dadosDominios.size() == 0 ||
                        						!moafInstance.dadosAcessibilidade) &&
                        						session.usuario.id.equals(moafInstance.usuario.id)}">
                        			<g:link action="continuarCadastro" id="${moafInstance.id}">[>>]</g:link>
                        		</g:if>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${moafInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
