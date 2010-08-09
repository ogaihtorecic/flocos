
<%@ page import="flocos.DadosTecnicos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosTecnicos.label', default: 'DadosTecnicos')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dadosTecnicosInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosTecnicosInstance}" as="list" />
            </div>
            </g:hasErrors>
            
            <g:form method="post" >
            
                <g:hiddenField name="id" value="${dadosTecnicosInstance?.id}" />
                <g:hiddenField name="version" value="${dadosTecnicosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="duracao"><g:message code="dadosTecnicos.duracao.label" default="Duração" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'duracao', 'errors')}">
                                    <g:textField name="duracao" value="${fieldValue(bean: dadosTecnicosInstance, field: 'duracao')}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locais"><g:message code="dadosTecnicos.locais.label" default="Locais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'locais', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosTecnicosInstance?.locais?}" var="l">
									    <li>${l}</li>
									</g:each>
									</ul>
									<g:link controller="local" action="create" params="['dadosTecnicos.id': dadosTecnicosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'local.label', default: 'Local')])}</g:link>

                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sistemasOperacionais"><g:message code="dadosTecnicos.sistemasOperacionais.label" default="Sistemas Operacionais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'sistemasOperacionais', 'errors')}">
                                    <g:select name="sistemasOperacionais" from="${flocos.SistemaOperacional.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.sistemasOperacionais*.id}" />
                                    <a href="/Flocos/sistemaOperacional/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="browsers"><g:message code="dadosTecnicos.browsers.label" default="Browsers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'browsers', 'errors')}">
                                    <g:select name="browsers" from="${flocos.Browser.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.browsers*.id}" />
                                    <a href="/Flocos/browser/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="resolucoes"><g:message code="dadosTecnicos.resolucoes.label" default="Resolucoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'resolucoes', 'errors')}">
                                    <g:select name="resolucoes" from="${flocos.Resolucao.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.resolucoes*.id}" />
                                    <a href="/Flocos/resolucao/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plugins"><g:message code="dadosTecnicos.plugins.label" default="Plugins" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'plugins', 'errors')}">
                                    <g:select name="plugins" from="${flocos.Plugin.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.plugins*.id}" />
                                    <a href="/Flocos/plugin/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hardwares"><g:message code="dadosTecnicos.hardwares.label" default="Hardwares" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'hardwares', 'errors')}">
                                    <g:select name="hardwares" from="${flocos.Hardware.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.hardwares*.id}" />
                                    <a href="/Flocos/hardware/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="middlewares"><g:message code="dadosTecnicos.middlewares.label" default="Middlewares" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'middlewares', 'errors')}">
                                    <g:select name="middlewares" from="${flocos.Middleware.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.middlewares*.id}" />
                                    <a href="/Flocos/middleware/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plataformas"><g:message code="dadosTecnicos.plataformas.label" default="Plataformas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'plataformas', 'errors')}">
                                    <g:select name="plataformas" from="${flocos.Plataforma.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.plataformas*.id}" />
                                    <a href="/Flocos/plataforma/create?backUri=/dadosTecnicos/edit/${dadosTecnicosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoMidias"><g:message code="dadosTecnicos.tipoMidias.label" default="Tipo Midias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'tipoMidias', 'errors')}">
                                    <g:select name="tipoMidias" from="${flocos.TipoMidia.list()}" multiple="yes" optionKey="id" size="5" value="${dadosTecnicosInstance?.tipoMidias*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoAplicacao"><g:message code="dadosTecnicos.tipoAplicacao.label" default="Tipo Aplicacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'tipoAplicacao', 'errors')}">
                                    <g:textField name="tipoAplicacao" value="${dadosTecnicosInstance?.tipoAplicacao}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parametros"><g:message code="dadosTecnicos.parametros.label" default="Parâmetros" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'parametros', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosTecnicosInstance?.parametros?}" var="p">
									    <li><g:link controller="parametro" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="parametro" action="create" params="['dadosTecnicos.id': dadosTecnicosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'parametro.label', default: 'Parametro')])}</g:link>

                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="funcoes"><g:message code="dadosTecnicos.funcoes.label" default="Funções" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'funcoes', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosTecnicosInstance?.funcoes?}" var="f">
									    <li><g:link controller="funcao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="funcao" action="create" params="['dadosTecnicos.id': dadosTecnicosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'funcao.label', default: 'Funcao')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="obervacaoInstalacao"><g:message code="dadosTecnicos.obervacaoInstalacao.label" default="Obervação de Instalação" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'obervacaoInstalacao', 'errors')}">
                                    <g:textArea name="obervacaoInstalacao" cols="40" rows="5" value="${dadosTecnicosInstance?.obervacaoInstalacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantidadeMaxima"><g:message code="dadosTecnicos.quantidadeMaxima.label" default="Quantidade Máxima" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'quantidadeMaxima', 'errors')}">
                                    <g:textField name="quantidadeMaxima" value="${fieldValue(bean: dadosTecnicosInstance, field: 'quantidadeMaxima')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
                
            </g:form>
            
        </div>
    </body>
</html>
