
<%@ page import="flocos.Funcao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcao.label', default: 'Funcao')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="funcao.nomeFuncao.label" default="Nome Funcao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: funcaoInstance, field: "nomeFuncao")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="funcao.descricaoFuncao.label" default="Descricao Funcao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: funcaoInstance, field: "descricaoFuncao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcao.parametroEntrada.label" default="Parametro Entrada" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: funcaoInstance, field: "parametroEntrada")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcao.parametroSaida.label" default="Parametro Saida" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: funcaoInstance, field: "parametroSaida")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="funcao.dadosTecnicos.label" default="Dados Tecnicos" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dadosTecnicos" action="show" id="${funcaoInstance?.dadosTecnicos?.id}">${funcaoInstance?.dadosTecnicos?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${funcaoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
