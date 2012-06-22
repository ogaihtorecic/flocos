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
          });
          
          function insere(id, name)
          {
            var achou = false;
            jQuery('#authors option').each(function(index) 
            {
                if (id == $(this).val())
                {
                  achou = true;
                }
            });
            
            if (achou != true)
            {
              jQuery('#authors').append('<option value=\"' + id + '\">' + name + '</option>');
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Author</th>
                            <th>email</th>
                            <th>Add</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${responsavelMcInstanceList}" status="i" var="responsavelMcInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="#" onclick="carregando('responsavel', '${resource(dir:'images', file: 'ajax-loader.gif')}'); load('responsavel', '${createLink(controller:'responsavelMc', action:'show')}', {id: ${responsavelMcInstance.id}});">${fieldValue(bean: responsavelMcInstance, field: "id")}</a></td>
                        
                            <td>${fieldValue(bean: responsavelMcInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: responsavelMcInstance, field: "email")}</td>
                            
                            <td><a href="#" onclick="insere(${responsavelMcInstance.id}, '${responsavelMcInstance.author}')">[+]</a></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>            
        </div>
    </body>
</html>
