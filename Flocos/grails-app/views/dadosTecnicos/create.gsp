
<%@ page import="flocos.DadosTecnicos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosTecnicos.label', default: 'DadosTecnicos')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dadosTecnicosInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosTecnicosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                                  <label for="sistemasOperacionais"><g:message code="dadosTecnicos.sistemasOperacionais.label" default="Sistemas Operacionais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'sistemasOperacionais', 'errors')}">
                                    <g:select name="sistemasOperacionais" from="${flocos.SistemaOperacional.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/sistemaOperacional/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="browsers"><g:message code="dadosTecnicos.browsers.label" default="Browsers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'browsers', 'errors')}">
                                    <g:select name="browsers" from="${flocos.Browser.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/browser/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="resolucoes"><g:message code="dadosTecnicos.resolucoes.label" default="Resoluções" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'resolucoes', 'errors')}">
                                    <g:select name="resolucoes" from="${flocos.Resolucao.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/resolucao/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plugins"><g:message code="dadosTecnicos.plugins.label" default="Plugins" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'plugins', 'errors')}">
                                    <g:select name="plugins" from="${flocos.Plugin.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/plugin/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hardwares"><g:message code="dadosTecnicos.hardwares.label" default="Hardwares" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'hardwares', 'errors')}">
                                    <g:select name="hardwares" from="${flocos.Hardware.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/hardware/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="middlewares"><g:message code="dadosTecnicos.middlewares.label" default="Middlewares" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'middlewares', 'errors')}">
                                    <g:select name="middlewares" from="${flocos.Middleware.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/middleware/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plataformas"><g:message code="dadosTecnicos.plataformas.label" default="Plataformas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'plataformas', 'errors')}">
                                    <g:select name="plataformas" from="${flocos.Plataforma.list()}" multiple="yes" optionKey="id" size="5" />
                                    <a href="/Flocos/plataforma/create?backUri=/dadosTecnicos/create?moaf.id=${params.moaf.id}">[+]</a>
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoMidias"><g:message code="dadosTecnicos.tipoMidias.label" default="Tipos de Mídias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'tipoMidias', 'errors')}">
                                    <g:select name="tipoMidias" from="${flocos.TipoMidia.list()}" multiple="yes" optionKey="id" size="5" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoAplicacao"><g:message code="dadosTecnicos.tipoAplicacao.label" default="Tipo de Aplicação" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosTecnicosInstance, field: 'tipoAplicacao', 'errors')}">
                                    <g:textField name="tipoAplicacao" value="${dadosTecnicosInstance?.tipoAplicacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obervacaoInstalacao"><g:message code="dadosTecnicos.obervacaoInstalacao.label" default="Observação de Instalação" /></label>
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
                        
                            <g:hiddenField name="usuario.id" value="${session.usuario.id}" />
                            
                            <g:hiddenField name="backUri" value="${params.backUri}" />
                            
                            <g:hiddenField name="moaf.id" value="${params.moaf.id}"/>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
