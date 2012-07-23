
<%@ page import="flocos.AnotacaoSemantica" %>
<html>
    <head>
        <g:set var="entityName" value="${message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')}" />
        <g:javascript src="jquery/moafmc.js" />
        <g:javascript>
          jQuery(document).ready(function(){
            jQuery("#createSem").click(function() 
            {
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'create')}", "")
            });  
            jQuery("#listSem").click(function() 
            {
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'list')}", "")
            });
            jQuery("#editSem").click(function() 
            {
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'edit')}", {id: ${anotacaoSemanticaInstance?.id}})
            });
            jQuery("#rmSem").click(function() 
            {
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'delete')}", {id: ${anotacaoSemanticaInstance?.id}})
            });
          });
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a id="listSem" href="#" class="list"><g:message code="default.list.label" args="[entityName]" /></a></span>
            <span class="menuButton"><a id="createSem" href="#" class="create"><g:message code="default.new.label" args="[entityName]" /></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            ${anotacaoSemanticaInstance}
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anotacaoSemantica.localAnotacao.label" default="Local Anotacao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: anotacaoSemanticaInstance, field: "localAnotacao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="anotacaoSemantica.tipoAnotacao.label" default="Tipo Anotacao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: anotacaoSemanticaInstance, field: "tipoAnotacao")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${anotacaoSemanticaInstance?.id}" />
                    <span class="button"><input id="editSem" type="submit" class="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><input id="rmSem" type="submit" class="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" value="${message(code: 'default.button.delete.label', default: 'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
