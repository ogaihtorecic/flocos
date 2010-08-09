
<%@ page import="flocos.DadosGerais" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dadosGerais.label', default: 'DadosGerais')}" />
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
            <g:hasErrors bean="${dadosGeraisInstance}">
            <div class="errors">
                <g:renderErrors bean="${dadosGeraisInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm method="post" >
                <g:hiddenField name="id" value="${dadosGeraisInstance?.id}" />
                <g:hiddenField name="version" value="${dadosGeraisInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="dadosGerais.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosGeraisInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${dadosGeraisInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="palavrasChave"><g:message code="dadosGerais.palavrasChave.label" default="Palavras Chave" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosGeraisInstance, field: 'palavrasChave', 'errors')}">
                                    <g:textField name="palavrasChave" value="${dadosGeraisInstance?.palavrasChave}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="dadosGerais.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosGeraisInstance, field: 'descricao', 'errors')}">
                                    <g:textArea name="descricao" cols="40" rows="5" value="${dadosGeraisInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="idiomas"><g:message code="dadosGerais.idiomas.label" default="Idiomas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dadosGeraisInstance, field: 'idiomas', 'errors')}">
                                    <g:select name="idiomas" from="${flocos.Idioma.list()}" multiple="yes" optionKey="id" size="5" value="${dadosGeraisInstance?.idiomas*.id}" />
                                    <a href="/Flocos/idioma/create?backUri=/dadosGerais/edit/${dadosGeraisInstance?.id}">[+]</a>
                                </td>
                            </tr>
                            
                            <g:if test="${dadosGeraisInstance.localArquivo == null}">
	                        	<tr class="prop">
					               <td valign="top" class="name">
					                   <label for="myFile"><g:message code="dadosGerais.myFile.label" default="Arquivo" /></label>
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
