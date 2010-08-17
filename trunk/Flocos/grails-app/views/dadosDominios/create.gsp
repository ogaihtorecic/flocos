
<%@ page import="flocos.DadosDominios" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosDominios.label', default: 'DadosDominios')}" />
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
            <g:hasErrors bean="${dadosDominiosInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosDominiosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm action="save" method="post" >
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
                                    <g:link controller="idioma" action="create" params="[backUri:'/dadosDominios/create']">[+]</g:link>
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dominioEspecifico"><g:message code="dadosDominios.dominioEspecifico.label" default="Dominio Especifico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'dominioEspecifico', 'errors')}">
                                    <g:textField name="dominioEspecifico" value="${dadosDominiosInstance?.dominioEspecifico}" />
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
                                    <label for="versao"><g:message code="dadosDominios.versao.label" default="Versao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'versao', 'errors')}">
                                    <g:textField name="versao" value="${dadosDominiosInstance?.versao}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="responsaveis"><g:message code="dadosDominios.responsaveis.label" default="Responsaveis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'responsaveis', 'errors')}">
                                    <g:select name="responsaveis" from="${flocos.Responsavel.list()}" multiple="yes" optionKey="id" size="5" value="${[flocos.Usuario.findById(session.usuario.id).responsavel?.id]}" />
                                    <g:link controller="responsavel" action="create" params="[backUri:'/dadosDominios/create']">[+]</g:link>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricaoOntologia"><g:message code="dadosDominios.descricaoOntologia.label" default="Descricao da Ontologia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosDominiosInstance, field: 'descricaoOntologia', 'errors')}">
                                    <g:textArea name="descricaoOntologia" cols="40" rows="5" value="${dadosDominiosInstance?.descricaoOntologia}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
				               <td valign="top" class="name">
				                   <label for="myFile"><g:message code="dadosDominios.myFile.label" default="Arquivo" /></label>
				               </td>
				               <td valign="top">
				                   <input type="file" name="myFile" />
				               </td>
				           </tr>
                        
                            <g:hiddenField name="usuario.id" value="${session.usuario.id}" />
                        
                        	<g:hiddenField name="backUri" value="${params.backUri}" />
                        	
                        	<g:hiddenField name="moaf.id" value="${params.moaf?.id}"/>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
