
<%@ page import="flocos.DadosTecnicos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosTecnicos.label', default: 'DadosTecnicos')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.tamanho.label" default="Tamanho" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosTecnicosInstance, field: "tamanho")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.duracao.label" default="Duração" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosTecnicosInstance, field: "duracao")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.locais.label" default="Locais" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.locais}" var="l">
                                    <li>${l}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.sistemasOperacionais.label" default="Sistemas Operacionais" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.sistemasOperacionais}" var="s">
                                    <li><g:link controller="sistemaOperacional" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	 <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.browsers.label" default="Browsers" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.browsers}" var="b">
                                    <li><g:link controller="browser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.resolucoes.label" default="Resoluções" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.resolucoes}" var="r">
                                    <li><g:link controller="resolucao" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.plugins.label" default="Plugins" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.plugins}" var="p">
                                    <li><g:link controller="plugin" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.hardwares.label" default="Hardwares" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.hardwares}" var="h">
                                    <li><g:link controller="hardware" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.middlewares.label" default="Middlewares" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.middlewares}" var="m">
                                    <li><g:link controller="middleware" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.plataformas.label" default="Plataformas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.plataformas}" var="p">
                                    <li><g:link controller="plataforma" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.tipoMidias.label" default="Tipos de Mídias" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.tipoMidias}" var="t">
                                    <li>${t?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.tipoAplicacao.label" default="Tipo de Aplicação" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosTecnicosInstance, field: "tipoAplicacao")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.parametros.label" default="Parâmetros" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.parametros}" var="p">
                                    <li><g:link controller="parametro" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.funcoes.label" default="Funções" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dadosTecnicosInstance.funcoes}" var="f">
                                    <li><g:link controller="funcao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.obervacaoInstalacao.label" default="Obervação de Instalação" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosTecnicosInstance, field: "obervacaoInstalacao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dadosTecnicos.quantidadeMaxima.label" default="Quantidade Máxima" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dadosTecnicosInstance, field: "quantidadeMaxima")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dadosTecnicosInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
