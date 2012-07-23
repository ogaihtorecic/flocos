
<%@ page import="flocos.AnotacaoSemantica" %>
<html>
    <head>
        <g:set var="entityName" value="${message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')}" />
        <g:javascript src="jquery/moafmc.js" />
        <g:javascript>
          jQuery(document).ready(function(){
            jQuery("#semantic form").submit(function() 
            {
                var local = jQuery("#localAnnotation").val();
                var type = jQuery("#typeAnnotation").val();
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}");
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'save')}", {localAnotacao: local, tipoAnotacao: type});
                return false;
            }); 
            
            jQuery("#listRes").click(function() 
            {
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'list')}", "")
            });
          });
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a id="listRes" href="#" class="list"><g:message code="default.list.label" args="[entityName]" /></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${anotacaoSemanticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${anotacaoSemanticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
