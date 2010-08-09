
<%@ page import="flocos.DadosDominios" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosDominios.label', default: 'DadosDominios')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="createWithoutMoaf"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dadosDominiosInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosDominiosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm method="post" >
                <g:hiddenField name="id" value="${dadosDominiosInstance?.id}" />
                <g:hiddenField name="version" value="${dadosDominiosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="titulo"><g:message code="dadosDominios.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${dadosDominiosInstance?.titulo}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="idiomas"><g:message code="dadosDominios.idiomas.label" default="Idiomas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'idiomas', 'errors')}">
                                    <g:select name="idiomas" from="${flocos.Idioma.list()}" multiple="yes" optionKey="id" size="5" value="${dadosDominiosInstance?.idiomas*.id}" />
                                    <a href="/Flocos/idioma/create?backUri=/dadosDominios/edit/${dadosDominiosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dominiosGerais"><g:message code="dadosDominios.dominiosGerais.label" default="Domínios Gerais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'dominiosGerais', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosDominiosInstance?.dominiosGerais?}" var="d">
									    <li><g:link controller="dominioGeral" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="dominioGeral" action="create" params="['dadosDominios.id': dadosDominiosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dominioGeral.label', default: 'DominioGeral')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dominioEspecifico"><g:message code="dadosDominios.dominioEspecifico.label" default="Domínio Específico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'dominioEspecifico', 'errors')}">
                                    <g:textField name="dominioEspecifico" value="${dadosDominiosInstance?.dominioEspecifico}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locais"><g:message code="dadosDominios.locais.label" default="Locais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'locais', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosDominiosInstance?.locais?}" var="l">
									    <li><g:link controller="local" action="show" id="${l.id}">${l}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="local" action="create" params="['dadosDominios.id': dadosDominiosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'local.label', default: 'Local')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="dadosDominios.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'data', 'errors')}">
                                    <g:datePicker name="data" precision="day" value="${dadosDominiosInstance?.data}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="versao"><g:message code="dadosDominios.versao.label" default="Versão" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'versao', 'errors')}">
                                    <g:textField name="versao" value="${dadosDominiosInstance?.versao}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="responsaveis"><g:message code="dadosDominios.responsaveis.label" default="Responsáveis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'responsaveis', 'errors')}">
                                    <g:select name="responsaveis" from="${flocos.Responsavel.list()}" multiple="yes" optionKey="id" size="5" value="${dadosDominiosInstance?.responsaveis*.id}" />
                                    <a href="/Flocos/responsavel/create?backUri=/dadosDominios/edit/${dadosDominiosInstance?.id}">[+]</a>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="formatos"><g:message code="dadosDominios.formatos.label" default="Formatos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'formatos', 'errors')}">
                                    
									<ul>
									<g:each in="${dadosDominiosInstance?.formatos?}" var="f">
									    <li><g:link controller="formato" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="formato" action="create" params="['dadosDominios.id': dadosDominiosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'formato.label', default: 'Formato')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricaoOntologia"><g:message code="dadosDominios.descricaoOntologia.label" default="Descrição da Ontologia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'descricaoOntologia', 'errors')}">
                                    <g:textArea name="descricaoOntologia" cols="40" rows="5" value="${dadosDominiosInstance?.descricaoOntologia}" />
                                </td>
                            </tr>
                            
                            <g:if test="${dadosDominiosInstance.nomeArquivo == null}">
	                        	<tr class="prop">
					               <td valign="top" class="name">
					                   <label for="myFile"><g:message code="dadosTecnicos.myFile.label" default="Arquivo" /></label>
					               </td>
					               <td valign="top">
					                   <input type="file" name="myFile" />
					               </td>
					           </tr>
				           </g:if>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
