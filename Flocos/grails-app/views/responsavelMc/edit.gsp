

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
            jQuery("#responsavel form").submit(function() 
            {
                var id = ${responsavelMcInstance?.id};
                var version = ${responsavelMcInstance?.version};
                var author = jQuery("#author").val();
                var email = jQuery("#email").val();
                var developer = jQuery("#developer").val();
                var institution = jQuery("#institution").val();
                carregando("responsavel", "${resource(dir:'images', file: 'ajax-loader.gif')}");
                load("responsavel", "${createLink(controller:'responsavelMc', action:'update')}", {id: id, version: version, author: author, email: email, developer: developer, institution: institution});
                return false;
            });
          });
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a id="listRes" href="#" class="list"><g:message code="default.list.label" args="[entityName]" /></a></span>
            <span class="menuButton"><a id="createRes" href="#" class="create"><g:message code="default.new.label" args="[entityName]" /></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${responsavelMcInstance}">
            <div class="errors">
                <g:renderErrors bean="${responsavelMcInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${responsavelMcInstance?.id}" />
                <g:hiddenField name="version" value="${responsavelMcInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="author"><g:message code="responsavelMc.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelMcInstance, field: 'author', 'errors')}">
                                    <g:textField name="author" value="${responsavelMcInstance?.author}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="responsavelMc.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelMcInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${responsavelMcInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="developer"><g:message code="responsavelMc.developer.label" default="Developer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelMcInstance, field: 'developer', 'errors')}">
                                    <g:textField name="developer" value="${responsavelMcInstance?.developer}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="institution"><g:message code="responsavelMc.institution.label" default="Institution" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: responsavelMcInstance, field: 'institution', 'errors')}">
                                    <g:textField name="institution" value="${responsavelMcInstance?.institution}" />
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
