
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
            jQuery("#semantic form").submit(function() 
            {
                var id = ${anotacaoSemanticaInstance?.id};
                var version = ${anotacaoSemanticaInstance?.version};
                var local = jQuery("#localAnnotation").val();
                var type = jQuery("#typeAnnotation").val();
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}");
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'update')}", {id: id, version: version, localAnotacao: local, tipoAnotacao: type});
                return false;
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
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${anotacaoSemanticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${anotacaoSemanticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${anotacaoSemanticaInstance?.id}" />
                <g:hiddenField name="version" value="${anotacaoSemanticaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localAnotacao">Local annotation</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anotacaoSemanticaInstance, field: 'localAnotacao', 'errors')}">
                                    <g:textField name="localAnnotation" value="${anotacaoSemanticaInstance?.localAnotacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoAnotacao">Annotation type</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anotacaoSemanticaInstance, field: 'tipoAnotacao', 'errors')}">
                                    <g:textField name="typeAnnotation" value="${anotacaoSemanticaInstance?.tipoAnotacao}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
