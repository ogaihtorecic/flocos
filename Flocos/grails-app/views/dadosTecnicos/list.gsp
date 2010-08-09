
<%@ page import="flocos.DadosTecnicos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosTecnicos.label', default: 'DadosTecnicos')}" />
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="tamanho" title="${message(code: 'dadosTecnicos.tamanho.label', default: 'Tamanho')}" />
                        
                            <g:sortableColumn property="duracao" title="${message(code: 'dadosTecnicos.duracao.label', default: 'Duracao')}" />
                            
                            <th><g:message code="dadosTecnicos.locais.label" default="Locais" /></th>
                            
                            <th><g:message code="dadosTecnicos.sistemasOperacionais.label" default="Sistemas Operacionais" /></th>
                            
                            <th><g:message code="dadosTecnicos.browsers.label" default="Browsers" /></th>
                            
                            <th><g:message code="dadosTecnicos.recolucoes.label" default="Resolucoes" /></th>
                            
                            <th><g:message code="dadosTecnicos.plugins.label" default="Plugins" /></th>
                            
                            <th><g:message code="dadosTecnicos.hardwares.label" default="Hardwares" /></th>
                            
                            <th><g:message code="dadosTecnicos.middlewares.label" default="Middleware" /></th>
                            
                            <th><g:message code="dadosTecnicos.plataformas.label" default="Plataformas" /></th>
                            
                            <th><g:message code="dadosTecnicos.tiposMidia.label" default="Tipos de Mídia" /></th>
                        
                            <g:sortableColumn property="tipoAplicacao" title="${message(code: 'dadosTecnicos.tipoAplicacao.label', default: 'Tipo Aplicacao')}" />
                            
                            <th><g:message code="dadosTecnicos.parametros.label" default="Parâmetros" /></th>
                            
                            <th><g:message code="dadosTecnicos.funcoes.label" default="Funções" /></th>
                        
                            <g:sortableColumn property="obervacaoInstalacao" title="${message(code: 'dadosTecnicos.obervacaoInstalacao.label', default: 'Obervação de Instalação')}" />
                        
                            <g:sortableColumn property="quantidadeMaxima" title="${message(code: 'dadosTecnicos.quantidadeMaxima.label', default: 'Quantidade Máxima')}" />
                            
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dadosTecnicosInstanceList}" status="i" var="dadosTecnicosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: dadosTecnicosInstance, field: "tamanho")}</td>
                        
                            <td>${fieldValue(bean: dadosTecnicosInstance, field: "duracao")}</td>
                            
                            <td>${dadosTecnicosInstance.locais}</td>
                            
                            <td>${dadosTecnicosInstance.sistemasOperacionais}</td>
                            
                            <td>${dadosTecnicosInstance.browsers}</td>
                            
                            <td>${dadosTecnicosInstance.resolucoes}</td>
                            
                            <td>${dadosTecnicosInstance.plugins}</td>
                            
                           	<td>${dadosTecnicosInstance.hardwares}</td>
                           
                           	<td>${dadosTecnicosInstance.middlewares}</td>
                           
                           	<td>${dadosTecnicosInstance.plataformas}</td> 
                           
                           	<td>${dadosTecnicosInstance.tipoMidias}</td>
                        
                            <td>${fieldValue(bean: dadosTecnicosInstance, field: "tipoAplicacao")}</td>
                            
                            <td>${dadosTecnicosInstance.parametros}</td>
                            
                            <td>${dadosTecnicosInstance.funcoes}</td>
                        
                            <td>${fieldValue(bean: dadosTecnicosInstance, field: "obervacaoInstalacao")}</td>
                        
                            <td>${fieldValue(bean: dadosTecnicosInstance, field: "quantidadeMaxima")}</td>
                        
                        	<td>
                        		<g:link action="show" id="${dadosTecnicosInstance.id}">[V]</g:link>
                        		<g:link action="edit" id="${dadosTecnicosInstance.id}">[E]</g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dadosTecnicosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
