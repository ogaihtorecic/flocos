
<%@ page import="flocos.AnotacaoSemantica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript src="jquery/moafmc.js" />
        <g:javascript>
          jQuery(document).ready(function(){
            jQuery("#createRes").click(function() 
            {
                carregando("semantic", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("semantic", "${createLink(controller:'anotacaoSemanticaMc', action:'create')}", "")
            });                        
          });
          
          function insere(id, name)
          {
            event.preventDefault();            
            var achou = false;
            jQuery('#semantics option').each(function(index) 
            {
                if (id == $(this).val())
                {
                  achou = true;
                }
            });
            
            if (achou != true)
            {
              jQuery('#semanticMessage').addClass('message');
              jQuery('#semanticMessage').append('Adicionado!<br />');
              jQuery('#semantics').append('<option value=\"' + id + '\">' + name + '</option>');
            }else
            {
              jQuery('#semanticMessage').removeClass('message');
              jQuery('#semanticMessage').html('');
            }
          }
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a id="createRes" href="#" class="create"><g:message code="default.new.label" args="[entityName]" /></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div id="semanticMessage"></div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                          <th>Id</th>
                            <th>Local annotation</th>
                            <th>Annotation type</th>
                            <th>Add</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${anotacaoSemanticaInstanceList}" status="i" var="anotacaoSemanticaMcInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                          
                            <td><a href="#" onclick="carregando('semantic', '${resource(dir:'images', file: 'ajax-loader.gif')}'); load('semantic', '${createLink(controller:'anotacaoSemanticaMc', action:'show')}', {id: ${anotacaoSemanticaMcInstance.id}});">${fieldValue(bean: anotacaoSemanticaMcInstance, field: "id")}</a></td>
                        
                            <td>${fieldValue(bean: anotacaoSemanticaMcInstance, field: "localAnotacao")}</td>
                        
                            <td>${fieldValue(bean: anotacaoSemanticaMcInstance, field: "tipoAnotacao")}</td>
                        
                            <td><a href="#" onclick="insere(${anotacaoSemanticaMcInstance.id}, '${anotacaoSemanticaMcInstance.localAnotacao}')">[+]</a></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${anotacaoSemanticaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
