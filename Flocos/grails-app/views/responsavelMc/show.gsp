
<%@ page import="flocos.ResponsavelMc" %>
<html>
    <head>
        <g:set var="entityName" value="${message(code: 'responsavelMc.label', default: 'ResponsavelMc')}" />
        <g:javascript src="jquery/moafmc.js" />
        <g:javascript>
          jQuery(document).ready(function(){
            jQuery("#createRes").click(function() 
            {
                carregando("responsavel", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("responsavel", "${createLink(controller:'responsavelMc', action:'create')}", "")
            });  
            jQuery("#listRes").click(function() 
            {
                carregando("responsavel", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("responsavel", "${createLink(controller:'responsavelMc', action:'list')}", "")
            });
            jQuery("#editRes").click(function() 
            {
                carregando("responsavel", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("responsavel", "${createLink(controller:'responsavelMc', action:'edit')}", {id: ${responsavelMcInstance?.id}})
            });
            jQuery("#rmRes").click(function() 
            {
                carregando("responsavel", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("responsavel", "${createLink(controller:'responsavelMc', action:'delete')}", {id: ${responsavelMcInstance?.id}})
            });
          });
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a id="listRes" href="#" class="list">List author</a></span>
            <span class="menuButton"><a id="createRes" href="#" class="create">New author</a></span>
        </div>
        <div class="body">
            <h1>Show author</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="responsavelMc.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: responsavelMcInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="responsavelMc.author.label" default="Author" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: responsavelMcInstance, field: "author")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="responsavelMc.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: responsavelMcInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="responsavelMc.developer.label" default="Developer" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: responsavelMcInstance, field: "developer")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="responsavelMc.institution.label" default="Institution" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: responsavelMcInstance, field: "institution")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form onsubmit="return false;">
                    <g:hiddenField name="id" value="${responsavelMcInstance?.id}" />
                    <span class="button"><input id="editRes" type="submit" class="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><input id="rmRes" type="submit" class="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" value="${message(code: 'default.button.delete.label', default: 'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
